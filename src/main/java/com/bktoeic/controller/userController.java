package com.bktoeic.controller;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bktoeic.model.Account;
import com.bktoeic.model.Comment;
import com.bktoeic.model.Report;
import com.bktoeic.service.userService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("user")
@SessionAttributes("logAcc")
public class userController {
	
	@Autowired
	private userService userService;
	
	//PHAN COMMENT
	@PostMapping(value = {"/discussion/comment"})
	@ResponseBody
	public String addComment(@RequestParam("discussionId")byte discussionId,@RequestParam("commentContent")String commentContent,
			ModelMap map, HttpSession session) throws JsonProcessingException {
			Account acc=(Account) session.getAttribute("logAcc");
			Comment comment=new Comment();
			comment.setDiscussion(userService.getDiscussion(discussionId));
			comment.setContent(commentContent);
			comment.setUser(acc);
			if(userService.addComment(comment)) {
				return "";
			};
			return new ObjectMapper().writeValueAsString("error");
		}
	
	@PostMapping(value = {"/discussion/deleteComment"})
	@ResponseBody
	public String deleteComment(@RequestParam("commentId")byte commentId,
			ModelMap map, HttpSession session) throws JsonProcessingException {
			Account acc=(Account) session.getAttribute("logAcc");
			Comment delComment= userService.getComment(commentId);
			if(acc.getUsername().equals(delComment.getUser().getUsername())) {
				if(userService.deleteComment(commentId)) {
					try {
						return new ObjectMapper().writeValueAsString("done");
					} catch (JsonProcessingException e) {
						e.printStackTrace();
					}
				};
			}
			
			return new ObjectMapper().writeValueAsString("error");
		}
	
	@PostMapping(value = {"/discussion/editComment"})
	@ResponseBody
	public String editComment(@RequestParam("editedCommentId")byte commentId,@RequestParam("editedContent")String editedContent,
			ModelMap map, HttpSession session) throws JsonProcessingException {
			
			if(commentId>0 && !editedContent.trim().isEmpty()) {
				Account acc=(Account) session.getAttribute("logAcc");
				Comment editComment= userService.getComment(commentId);
				if(acc.getUsername().equals(editComment.getUser().getUsername())) {
					editComment.setContent(editedContent);
					if(userService.updateComment(editComment)) {
						try {
							return new ObjectMapper().writeValueAsString("done");
						} catch (JsonProcessingException e) {
							e.printStackTrace();
						}
					};
				}
			}
			return new ObjectMapper().writeValueAsString("error");
		}
	
	//LIEN QUAN DEN PHAN REPORT
	
	@PostMapping(value = {"/discussion/reportComment"})
	@ResponseBody
	public String reportComment(@RequestParam("reportedCommentId")byte reportedCommentId,@RequestParam("reportedContent")String reportedContent,
			ModelMap map, HttpSession session) throws JsonProcessingException {
			
			if(reportedCommentId>0 && !reportedContent.trim().isEmpty()) {
				Account acc=(Account) session.getAttribute("logAcc");
				Report report = new Report();
				Comment reportedComment= userService.getComment(reportedCommentId);
				report.setContent(reportedContent);
				report.setReportedComment(reportedComment);
				report.setUser(acc);
					if(userService.report(report)) {
						try {
							return new ObjectMapper().writeValueAsString("done");
						} catch (JsonProcessingException e) {
							e.printStackTrace();
						}
					}
			}
			return new ObjectMapper().writeValueAsString("error");
		}
}
