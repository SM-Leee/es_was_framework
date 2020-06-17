package com.douzone.common.service.grid;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.commons.dbcp.BasicDataSource;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author LeeSoHyun
 * @comment Insert, delete, update작업을 위해 생성
 *
 */

public class GridDBHelper {

	private BasicDataSource dataSource;
	
	String DBCode = null;
	Connection connection = null;
	CallableStatement cstmt = null;
	Map<String, Object> object = null;
	String procName = "";

	GridDBHelper(BasicDataSource dataSource) {
		try {
			this.dataSource = dataSource;

			connection = dataSource.getConnection();
			
		} catch(Exception ex) {
			System.err.println(ex);
		}
			
		try {		
		} catch(Exception ex) {
			System.err.println(ex);
		}
	}
	
	public void setAutoCommit(boolean defaultAutocommit) {
		dataSource.setDefaultAutoCommit(defaultAutocommit);
	}
	
	public void commit() throws SQLException {
		dataSource.getConnection().commit();
	}
	
	public void rollback() throws SQLException {
		dataSource.getConnection().rollback();
	}
	
	// search
	public JSONObject exquteQuery(String procName, Object[] args) throws SQLException {
		JSONObject jsonObject = new JSONObject();
		
		if(args.length == 0) return null;
		
		String sql = "{call " + procName + "(";

		for(int i=0; i<args.length; i++) {
			if(i == (args.length)-1) {
				sql += "?)}";
			} else{
				sql += "?, ";
			}
		}

		// 2. Execute a procedure create
		cstmt = connection.prepareCall(sql);
		
		int index = 1;
		for(int i=0; i<args.length; i++) {
			cstmt.setString(index, args[i].toString());
			index++;
		}
		
		boolean isExistResult = cstmt.execute();
		
		int rsCount = 0;
		while(isExistResult) {
			ResultSet rs = cstmt.getResultSet();

			JSONArray jsonArray = SetJSONArray(rs);
			jsonObject.put(Integer.toString(rsCount), jsonArray);
		
			rs.close();
		
			isExistResult = cstmt.getMoreResults();
			rsCount++;
		}	
		return jsonObject;
	}

	private JSONArray SetJSONArray(ResultSet resultset) throws SQLException {
		JSONArray jsonArray = new JSONArray();
	
		while (resultset.next()) {
		    int columns = resultset.getMetaData().getColumnCount();
		    JSONObject obj = new JSONObject();
		    for (int i = 0; i < columns; i++) {
		    	obj.put(resultset.getMetaData().getColumnLabel(i + 1).toLowerCase(), resultset.getObject(i + 1));
		    }
		    jsonArray.add(obj);
		}
		return jsonArray;
	}
	
	public void setParameter(String parameter, Object value) {
		try {
			if(object == null) {
				object = new LinkedHashMap<String, Object>();
			}
			
			object.put(parameter, value);			
		} catch(Exception ex) {
    		System.err.println(ex);  
		}
	}
	
	// insert, update, delete
	public int save(String procName) throws SQLException {
		this.procName = procName;
		return excute();
	}
		
	private int excute() throws SQLException {
		int result = 0;

		if(object == null || object.size() == 0) {
			System.err.println("로직 실행할 데이터가 없습니다.");
			return -1;
		}
		
		String sql = "{call " + procName + "(";
		int paramSize = object.size();		
		for(int i=0; i<object.size(); i++) {
			if(i == paramSize-1) {
				sql += "?)}";
			} else{
				sql += "?, ";
			}
		}
		
		// 2. Execute a procedure create
		CallableStatement cstmt = connection.prepareCall(sql); 
		
		Iterator<String> iter = object.keySet().iterator();
		int index = 1;
		while(iter.hasNext()) {
			String param = iter.next();
			String value = object.get(param).toString();
			
			cstmt.setString(index, value);
			index++;
		}
		result = cstmt.executeUpdate();	
	
		object = null;
		return result;
	}
}
