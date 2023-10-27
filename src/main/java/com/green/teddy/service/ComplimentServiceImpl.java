package com.green.teddy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.teddy.dao.ComplimentDao;
import com.green.teddy.dto.Compliment;
@Service
public class ComplimentServiceImpl implements ComplimentService{
   @Autowired
	private ComplimentDao cd;
   
   
	@Override
	public int comGetTotal(Compliment compliment) {
		
		return cd.comGetTotal(compliment);
	}
	@Override
	public List<Compliment> cpList(Compliment compliment) {
		
		return cd.cpList(compliment);
	}
	@Override
	public int coinsert(Compliment compliment) {
		
		return cd.coinsert(compliment);
	}
	@Override
	public int delete(int cpno) {
		
		return cd.delete(cpno);
	}

}
