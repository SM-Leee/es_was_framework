package com.douzone.common.service.grid;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.douzone.common.model.dbhelper.DBHelper;


@Service
public class GridService {

	
	public JSONObject getEmpgetEmpInfoToGrid(HttpServletRequest request) {
		
		String CD_COMPANY = request.getParameter("CD_COMPANY");
		System.out.println(CD_COMPANY);
		
		
    	DBHelper dbHelper = new DBHelper("002");
    	JSONObject result = null;
    	
    	try {
    		
    		Object[] param = new Object[1];
    		param[0] = CD_COMPANY;

    		result = dbHelper.ExecuteQuery("UP_CZ_Z_LSH_GRID_TEST_S", param);
    	} catch(Exception ex) {
    		result = new JSONObject();
    		result.put("error", ex.toString());
    	} finally {
    		dbHelper.Terminate();
    	}
    	
		return result;
	}

	public JSONObject getDataMap(HttpServletRequest request) {
		
		String CD_COMPANY = request.getParameter("CD_COMPANY");
		String CD_FIELD = request.getParameter("CD_FIELD");		
		
    	DBHelper dbHelper = new DBHelper("002");
    	JSONObject result = null;
    	
    	try {
    		
    		Object[] param = new Object[2];
    		param[0] = CD_COMPANY;
    		param[1] = CD_FIELD;

    		result = dbHelper.ExecuteQuery("UP_CZ_Z_LSH_GRID_TEST_S1", param);
    	} catch(Exception ex) {
    		result = new JSONObject();
    		result.put("error", ex.toString());
    	} finally {
    		dbHelper.Terminate();
    	}
    	
		return result;
	}
	
	public JSONObject getSO(HttpServletRequest request) {

		String CD_COMPANY = request.getParameter("CD_COMPANY");
		String CD_PLANT = request.getParameter("CD_PLANT");		
		String NO_SO = request.getParameter("NO_SO");		

    	DBHelper dbHelper = new DBHelper("002");
    	JSONObject result = null;
    	
    	try {
    		
    		Object[] param = new Object[3];
    		param[0] = CD_COMPANY;
    		param[1] = CD_PLANT;
    		param[2] = NO_SO;

    		result = dbHelper.ExecuteQuery("UP_CZ_Z_LSH_GRID_TEST_S2", param);
    	} catch(Exception ex) {
    		result = new JSONObject();
    		result.put("error", ex.toString());
    	} finally {
    		dbHelper.Terminate();
    	}
    	
		return result;
	}
	
	public JSONObject getWCode(HttpServletRequest request) {

		String CD_COMPANY = request.getParameter("CD_COMPANY");

    	DBHelper dbHelper = new DBHelper("002");
    	JSONObject result = null;
    	
    	try {
    		
    		Object[] param = new Object[1];
    		param[0] = CD_COMPANY;

    		result = dbHelper.ExecuteQuery("UP_CZ_Z_LSH_GRID_TEST_S3", param);
    	} catch(Exception ex) {
    		result = new JSONObject();
    		result.put("error", ex.toString());
    	} finally {
    		dbHelper.Terminate();
    	}
    	
		return result;
	}
}
