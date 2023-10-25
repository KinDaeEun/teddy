package com.green.teddy.service;

import java.util.List;

import com.green.teddy.dto.Compliment;

public interface ComplimentService {

	int comGetTotal(Compliment compliment);

	List<Compliment> cpList(Compliment compliment);

	int coinsert(Compliment compliment);

}
