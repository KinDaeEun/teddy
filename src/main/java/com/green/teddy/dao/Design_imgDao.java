package com.green.teddy.dao;

import java.util.List;

import com.green.teddy.dto.Design_img;

public interface Design_imgDao {

	int insertImg(List<Design_img> design_img);

	List<Design_img> imgList(int cno);

}
