package com.green.teddy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.teddy.dto.Design_img;

@Repository
public class Design_imgDaoImpl implements Design_imgDao {
	@Autowired
	private SqlSessionTemplate sst;

	public int insertImg(List<Design_img> design_img) {
		return sst.insert("design_imgns.insertImg",design_img);
	}

	@Override
	public List<Design_img> imgList(int cno) {
		return sst.selectList("design_imgns.imgList",cno);
	}
}
