package com.green.teddy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.teddy.dao.Design_imgDaoImpl;
import com.green.teddy.dto.Design_img;

@Service
public class Design_imgServiceImpl implements Design_imgService{
	@Autowired
	private Design_imgDaoImpl dd;

	@Override
	public int insertImg(List<Design_img> design_img) {
		return dd.insertImg(design_img);
	}
}
