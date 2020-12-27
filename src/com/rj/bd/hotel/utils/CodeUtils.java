package com.rj.bd.hotel.utils;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * @desc     验证码工具类
 */
public class CodeUtils {

	
	
	public static String createdCode(){
		String[] beforeShuffle=new String[] {"2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
		List<String> list=Arrays.asList(beforeShuffle);
		Collections.shuffle(list);//自动洗牌
		StringBuilder sb=new StringBuilder();
		for (int i = 0; i < list.size(); i++) {
			sb.append(list.get(i));
		}
		String afterShuffle=sb.toString();
		String result=afterShuffle.substring(0,4);
		System.out.println(result);
		return result;
	}

}
