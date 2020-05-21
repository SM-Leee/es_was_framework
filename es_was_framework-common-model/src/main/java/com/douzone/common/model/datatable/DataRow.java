package com.douzone.common.model.datatable;
import java.util.*;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/*
 * 작 성 자  : 이 소 현
 * 작 성 일  : 2019.11.01
 * 수 정 자  :
 * 수 정 일  : 
 * 수정내용 :  
 */

public class DataRow {
	private Map<String, Object> row;
	private String rowState;
	
	public DataRow() {
		row = new HashMap<String, Object>();
		rowState = "I";
	}

	public Map<String, Object> getRow() {
		return row;
	}

	// jsonData를 DataRow에 insert하는 작업입니다.
	public void setRowWithJson(String jsonData) {
		try{
			JSONParser jsonParse = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParse.parse(jsonData);
			
			Iterator<String> iter = jsonObj.keySet().iterator();
			
			while(iter.hasNext()) {
				
				String column = iter.next();
				Object value = jsonObj.get(column);
				row.put(column, value);				
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// column갯수를 반환합니다.
	public int columnSize()
	{
	  return row.keySet().size();
	}
	
	// column - value 추가합니다.
	public void addColumn(String column,Object value) {
		row.put(column, value);
	}
	
	public void removeColumn(String column) {
		row.remove(column);
	}
	
	// row에 들어있는 columnList를 가져옵니다.
	public ArrayList<String> getColumnList() {
		ArrayList<String> columnList = new ArrayList<String>();
		Iterator<String> iterator = row.keySet().iterator();
		
		while(iterator.hasNext()) {
			columnList.add(iterator.next());
		}
		
		return columnList;
	}
	
	// 특정 column의 value를 가져옵니다.
	public Object getColumnValue(String columnName) {
		return row.get(columnName);
	}
	
	// 특정 column의 dataType을 가져옵니다.
	public String getColumnType(String columnName) {
		Object value = row.get(columnName);
		
		if(value instanceof String) {
			return "String";
		} else if (value instanceof Byte) {
			return "Byte";
		} else if (value instanceof Number) {
			return "Number";
		} else if (value instanceof Boolean) {
			return "Boolean";
		}
		
		return "판별할 수 없는 타입입니다.";
	}
	
	// display
	public void dispDataRow() {
		Iterator<String> iter = row.keySet().iterator();
		
		System.out.println("=============================================");
		while(iter.hasNext()) {
			String column = iter.next();
			Object value = row.get(column);
			
			System.out.println("column : " + column + "\t| value : " + value);
		}
		System.out.println("=============================================");
	}
}
