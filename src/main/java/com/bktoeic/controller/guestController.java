package com.bktoeic.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bktoeic.dao.DLBaiHocDAO;
import com.bktoeic.dao.UserDAO;
import com.bktoeic.model.Account;
import com.bktoeic.model.Lessions;
import com.fasterxml.jackson.core.JsonProcessingException;


@Controller
public class guestController {
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private DLBaiHocDAO dlBaiHocDAO;

	@GetMapping(value= {"/","/login"})
	public String login(Model model) {
		model.addAttribute("user", new Account());
		return "guest";
	}
	
	@GetMapping(value= {"/home"})
	public String home(@ModelAttribute("name")String name,Model model) {
		model.addAttribute("name", name);
		return "home";
	}
	
	@PostMapping("/checklogin")
	public String dangNhap(@RequestParam("usernameLogin")String username,@RequestParam("passwordLogin")String password,Model model) {
		if(userDAO.checkAccount(username, password)) {
			Account user=userDAO.getUser(username);
			String[] name=user.getName().split("\\s");
			model.addAttribute("name", name[name.length-1]);
			return "redirect: home";
		}
		return "redirect: login";
	}
	
	@RequestMapping("/register")
	@ResponseBody
	public String dangKy(@ModelAttribute("user")Account user,Model model) throws JsonProcessingException {
		
//		user.setType("user");
//		user.setDateOfBirth(java.sql.Date.valueOf(dob));
//		System.out.println(user.getDateOfBirth());
//		ObjectMapper ob=new ObjectMapper();
//		System.out.println("ajax");
		if(userDAO.addUser(user)) {
//			return ob.writeValueAsString(true);
			return "redirect: home";
		}
		
		return "redirect: /";
	}
	
	@RequestMapping("/readingpractice")
	public String redinghome(ModelMap map) {
		List<Lessions> suggest= dlBaiHocDAO.topLession("BD");
		List<Lessions> newLessions= dlBaiHocDAO.newLession("BD");
		map.put("suggest", suggest);
		map.put("newLessions", newLessions);
		return "readinghome";
	}
}
