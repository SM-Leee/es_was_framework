
/*
 * 작 성 자  : 이 소 현
 * 작 성 일  : 2020.03.17
 * 수 정 자  :
 * 수 정 일  : 
 * 수정내용 :  
 */



function createGrid(gridInfo, id) {
	console.log(gridInfo);
	
	$.ajax({
		
	}).done(function(data) {
		
	}).fail(function(xhr, status, errorThrown) {
		
	}).always(function(xhr, status) {
		
	});
	
    var grid = new wijmo.grid.FlexGrid(id);
    
    grid.autoGenerateColumns = false; // 사용자 정의 컬럼을 만들 수 있도록 사전 설정	
    grid.selectionMode = "Row";
    
 	for(var i=0; i<gridInfo.columns.length; i++) {
		var c = new wijmo.grid.Column();
		
		c.binding = gridInfo.columns[i].field;
		c.header = gridInfo.columns[i].title;// 사용자에게 보여지는 컬럼
		c.width =  gridInfo.columns[i].width;// 사용자에게 보여지는 컬럼
		grid.columns.push(c);
	}  
 	
 	return grid;
}