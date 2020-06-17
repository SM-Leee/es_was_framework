package com.douzone.common.service.grid;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.apache.commons.dbcp.BasicDataSource;
import org.json.simple.JSONArray;
import org.json.simple.parser.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GridService {

	@Autowired
	private BasicDataSource dataSource;
	
	public JSONObject getEmpgetEmpInfoToGrid(HttpServletRequest request) {
    	JSONObject result = null;
    	
    	try {
    		Object[] param = new Object[1];
    		param[0] = request.getParameter("CD_COMPANY");

			GridDBHelper dbHelper = new GridDBHelper(dataSource);
			result = dbHelper.exquteQuery("UP_HR_Z_LSH_GRID_TEST_S", param);
    	} catch(Exception ex) {
    		result = new JSONObject();
    		result.put("error", ex.toString());
    	}
    	
		return result;
	}
	
	public int save(HttpServletRequest request) {
		GridDBHelper dbHelper = new GridDBHelper(dataSource);
		dbHelper.setAutoCommit(false);
		
		int result = -1;
		
    	try {
    		JSONParser jsonParse = new JSONParser();
    		
    		String added = request.getParameter("added"); // 얘 자체가 JSONArray로 넘어옴
    		String modified = request.getParameter("modified"); // 얘 자체가 JSONArray로 넘어옴
    		String deleted = request.getParameter("deleted"); // 얘 자체가 JSONArray로 넘어옴
    		
    		JSONArray addedArr = (JSONArray)jsonParse.parse(added);
    		JSONArray modifiedArr = (JSONArray)jsonParse.parse(modified);
    		JSONArray deletedArr = (JSONArray)jsonParse.parse(deleted);

    		// Added 로직
    		if(addedArr != null && addedArr.size() > 0) {
    			System.out.println("start added logic...");

    			//GridDBHelper dbHelper = new GridDBHelper(dataSource);
        		String procName = "UP_HR_Z_LSH_GRID_TEST_I";
        		
    			for(int i=0; i<addedArr.size(); i++) {
    				JSONObject object = (JSONObject)addedArr.get(i);
					
    				String cd_company = object.get("cd_company").toString();
					String no_emp = object.get("no_emp").toString();
					String nm_kor = object.get("nm_kor").toString();
					String cd_dept = object.get("cd_dept").toString();

					dbHelper.setParameter("cd_company", cd_company);
					dbHelper.setParameter("no_emp", no_emp);
					dbHelper.setParameter("nm_kor", nm_kor);
					dbHelper.setParameter("cd_dept", cd_dept);
					
					result = dbHelper.save(procName);
					System.out.println("added logic : " + result);
    			}
    		}

    		// Updated 로직
    		if(modifiedArr != null && modifiedArr.size() > 0) {
    			System.out.println("start modified logic...");
    			
    			//GridDBHelper dbHelper = new GridDBHelper(dataSource);
        		String procName = "UP_HR_Z_LSH_GRID_TEST_U";
        		
    			for(int i=0; i<modifiedArr.size(); i++) {
    				JSONObject object = (JSONObject)modifiedArr.get(i);
					
    				String cd_company = object.get("cd_company").toString();
					String no_emp = object.get("no_emp").toString();
					String nm_kor = object.get("nm_kor").toString();
					String cd_dept = object.get("cd_dept").toString();
					
					dbHelper.setParameter("cd_company", cd_company);
					dbHelper.setParameter("no_emp", no_emp);
					dbHelper.setParameter("nm_kor", nm_kor);
					dbHelper.setParameter("cd_dept", cd_dept);
					
					result = dbHelper.save(procName);
					System.out.println("updated logic : " + result);
    			}
    		}

    		// Deleted 로직
    		if(deletedArr != null && deletedArr.size() > 0) {
    			System.out.println("start deleted logic...");
    			
    			//GridDBHelper dbHelper = new GridDBHelper(dataSource);
        		String procName = "UP_HR_Z_LSH_GRID_TEST_D";
        		
    			for(int i=0; i<deletedArr.size(); i++) {
    				System.out.println(deletedArr.get(i));
    				JSONObject object = (JSONObject)deletedArr.get(i);
					
    				String cd_company = object.get("cd_company").toString();
					String no_emp = object.get("no_emp").toString();
					
					dbHelper.setParameter("cd_company", cd_company);
					dbHelper.setParameter("no_emp", no_emp);
					
					result = dbHelper.save(procName);
					System.out.println("deleted logic : " + result);
    			}
    		}
    		
    		dbHelper.commit();
    	} catch(Exception ex) {
    		try {
				dbHelper.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
    		result = -1;
    		System.err.println(ex);    		
    	}
    	
    	return result;
	}
}
