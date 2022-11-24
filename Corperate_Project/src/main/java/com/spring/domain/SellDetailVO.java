package com.spring.domain;

import java.util.ArrayList;

import lombok.Data;

@Data
public class SellDetailVO {
	   private int no;
	   private ArrayList<Integer> item_no;
	   private ArrayList<Integer> amount;
	   private ArrayList<Integer> sell_price;
	   private ArrayList<String> lot_code;
	   private int sell_no;
	   private String item_name;
	   private int in_price;
	   private int out_price;
	   private String sell_day;
	   private String profit;
		private int order_sheet_no;
	   
	   private String code;
	   private String name;
	   
	   private int amount2; // 지우지 마세요
	   private int amount3; // 영업현황입니다. 지우지 마세요
	   private int sell_price2; // 지우지 마세요
	   private String lot_code2; // 지우지 마세요
}
