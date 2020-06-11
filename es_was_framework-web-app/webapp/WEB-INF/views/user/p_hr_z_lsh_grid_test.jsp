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
	var originDataSource = []; // 조회해왔을 때 원본데이터소스
	var changedDataSource = []; // state가 added, modified, deleted된 row 모음
	var dataSource = []; // grid에 바인딩될 dataSource

	var grid = new wijmo.grid.FlexGrid('#grid', {
	  	itemsSource: dataSource,
	    selectionMode: 'Row',
	    isReadOnly: false,
	    // 사용자 정의 컬럼을 만들 수 있도록 사전 설정 
	    // 컬럼은 동적이므로 반드시 false여야함. 
	    autoGenerateColumns: false,
    	columns: [
    		{binding: "no_emp", header: "사번", width: 80},
    		{binding: "nm_kor", header: "이름", width: 80}
    	],
	    selectionChanged: function (s, e) {
			var item = grid.collectionView.currentItem; // 선택한 row의 column data가져오기
			
			if(item != null) {
				// 이부분은 알아서 매핑해야함
				// 따로 js소스 뺄 필요없음
				$('#no_emp').val(item.no_emp);
				$('#cd_company').val(item.cd_company);
				$('#nm_kor').val(item.nm_kor);
				$('#nm_duty_rank').val(item.nm_duty_rank);
			}
	    },
	    cellEditEnding: function (s, e) {
	    	// 수정 완료 후  실행되는 함수(validate edit이랑 같음)
			var item = grid.collectionView.currentItem;

			item.state = "modified";
			changedDataSource.push(item)
	    }
	    /*
	    deletedRow: function (s, e){
	    	// allowDelete = true 설정했을 때 row삭제 이벤트 발생 후 여기로 탄다..
	    }
	    */
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
					data[0][i].state = "unchanged";
				}
				originDataSource = data[0];
				dataSource = data[0];
				grid.itemsSource = dataSource;
			},
			error: function(request, status, error){
				console.log(request);
				console.log(status);
				console.log(error);
			}
		});
		
		grid.select(0, 0, 0, 0, true);
		//grid.allowAddNew = true; // 조회 후 설정돼야함
		//grid.allowDelete = true; // Delete key 이용하여 row 삭제
	});

	$("#add").on("click", function() {
		var currentItem = grid.collectionView.currentItem;
		var newItem = JSON.parse(JSON.stringify(currentItem)); // 현재 row clone

		for(key in newItem) {
			if(newItem[key] == "state") {
				newItem[key] = "added";
			} else {
				var item = newItem[key] = "";
			}
		}
		console.log(newItem);
		
		//changedDatasource.push(newItem); 얘 왜 is not defined뜨는거지..
		dataSource.push(newItem);
		
		//grid.itemsSource = dataSource;
		grid.collectionView.refresh();
		console.log(grid.itemsSource);
		//console.log(changedDatasource);
	});
	
	$("#delete").on("click", function() {
		var view = grid.collectionView; // 현재 그리드
		var currentItem = view.currentItem; // 현재 포커스되어있는 row
		currentItem.state = "deleted";
		
		changedDataSource.push(currentItem);
		view.remove(view.currentItem); // 그리드에서 포커싱된 row 삭제
	});
	
	$("#save").on("click", function() {
		
	});

	$("#show").on("click", function() {
		console.log(grid.itemsSource);
		console.log(changedDataSource);
	});
	
	/*
	function controlState(item, state) {
		if(changedDataSource.length > 0) {
			var findedItem = null;
			
			for(key in changedDataSource) {
				if(changedDataSource[key] == "state") {
					newItem[key] = "added";
				} else {
					var item = newItem[key] = "";
				}				
			}
		} else {
			item.state = state;
		}
	}
	*/
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
	background-color: #5592D8; /* 헤더 색상 */
	width: 100%;
	height: 300px;
	border-bottom: solid 1px #FFFFFF; /* 칸 사이 선 */
	border-right: solid 1px #FFFFFF;  /* 칸 사이 선 */
	/* font-weight: bold; */
}

.custom-flex-grid .wj-cell {
	 background-color: #fff;
	 border: none;
}

.custom-flex-grid .wj-alt:not(.wj-state-selected):not(.wj-state-multi-selected) {
	 background-color: #fff;
}

.custom-flex-grid .wj-state-selected {
	 background: #000;
	 color: #fff;
}

.custom-flex-grid .wj-state-multi-selected {
	 background: #222;
	 color: #fff;
}
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