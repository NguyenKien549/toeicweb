package com.bktoeic.serviceImpl;

import java.util.List;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bktoeic.dao.GuestDAO;
import com.bktoeic.model.Practice;
import com.bktoeic.service.guestService;

@Service("guestService")
public class guestServiceImpl<T> implements guestService {
	
	@SuppressWarnings("rawtypes")
	@Autowired
	private GuestDAO guestDAO;

	@SuppressWarnings("unchecked")
	public List<Practice> accessPractice(byte part) {
		return guestDAO.accessPractice(part);
	}


	public Practice practiceReading(String code) {
		// TODO Auto-generated method stub
		return guestDAO.practiceReading(code);
	}

	public Practice practiceListening(String code) {
		// TODO Auto-generated method stub
		return guestDAO.practiceListening(code);
	}

	@SuppressWarnings("unchecked")
	public Set<T> practiceReadingQues(int id, byte part) {
		return guestDAO.practiceReadingQues(id, part);
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
