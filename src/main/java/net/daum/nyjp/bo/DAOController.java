package net.daum.nyjp.bo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.daum.nyjp.dao.CommonDAO;

public class DAOController {
	

	public static List<Map<String, Object>> getUserInfo(CommonDAO commonDAO) {
		List<Map<String, Object>> userList = commonDAO.selectList("Common.getUserList", null);
		return userList;
	}

	public static List<Map<String, Object>> getPresentationList(CommonDAO commonDAO, String userId) {
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("userId", userId);
		List<Map<String, Object>> presentationList = commonDAO.selectList("Common.getPresentationList", parameter);
		return presentationList;
		
	}

	public static int getPresentationTotalNum(CommonDAO commonDAO,
			String userId) {
		int totNum = 0;
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("userId", userId);
		totNum = commonDAO.selectCount("Common.getPresentationTotalNum", parameter);
		return totNum;
	}

	public static void insertPresentationInfo(CommonDAO commonDAO,
			String title, String description, String userId, String pid) {
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("pid", pid);
		parameter.put("title", title);
		parameter.put("description", description);
		parameter.put("userId", userId);
		commonDAO.insert("Common.insertPresentation", parameter);
		
	}
	

}
