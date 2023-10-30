package com.green.teddy.service;

import java.util.List;

import com.green.teddy.dto.Design_img;

public interface Design_imgService {

	int insertImg(List<Design_img> design_img);

	List<Design_img> imgList(int cno);

	int deleteImg(int dno);

	

}
