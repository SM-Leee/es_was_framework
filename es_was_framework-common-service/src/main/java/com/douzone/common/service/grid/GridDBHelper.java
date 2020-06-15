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
	Connection conn = null;
	CallableStatement cstmt = null;
	Map<String, Object> object = null;
	String procName = "";

	GridDBHelper(BasicDataSource dataSource) {
		this.dataSource = dataSource;
		
		object = new LinkedHashMap<String, Object>();				
		try {		
		} catch(Exception ex) {
			System.err.println(ex);
		}
	}
	
	public JSONObject exquteQuery(String procName, Object[] args) {
		JSONObject jsonObject = new JSONObject();
		
		try {
			if(args.length == 0) return null;

			Connection connection = null;
			connection = dataSource.getConnection();

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
		} catch(Exception ex) {
			
		}
		
		return jsonObject;
	}

	private JSONArray SetJSONArray(ResultSet resultset) {
		JSONArray jsonArray = new JSONArray();
		
		try {
			while (resultset.next()) {
			    int columns = resultset.getMetaData().getColumnCount();
			    JSONObject obj = new JSONObject();
			    for (int i = 0; i < columns; i++) {
			    	obj.put(resultset.getMetaData().getColumnLabel(i + 1).toLowerCase(), resultset.getObject(i + 1));
			    }
			    jsonArray.add(obj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
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
	
	public int save(String procName) {
		this.procName = procName;
		return excute();
	}
	
	private int excute() {
		int result = 0;

		try {
			if(object == null || object.size() == 0) {
				System.err.println("로직 실행할 데이터가 없습니다.");
				return -1;
			}

			Connection connection = null;
			connection = dataSource.getConnection();

			/*
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String url = "jdbc:sqlserver://175.206.170.131:3433;databaseName=NEOE";
			conn = DriverManager.getConnection(url, "NEOE", "NEOE");	
			// 1. AutoCommit 해제
			conn.setAutoCommit(false);
			
			*/
			String sql = "{call " + procName + "(";
			int paramSize = object.size();		
			for(int i=0; i<paramSize; i++) {
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
				System.out.println(param);
				String value = object.get(param).toString();
				System.out.println(value);
				
				cstmt.setString(index, value);
				index++;
			}
			result = cstmt.executeUpdate();
			// Commit data here
			//conn.commit();
			
		} catch(SQLException se) {
			se.printStackTrace();
			/*
			// RollBack
			try {
				if(conn != null) {
					conn.rollback();
				}
			} catch(SQLException se2) {
				se2.printStackTrace();
			}
			*/
		} catch(Exception ex) {
			System.err.println(ex);
		} finally {
			//Terminate();
		}
		
		return result;
	}

	private void Terminate() {
		try {
			if(conn != null) {
				conn.close();
			}
			if(cstmt != null) {
				cstmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
