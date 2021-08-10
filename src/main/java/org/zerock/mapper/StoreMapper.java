package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.CartVO;

public interface StoreMapper {
	
	public void addCart(CartVO vo);
	
	public List<CartVO> listCart(String userid);
	
	public void cartdelet(Long cno);
	
	public void modifyCart(CartVO vo);
	
	public int sumMoney(String userid);
	
	/* 장바구니에 동일한 상품이 있는지 확인 */
	public int countCart(long pno, String userid);

	/* 장바구니에 동일한 상품이 있는지 확인되면 수정 */
	public void updateCart(CartVO vo);
	
}
