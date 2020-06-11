
/*
 * 작 성 자  : 이 소 현
 * 작 성 일  : 2020.03.17
 * 수 정 자  :
 * 수 정 일  : 
 * 수정내용 :  
 */

var path;

function initGrid(id, gridInfo) {
    var grid = new wijmo.grid.FlexGrid(id);

    grid.selectionMode = "Row";
    grid.itemsSource = gridInfo.itemsSource;
    grid.allowSorting = gridInfo.allowSorting == null ? false : gridInfo.allowSorting;
    //grid.allowResizing = gridInfo.allowResizing;
    grid.isReadOnly = gridInfo.isReadOnly == null ? false : gridInfo.isReadOnly;
    
    // 사용자 정의 컬럼을 만들 수 있도록 사전 설정
    // 컬럼은 동적이므로 반드시 false여야함.
    grid.autoGenerateColumns = false;	
    
 	for(var i=0; i<gridInfo.columns.length; i++) {
		var c = new wijmo.grid.Column();
		
		c.binding = gridInfo.columns[i].field.toLowerCase();	
		c.header = gridInfo.columns[i].title;
		c.width =  gridInfo.columns[i].readOnly == null ? 100 : gridInfo.columns[i].width;
		c.isReadOnly = gridInfo.columns[i].readOnly == null ? true : gridInfo.columns[i].readOnly;
		c.dataType = gridInfo.columns[i].type == null ? "String" : gridInfo.columns[i].type;
		
		grid.columns.push(c);
	}  
 	
 	return grid;
}

function gridBiding(grid, info){
	$.ajax({
		url: path + info.url,
		type: "POST",
		data: info.params,
		success: function(data) {
			grid.itemsSource = data[0];	
		},
		error: function(request, status, error){
			console.log(request);
			console.log(status);
			console.log(error);
		}
	});
}


function newRow(grid) {
	console.log('hi');
	if(grid.itemsSource != null && grid.itemsSource.length > 0) {
		var element = grid.itemsSource[0];

		Object.keys(element).forEach(function(k) {
			element[k] = "";
		});
		
		return element;
	}
}

function setContextPath(path) {
	this.path = path;
}

function getCheckedData(grid){
	var checkedData = [];
	
	for(var i=0; i<grid.itemsSource.length; i++) {
		var data = grid.itemsSource[i];
		
		if(data.s){
			checkedData.push(data);
		}
	}
	
	return checkedData;
}