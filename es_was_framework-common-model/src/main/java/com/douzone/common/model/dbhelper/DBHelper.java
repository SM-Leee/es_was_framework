package com.douzone.common.model.dbhelper;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.douzone.common.model.datatable.DataTable;

import oracle.jdbc.OracleTypes;

/**
 * @author kangjaeseong
 *
 */
public class DBHelper {
	String DBCode = null;
	Connection conn = null;
	ResultSet rs = null;
	ResultSetMetaData rsmd = null;
	CallableStatement cstmt = null;
	
	// 1. DBHelper 생성자
	public DBHelper(String DBCode) {
		try {
			if(DBCode.equals("001")) {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				String url = "jdbc:oracle:thin:@175.206.170.132:3433:ORCL";
				conn = DriverManager.getConnection(url, "NEOE", "NEOE");	
			}
			else if(DBCode.equals("002")) {
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				String url = "jdbc:sqlserver://175.206.170.131:3433;databaseName=NEOE";
				conn = DriverManager.getConnection(url, "NEOE", "NEOE");
			}
			// 로컬 DB 접근
			else if(DBCode.equals("003")) {
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				String url = "jdbc:sqlserver://127.0.0.1;databaseName=NEOE";
				conn = DriverManager.getConnection(url, "NEOE", "NEOE");
			}
			this.DBCode = DBCode;
		} catch(Exception ex) {
			System.out.println("드라이버 로딩 실패: " + ex);
		}
	}
	
	// DataTable
	public DataTable GetDataTable(String procName, Object[] args) {
		return new DataTable(this.ExecuteQuery(procName, args).toJSONString());
	}

	// DataSet
	public DataTable GetDataSet(String procName, Object[] args) {
		return new DataTable(this.ExecuteQuery(procName, args).toJSONString());
	}
	
	// Insert, Delete, Update
	public int Save(String procName, Object[][] args) {
		int result = 0;
		try {
			String sql = "{call " + procName + "(?, ?, ?, ?)}";
			
			// 1. AutoCommit 해제
			conn.setAutoCommit(false);
			
			// 2. Execute a procedure create
			cstmt = conn.prepareCall(sql);
			
			for(int i = 0; i < args.length; i++) {
				for(int j = 1; j <= args[i].length; j++) {
					System.out.println("i : " + i + ", j : " + j + ", data : " + args[i][j - 1].toString());
					cstmt.setString(j, args[i][j - 1].toString());
				}
				result = cstmt.executeUpdate();
			}
			
			// Commit data here
			conn.commit();
		} catch(SQLException se) {
			se.printStackTrace();
			// RollBack
			try {
				if(conn != null) {
					conn.rollback();
				}
			} catch(SQLException se2) {
				se2.printStackTrace();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return result;
	}

	/**
	 * @author KangJaeSeong
	 * @Method ExecuteQuery
	 * @Param  String procName, Object[] args
	 * @return DataSet
	 * @comment DataSet Return
	 */
	public JSONObject ExecuteQuery(String procName, Object[] args) {
		JSONObject jsonObject = new JSONObject();
		try {
			String parameter = this.SetParamCreate(args);
			String sql = this.SetSqlCreate(procName, parameter);

			int rsCount = 0;
			
			cstmt = conn.prepareCall(sql);
			
			for(int i = 1; i <= args.length; i++) {
				cstmt.setString(i, args[i-1].toString());
			}
			if(DBCode.equals("001")) {
				cstmt.registerOutParameter(args.length + 1, OracleTypes.CURSOR);
				cstmt.executeQuery();
				rs = (ResultSet)cstmt.getObject(args.length + 1);
				rsmd = rs.getMetaData();
			}
			else if(DBCode.equals("002")) {
				rs = cstmt.executeQuery();
				rsmd = rs.getMetaData();
			}
			
			boolean results = cstmt.execute();
			
			// Loop through the available result sets.
			while (results) {
			   ResultSet rs = cstmt.getResultSet();

			   JSONArray jsonArray = SetJSONArray(rs);
			   jsonObject.put(Integer.toString(rsCount), jsonArray);

			   rs.close();

			   results = cstmt.getMoreResults();
			   rsCount++;
			} 
			rs.close();
		} catch(SQLException ex) {
			System.out.println(ex);
		}
		catch(Exception ex) {
			System.out.println("Exception : " + ex);
		} 
		return jsonObject;
	}
	
	/**
	 * @author KangJaeSeong
	 * @Method SetSqlCreate
	 * @Param  String procName, String param
	 * @return String
	 * @comment SQL문 CREATE
	 */
	private String SetSqlCreate(String procName, String param) {
		return "{call " + procName + "(" + param + ")}";
	}


	/**
	 * @author KangJaeSeong
	 * @Method SetParamCreate
	 * @Param  Object[] param
	 * @return String
	 * @comment SQL문에 넘길 Parameter CREATE
	 */
	private String SetParamCreate(Object[] param) {
		String parameter = "";
		
		if(param.length > 0)
		{
			for(Object obj : param) {
				parameter = parameter + "?,";
			}
			if(DBCode.equals("001")) {
				parameter = parameter + "?,";
			}
			parameter = parameter.substring(0, parameter.length()-1);
		}
		return parameter;
	}

	
	/**
	 * @author KangJaeSeong
	 * @Method SetJSONArray
	 * @Param  ResultSet resultset
	 * @return JSONArray
	 * @comment ResultSet to JSONArray
	 */
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
	
	/**
	 * @author KangJaeSeong
	 * @Method Terminate
	 * @comment 연결해제
	 */
	public void Terminate() {
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
