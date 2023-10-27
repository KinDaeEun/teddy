package com.green.teddy.dao;

import java.util.List;

import com.green.teddy.dto.Compliment;

public interface ComplimentDao {

	int comGetTotal(Compliment compliment);

	List<Compliment> cpList(Compliment compliment);

	int coinsert(Compliment compliment);

	int delete(int cpno);

}
