<!-- 
	차후 개발 진행 순서
	1. Row Number v
	2. 선택 콤보박스 v
	3. page numbering
	4. column DataMap
	5. menu jump
 -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>사원정보</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<%-- <link href="${pageContext.servletContext.contextPath }/assets/css/grid.css" rel="stylesheet" type="text/css"> --%>
	
	<script type="text/javascript" src="<c:url value="/resources/assets/js/jquery/jquery-1.9.0.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/assets/js/grid/module.js"/>"></script>	<!-- 필요한 module -->
	<script type="text/javascript" src="<c:url value="/resources/assets/js/grid/grid.js"/>"></script>	<!-- 그리드 생성 js -->
	
</head>
<script>

onload = function() {
	var changedDataSource = []; // state가 added, modified, deleted된 row 모음
	var dataSource = []; // grid에 바인딩될 dataSource
	
	var maxRowNumber = 0; // rowNumber는 1부터 시작하므로 0
	var maxRowId = -1; // rowId는 0부터 시작하므로 -1
	
	var grid = new wijmo.grid.FlexGrid('#grid', {
	  	itemsSource: dataSource,
	    selectionMode: 'Row',
	    isReadOnly: false,
	    // 사용자 정의 컬럼을 만들 수 있도록 사전 설정 
	    // 컬럼은 동적이므로 반드시 false여야함. 
	    autoGenerateColumns: false,
    	columns: [
    		{binding: "rowNumber", header: "번호", width: 50, align: 'center', isReadOnly:true},
    		{binding: "s", header: "S", width: 50, dataType: "Boolean"}, // string type으로 Boolean 입력해야 check박스 활성화
    		{binding: "no_emp", header: "사번", width: 80},
    		{binding: "nm_kor", header: "이름", width: 80},
    		{binding: "cd_dept", header: "부서코드", width: 80},
    		{binding: "nm_dept", header: "부서명", width: 150, isReadOnly:true}
    	],
	    selectionChanged: function (s, e) {
	    	// AfterRowChange의 역할
			var item = grid.collectionView.currentItem; // 선택한 row의 column data가져오기
	    },
	    cellEditEnding: function (s, e) { // 수정 완료 후  실행되는 함수(validate edit이랑 같음)	  
			var item = grid.collectionView.currentItem;
	    	
	    	// changedDataSource에 currentRow.rowId가 이미 존재하는지 확인
	    	// 존재한다면 이미 changedDataSource에 데이터가 존재하는다는 뜻 => push 안해도됨
			var currentRowId = item.rowId;
	    	var isExist = false;
	    	
	    	for(var i=0; i<changedDataSource.length; i++) {
	    		var tmpRowId = changedDataSource[i].rowId;
	    		
	    		if(currentRowId == tmpRowId) {
	    			isExist = true;
	    			break;
	    		}
	    	}
	    	
	    	if(!isExist && item.state != "added") { // changedDataSource에 currentRow가 존재하지 않으면 push...
				item.state = "modified";	
				changedDataSource.push(item);  
	    	}
	    }
	});
	grid.onSelectionChanged(null); // initialize selection display
	
	$("#search").on("click", function() {
		$.ajax({
			url: "grid/getEmp",
			type: "POST",
			async: false,
			data: {
				CD_COMPANY: "1000"
			},
			success: function(data) {
				// 모듈화 시킬 것
				for(var i=0; i<data[0].length; i++) {
					data[0][i].rowNumber = i+1;
					data[0][i].rowId = i;
					data[0][i].state = "unchanged";
					
					maxRowNumber = i+1; // 그리드에 그려질 번호
					maxRowId = i; // row id
				}
				
				dataSource = data[0];
				changedDataSource = [];
				grid.itemsSource = dataSource;
			},
			error: function(request, status, error){
				console.log(request);
				console.log(status);
				console.log(error);
			}
		});
		grid.select(0, 0, 0, 0, true); // 첫번째 row 첫번째 col에 focus
	});

	$("#add").on("click", function() {
		if(grid.itemsSource[0] == null) {
			return;
		}
		
		var currentItem = grid.collectionView.currentItem;
		var newItem = JSON.parse(JSON.stringify(currentItem)); // 현재 row clone
		
		var gridColumns = getColumns(grid);
		
		for(key in newItem) {
			// 그리드에 그려져있는 데이터만 초기화해야함
			if(gridColumns.includes(key)) { 
				newItem[key] = "";
			}	
			
			// 초기화작업
			if(key == "state") {
				newItem[key] = "added";
			}
			else if(key == "rowNumber"){
				maxRowNumber++;
				newItem[key] = maxRowNumber;
			}
			else if(key == "rowId"){
				maxRowId++;
				newItem[key] = maxRowId;
			}
			else if(key == "s"){
				newItem[key] = false;
			}
		}
		
		changedDataSource.push(newItem);
		dataSource.push(newItem);
		grid.collectionView.refresh();
	});
	
	$("#delete").on("click", function() {
		if(grid.itemsSource[0] == null) {
			return;
		}
		var view = grid.collectionView; // 현재 그리드
		var currentItem = view.currentItem; // 현재 포커스되어있는 row
		
		// state가 added인 row는 db에 없으므로 화면에서만 삭제처리하면됨
		// 해당 row 찾아서 changedDataSource에서 row삭제하기
		if(currentItem.state == "added" && changedDataSource.length > 0) {
			for(var i=0; i<changedDataSource.length; i++) {
				var changedDataSourceRowId = changedDataSource[i].rowId;
				var currentRowId = currentItem.rowId; // 현재 포커싱되어있는 row id
				
				if(changedDataSourceRowId == currentRowId){
					// changedDataSource에서 added된 row삭제
					changedDataSource.splice(i, 1);
					break;						
				}
			}		
		} else {
			if(currentItem.state == "unchanged") { // 그냥 추가하면 2개이상이됨..
				currentItem.state = "deleted";			
				changedDataSource.push(currentItem);				
			} else if(currentItem.state == "modified") {
				currentItem.state = "deleted";						
			}	
		}
		
		view.remove(view.currentItem); // 그리드에서 포커싱된 row 삭제
		
		// rowNumber reNumbering
		for(var i=0; i<grid.itemsSource.length; i++){
			grid.itemsSource[i].rowNumber = i+1;
			maxRowNumber = i+1;
		}
		
		grid.collectionView.refresh();
	});
	
	$("#save").on("click", function() {
		if(grid.itemsSource[0] == null) {
			return;
		}
		if(changedDataSource.length == 0) {
			alert("저장할 데이터가 없습니다.");
			return;
		}
		
		/********* 모듈화시키기 *********/
		var added = [];
		var modified = [];
		var deleted = [];
		
		for(var i=0; i<changedDataSource.length; i++) {
			var item = changedDataSource[i];
			
			if(item.state == "added") {
				added.push(item);
			} else if(item.state == "modified"){
				modified.push(item);
			} else if(item.state == "deleted"){
				deleted.push(item);
			}
		}
		
		console.log(added);
		console.log(modified);
		console.log(deleted);

		$.ajax({
			url: "grid/save",
			type: "POST",
			async: false,
			data: {
				added: JSON.stringify(added),
				modified: JSON.stringify(modified),
				deleted: JSON.stringify(deleted)
			},
			success: function(data) {
				console.log(data); // 넘어오는 data값에 따라서 저장완료 여부 파악해야하는데
				console.log("here");
				
				alert("저장완료되었습니다.");
				// 로직끝났으면 초기화
				changedDataSource = [];
			},
			error: function(request, status, error) { // 이 에러는 통신에러
				console.log(request);
				console.log(status);
				console.log(error);
			}
		});
	});

	$("#show").on("click", function() {
		console.log(grid.itemsSource);
		console.log(changedDataSource);
	});
	
	function reNumbering(_grid) {
		var view = _grid._view;
		
		
		return view;
	}
	
	// 그리드에 그려져있는 column만 return해줌
	function getColumns(_grid) {
		var gridColumns = [];
		
		for(var i=0; i<_grid.columns.length; i++) {
			var keys = _grid.columns[i]._binding._key;
			
			gridColumns.push(keys);
		}
		return gridColumns;
	}
}

