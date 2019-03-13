package com.bktoeic.serviceImpl;

import java.util.List;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bktoeic.dao.GuestDAO;
import com.bktoeic.model.Paragraph;
import com.bktoeic.model.Practice;
import com.bktoeic.service.guestService;
import com.bktoeic.service.userService;

@Service("guestService")
public class guestServiceImpl<T> implements guestService {
	
	@SuppressWarnings("rawtypes")
	@Autowired
	private GuestDAO guestDAO;

	public List<Practice> accessPractice(byte part) {
		return guestDAO.accessPractice(part);
	}


	public Practice practiceReading(String code) {
		// TODO Auto-generated method stub
		return guestDAO.practiceReading(code);
	}



	@SuppressWarnings("unchecked")
	public Set<T> practiceReadingQues(int id, byte part) {
		return guestDAO.practiceReadingQues(id, part);
	}


	@Override
	public Practice practice(int id, byte part) {
		return guestDAO.practice(id, part);
	}


	@Override
	public Set<Paragraph> getParagraphList(int id, byte part) {
		// TODO Auto-generated method stub
		return guestDAO.getParagraphList(id, part);
	}

//	public List<PracticeQuestion> practiceReading(String code) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	public List<PracticeQuestion> practiceListening(String code) {
//		// TODO Auto-generated method stub
//		return null;
//	}

}
