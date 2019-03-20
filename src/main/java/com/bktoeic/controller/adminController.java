package com.bktoeic.controller;

import java.io.File;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import com.bktoeic.model.Account;
import com.bktoeic.model.Audio;
import com.bktoeic.model.Part1;
import com.bktoeic.model.Part5;
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

	@GetMapping("accountManagement/{page}")
	public String adminHome(@PathVariable("page") int page, ModelMap map, HttpSession session) {
		map.put("listUser", adminService.getList("account", page));
		map.put("numbPage", userService.getNumberPage("account", 10));
		map.put("currentPage", page);
		return "admin/accountManagement";
	}

	@GetMapping("questionManagement/{type}/{page}")
	public String accessQuestionManagement(@PathVariable("type") String type, @PathVariable("page") int page,
			ModelMap map, HttpSession session) {
		map.put("listQuestion", adminService.getList(type, page));
		map.put("numbPage", userService.getNumberPage(type, 10));
		map.put("currentPage", page);
		switch (type) {
		case "part1":
			return "admin/part1Management";
		case "part2":
			return "admin/part2Management";
		case "part3":
			return "admin/part3Management";
		case "part4":
			return "admin/part4Management";
		case "part5":
			return "admin/part5Management";
		case "part6":
			return "admin/part6Management";
		case "part7":
			return "admin/part7Management";
		case "audio":
			return "admin/audioManagement";
		case "image":
			return "admin/imageManagement";
		case "paragraph":
			return "admin/paragraphManagement";
		default:
			return "error";
		}

	}
	

	@PostMapping("uploadFile/{type}")
	@ResponseBody
	public String uploadFile(@RequestParam("file") CommonsMultipartFile commonsMultipartFile,@PathVariable("type")String type,
			HttpSession session) throws JsonProcessingException {
		String fileName = commonsMultipartFile.getOriginalFilename();
		
		
		try {
			if(type.equals("audio")) {
				String dirPath = session.getServletContext().getRealPath("upload/audio");
				if (!fileName.equals("")) {
					File fileDir = new File(dirPath);
					if (!fileDir.exists()) {
						fileDir.mkdirs();
					}
					File uploadFile = new File(dirPath + File.separator + fileName);

					commonsMultipartFile.transferTo(uploadFile);
					System.out.println("upload done");
					return new ObjectMapper().writeValueAsString("upload/audio/" + fileName);
				}
			}else if(type.equals("image")) {
				String dirPath = session.getServletContext().getRealPath("upload/image");
				if (!fileName.equals("")) {
					File fileDir = new File(dirPath);
					if (!fileDir.exists()) {
						fileDir.mkdirs();
					}
					File uploadFile = new File(dirPath + File.separator + fileName);

					commonsMultipartFile.transferTo(uploadFile);
					System.out.println("upload done");
					return new ObjectMapper().writeValueAsString("upload/image/" + fileName);
				}
			}
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return new ObjectMapper().writeValueAsString("error");
	}

	@SuppressWarnings("rawtypes")
	@PostMapping("questionManagement/addPart1")
	@ResponseBody
	public String addQuestion(@RequestBody TransferDTO part1Ques)
			throws JsonProcessingException {
		@SuppressWarnings("unchecked")
		LinkedHashMap<String, String> audioMap =(LinkedHashMap<String, String>) part1Ques.getListPart().get(0);
		System.out.println(audioMap);
		Audio audio = new Audio();
		audio.setAudio(audioMap.get("audio"));
		audio.setScript(audioMap.get("script"));
//		audio.setPart1(audioMap.get("part1"));
		return new ObjectMapper().writeValueAsString("done");
	}

	@SuppressWarnings("unchecked")
	@PostMapping("questionManagement/addPart5")
	public String addQuestion(@ModelAttribute("part5") Part5 part5, ModelMap map, HttpSession session) {
		if (adminService.save((T) part5)) {
			System.out.println("add done");
		}
		return "redirect: part5/" + userService.getNumberPage("part5", 10);
	}

	@SuppressWarnings("unchecked")
	@PostMapping("questionManagement/updatePart5")
	public String updateQuestion(@ModelAttribute("part5") Part5 part5, ModelMap map, HttpSession session) {
		if (adminService.update((T) part5)) {
			System.out.println("add done");
		}
		return "redirect: part5/" + userService.getNumberPage("part5", 10);
	}

	@GetMapping("practiceManagement/{page}")
	public String practiceManagement(@PathVariable("page") int page, ModelMap map, HttpSession session) {
		map.put("listPractice", adminService.getList("practice", page));
		map.put("numbPage", userService.getNumberPage("practice", 10));
		map.put("currentPage", page);
		return "admin/accountManagement";
	}

	@PostMapping("deleteDocument")
	@ResponseBody
	public String deleteAccount(@RequestParam("type") String type, @RequestParam("ids[]") int[] ids)
			throws JsonProcessingException {
		switch (type) {
		case "account":
			if (adminService.delete("account", ids))
				return new ObjectMapper().writeValueAsString("done");
			break;
		case "part1":
			return "admin/part1Management";
		case "part2":
			return "admin/part2Management";
		case "part3":
			return "admin/part3Management";
		case "part4":
			return "admin/part4Management";
		case "part5":
			if (adminService.delete("part5", ids))
				return new ObjectMapper().writeValueAsString("done");
			break;
		case "part6":
			return "admin/part6Management";
		case "part7":
			return "admin/part7Management";
		case "audio":
			return "admin/audioManagement";
		case "image":
			return "admin/imageManagement";
		case "paragraph":
			return "admin/paragraphManagement";
		default:
			return "error";
		}
		return new ObjectMapper().writeValueAsString("error");
	}
}

class TransferDTO<T> {
	private List<T> listPart;

	public final List<T> getListPart() {
		return listPart;
	}

	public final void setListPart(List<T> listPart) {
		this.listPart = listPart;
	}
	
}
