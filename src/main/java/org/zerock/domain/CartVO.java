package org.zerock.domain;


import java.util.List;

import lombok.Data;

@Data
public class CartVO {
	public static final int SHOPPING = 0;
    public static final int ORDERD = 1;
    public static final int SHIPPING = 2;
    public static final int DELYVERED = 3;
    
	private int id;
	private int status;
    private int userid;
    
    private List<ItemVO> items;
    private int totalPrice;
    
}
