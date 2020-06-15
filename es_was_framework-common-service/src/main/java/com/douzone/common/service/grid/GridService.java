package com.douzone.common.service.grid;

import java.util.*;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.*;
import org.springframework.stereotype.Service;

import com.douzone.common.model.dbhelper.DBHelper;

@Service
public class GridService {

	public JSONObject getEmpgetEmpInfoToGrid(HttpServletRequest request) {
		DBHelper dbHelper = new DBHelper("002");
		
    	JSONObject result = null;
    	
    	try {
    		Object[] param = new Object[1];
    		param[0] = request.getParameter("CD_COMPANY");

    		result = dbHelper.ExecuteQuery("UP_HR_Z_LSH_GRID_TEST_S", param);
    	} catch(Exception ex) {
    		result = new JSONObject();
    		result.put("error", ex.toString());
    	} finally {
    		dbHelper.Terminate();
    	}
    	
		return result;
	}
	
	public void save(HttpServletRequest request) {
    	try {
    		JSONParser jsonParse = new JSONParser();
    		
    		String added = request.getParameter("added"); // 얘 자체가 JSONArray로 넘어옴
    		String modified = request.getParameter("modified"); // 얘 자체가 JSONArray로 넘어옴
    		String deleted = request.getParameter("deleted"); // 얘 자체가 JSONArray로 넘어옴
    		
    		JSONArray addedArr = (JSONArray)jsonParse.parse(added);
    		JSONArray modifiedArr = (JSONArray)jsonParse.parse(modified);

    		
    		// Added 로직
    		if(addedArr != null && addedArr.size() > 0) {
        		GridDBHelper dbHelper = new GridDBHelper();
        		String procName = "UP_HR_Z_LSH_GRID_TEST_I";
        		
    			for(int i=0; i<addedArr.size(); i++) {
    				System.out.println(addedArr.get(i));
    				JSONObject object = (JSONObject)addedArr.get(i);
					
    				String cd_company = object.get("cd_company").toString();
					String no_emp = object.get("no_emp").toString();
					String nm_kor = object.get("nm_kor").toString();

					dbHelper.setParameter("cd_company", cd_company);
					dbHelper.setParameter("no_emp", no_emp);
					dbHelper.setParameter("nm_kor", nm_kor);
					
					int result = dbHelper.save(procName);
    			}
    		}
    		
    		// Updated 로직
/*
    		if(modifiedArr != null && modifiedArr.size() > 0) {
        		GridDBHelper dbHelper = new GridDBHelper();
        		String procName = "UP_HR_Z_LSH_GRID_TEST_U";
        		
    			for(int i=0; i<modifiedArr.size(); i++) {
    				System.out.println(modifiedArr.get(i));
    				JSONObject object = (JSONObject)modifiedArr.get(i);
					
    				String cd_company = object.get("cd_company").toString();
					String no_emp = object.get("no_emp").toString();
					String nm_kor = object.get("nm_kor").toString();
					
					dbHelper.setParameter("cd_company", cd_company);
					dbHelper.setParameter("no_emp", no_emp);
					dbHelper.setParameter("nm_kor", nm_kor);
					
					int result = dbHelper.save(procName);
    			}
    		}
    		*/
    		// 2020.06.15 오전 소스
    		/*
    		if(addedArr != null && addedArr.size() > 0) {
    			Object[][] args = new Object[addedArr.size()][]; // save에 넘겨질 파라미터

    			// 이부분은.. 모듈화시켜야함
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				String url = "jdbc:sqlserver://175.206.170.131:3433;databaseName=NEOE";
    			conn = DriverManager.getConnection(url, "NEOE", "NEOE");

    			// 1. AutoCommit 해제
    			conn.setAutoCommit(false);

				JSONObject object = (JSONObject)addedArr.get(0);	// jsonArray에서 item추출
				Iterator<String> iter = object.keySet().iterator(); // KeySet가져오기
				
				int keySize = object.keySet().size() - 1; // 각 json마다 key 갯수 // -1 이유는 state값 때문에

				String sql = "{call " + procName + "(";
				for(int keyIndex=0; keyIndex<keySize; keyIndex++) {
					if(keyIndex == keySize-1) {
						sql += "?)}";
					} else{
						sql += "?, ";
					}
				}
				
    			// 2. Execute a procedure create
				CallableStatement cstmt = conn.prepareCall(sql); 	
    			 
				for(int i=0; i<addedArr.size(); i++) {
					object = (JSONObject)addedArr.get(i);	// jsonArray에서 item추출
					iter = object.keySet().iterator(); // KeySet가져오기
					
					//Object[] obj = new Object[keySize]; // key갯수만큼 생성
					int index = 1;
					
					//Map<String, Object> s = new HashMap<String, Object>();
					
					while(iter.hasNext()) {
						String key = iter.next();
						String value = object.get(key).toString();
						if(key.equals("state")) continue;
						
						System.out.println(value);
						
						cstmt.setString(index, value);

						index++;
					}
					//args[i] = obj;
				}
				cstmt.executeUpdate();
				// Commit data here
				conn.commit();
    		}
    		*/
    		// 2020.06.15 이전 데이터 소스
/*
    		String procName = "UP_HR_Z_LSH_GRID_TEST_I";

    		if(addedArr != null && addedArr.size() > 0) {
				for(int i=0; i<addedArr.size(); i++) {
					JSONObject object = (JSONObject)addedArr.get(i);
					Iterator<String> iter = object.keySet().iterator();

					while(iter.hasNext()) {
						String key = iter.next();
						System.out.println(key);
						System.out.println(object.get(key));
					}
				}
    		}
*/
    		/*
    		JSONParser jsonParse = new JSONParser();
    		JSONArray arr = (JSONArray)jsonParse.parse(deleted);
    		//dbHelper.Save("UP_HR_Z_LSH_GRID_TEST_I", arr);

			for(int i=0; i<arr.size(); i++) {
				System.out.println(arr.get(i));
	    		//dbHelper.Save("UP_HR_Z_LSH_GRID_TEST_I", arr.get(i));				
			}
			*/
    		/*
    		if(arr != null && arr.size() > 0) {
				JSONObject object = (JSONObject)arr.get(0);
				System.out.println(object);
				Iterator<String> iter = object.keySet().iterator();
				
    			String insertProcName = "UP_HR_Z_LSH_GRID_TEST_I";
    			String updateProcName = "UP_HR_Z_LSH_GRID_TEST_U";
    			String deleteProcName = "UP_HR_Z_LSH_GRID_TEST_D";
    			
    			for(int i=0; i<arr.size(); i++) {
    			}
    		}*/
    	} catch(Exception ex) {
    		System.err.println(ex);    		
    	}
	}
	
	
}
