package com.bktoeic.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;


import java.nio.charset.Charset;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bktoeic.model.Account;
import com.bktoeic.model.Comment;
import com.bktoeic.model.Practice;
import com.bktoeic.model.ReplyComment;
import com.bktoeic.service.guestService;
import com.bktoeic.service.userService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@SessionAttributes("logAcc")
public class guestController {

	@Autowired
	private userService userService;

	@Autowired
	private guestService guestService;


	@GetMapping(value = { "/", "/login" })
	public String login(Model model, RedirectAttributes ra, HttpSession session) {
		Account acc = (Account) session.getAttribute("logAcc");
		if (acc != null) {
			ra.addFlashAttribute("name", acc.getName());
			return "redirect: home";
		}
		model.addAttribute("user", new Account());
		return "guest";
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect: login";
	}

	@GetMapping(value = { "/home" })
	public String home(ModelMap model, HttpSession session) {
		Account acc = (Account) session.getAttribute("logAcc");
		if (acc == null) {
			return "redirect: login";
		} else {
			if (acc.getType().equals("Admin")) {
				return "redirect: admin";
			} else if (acc.getType().equals("User")) {
				String[] name = acc.getName().split("\\s");
				System.out.println(acc.getName() + name);
				try {
					model.addAttribute("name", new String(name[name.length - 1].getBytes("UTF-8"), "UTF-8"));
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
		}
		return "home";
	}

	@PostMapping("/checklogin")
	public String dangNhap(@RequestParam("usernameLogin") String username,
			@RequestParam("passwordLogin") String password, ModelMap model) {
		Account user = userService.checkAccount(username.trim(), password.trim());
		if (user != null) {
			try {
				user.setName(new String(user.getName().getBytes("UTF-8"), "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			model.addAttribute("logAcc", user);
			if (user.getType().equals("Admin")) {
				return "redirect: admin/accountManagement/1";
			}
			return "redirect: home";
		}
		System.out.println("account null");
		return "redirect: login";
	}

	@PostMapping("/register")
	public String register(@RequestParam("avt")CommonsMultipartFile avatar,@ModelAttribute("user") Account user, Model model,HttpSession session) throws JsonProcessingException {
		try {
			String filename=avatar.getOriginalFilename();
			String dirPath = session.getServletContext().getRealPath("upload/avt");
			if(!filename.equals("")) {
				File fileDir =new File(dirPath);
				if(!fileDir.exists()) {
					fileDir.mkdirs();
					System.out.println("folder created!");
				}
				
				File avt =new File(dirPath+File.separator+filename);
				avatar.transferTo(avt);
				
				user.setAvatar("upload/avt/"+filename);
				System.out.println("upload done: "+"upload/avt/"+filename);
			}
			if (userService.register(user)) {
				return "redirect: home";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect: login";
	}

	// 		PRACTICE
	@RequestMapping("/readingpractice/{part}")
	public String readinghome(ModelMap map, HttpSession session, @PathVariable("part") byte part) {
		List<Practice> listPrac = guestService.accessPractice(part);
		map.addAttribute("listPractice", listPrac);
		if (part == 5) {
			map.addAttribute("partTitle", "Part 5: Incomplete Sentence");
			map.addAttribute("part", 5);
		} else if (part == 6) {
			map.addAttribute("partTitle", "Part 6: Text completion");
			map.addAttribute("part", 6);
		} else if (part == 7) {
			map.addAttribute("partTitle", "Part 7: Reading comprehen");
			map.addAttribute("part", 7);
		}

		Account acc = (Account) session.getAttribute("logAcc");

		if (acc != null) {
			String[] name = acc.getName().split("\\s");
			map.addAttribute("name", name[name.length - 1]);
		} else {
			map.addAttribute("name", null);
		}
		return "practice/readinghome";
	}
	
	@RequestMapping("/listeningpractice/{part}")
	public String listeninghome(ModelMap map, HttpSession session, @PathVariable("part") byte part) {
		List<Practice> listPrac = guestService.accessPractice(part);
		map.addAttribute("listPractice", listPrac);
		if (part == 1) {
			map.addAttribute("partTitle", "Part 1: Photo");
			map.addAttribute("part", 1);
		} else if (part == 2) {
			map.addAttribute("partTitle", "Part 2: Question-Response");
			map.addAttribute("part", 2);
		} else if (part == 3) {
			map.addAttribute("partTitle", "Part 3: Short conversation");
			map.addAttribute("part", 3);
		}else if (part == 4) {
			map.addAttribute("partTitle", "Part 4: Short talk");
			map.addAttribute("part", 4);
		}

		Account acc = (Account) session.getAttribute("logAcc");

		if (acc != null) {
			String[] name = acc.getName().split("\\s");
			map.addAttribute("name", name[name.length - 1]);
		} else {
			map.addAttribute("name", null);
		}
		return "practice/listening";
	}

	@PostMapping("/readingPractice")
	@ResponseBody
	public String practice(ModelMap map, HttpSession session, @RequestParam("id") int idPractice,
			@RequestParam("part") byte part) throws IOException{
		
		String response=null;
					try {
						response = new String(new ObjectMapper().writeValueAsBytes(
						guestService.practiceReadingQues(idPractice, part)));
					} catch (JsonProcessingException e) {
						System.out.println("json error"+e.getMessage());
					}
		return response;
	}
	
	@GetMapping("/practice/{part}/{title}/{id}")
	public String accessPractice(ModelMap map, HttpSession session, 
			@PathVariable("id") int id, @PathVariable("part") byte part) {
		map.put("practice", guestService.practice(id,part));
		if(part==3 || part==4 || part ==1 ||part==2) {
			return "practice/listeningPractice";
		}else if(part ==6 || part==7 || part==5) {
			return "practice/readingPractice";
		}
		
		return "redirect: ";
	}
	
	@PostMapping("/practice/{part}/{id}")
	@ResponseBody
	public String practiceListening(ModelMap map, HttpSession session, 
			@PathVariable("id") int id, @PathVariable("part") byte part) throws JsonProcessingException {
		Practice p=guestService.practice(id,part);
		if(part==3) {
			return new ObjectMapper().writeValueAsString(p.getAudio().getPart3());
		}else if(part==1) {
			return new ObjectMapper().writeValueAsString(p.getAudio().getPart1());
		}else if(part==2) {
			return new ObjectMapper().writeValueAsString(p.getAudio().getPart2());
		}else if(part==4) {
			return new ObjectMapper().writeValueAsString(p.getAudio().getPart4());
		}
		return "error";
	}
	
	//THUOC VE THAO LUAN
	
	@GetMapping(value = { "/BKForum" })
	public String forum(ModelMap map, HttpSession session) {
		Account acc = (Account) session.getAttribute("logAcc");
		
		map.put("discussionList", userService.getDiscussionList());
		if (acc == null) {
			return "discussion/guestDiscussion";
		} else {
			return "discussion/guestDiscussion";
//			if (acc.getType().equals("Admin")) {
//				return "redirect: Admin";
//			} else if (acc.getType().equals("User")) {
//				String[] name = acc.getName().split("\\s");
//
//				System.out.println(acc.getName() + name);
//				try {
//					model.addAttribute("name", new String(name[name.length - 1].getBytes("UTF-8"), "UTF-8"));
//				} catch (UnsupportedEncodingException e) {
//					e.printStackTrace();
//				}
//
//			}
		}
		
	}
	
	@GetMapping(value = { "/discussion/{title}/{id}" })
	public String accessDiscussion(@PathVariable("id")byte id,ModelMap map, HttpSession session) {
		Account acc = (Account) session.getAttribute("logAcc");
		if (acc == null) {
			map.put("discussion", userService.getDiscussion(id));
			return "discussion/discussionView";
		} else {
			String[] name = acc.getName().split("\\s");
			map.addAttribute("name", name[name.length - 1]);
			map.put("discussion", userService.getDiscussion(id));
			map.put("user", acc);
			return "discussion/discussionViewUser";
		}
	}
	
	@PostMapping(value = { "/getPageComment" })
	@ResponseBody
	public String getPageComment(@RequestParam("id")int discussionId,@RequestParam("page")int page,
			@RequestParam("pageSize")int pageSize,ModelMap map, HttpSession session) throws JsonProcessingException {
		try {
			List<Comment> comments= userService.getListComment(page, pageSize , discussionId);
			return new ObjectMapper().writeValueAsString(comments);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ObjectMapper().writeValueAsString("error");
	}
	
	@PostMapping(value = { "/getReplyComment" })
	@ResponseBody
	public String getReplyComment(@RequestParam("id")int commentId,@RequestParam("page")int page,
			@RequestParam("pageSize")int pageSize,ModelMap map, HttpSession session) throws JsonProcessingException {
		try {
			List<ReplyComment> replies= userService.getListReplyComment(page, pageSize , commentId);
			return new ObjectMapper().writeValueAsString(replies);
		} catch (Exception e) {
			e.printStackTrace();
		}
			return new ObjectMapper().writeValueAsString("error");
		}
	
}