</script>
<style>

.btnContainer {
	position: relative;
	right: 0px;
	text-align: right;
	background-color: #EAEAEA;
}

.button {
	border: none;
	border-radius: 4px;
	margin-top: 5px;
	margin-bottom: 5px;
	margin-left: 5px;
	margin-right: 5px;
	padding: 5px 20px;
  	font-size: 13px;
  	cursor: pointer;
	color: white;
	background-color: #008CBA;
} 

.container {
	position: relative;
	margin-top: 5px;
	display:flex;
	/* background-color: #FFD9EC; */
	padding-top: 5px;
	padding-bottom: 5px;
	padding-right: 5px;
	padding-left: 5px;
} 

.gridBox{
	float: left;
	width: 100%;
	height: 300px;
	/* background-color: #EAEAEA; */ 
	margin-top: 5px;
	margin-bottom: 5px;
	margin-right: 5px;
	margin-left: 5px;
}
.custom-flex-grid .wj-header.wj-cell {
	color: #fff;
	background-color: #649FE2; /* 헤더 background 색상 */
	width: 100%;
	height: 300px;
	border-bottom: solid 1px #C9CAC9; /* 칸 사이 선 */
	border-right: solid 1px #C9CAC9;  /* 칸 사이 선 */
	font-size: 15px;
	/* font-weight: bold; */
	 text-align: center;
}

