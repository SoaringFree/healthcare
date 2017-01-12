package com.healthcare.dao.base;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.healthcare.dao.base.Dao;

public class DaoHelper {
	/**
	 * 获得Dao对应的数据库表名。该方法仅仅将XXXDao转换为univ_xxxs的形式，并没有细究语法上的复数形式。
	 * 
	 * @param cls
	 * @return
	 */
	public static <T extends Dao<?>> String getTableName(Class<T> cls) {

		String clsName = cls.getSimpleName();

		// 添加数据库表的前缀
		StringBuilder sb = new StringBuilder("ipv6_");

		// 剔除DAO类的"Dao"
		String noDao = clsName.substring(0, clsName.indexOf("Dao"));

		// 匹配DAO前的字符串，通常为一个实体类的类名
		Pattern pattern = Pattern.compile("[A-Z][a-z]+");
		Matcher matcher = pattern.matcher(noDao);

		while (matcher.find())
			// 在每个匹配的字符串后加下划线
			sb.append(matcher.group().toLowerCase()).append('_');

		String raw = sb.toString();
		// 去除最后一个字符，该字符必定是下划线。
		String table = raw.substring(0, raw.length() - 1);
		
		return table;
	}

	/**
	 * 获得DAO对应的缓存区域名。
	 * 
	 * @param cls
	 * @return
	 */
	public static <T extends Dao<?>> String getCacheName(Class<T> cls) {
		String clsName = cls.getSimpleName();
		String cacheRegion = clsName.substring(0, clsName.indexOf("Dao"));
		return cacheRegion;
	}
}
