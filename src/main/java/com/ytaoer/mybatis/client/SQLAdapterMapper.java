package com.ytaoer.mybatis.client;

import com.ytaoer.mybatis.vo.SQLAdapter;

public interface SQLAdapterMapper {

	void executeSQL(SQLAdapter sqlAdapter);

	void executeMapSQL(SQLAdapter sqlAdapter);

	int insertReturnPriKey(SQLAdapter sqlAdapter);
	

}
