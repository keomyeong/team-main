package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.CartVO;
import org.zerock.domain.Order_detailVO;
import org.zerock.domain.WishVO;

public interface StoreMapper {
	
	public void addCart(CartVO vo);
	
	public List<CartVO> listCart(String userid);
	
	public void cartdelete(Long cno);
	
	public void modifyCart(CartVO vo);
	
	public int sumMoney(String userid);
	
	/* 장바구니에 동일한 상품이 있는지 확인 */
	public int countCart(@Param("pno") long pno, @Param("userid") String userid);

	/* 장바구니에 동일한 상품이 있는지 확인되면 수정 */
	public void updateCart(CartVO vo);
	
	// 위시리스트 관련
	public void addWish(WishVO vo);
	public List<WishVO> wishlist(String userid);
	public void wishdelete(Long wno);
	public int countwish(@Param("pno") long pno, @Param("userid") String userid);
	public void cwishdelete(@Param("pno") long pno, @Param("userid") String userid);
	public void orderDetail(Order_detailVO vo);



}
