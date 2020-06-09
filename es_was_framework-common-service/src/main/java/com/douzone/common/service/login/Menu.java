package com.douzone.common.service.login;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import org.apache.commons.dbcp.BasicDataSource;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.common.model.user.LoginUser;

@Service
public class Menu {
	@Autowired
	private BasicDataSource dataSource;
	
	public JSONObject getMenu(String companyCode) {
		System.out.println("22222");
		JSONObject jsonObjMain = new JSONObject();
		try {

			System.out.println("[getMenu]메소드 실행");
			
			
			String storedProcedure = "{call MA_FRAMEWORK_MENU_S(?)}";
			Connection connection = null;

			connection = dataSource.getConnection();
			
			CallableStatement callableSt = connection.prepareCall(storedProcedure);
			callableSt.setString(1, "1000");
			
			boolean isExistResult = callableSt.execute();
			int count = 0;
			
			while(isExistResult) {
				ResultSet rs = callableSt.getResultSet();
				System.out.println(rs);
				ResultSetMetaData metadata = rs.getMetaData();
				System.out.println(metadata);
				int numColumns = metadata.getColumnCount();
				System.out.println(numColumns);
				JSONArray jsonArr = new JSONArray();
				
				while(rs.next()) {
					JSONObject jsonObj = new JSONObject();
					for(int i = 1; i <= numColumns; ++i) {
						String col_name = metadata.getColumnName(i);
						jsonObj.put(col_name, rs.getObject(i));
					}
					jsonArr.add(jsonObj);
				}
				jsonObjMain.put(count, jsonArr);
				rs.close();
				
				count++;
				isExistResult = callableSt.getMoreResults();
			}
			
		} catch(Exception e) {
			System.out.println("error: " + e);
		} finally {
			
		}
		
		return jsonObjMain;
	}
}
