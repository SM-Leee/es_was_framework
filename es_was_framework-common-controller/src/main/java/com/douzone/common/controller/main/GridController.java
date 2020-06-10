package com.douzone.common.controller.main;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzone.common.service.grid.GridService;

@Controller
@RequestMapping("/grid")
public class GridController {

	@Autowired
	GridService gridService;
	
	@ResponseBody
	@RequestMapping(value="/getEmp", method=RequestMethod.POST)
	public JSONObject getEmpInfoToGrid(HttpServletRequest request) {
		System.out.println("hi");
		return gridService.getEmpgetEmpInfoToGrid(request);
	}
	
	@ResponseBody
	@RequestMapping(value="/dataMap", method=RequestMethod.POST)
	public JSONObject getDataMap(HttpServletRequest request) {
		return gridService.getDataMap(request);
	}

	@ResponseBody
	@RequestMapping(value="/getSo", method=RequestMethod.POST)
	public JSONObject getSo(HttpServletRequest request) {
		return gridService.getSO(request);
	}

	@ResponseBody
	@RequestMapping(value="/getWCode", method=RequestMethod.POST)
	public JSONObject getWCode(HttpServletRequest request) {
		return gridService.getWCode(request);
	}
}
