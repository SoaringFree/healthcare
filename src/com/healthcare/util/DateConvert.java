package com.healthcare.util;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateConvert {
	/**
	 * 将日期字符串转换为sql.Date
	 * @param shortDateString  yyyy-MM-dd
	 * @return sql.Date
	 */
	public static Date String2Date(String shortDateString) {

		Date m_utildate = null;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		try {
			m_utildate = format.parse(shortDateString);

		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return m_utildate;
	}
	
	/**
	 * 将日期字符串转换为sql.Date
	 * @param shortDateString  yyyy-MM-dd HH:mm:ss
	 * @return sql.Date
	 */
	public static Date String2DateTime(String shortDateString) {

		Date m_utildate = null;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		try {
			m_utildate = format.parse(shortDateString);

		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return m_utildate;
	}
	
	/**
	 * 将日期类型的字符串转化为timestamp类型数据
	 * @param dateString
	 * @return
	 */
	public static Timestamp String2TimeStamp(String dateString) {
		
		if (11 > dateString.length()) {
			dateString += " 00:00:00";
		}

		return Timestamp.valueOf(dateString);
	}
	
	/**
	 * 将字符串类型的日期加上n天
	 * @param shortDateString  yyyy-MM-dd
	 * @param day  增加的天数
	 * @return  yyyy-MM-dd + day
	 */
	public static String StringDateAddDay(String shortDateString, int day) {
		String add_date = null;
		java.util.Date m_date = null;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar m_calendar = Calendar.getInstance();

		try {
			m_date = format.parse(shortDateString);
			m_calendar.setTime(m_date);
			m_calendar.add(Calendar.DATE, day);
			add_date = format.format(m_calendar.getTime());
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return add_date;
	}
	
	
	/**
	 * 将TimeStamp类型的时间转换为yyyy-MM-dd格式的日期类型
	 * @param timestamp 时间
	 * @return DateString: yyyy-MM-dd
	 */
	public static String timeStamp2ShortDateString(Timestamp timestamp) {
		String date = "";
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		try {
			date = df.format(timestamp);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return date;
	}
	
	
	/**
	 * 将TimeStamp类型的时间转换为yyyy/MM/dd格式的日期类型
	 * @param timestamp 时间
	 * @return DateString: yyyy/MM/dd
	 */
	public static String timeStamp2DateString(Timestamp timestamp) {
		String date = "";
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		try {
			date = df.format(timestamp);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return date;
	}
	
	
	/**
	 * 将TimeStamp类型的时间转换为yyyy/MM/dd HH:mm格式的日期类型
	 * @param timestamp 时间
	 * @return DateTimeString: yyyy/MM/dd HH:mm
	 */
	public static String timeStamp2DateTime(Timestamp timestamp) {
		String datetime = "";
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		try {
			datetime = df.format(timestamp);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return datetime;
	}
	
	
	/**
	 * 将TimeStamp类型的时间转换为yyyy-MM-dd HH:mm:ss格式的日期类型
	 * @param timestamp 时间
	 * @return DateTimeString: yyyy-MM-dd HH:mm:ss
	 */
	public static String timeStamp2DateTimeString(Timestamp timestamp) {
		String datetime = "";
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			datetime = df.format(timestamp);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return datetime;
	}
	
	
	/**
	 * 比较两个字符串格式日期的大小
	 * @param dateFrom  开始日期: yyyy-MM-dd
	 * @param dateTo  结束日期: yyyy-MM-dd
	 * @return  true: dateFrom <= dateTo 
	 */
	public static Boolean DateCompare(String dateFrom, String dateTo) {
		Boolean isTrue = false;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		try {
			java.util.Date df = sdf.parse(dateFrom);
			java.util.Date dt = sdf.parse(dateTo);
			if(df.before(dt)) {
				isTrue = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return isTrue;
	}
	
	
	public static String Date2String(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		String str = sdf.format(date);
		return str;
	}
	
	
	
}
