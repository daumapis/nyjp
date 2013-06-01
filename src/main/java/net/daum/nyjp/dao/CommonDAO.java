package net.daum.nyjp.dao;

/**
 * @file CommonMasterDAO.java
 * Copyright by Daum Communications Corp.
 * @author Jaesuk Hwang, Daum Communications Corp. Integrated Search Platform Team.
 * @version 1.0
 * @date 2010. 1. 19.
 */


import java.sql.SQLException;
import java.util.*;

/**
 * 공통 Master DAO 인터페이스
 * 
 * @author Jaesuk Hwang, Daum Communications Corp. Integrated Search Platform Team.
 * @version 1.0
 */
public interface CommonDAO {
    /**
     * INSERT 관련된 SQL을 실행한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @param parameter 파라미터
     * @return INSERT 후 반환 특히 ID 객체를 반환한다.
     */
    public Object insert(String statementName, final Map<String, Object> parameter);

    /**
     * UPDATE 관련된 SQL을 실행한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @param parameter 파라미터
     * @return 적용 건 수를 반환한다.
     */
    public int update(String statementName, final Map<String, Object> parameter);

    /**
     * DELETE 관련된 SQL을 실행한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @param parameter 파라미터
     * @return 적용 건 수를 반환한다.
     */
    public int delete(String statementName, final Map<String, Object> parameter);

    /**
     * REPLACE 관련된 SQL을 실행한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @param parameter 파라미터
     * @return 적용 건 수를 반환한다.
     */
    public int replace(String statementName, final Map<String, Object> parameter);

    /**
     * 한 건 조회를 위한 SQL을 실행하여 Map으로 구성하여 반환한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @param parameter 파라미터
     * @return 조회한 결과를 Map으로 구성하여 반환한다.
     */
    public Map<String, Object> selectOne(String statementName, final Map<String, Object> parameter);

    /**
     * 목록 조회를 위한 SQL을 실행하여 Map으로 이루어진 List를 구성하여 반환한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @param parameter 파라미터
     * @return 조회한 결과를 Map으로 이루어진 List로 구성하여 반환한다.
     */
    public List<Map<String, Object>> selectList(String statementName, final Map<String, Object> parameter);

    public Map<String, Object> selectMap(String statementName, final Map<String, Object> parameter, String keyProperty);
    public Map<String, Object> selectMapValue(String statementName, final Map<String, Object> parameter, String keyProperty , String valueProperty);

    /**
     * COUNT 조회를 위한 SQL을 실행하여 int 타입의 결과를 구성하여 반환한다.
     * 
     * @param statementName 실행할 SQL 이름
     * @param parameter 파라미터
     * @return 조회한 결과를 Map으로 이루어진 List로 구성하여 반환한다.
     */    
    public int selectCount(String statementName, final Map<String, Object> parameter);
    
    public int insertList(final String statementName, final List<Map<String, Object>> parameters);
    
    /**
     * commit 이 필요한 DB 에서 commit 을 수행한다.
     * @throws SQLException 
     */
    public void commit() throws SQLException;
    
    public void startTransaction() throws SQLException;
    
    public void endTransaction() throws SQLException;
}
