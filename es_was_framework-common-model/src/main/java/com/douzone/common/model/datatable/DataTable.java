package com.douzone.common.model.datatable;
import java.util.*;
import java.lang.Comparable;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.*;

/*
 * 작 성 자  : 이 소 현
 * 작 성 일  : 2019.11.06
 * 수 정 자  :
 * 수 정 일  :  
 * 수정내용 :  
 */

public class DataTable {
	private ArrayList<DataRow> rowList;

	public DataTable () {
		rowList = new ArrayList<DataRow>();
	}
	
	public DataTable(String jsonData) {
		rowList = new ArrayList<DataRow>();	
		
		setTableWithJson(jsonData);
	}
	
	// row 리스트를 가져옵니다.
	public ArrayList<DataRow> getRowList() {
		return rowList;
	}

	// row를 추가합니다.
	public void addRow(DataRow newRow) {
		if(rowList == null) {
			rowList = new ArrayList<DataRow>();
		}
		try{
			// 기존에 저장된 column의 갯수와 추가될 데이터의 column갯수가 일치한지 확인
			if(rowList.size() > 0) {
				int oldColumnLength = rowList.get(0).getRow().keySet().size();
				int newColumnLength = newRow.getRow().keySet().size();
				
				if(oldColumnLength != newColumnLength) {
					throw new Exception();
				}
			}
			rowList.add(newRow);
		} catch(Exception e) {
			e.printStackTrace();
			return;
		}
		
	}

	// row를 삭제합니다.
	public void removeRow(int index) {
		rowList.remove(index);
	}
	
	// json데이터를 row로 추가합니다.
	public void setTableWithJson(String jsonData) 
	{		
		if(rowList == null) {
			rowList = new ArrayList<DataRow>();
		} 
				
		try{
			JSONParser jsonParse = new JSONParser();
			JSONObject jsonObject = (JSONObject)jsonParse.parse(jsonData);

			Iterator<String> iter = jsonObject.keySet().iterator();
			JSONArray jsonArray = null;
			
			while(iter.hasNext()) {
				String tableName = iter.next();
				jsonArray = (JSONArray)jsonObject.get(tableName);
			}
			
			for(int i=0; i<jsonArray.size(); i++) {
				JSONObject obj = (JSONObject)jsonArray.get(i);

				DataRow newRow = new DataRow();
				newRow.setRowWithJson(obj.toJSONString());
				
				// 기존에 저장된 column의 갯수와 추가될 데이터의 column갯수가 일치한지 확인
				if(rowList.size() > 0) {
					int oldColumnLength = rowList.get(0).getRow().keySet().size();
					int newColumnLength = newRow.getRow().keySet().size();
					
					if(oldColumnLength != newColumnLength) {
						throw new Exception();
					}
				}
				
				rowList.add(newRow);
			}
		} catch(Exception e) {
			e.printStackTrace();
			return;
		}
	}
	
	// 특정 row의 column 데이터를 가져옵니다.
	public Object getColumnValue(int rowIndex, String columnName)
	{
		return rowList.get(rowIndex).getColumnValue(columnName);
	}

	// 특정 column의 타입을 가져옵니다. 
	public String getColumnType(String columnName) {
		return rowList.get(0).getColumnType(columnName);
	}
	
	// DataTable의 row갯수를 가져옵니다.
	public int getRowCount() {
		return rowList.size();
	}
	
	// 미완성
	// 현재 DataTable Schema를 복사합니다.
	/*
	public DataTable clone() {
		if(rowList.size() == 0) {
			return null;
		}
		if(rowList == null) {
			rowList = new ArrayList<DataRow>();
		}
		
		Iterator<String> iter = rowList.get(0).getRow().keySet().iterator();
		
		DataTable dt = new DataTable();
		
		while(iter.hasNext()) {
			String column = iter.next();

			DataRow row = new DataRow();
			row.addRow(column, null);
			
			dt.getRowList().add(row);
		}		
		
		return dt;
	}
*/
	//DataTable Row를 정렬합니다.
	public void singleSort(final String columnName, final String orderBy) {
		// DataTable column에 columnName이 존재하는지 확인
		if(rowList.get(0).getColumnList().contains(columnName)) {
			
			Collections.sort(rowList, new Comparator<DataRow>() {
				
				@Override
				public int compare(DataRow first, DataRow second) {
					// TODO Auto-generated method stub
					Object v1 = first.getRow().get(columnName);
					Object v2 = second.getRow().get(columnName);
					
					if(orderBy.toUpperCase().equals("ASC")) {
						return ((Comparable) v1).compareTo(v2); // 오름차순					
					} else if(orderBy.toUpperCase().equals("DESC")) {
						return ((Comparable) v2).compareTo(v1); // 내림차순
					}
					return 0;
				}				
			});
		} else {
			System.out.println(columnName + "is not exist");
		}		
	}
	
	// 현재 DataTable의 정보를 보여줍니다.
	public void dispDataTable() {
		// 컬럼사이즈
		int columnSize = rowList.get(0).columnSize();
		ArrayList<String> columnList = rowList.get(0).getColumnList();
		
		for(int i=0; i<=rowList.size(); i++) {
			for(int j=0; j<columnList.size(); j++) {
				if(i == 0) {
					// column
					System.out.print(columnList.get(j) + "\t");
				} else {
					// value
					String column = columnList.get(j);
					Object value = rowList.get(i-1).getColumnValue(column);
					System.out.print(value + "\t");
				}
			}
			System.out.println();
		}
	}
}
