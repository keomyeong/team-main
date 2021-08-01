package org.zerock.domain;

import lombok.Data;

@Data
public class ProductVO {
	private int id;
	private String title;
	private long price;
	private String content;
	private String image;
}
