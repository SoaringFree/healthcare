package com.healthcare.dao.base;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlReturnResultSet;
import org.springframework.jdbc.object.StoredProcedure;

public abstract class BaseStoredProcedureDao<T> {
	
	protected StoredProcedure storedProc;    //存储过程

	protected String sprocName;
	
	protected RowMapper<T> rowMapper;
	
	protected abstract RowMapper<T> buildRowMapper();
	
	protected abstract StoredProcedure buildStoredProcedure();

	@Autowired
	void init(DataSource dataSource) {
		String clsName = getClass().getSimpleName();
		sprocName = clsName.substring(0, clsName.indexOf("Dao"));
		rowMapper = buildRowMapper();
		storedProc = buildStoredProcedure();
		storedProc.setDataSource(dataSource);
		storedProc.setSql(sprocName);
		storedProc.declareParameter(new SqlReturnResultSet("resultSet",rowMapper));
	}

	@SuppressWarnings("unchecked")
	public List<T> call(Object...inParams) {
		Map<String, Object> results = storedProc.execute(inParams);
		return (List<T>) results.get("resultSet");
	}
}
