package org.zerock.domain;


import lombok.Data;

@Data
public class ItemVO {
	private int cartid;
	private int productid;
	private int amount;
//	여기에 price를 넣는건가 
	private long price;
	
	private ProductVO product;
}
