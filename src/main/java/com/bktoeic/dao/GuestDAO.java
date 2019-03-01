package com.bktoeic.dao;

import java.util.List;

import java.util.Set;

import com.bktoeic.model.Practice;

public interface GuestDAO<T> {
	public List<Practice> accessPractice(byte part);
//	public List<PracticeQuestion> practiceReading(String code);
//	public List<PracticeQuestion> practiceListening(String code);
	
	public Practice practiceReading(String code);
	public Set<T> practiceReadingQues(int id,byte part);
	public Practice practiceListening(String code);
}
