package net.daum.nyjp.dao;

/**
 * @file CommonMasterDAOImpl.java
 * Copyright by Daum Communications Corp.
 * @author Jaesuk Hwang, Daum Communications Corp. Integrated Search Platform Team.
 * @version 1.0
 * @date 2010. 1. 19.
 */


import java.sql.SQLException;
import java.util.*;

import org.springframework.orm.ibatis.SqlMapClientCallback;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.ibatis.sqlmap.client.SqlMapExecutor;

/**
 * 공통 Master DAO 구현
 * @author Jaesuk Hwang, Daum Communications Corp. Integrated Search Platform Team.
 * @version 1.0
 */
public class CommonDAOImpl extends SqlMapClientDaoSupport implements CommonDAO {
    /**
     * INSERT 관련된 SQL을 실행한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @param parameter 파라미터
     * @return INSERT 후 반환 특히 ID 객체를 반환한다.
     */
    public Object insert(String statementName, final Map<String, Object> parameter) {
        return (Object) getSqlMapClientTemplate().insert(statementName, parameter);
    }

    /**
     * UPDATE 관련된 SQL을 실행한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @param parameter 파라미터
     * @return 적용 건 수를 반환한다.
     */
    public int update(String statementName, final Map<String, Object> parameter) {
        return getSqlMapClientTemplate().update(statementName, parameter);
    }

    /**
     * DELETE 관련된 SQL을 실행한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @param parameter 파라미터
     * @return 적용 건 수를 반환한다.
     */
    public int delete(String statementName, final Map<String, Object> parameter) {
        return getSqlMapClientTemplate().delete(statementName, parameter);
    }

    /**
     * REPLACE 관련된 SQL을 실행한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @param parameter 파라미터
     * @return 적용 건 수를 반환한다.
     */
    public int replace(String statementName, final Map<String, Object> parameter) {
        return getSqlMapClientTemplate().update(statementName, parameter);
    }

    /**
     * 한 건 조회를 위한 SQL을 실행하여 Map으로 구성하여 반환한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @param parameter 파라미터
     * @return 조회한 결과를 Map으로 구성하여 반환한다.
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectOne(String statementName, final Map<String, Object> parameter) {
        return (HashMap<String, Object>) getSqlMapClientTemplate().queryForObject(statementName, parameter);
    }
    
    /**
     * 목록 조회를 위한 SQL을 실행하여 Map으로 이루어진 List를 구성하여 반환한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @param parameter 파라미터
     * @return 조회한 결과를 Map으로 이루어진 List로 구성하여 반환한다.
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectList(String statementName, final Map<String, Object> parameter) {
        return (ArrayList<Map<String, Object>>) getSqlMapClientTemplate().queryForList(statementName, parameter);
    }

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMap(String statementName, Map<String, Object> parameter, String keyProperty) {
		return (Map<String, Object>) getSqlMapClientTemplate().queryForMap(statementName, parameter, keyProperty);
	}
	
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectMapValue(String statementName, final Map<String, Object> parameter, String keyProperty , String valueProperty) {
        return (Map<String, Object>) getSqlMapClientTemplate().queryForMap(statementName, parameter, keyProperty, valueProperty);
    }
    
    /**
     * COUNT 조회를 위한 SQL을 실행하여 int 타입의 결과를 구성하여 반환한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @param parameter 파라미터
     * @return 조회한 결과를 Map으로 이루어진 List로 구성하여 반환한다.
     */    
    public int selectCount(String statementName, final Map<String, Object> parameter) {
        return (Integer) getSqlMapClientTemplate().queryForObject(statementName, parameter);
    }
    
    public int insertList(final String statementName, final List<Map<String, Object>> parameters) {
		Integer result = (Integer) getSqlMapClientTemplate().execute(new SqlMapClientCallback() {
			public Object doInSqlMapClient(SqlMapExecutor executor) throws SQLException {
				executor.startBatch();
				for (Map<String, Object> parameter : parameters) {
					executor.insert(statementName, parameter);
				}
				return new Integer(executor.executeBatch());
			}
		});
		return result.intValue();    
	}    
    
	public void commit() throws SQLException {
		// TODO Auto-generated method stub
		getSqlMapClientTemplate().getSqlMapClient().commitTransaction();
	}
    
	public void endTransaction() throws SQLException {
		// TODO Auto-generated method stub
		getSqlMapClientTemplate().getSqlMapClient().endTransaction();
	}

	public void startTransaction() throws SQLException {
		// TODO Auto-generated method stub
		getSqlMapClientTemplate().getSqlMapClient().startTransaction();
	}
}
