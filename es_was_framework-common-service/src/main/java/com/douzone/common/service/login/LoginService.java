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
public class LoginService {

	@Autowired
	private BasicDataSource dataSource;

	public LoginUser getUser(String companyCode, String groupCode, String userId, String password) {
		LoginUser result = null;

		try {

			System.out.println("[getUser]메소드 실행");
			JSONObject jsonObjMain = new JSONObject();

			String storedProcedure = "{call UP_Z_KJS_TEST_S(?, ?, ?, ?)}";
			Connection connection = null;

			connection = dataSource.getConnection();

			CallableStatement callableSt = connection.prepareCall(storedProcedure);
			callableSt.setString(1, companyCode);
			callableSt.setString(2, groupCode);
			callableSt.setString(3, userId);
			callableSt.setString(4, password);

			boolean isExistResult = callableSt.execute();
			while(isExistResult) {
				ResultSet rs = callableSt.getResultSet();
				
				while(rs.next()) {
					result = new LoginUser();
					result.setCOMPANY_CODE(rs.getString("CD_COMPANY"));
					result.setUSER_ID(rs.getString("ID_USER"));
					result.setUSER_NAME(rs.getString("NM_USER"));
					result.setEMP_NO(rs.getString("NO_EMP"));
					result.setUSER_AUTH(rs.getString("USR_GUBUN"));
				}
				isExistResult = callableSt.getMoreResults();
			}
			int count = 0;
			
			/*
			while (isExistResult) {
				ResultSet rs = callableSt.getResultSet();
				ResultSetMetaData metadata = rs.getMetaData();
				int numColumns = metadata.getColumnCount();
				JSONArray jsonArr = new JSONArray();

				while (rs.next()) {
					JSONObject jsonObj = new JSONObject();
					for (int i = 1; i <= numColumns; ++i) {
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
			*/

		} catch (Exception e) {
			System.out.println("error: " + e);
		} finally {

		}

		return result;
	}
}
