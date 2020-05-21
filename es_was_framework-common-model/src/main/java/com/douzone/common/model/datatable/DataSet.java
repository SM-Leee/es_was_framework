package com.douzone.common.model.datatable;

import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.*;

/*
 * 작 성 자  : 이 소 현
 * 작 성 일  : 2019.11.16
 * 수 정 자  :
 * 수 정 일  : 
 * 수정내용 :  
 */

public class DataSet {
	private ArrayList<DataTable> tableList;
	
	public DataSet() {
		tableList = new ArrayList<DataTable>();
	}
	
	// table 리스트를 가져옵니다. 
	public ArrayList<DataTable> getTableList() {
		return tableList;
	}

	// json데이터를 table로 추가합니다.
	public void setDataSetWithJson(String jsonData){
		if(tableList == null) {
			tableList = new ArrayList<DataTable>();
		}
		
		try{
			JSONParser jsonParse = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParse.parse(jsonData);
			
			// DataTable로 쪼개기
			Iterator<String> iter = jsonObj.keySet().iterator();
			ArrayList<JSONArray> jsonArrayList = new ArrayList<JSONArray>();
			
			// 거꾸로 파싱되는거 막기위해
			ArrayList<JSONArray> arrList = new ArrayList<JSONArray>();
			
			while(iter.hasNext()) {
				String tableName = iter.next();
				JSONArray arr = (JSONArray) jsonObj.get(tableName);
				
				arrList.add(arr);
			}
			
			for(int index=arrList.size()-1; index>=0; index--) {
				DataTable dt = new DataTable();
				// 아래 파라미터	부분 JSONArray -> JSONObject 방법 찾아보기
				dt.setTableWithJson("{\"\":" + arrList.get(index).toString() + "}");
				
				tableList.add(dt);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	// 특정 인덱스의 테이블을 가져옵니다.
	public DataTable getDataTable(int index) {
		return tableList.get(index);
	}

	// 현재 DataSet의 정보를 보여줍니다.
	public void dispDataSet() {
		for(int i=0; i<tableList.size(); i++) {
			tableList.get(i).dispDataTable();
		}
	}
}
