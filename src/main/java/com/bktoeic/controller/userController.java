package com.bktoeic.controller;

import java.io.UnsupportedEncodingException;

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

import com.bktoeic.model.Account;
import com.bktoeic.model.Comment;
import com.bktoeic.model.Discussion;
import com.bktoeic.model.ReplyComment;
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

	// DISCUSSION
	@PostMapping(value = { "/discussion/newTopic" })
	@ResponseBody
	public String addDiscussion(@RequestParam("title") String title, @RequestParam("content") String discussionContent,
			HttpSession session) throws JsonProcessingException {
		Account acc = (Account) session.getAttribute("logAcc");
		Discussion discussion = new Discussion();
		discussion.setTitle(title);
		discussion.setContent(discussionContent);
		discussion.setUser(acc);
		discussion.setView(0);
		if (userService.addDiscussion(discussion)) {
			return new ObjectMapper().writeValueAsString("done");
		}
		;
		return new ObjectMapper().writeValueAsString("error");
	}

	@PostMapping(value = { "/discussion/editTopic" })
	@ResponseBody
	public String updateDiscussion(@RequestParam("editTitle") String title, @RequestParam("id") int id,
			@RequestParam("editContent") String discussionContent, HttpSession session) throws JsonProcessingException {
		Account acc = (Account) session.getAttribute("logAcc");
		Discussion discussion = userService.getDiscussion(id);
		if (discussion.getUser().getUsername().equals(acc.getUsername())) {
			discussion.setTitle(title);
			discussion.setContent(discussionContent);
			if (userService.updateDiscussion(discussion)) {
				return new ObjectMapper().writeValueAsString("done");
			}
			;
		}
		return new ObjectMapper().writeValueAsString("error");
	}

	@PostMapping(value = { "/discussion/deleteDiscussion" })
	@ResponseBody
	public String deleteDiscussion(@RequestParam("discussionId") int discussionId, HttpSession session)
			throws JsonProcessingException {
		Account acc = (Account) session.getAttribute("logAcc");
		Discussion discussion = userService.getDiscussion(discussionId);
		if (acc.getUsername().equals(discussion.getUser().getUsername())) {
			if (userService.deleteDiscussion(discussionId)) {
				try {
					return new ObjectMapper().writeValueAsString("done");
				} catch (JsonProcessingException e) {
					e.printStackTrace();
				}
			}
			;
		}

		return new ObjectMapper().writeValueAsString("error");
	}

	// PHAN COMMENT
	@PostMapping(value = { "/discussion/comment" })
	@ResponseBody
	public String addComment(@RequestParam("discussionId") int discussionId,
			@RequestParam("commentContent") String commentContent, HttpSession session) throws JsonProcessingException {
		if (!commentContent.trim().isEmpty()) {
			Account acc = (Account) session.getAttribute("logAcc");
			Comment comment = new Comment();
			comment.setDiscussion(userService.getDiscussion(discussionId));
			comment.setContent(commentContent);
			comment.setUser(acc);
			if (userService.addComment(comment)) {
				return new ObjectMapper().writeValueAsString("done");
			}
			;
		}
		return new ObjectMapper().writeValueAsString("error");
	}

	@PostMapping(value = { "/discussion/deleteComment" })
	@ResponseBody
	public String deleteComment(@RequestParam("commentId") int commentId, HttpSession session)
			throws JsonProcessingException {
		Account acc = (Account) session.getAttribute("logAcc");
		Comment delComment = userService.getComment(commentId);
		if (acc.getUsername().equals(delComment.getUser().getUsername()) || acc.getType().equals("Admin")) {
			if (userService.deleteComment(commentId)) {
				try {
					return new ObjectMapper().writeValueAsString("done");
				} catch (JsonProcessingException e) {
					e.printStackTrace();
				}
			}
			;
		}

		return new ObjectMapper().writeValueAsString("error");
	}

	@PostMapping(value = { "/discussion/editComment" })
	@ResponseBody
	public String editComment(@RequestParam("editedCommentId") int commentId,
			@RequestParam("editedContent") String editedContent, HttpSession session) throws JsonProcessingException {

		if (commentId > 0 && !editedContent.trim().isEmpty()) {
			Account acc = (Account) session.getAttribute("logAcc");
			Comment editComment = userService.getComment(commentId);
			if (acc.getUsername().equals(editComment.getUser().getUsername())) {
				editComment.setContent(editedContent);
				if (userService.updateComment(editComment)) {
					try {
						return new ObjectMapper().writeValueAsString("done");
					} catch (JsonProcessingException e) {
						e.printStackTrace();
					}
				}
				;
			}
		}
		return new ObjectMapper().writeValueAsString("error");
	}

	// LIEN QUAN DEN PHAN REPORT
	@PostMapping(value = { "/discussion/reportComment" })
	@ResponseBody
	public String reportComment(@RequestParam("reportedCommentId") int reportedCommentId,
			@RequestParam("reportedContent") String reportedContent, HttpSession session)
			throws JsonProcessingException {

		if (reportedCommentId > 0 && !reportedContent.trim().isEmpty()) {
			Account acc = (Account) session.getAttribute("logAcc");
			Report report = new Report();
			Comment reportedComment = userService.getComment(reportedCommentId);
			report.setContent(reportedContent);
			report.setReportedComment(reportedComment);
			report.setUser(acc);
			if (userService.report(report)) {
				try {
					return new ObjectMapper().writeValueAsString("done");
				} catch (JsonProcessingException e) {
					e.printStackTrace();
				}
			}
		}
		return new ObjectMapper().writeValueAsString("error");
	}

	@PostMapping(value = { "/discussion/reportReplyComment" })
	@ResponseBody
	public String reportReplyComment(@RequestParam("reportedReplyId") int reportedReplyId,
			@RequestParam("reportedContent") String reportedContent, HttpSession session)
			throws JsonProcessingException {

		if (reportedReplyId > 0 && !reportedContent.trim().isEmpty()) {
			Account acc = (Account) session.getAttribute("logAcc");
			Report report = new Report();
			ReplyComment reportedReplyComment = userService.getReplyComment(reportedReplyId);
			report.setContent(reportedContent);
			report.setReportedReplyComment(reportedReplyComment);
			report.setUser(acc);
			if (userService.report(report)) {
				try {
					return new ObjectMapper().writeValueAsString("done");
				} catch (JsonProcessingException e) {
					e.printStackTrace();
				}
			}
		}
		return new ObjectMapper().writeValueAsString("error");
	}

	@PostMapping(value = { "/discussion/reportDiscussion" })
	@ResponseBody
	public String reportDiscussion(@RequestParam("reportedDiscussionId") int reportedDiscussionId,
			@RequestParam("reportedDiscussionContent") String reportedDiscussionContent, HttpSession session)
			throws JsonProcessingException {

		if (reportedDiscussionId > 0 && !reportedDiscussionContent.trim().isEmpty()) {
			Account acc = (Account) session.getAttribute("logAcc");
			Report report = new Report();
			Discussion reportedDiscussion = userService.getDiscussion(reportedDiscussionId);
			report.setContent(reportedDiscussionContent);
			report.setReportedDiscussion(reportedDiscussion);
			report.setUser(acc);
			if (userService.report(report)) {
				try {
					return new ObjectMapper().writeValueAsString("done");
				} catch (JsonProcessingException e) {
					e.printStackTrace();
				}
			}
		}
		return new ObjectMapper().writeValueAsString("error");
	}

	// PHAN REPLY
	@PostMapping(value = { "/discussion/deleteReply" })
	@ResponseBody
	public String deleteReply(@RequestParam("replyCommentId") int replyId, HttpSession session)
			throws JsonProcessingException {
		Account acc = (Account) session.getAttribute("logAcc");
		ReplyComment delReply = userService.getReplyComment(replyId);
		if (acc.getUsername().equals(delReply.getUser().getUsername()) || acc.getType().equals("Admin")) {
			if (userService.deleteReplyComment(replyId)) {
				try {
					return new ObjectMapper().writeValueAsString("done");
				} catch (JsonProcessingException e) {
					e.printStackTrace();
				}
			}
			;
		}
		System.out.println("delete error or not permission");

		return new ObjectMapper().writeValueAsString("error");
	}

	@PostMapping(value = { "/discussion/replyComment" })
	@ResponseBody
	public String replyComment(@RequestParam("commentId") int commentId, @RequestParam("replyContent") String content,
			HttpSession session) throws JsonProcessingException {
		Account acc = (Account) session.getAttribute("logAcc");
		ReplyComment reply = new ReplyComment();
		reply.setContent(content);
		reply.setUser(acc);
		reply.setComment(userService.getComment(commentId));
		ReplyComment temp = userService.addReplyComment(reply);
		if (temp != null) {
			try {
				return new ObjectMapper().writeValueAsString(temp);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
		}
		System.out.println("delete error");

		return new ObjectMapper().writeValueAsString("error");
	}

	@PostMapping(value = { "/discussion/editReply" })
	@ResponseBody
	public String editReply(@RequestParam("editedReplyId") int replyId,
			@RequestParam("editedReplyContent") String editedReplyContent, HttpSession session)
			throws JsonProcessingException {

		if (replyId > 0 && !editedReplyContent.trim().isEmpty()) {
			Account acc = (Account) session.getAttribute("logAcc");
			ReplyComment editReply = userService.getReplyComment(replyId);
			if (acc.getUsername().equals(editReply.getUser().getUsername())) {
				System.out.println(editReply.getUser().getUsername());
				editReply.setContent(editedReplyContent);
				if (userService.updateReplyComment(editReply)) {
					try {
						return new ObjectMapper().writeValueAsString("done");
					} catch (JsonProcessingException e) {
						e.printStackTrace();
					}
				}
				;
			}
		}
		return new ObjectMapper().writeValueAsString("error");
	}

	// PHAN TEST

	@GetMapping("/test")
	public String getTestList(ModelMap map,HttpSession session) throws JsonProcessingException, UnsupportedEncodingException {
		Account acc =(Account) session.getAttribute("logAcc");
		
		map.addAttribute("name",guestController.convertName(acc.getName()));
		map.put("listTest", userService.getTestList());
		return "testHome";
	}
	
	// get infor of test
	
	@GetMapping("/test/{id}/{name}")
	public String getTest(@PathVariable("id") int testID, ModelMap map,HttpSession session) throws JsonProcessingException, UnsupportedEncodingException {
		Account acc =(Account) session.getAttribute("logAcc");
		
		map.addAttribute("name",guestController.convertName(acc.getName()));
		map.put("test", userService.getTest(testID, true,(Account) session.getAttribute("logAcc")));
		return "test";
	}

	// get part in test by ajax
	@GetMapping("/test/{id}/part")
	@ResponseBody
	public String getPartTest(@PathVariable("id") int id, ModelMap map) {
		System.out.println("ajax");
		String a = null;
		try {
			a = new ObjectMapper().writeValueAsString(userService.getTest(id, false,null));
		} catch (JsonProcessingException e) {
			System.out.println(e.getMessage());
		}
		return a;
	}

}
