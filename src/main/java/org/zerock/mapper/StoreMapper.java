package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.CartVO;

public interface StoreMapper {
	
	public void addCart(CartVO vo);
	
	public List<CartVO> listCart(String userid);
	
	
}
