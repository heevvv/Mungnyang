package com.heekyung.mungnyang.search.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heekyung.mungnyang.search.dao.SearchDAO;
import com.heekyung.mungnyang.search.model.Hospital;

@Service
public class SearchBO {
	
	@Autowired
	private SearchDAO searchDAO;
	
	public List<Hospital> getSearchList() {
		return searchDAO.selectSearchList();

	}
	
	public Hospital getSearch(int searchId) {
		return searchDAO.selectSearch(searchId);
	}

}
