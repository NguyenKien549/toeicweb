package com.bktoeic.controller;

import java.io.File;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;

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
import com.bktoeic.model.Discussion;
import com.bktoeic.model.Paragraph;
import com.bktoeic.model.Part1;
import com.bktoeic.model.Part2;
import com.bktoeic.model.Part3;
import com.bktoeic.model.Part4;
import com.bktoeic.model.Part5;
import com.bktoeic.model.Part6;
import com.bktoeic.model.Part7;
import com.bktoeic.model.Practice;
import com.bktoeic.model.Test;
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

	String upload(CommonsMultipartFile commonsMultipartFile, String type, HttpSession session) {
		try {
			String fileName = commonsMultipartFile.getOriginalFilename();
			String dirPath = session.getServletContext().getRealPath("upload/" + type);
			if (!fileName.equals("")) {
				File fileDir = new File(dirPath);
				if (!fileDir.exists()) {
					fileDir.mkdirs();
				}
				File uploadFile = new File(dirPath + File.separator + fileName);

				commonsMultipartFile.transferTo(uploadFile);
				System.out.println("upload/" + type + "/" + fileName);
				return "upload/" + type + "/" + fileName;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "";
	}

	// ACCOUNT

	@GetMapping("accountManagement/{page}")
	public String adminHome(@PathVariable("page") int page, ModelMap map, HttpSession session) {
		map.put("listUser", adminService.getList("account", page, 10));
		map.put("numbPage", userService.getNumberPage("account", 10));
		map.put("currentPage", page);
		map.put("account", new Account());
		return "admin/accountManagement";
	}

	@SuppressWarnings("unchecked")
	@PostMapping("accountManagement/addAccount")
	public String addAccount(@ModelAttribute("account") Account account,
			@RequestParam("avt") CommonsMultipartFile avatar, ModelMap map, HttpSession session) {
		try {
			account.setAvatar(upload(avatar, "avt", session));
			if (adminService.save((T) account)) {
				System.out.println("add done");
				map.put("error", "add done!");
			} else {
				map.put("error", "add fail! please again!");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect: " + userService.getNumberPage("account", 10);
	}

	@PostMapping("accountManagement/lockAccount")
	@ResponseBody
	public String lockAccount(@RequestParam("ids[]") Integer[] ids, ModelMap map) throws JsonProcessingException {
		if (adminService.lock("account", ids)) {
			return new ObjectMapper().writeValueAsString("done");
		}
		return new ObjectMapper().writeValueAsString("error");
	}

	@PostMapping("accountManagement/unlockAccount")
	@ResponseBody
	public String unlockAccount(@RequestParam("ids[]") Integer[] ids, ModelMap map) throws JsonProcessingException {
		if (adminService.unlock("account", ids)) {
			return new ObjectMapper().writeValueAsString("done");
		}
		return new ObjectMapper().writeValueAsString("error");
	}
	
	@PostMapping("accountManagement/delete")
	@ResponseBody
	public String deleteAccount(@RequestParam("ids[]") int[] ids, ModelMap map) throws JsonProcessingException {
		if (adminService.delete("account", ids)) {
			return new ObjectMapper().writeValueAsString("done");
		}
		return new ObjectMapper().writeValueAsString("error");
	}

	// QUESTION LIBRARY

	@GetMapping("questionManagement/{type}/{page}")
	public String accessQuestionManagement(@PathVariable("type") String type, @PathVariable("page") int page,
			ModelMap map, HttpSession session) {
		map.put("listQuestion", adminService.getList(type, page, 10));
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
	public String uploadFile(@RequestParam("file") CommonsMultipartFile commonsMultipartFile,
			@PathVariable("type") String type, HttpSession session) throws JsonProcessingException {
		try {
			if (type.equals("audio")) {
				return new ObjectMapper().writeValueAsString(upload(commonsMultipartFile, "audio", session));
			} else if (type.equals("image")) {
				return new ObjectMapper().writeValueAsString(upload(commonsMultipartFile, "image", session));
			}

		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return new ObjectMapper().writeValueAsString("error");
	}

	// QuestionDocument

	// add question to audio,paragraph,test,practice
	@PostMapping("questionManagement/addQuestionToDocument")
	@ResponseBody
	public String addDocumentQuestion(@RequestParam("type") String type, @RequestParam("part") String part,
			@RequestParam("id") int id, @RequestParam("ids[]") int[] ids) throws JsonProcessingException {
		System.out.println("part " + part + " type: " + type);
		if (adminService.addOrUpdateQuestionToDocument(type, part, id, ids))
			return new ObjectMapper().writeValueAsString("done");

		return new ObjectMapper().writeValueAsString("error");
	}

	// update question to audio,paragraph,test,practice
	@PostMapping("questionManagement/updateQuestionToDocument")
	@ResponseBody
	public String updateDocumentQuestion(@RequestParam("type") String type, @RequestParam("part") String part,
			@RequestParam("id") int id, @RequestParam("ids[]") int[] ids) throws JsonProcessingException {
		if (ids.length > 0) {
			System.out.println("part update " + part);
			if (adminService.addOrUpdateQuestionToDocument(type, part, id, ids))
				return new ObjectMapper().writeValueAsString("done");
		}

		return new ObjectMapper().writeValueAsString("error");
	}

	// PRACTICE and test
	@GetMapping("lessonManagement/{type}/{page}")
	public String lessonManagement(@PathVariable("type") String type, @PathVariable("page") int page, ModelMap map,
			HttpSession session) {
		map.put("listLesson", adminService.getList(type, page, 10));
		map.put("numbPage", userService.getNumberPage(type, 10));
		map.put("currentPage", page);
		if (type.equals("practice")) {
			return "admin/practiceManagement";
		} else if (type.equals("test")) {
			return "admin/testManagement";
		}
		return "error";

	}

	@GetMapping("lessonManagement/getDocumentForLesson")
	@ResponseBody
	public String getDocumentForLesson(@RequestParam("type") String type, @RequestParam("kind") String kind)
			throws JsonProcessingException {

		System.out.println("type update " + type);
		try {
			List<T> list = adminService.getDocumentForLesson(type, kind);
			if (list != null)
				return new ObjectMapper().writeValueAsString(list);
		} catch (Exception e) {
			e.getMessage();
			e.printStackTrace();
		}
		return new ObjectMapper().writeValueAsString("error");
	}

	@SuppressWarnings("unchecked")
	@PostMapping("lessonManagement/addPractice")
	@ResponseBody
	public String addLesson(@RequestBody DTO practice) throws JsonProcessingException {
		System.out.println(practice.getPractice().getAudio());
		if (practice.getPractice() != null)
			if (adminService.save((T) practice.getPractice())) {
				return new ObjectMapper().writeValueAsString(userService.getNumberPage("practice", 10));
			}

		return new ObjectMapper().writeValueAsString("error");
	}

	@SuppressWarnings("null")
	@PostMapping("lessonManagement/addDocumentForLesson")
	@ResponseBody
	public String addDocumentForLesson(@RequestParam("type") String type, @RequestParam("id") int id,
			@RequestParam("ids[]") int[] ids) throws JsonProcessingException {
		if (type != null || type.equals("") || id < 1)
			if (adminService.addorUpdateDocumentForLesson(type, id, ids)) {
				return new ObjectMapper().writeValueAsString("done");
			}

		return new ObjectMapper().writeValueAsString("error");
	}

	@SuppressWarnings("unchecked")
	@PostMapping("lessonManagement/updatePractice")
	@ResponseBody
	public String updateLesson(@RequestBody DTO practice) throws JsonProcessingException {
		if (practice.getPractice() != null)
			if (adminService.update((T) practice.getPractice())) {
				return new ObjectMapper().writeValueAsString(userService.getNumberPage("practice", 10));
			}

		return new ObjectMapper().writeValueAsString("error");
	}

	@PostMapping("lessonManagement/getCurrentDocument")
	@ResponseBody
	public String getCurrentDocument(@RequestParam("type") String type, @RequestParam("id") int id)
			throws JsonProcessingException {
		if (type != null && id > 0) {
			Object obj = adminService.getObject(type, id);
			System.out.println("get DOne");
			return new ObjectMapper().writeValueAsString(obj);
		}
		return new ObjectMapper().writeValueAsString("error");
	}

	@SuppressWarnings("null")
	@PostMapping("lessonManagement/updateDocumentForLesson")
	@ResponseBody
	public String updateDocumentForLesson(@RequestParam("type") String type, @RequestParam("id") int id,
			@RequestParam("ids[]") int[] ids) throws JsonProcessingException {
		if (type != null || type.equals("") || id < 1)
			if (adminService.addorUpdateDocumentForLesson(type, id, ids)) {
				return new ObjectMapper().writeValueAsString("done");
			}

		return new ObjectMapper().writeValueAsString("error");
	}

	// Test

	@SuppressWarnings("unchecked")
	@PostMapping("lessonManagement/addTest")
	@ResponseBody
	public String addTest(@RequestBody DTO test) throws JsonProcessingException {
		if (test.getTest() != null)
			if (adminService.save((T) test.getTest())) {
				return new ObjectMapper().writeValueAsString(userService.getNumberPage("test", 10));
			}

		return new ObjectMapper().writeValueAsString("error");
	}
	
	@SuppressWarnings("unchecked")
	@PostMapping("lessonManagement/updateTest")
	@ResponseBody
	public String updateTest(@RequestBody DTO test) throws JsonProcessingException {
		if (test.getTest() != null)
			if (adminService.update((T) test.getTest())) {
				return new ObjectMapper().writeValueAsString(userService.getNumberPage("test", 10));
			}

		return new ObjectMapper().writeValueAsString("error");
	}
	
	@GetMapping("lessonManagement/test/updateTestDocument/{testId}")
	public String updateTestDocument(@PathVariable("testId")int id,ModelMap map){
		map.put("test", adminService.getObject("test", id)) ;
		map.put("audioDocuments", adminService.getDocumentForLesson("test","test")) ;
		map.put("part5Documents", adminService.getDocumentForLesson("part5", "test")) ;
		map.put("part6Documents", adminService.getDocumentForLesson("part6", "test")) ;
		map.put("part7Documents", adminService.getDocumentForLesson("part7", "test")) ;
		return "admin/updateTestManagement";
	}

	// AUDIO
	@PostMapping("questionManagement/getQuestionToDocument")
	@ResponseBody
	public String getDocumentQuestion(@RequestParam("type") String type) throws JsonProcessingException {
		System.out.println("type " + type);
		if (type != null) {
			List<T> list = adminService.getQuestion(type);
			if (list != null) {
				return new ObjectMapper().writeValueAsString(list);
			}
		}
		return new ObjectMapper().writeValueAsString("error");
	}

	@PostMapping("questionManagement/getCurrentQuestion")
	@ResponseBody
	public String getCurrentQuestion(@RequestParam("type") String type, @RequestParam("id") int id)
			throws JsonProcessingException {
		if (type != null) {
			Object obj = adminService.getObject(type, id);
			System.out.println("get DOne");
			return new ObjectMapper().writeValueAsString(obj);
		}
		return new ObjectMapper().writeValueAsString("error");
	}

	@SuppressWarnings("unchecked")
	@PostMapping("questionManagement/addAudio")
	@ResponseBody
	public String addAudio(@RequestBody DTO audio) throws JsonProcessingException {
		if (audio.getAudio() != null)
			if (adminService.save((T) audio.getAudio())) {
				return new ObjectMapper().writeValueAsString(userService.getNumberPage("audio", 10));
			}

		return new ObjectMapper().writeValueAsString("error");
	}

	@SuppressWarnings("unchecked")
	@PostMapping("questionManagement/updateAudio")
	@ResponseBody
	public String updateAudio(@RequestBody DTO audio) throws JsonProcessingException {
		if (adminService.update((T) audio.getAudio())) {
			return new ObjectMapper().writeValueAsString("done");
		}
		return new ObjectMapper().writeValueAsString("error");
	}

	// PARAGRAPH
	@SuppressWarnings("unchecked")
	@PostMapping("questionManagement/addParagraph")
	@ResponseBody
	public String addParagraph(@RequestBody DTO paragraph) throws JsonProcessingException {
		if (paragraph.getParagraph() != null)
			if (adminService.save((T) paragraph.getParagraph())) {
				return new ObjectMapper().writeValueAsString(userService.getNumberPage("paragraph", 10));
			}

		return new ObjectMapper().writeValueAsString("error");
	}

	@SuppressWarnings("unchecked")
	@PostMapping("questionManagement/updateParagraph")
	@ResponseBody
	public String updateParagraph(@RequestBody DTO paragraph) throws JsonProcessingException {
		if (adminService.update((T) paragraph.getParagraph())) {
			return new ObjectMapper().writeValueAsString("done");
		}
		return new ObjectMapper().writeValueAsString("error");
	}

	// PART 1

	@SuppressWarnings("unchecked")
	@PostMapping("questionManagement/addPart1")
	@ResponseBody
	public String addQuestion(@RequestBody DTO part1) throws JsonProcessingException {
		if (!part1.getPart1().isEmpty())
			if (adminService.save((T) part1.getPart1())) {
				return new ObjectMapper().writeValueAsString(userService.getNumberPage("part1", 10));
			}

		return new ObjectMapper().writeValueAsString("error");
	}

	@SuppressWarnings("unchecked")
	@PostMapping("questionManagement/updateQuestion")
	@ResponseBody
	public String updateQuestion(@RequestBody DTO question) throws JsonProcessingException {
		System.out.println(question.getQuestion().getId());
		Audio audio = (Audio) adminService.getObject("audio", question.getQuestion().getAudioPart1().getId());
		question.getQuestion().setAudioPart1(audio);
		adminService.update((T) question.getQuestion());
		return new ObjectMapper().writeValueAsString("done");
	}

	// PART 2

	@SuppressWarnings("unchecked")
	@PostMapping("questionManagement/addPart2")
	@ResponseBody
	public String addQuestion2(@RequestBody DTO part2) throws JsonProcessingException {
		if (!part2.getPart2().isEmpty())
			if (adminService.save((T) part2.getPart2())) {
				return new ObjectMapper().writeValueAsString(userService.getNumberPage("part2", 10));
			}

		return new ObjectMapper().writeValueAsString("error");
	}

	@SuppressWarnings("unchecked")
	@PostMapping("questionManagement/updatePart2")
	@ResponseBody
	public String updateQuestion2(@RequestBody DTO question2) throws JsonProcessingException {
		if (adminService.update((T) question2.getQuestion2())) {
			System.out.println("ok");
			return new ObjectMapper().writeValueAsString("done");
		}

		return new ObjectMapper().writeValueAsString("error");
	}

	// PART3

	@SuppressWarnings("unchecked")
	@PostMapping("questionManagement/addPart3")
	@ResponseBody
	public String addQuestion3(@RequestBody DTO part3) throws JsonProcessingException {
		if (!part3.getPart3().isEmpty())
			if (adminService.save((T) part3.getPart3())) {
				return new ObjectMapper().writeValueAsString(userService.getNumberPage("part3", 10));
			}

		return new ObjectMapper().writeValueAsString("error");
	}

	@SuppressWarnings("unchecked")
	@PostMapping("questionManagement/updatePart3")
	@ResponseBody
	public String updateQuestion3(@RequestBody DTO question3) throws JsonProcessingException {
		if (adminService.update((T) question3.getQuestion3())) {
			System.out.println("ok");
			return new ObjectMapper().writeValueAsString("done");
		}

		return new ObjectMapper().writeValueAsString("error");
	}

	// PART 4

	@SuppressWarnings("unchecked")
	@PostMapping("questionManagement/addPart4")
	@ResponseBody
	public String addQuestion4(@RequestBody DTO part4) throws JsonProcessingException {
		if (!part4.getPart4().isEmpty())
			if (adminService.save((T) part4.getPart4())) {
				return new ObjectMapper().writeValueAsString(userService.getNumberPage("part4", 10));
			}

		return new ObjectMapper().writeValueAsString("error");
	}

	@SuppressWarnings("unchecked")
	@PostMapping("questionManagement/updatePart4")
	@ResponseBody
	public String updateQuestion4(@RequestBody DTO question4) throws JsonProcessingException {
		if (adminService.update((T) question4.getQuestion4())) {
			System.out.println("ok");
			return new ObjectMapper().writeValueAsString("done");
		}

		return new ObjectMapper().writeValueAsString("error");
	}

	// PART 5
	@SuppressWarnings("unchecked")
	@PostMapping("questionManagement/addPart5")
	@ResponseBody
	public String addQuestion5(@RequestBody DTO part5) throws JsonProcessingException {
		if (!part5.getPart5().isEmpty())
			if (adminService.save((T) part5.getPart5())) {
				return new ObjectMapper().writeValueAsString(userService.getNumberPage("part5", 10));
			}

		return new ObjectMapper().writeValueAsString("error");
	}

	@SuppressWarnings("unchecked")
	@PostMapping("questionManagement/updatePart5")
	@ResponseBody
	public String updateQuestion5(@RequestBody DTO question5) throws JsonProcessingException {
		if (adminService.update((T) question5.getQuestion5())) {
			System.out.println("ok");
			return new ObjectMapper().writeValueAsString("done");
		}

		return new ObjectMapper().writeValueAsString("error");
	}

	// PART 6
	@SuppressWarnings("unchecked")
	@PostMapping("questionManagement/addPart6")
	@ResponseBody
	public String addQuestion6(@RequestBody DTO part6) throws JsonProcessingException {
		if (!part6.getPart6().isEmpty())
			if (adminService.save((T) part6.getPart6())) {
				return new ObjectMapper().writeValueAsString(userService.getNumberPage("part6", 10));
			}

		return new ObjectMapper().writeValueAsString("error");
	}

	@SuppressWarnings("unchecked")
	@PostMapping("questionManagement/updatePart6")
	@ResponseBody
	public String updateQuestion6(@RequestBody DTO question6) throws JsonProcessingException {
		if (adminService.update((T) question6.getQuestion6())) {
			System.out.println("ok");
			return new ObjectMapper().writeValueAsString("done");
		}

		return new ObjectMapper().writeValueAsString("error");
	}

	// PART 7
	@SuppressWarnings("unchecked")
	@PostMapping("questionManagement/addPart7")
	@ResponseBody
	public String addQuestion7(@RequestBody DTO part7) throws JsonProcessingException {
		if (!part7.getPart7().isEmpty())
			if (adminService.save((T) part7.getPart7())) {
				return new ObjectMapper().writeValueAsString(userService.getNumberPage("part7", 10));
			}

		return new ObjectMapper().writeValueAsString("error");
	}

	@SuppressWarnings("unchecked")
	@PostMapping("questionManagement/updatePart7")
	@ResponseBody
	public String updateQuestion7(@RequestBody DTO question7) throws JsonProcessingException {
		if (adminService.update((T) question7.getQuestion7())) {
			System.out.println("ok");
			return new ObjectMapper().writeValueAsString("done");
		}

		return new ObjectMapper().writeValueAsString("error");
	}

	@GetMapping("practiceManagement/{page}")
	public String practiceManagement(@PathVariable("page") int page, ModelMap map, HttpSession session) {
		map.put("listPractice", adminService.getList("practice", page, 10));
		map.put("numbPage", userService.getNumberPage("practice", 10));
		map.put("currentPage", page);
		return "admin/accountManagement";
	}

	// DELETE

	@PostMapping("deleteDocument")
	@ResponseBody
	public String delete(@RequestParam("type") String type, @RequestParam("ids[]") int[] ids)
			throws JsonProcessingException {

		System.out.println("type" + type);
		if (adminService.delete(type, ids))
			return new ObjectMapper().writeValueAsString("done");

		return new ObjectMapper().writeValueAsString("error");
	}

	// SEARCH

	@GetMapping("search")
	@ResponseBody
	public String searchDocument(@RequestParam("page") int page, @RequestParam("pageSize") int pageSize,
			@RequestParam("type") String type, @RequestParam("key") String key, ModelMap map)
			throws JsonProcessingException {
		try {
			if (page <= 0 || pageSize <= 0) {
				return new ObjectMapper().writeValueAsString("empty");
			}

			List<T> list = userService.search(type, key, page, (byte) pageSize);
			if (list != null) {
				map.addAttribute("done", "search done!");
				String result = new ObjectMapper().writeValueAsString(list);
				System.out.println(result);
				return result;
			} else
				return new ObjectMapper().writeValueAsString("empty");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		return new ObjectMapper().writeValueAsString("error");
	}

	@RequestMapping("searchNumbPage")
	@ResponseBody
	public String searchNumbPage(@RequestParam("pageSize") int pageSize, @RequestParam("type") String type,
			@RequestParam("key") String key) throws JsonProcessingException {
		try {
			return new ObjectMapper().writeValueAsString(userService.searchNumbPage(type, key, pageSize));
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		return new ObjectMapper().writeValueAsString("error");
	}

	// DISCUSSION

	@GetMapping("discussionManagement/{page}")
	public String manageDiscussion(@PathVariable("page") int page, ModelMap map) {
		map.put("discussionList", adminService.getList("discussion", page, 10));
		map.put("numbPage", userService.getNumberPage("discussion", 10));
		map.put("currentPage", page);
		return "admin/discussionManagement";
	}

	@PostMapping("discussionManagement/add")
	@ResponseBody
	public String addDiscussion(@RequestParam("title") String title, @RequestParam("content") String content,
			ModelMap map, HttpSession session) throws JsonProcessingException {
		try {
			Account acc = (Account) session.getAttribute("logAcc");
			if (acc != null) {
				Discussion discussion = new Discussion();
				discussion.setTitle(title);
				discussion.setContent(content);
				discussion.setUser(acc);
				discussion.setView(0);
				if (userService.addDiscussion(discussion))
					return new ObjectMapper().writeValueAsString(userService.getNumberPage("discussion", 10));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ObjectMapper().writeValueAsString("error");
	}

	@PostMapping("discussionManagement/lockDiscussion")
	@ResponseBody
	public String lockDiscussion(@RequestParam("ids[]") Integer[] ids, ModelMap map) throws JsonProcessingException {
		if (adminService.lock("discussion", ids)) {
			return new ObjectMapper().writeValueAsString("done");
		}
		return new ObjectMapper().writeValueAsString("error");
	}

	@PostMapping("discussionManagement/unlockDiscussion")
	@ResponseBody
	public String unlockDiscussion(@RequestParam("ids[]") Integer[] ids, ModelMap map) throws JsonProcessingException {
		if (adminService.unlock("discussion", ids)) {
			return new ObjectMapper().writeValueAsString("done");
		}
		return new ObjectMapper().writeValueAsString("error");
	}
	
	
	//report
	@GetMapping("reportManagement/{page}")
	public String manageReport(@PathVariable("page") int page, ModelMap map) {
		map.put("reportsList", adminService.getList("report", page, 10));
		map.put("numbPage", userService.getNumberPage("report", 10));
		map.put("currentPage", page);
		return "admin/reportManagement";
	}

}

class DTO {
	private Practice practice;
	private Test test;

	private Audio audio;
	private Paragraph paragraph;
	private Part1 question;
	private Part2 question2;
	private Part3 question3;
	private Part4 question4;
	private Part5 question5;
	private Part6 question6;
	private Part7 question7;
	private List<Part1> part1;
	private List<Part2> part2;
	private List<Part3> part3;
	private List<Part4> part4;
	private List<Part5> part5;
	private List<Part6> part6;
	private List<Part7> part7;

	public final Test getTest() {
		return test;
	}

	public final void setTest(Test test) {
		this.test = test;
	}

	public final Practice getPractice() {
		return practice;
	}

	public final void setPractice(Practice practice) {
		this.practice = practice;
	}

	public final List<Part5> getPart5() {
		return part5;
	}

	public final void setPart5(List<Part5> part5) {
		this.part5 = part5;
	}

	public final Paragraph getParagraph() {
		return paragraph;
	}

	public final void setParagraph(Paragraph paragraph) {
		this.paragraph = paragraph;
	}

	public final Audio getAudio() {
		return audio;
	}

	public final void setAudio(Audio audio) {
		this.audio = audio;
	}

	public final List<Part1> getPart1() {
		return part1;
	}

	public final void setPart1(List<Part1> part1) {
		this.part1 = part1;
	}

	public final Part7 getQuestion7() {
		return question7;
	}

	public final void setQuestion7(Part7 question7) {
		this.question7 = question7;
	}

	public final List<Part7> getPart7() {
		return part7;
	}

	public final void setPart7(List<Part7> part7) {
		this.part7 = part7;
	}

	public final Part6 getQuestion6() {
		return question6;
	}

	public final void setQuestion6(Part6 question6) {
		this.question6 = question6;
	}

	public final List<Part6> getPart6() {
		return part6;
	}

	public final void setPart6(List<Part6> part6) {
		this.part6 = part6;
	}

	public final Part5 getQuestion5() {
		return question5;
	}

	public final void setQuestion5(Part5 question5) {
		this.question5 = question5;
	}

	public final Part4 getQuestion4() {
		return question4;
	}

	public final void setQuestion4(Part4 question4) {
		this.question4 = question4;
	}

	public final List<Part4> getPart4() {
		return part4;
	}

	public final void setPart4(List<Part4> part4) {
		this.part4 = part4;
	}

	public final Part3 getQuestion3() {
		return question3;
	}

	public final void setQuestion3(Part3 question3) {
		this.question3 = question3;
	}

	public final List<Part3> getPart3() {
		return part3;
	}

	public final void setPart3(List<Part3> part3) {
		this.part3 = part3;
	}

	public final Part2 getQuestion2() {
		return question2;
	}

	public final void setQuestion2(Part2 question2) {
		this.question2 = question2;
	}

	public final List<Part2> getPart2() {
		return part2;
	}

	public final void setPart2(List<Part2> part2) {
		this.part2 = part2;
	}

	public final Part1 getQuestion() {
		return question;
	}

	public final void setQuestion(Part1 question) {
		this.question = question;
	}

}
