package com.green.teddy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.teddy.dto.Compliment;

@Repository
public class ComplimentDaoImpl implements ComplimentDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int comGetTotal(Compliment compliment) {
		return sst.selectOne("boardns.comGetTotal", compliment);
	}

	@Override
	public List<Compliment> cpList(Compliment compliment) {
		return sst.selectList("boardns.cpList", compliment);
	}

	@Override
	public int coinsert(Compliment compliment) {

		return sst.insert("boardns.coinsert", compliment);
	}

}
