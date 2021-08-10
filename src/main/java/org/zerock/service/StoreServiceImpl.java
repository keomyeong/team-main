package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.CartVO;
import org.zerock.mapper.StoreMapper;

import lombok.Setter;

@Service
public class StoreServiceImpl implements StoreService {

	@Setter (onMethod_ = @Autowired)
	private StoreMapper mapper;
	
	@Override
	public void addCart(CartVO vo) {
		mapper.addCart(vo);	
	}

	@Override
	public List<CartVO> listCart(String userid) {
		return mapper.listCart(userid);
	}

}
