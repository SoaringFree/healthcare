package com.healthcare.model.base;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class JavaBean {
	// private static final long serialVersionUID = 2947114610626647040L;

	@JsonSerialize(include = JsonSerialize.Inclusion.NON_DEFAULT)
	protected long id = 0;
	
	/**
	 * 获取数据表中的条目id<br/>
	 */
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
}
