package com.bktoeic.service;

import java.util.List;

import java.util.Set;

import com.bktoeic.model.Discussion;
import com.bktoeic.model.Practice;

public interface guestService {
	public List<Practice> accessPractice(byte part);
	
	public Practice practiceReading(String code);
	public <T> Set<T> practiceReadingQues(int id,byte part);
	public Practice practiceListening(String code);
	
}
