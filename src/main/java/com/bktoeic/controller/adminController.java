package com.bktoeic.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.bktoeic.model.Account;
import com.bktoeic.model.Audio;
import com.bktoeic.model.Part1;
import com.bktoeic.service.adminService;
import com.bktoeic.service.userService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("admin")
@SessionAttributes("logAcc")
public class adminController<T> {

	@Autowired
	private adminService<T> adminService;

	@Autowired
	private userService userService;

	@GetMapping("accountManagement")
	public String adminHome(ModelMap map, HttpSession session) {
		// Account acc=(Account) session.getAttribute("logAcc");
		// if(acc.getType().equals("Admin")) {
		map.put("listUser", adminService.getList("account", 1));
		map.put("numbPage", userService.getNumberPage("account", 10));
		return "admin/accountManagement";
		// }
		// return "return /webtoeicproject/login";
	}
	

	@PostMapping("deleteAccount")
	@ResponseBody
	public String deleteAccount(@RequestParam("ids[]") int[] ids) throws JsonProcessingException {
		if (adminService.delete("account", ids)) {
			return new ObjectMapper().writeValueAsString("done");
		}
		return new ObjectMapper().writeValueAsString("error");
	}

	@GetMapping("questionManagement/{type}")
	public String accessQuestionManagement(@PathVariable("type") String type, ModelMap map, HttpSession session) {
		// Account acc=(Account) session.getAttribute("logAcc");
		// if(acc.getType().equals("Admin")) {
		map.put("listQuestion", adminService.getList(type, 1));
		map.put("numbPage", userService.getNumberPage(type, 10));
		switch (type) {
		case "part1": return "admin/part1Management";
		case "part2": return "admin/part2Management";
		case "part3": return "admin/part3Management";
		case "part4": return "admin/part4Management";
		case "part5": return "admin/part5Management";
		case "part6": return "admin/part6Management";
		case "part7": return "admin/part7Management";
		case "audio": return "admin/audioManagement";
		case "image": return "admin/imageManagement";
		case "paragraph": return "admin/paragraphManagement";
		default: return "error";
		}

	}

	@PostMapping("questionManagement/addPart1")
	@ResponseBody
	public String addQuestion(@RequestParam("audio") CommonsMultipartFile commonsMultipartFile,@RequestParam("part1[]")ArrayList<Part1> questions) throws JsonProcessingException {
		System.out.println(commonsMultipartFile.getOriginalFilename());
		
		
//		if (adminService.delete("account", ids)) {
//			return new ObjectMapper().writeValueAsString("done");
//		}
		return new ObjectMapper().writeValueAsString("error");
	}
	
	@PostMapping("pagination/{type}/{page}")
	@ResponseBody
	public String paging(@PathVariable("type")String type,@PathVariable("page")int page) throws JsonProcessingException {
		
		
		
//		if (adminService.delete("account", ids)) {
//			return new ObjectMapper().writeValueAsString("done");
//		}
		return new ObjectMapper().writeValueAsString("error");
	}

}
