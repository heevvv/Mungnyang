package com.heekyung.mungnyang.search.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.heekyung.mungnyang.search.model.Hospital;

@Repository
public interface SearchDAO {
	
	public List<Hospital> selectSearchList();
	
	
}