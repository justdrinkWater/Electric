package com.sw.elec.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sw.elec.dao.IElecLogDao;
import com.sw.elec.domain.ElecLog;
import com.sw.elec.domain.ElecUser;
import com.sw.elec.service.IElecLogService;
import com.sw.elec.web.form.ElecLogForm;

@Transactional
@Service(IElecLogService.SERVICE_NAME)
public class ElecLogServiceImpl implements IElecLogService {

	@Resource(name = IElecLogDao.SERVICE_NAME)
	private IElecLogDao elecLogDao;

	// 增加日志
	@Override
	public void addLog(HttpServletRequest request, String string) {
		ElecLog elecLog = new ElecLog();
		elecLog.setIpAddress(request.getRemoteAddr());
		ElecUser elecUser = (ElecUser) request.getSession().getAttribute(
				"globle_user");
		elecLog.setOpeName(elecUser.getUserName());
		elecLog.setOpeTime(new Date());
		elecLog.setDetails(string);
		elecLogDao.save(elecLog);
	}

	@SuppressWarnings("null")
	@Override
	public List<ElecLogForm> findElecLog(ElecLogForm elecLogForm) {
		String hqlWhere = "";
		LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
		List<ElecLogForm> listLogForm = null;
		List<ElecLog> listLog = null;
		// 说明是首次进来
		if (elecLogForm != null && elecLogForm.getOpeName() != null) {
			String opeName = elecLogForm.getOpeName();
			hqlWhere = " and o.opeName like ?";
			Object[] params = { "%" + opeName + "%" };
			orderBy.put(" o.opeTime", "desc");
			listLog = elecLogDao.findCollectionByConditionNoPage(hqlWhere,
					params, orderBy);
		} else {
			Object[] params = {};
			orderBy.put(" o.opeTime", "desc");
			listLog = elecLogDao.findCollectionByConditionNoPage(hqlWhere,
					params, orderBy);
		}
		listLogForm = convertListLogToLogForm(listLog);
		return listLogForm;
	}

	// 将logList转成LogFormList
	private List<ElecLogForm> convertListLogToLogForm(List<ElecLog> listLog) {
		ElecLog elecLog = null;
		ElecLogForm elecLogForm = null;
		List<ElecLogForm> elecLogForms = new ArrayList<ElecLogForm>();
		for (int i = 0; listLog != null && i < listLog.size(); i++) {
			elecLog = listLog.get(i);
			elecLogForm = new ElecLogForm();
			elecLogForm.setLogID(elecLog.getLogID());
			elecLogForm.setIpAddress(elecLog.getIpAddress());
			elecLogForm.setDetails(elecLog.getDetails());
			elecLogForm.setOpeName(elecLog.getOpeName());
			elecLogForm.setOpeTime(String.valueOf(elecLog.getOpeTime()));
			elecLogForms.add(elecLogForm);
		}
		return elecLogForms;
	}

	// 删除按照关键字找到的日志信息
	@Override
	public void deleteLogByFind(ElecLogForm elecLogForm) {
		String logIds = elecLogForm.getLogID();
		String[] ids = logIds.split(",");
		for (int i = 0; ids != null && i < ids.length; i++) {
			String id = ids[i].trim();
			elecLogDao.deleteObjectByIDs(id);
		}
	}

}
