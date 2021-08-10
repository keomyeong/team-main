package org.zerock.service;

import java.util.List;

import org.zerock.domain.CartVO;


public interface StoreService {
	public void addCart(CartVO vo);
	public List<CartVO> listCart(String userid);

		
}
