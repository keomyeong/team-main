package org.zerock.domain;

import java.math.BigDecimal;

import lombok.Data;

@Data 
public class OrderVO {
private String tilte;
private BigDecimal price;
// 찾아보기 BigDecimal 일반적으로 다름
private int amount;
private int amountprice;
private String useradd;
private String userPhone;
private String userName;
}