.custom-flex-grid .wj-cell {
	background-color: #fff;
	border: none;
	border-bottom: solid 1px #C9CAC9; /* 칸 사이 선 */
	border-right: solid 1px #C9CAC9;  /* 칸 사이 선 */
	font-size: 15px;
	 /* cell data align */
	 /* text-align: center; */
}

.custom-flex-grid .wj-alt:not(.wj-state-selected):not(.wj-state-multi-selected) {
	 background-color: #fff;
}

.wj-cells .wj-cell.wj-state-selected {
	 background: #E6F4FF;
	 color: black;

}

/*
.custom-flex-grid .wj-state-selected {
	 background: #E6F4FF;
	 color: black;
}

.custom-flex-grid .wj-state-multi-selected {
	 background: #E6F4FF;
	 color: black;
}
*/
.controlBox {
	display: inline-block;
	width: 50%;
	height: 300px;
	background-color: #E4F7BA;
	margin-top: 5px;
	margin-bottom: 5px;
	margin-right: 5px;
	margin-left: 5px;
}
body{
	background-color: #fff;
}
</style>
<body>
		<div class="btnContainer">
			<input type="button" class="button" id="search" value="조회">
			<input type="button" class="button" id="add" value="추가">
			<input type="button" class="button" id="delete" value="삭제">
			<input type="button" class="button" id="save" value="저장">
			<input type="button" class="button" id="show" value="변경데이터확인">
		</div>
		
		<div class="container">
			<div id="grid" class="gridBox custom-flex-grid"></div>
		</div>
</body>
</html>


<!-- 참고 소스 -->
<!-- 
	/*
	grid.selectionChanged.addHandler(function (sender, event) {
	     setTimeout(function() {
	        grid.startEditing(false);
	    }, 50); 
	});
	grid.prepareCellForEdit.addHandler(function (sender, event) {
	    grid.activeEditor.addEventListener('mousedown', editorKeyDown_Grid1(e) {
	    	alert('바부');
	    	console.log('aaaa');
	    });
	});
	grid.cellEditEnding.addHandler(function (sender, event) {
	    grid.activeEditor.removeEventListener('mousedown', editorKeyDown_Grid1);
	});
	*/
 -->