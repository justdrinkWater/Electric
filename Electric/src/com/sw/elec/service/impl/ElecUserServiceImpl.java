package com.sw.elec.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sw.elec.dao.IElecDictionaryDao;
import com.sw.elec.dao.IElecUserDao;
import com.sw.elec.domain.ElecUser;
import com.sw.elec.service.IElecUserService;
import com.sw.elec.util.StringHelper;
import com.sw.elec.web.form.ElecUserForm;

@Transactional
@Service(IElecUserService.SERVICE_NAME)
public class ElecUserServiceImpl implements IElecUserService {

	@Resource(name = IElecUserDao.SERVICE_NAME)
	private IElecUserDao elecUserDao;

	@Resource(name = IElecDictionaryDao.SERVICE_NAME)
	private IElecDictionaryDao elecDictionaryDao;

	@Override
	public List<ElecUserForm> findUsers(ElecUserForm elecUserForm) {
		String userName = elecUserForm.getUserName();
		List<ElecUser> list = null;
		List<ElecUserForm> listForm = null;
		// 当userName不为空，表示不是点击查询而是点击旁边链接进来，或者是没有输入字
		if (elecUserForm != null && userName != null) {
			list = this.findUserByKeyword(userName);
		} else {
			list = this.findAllUser();
		}
		listForm = this.convertPoToVoList(list);
		return listForm;
	}

	// 找到所有user
	private List<ElecUser> findAllUser() {
		String hqlWhere = "";
		Object[] params = {};
		LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
		orderBy.put(" o.userID ", "asc");
		List<ElecUser> list = elecUserDao.findCollectionByConditionNoPage(
				hqlWhere, params, orderBy);
		return list;
	}

	// 将PO对象List转成VO对象List
	private List<ElecUserForm> convertPoToVoList(List<ElecUser> list) {
		List<ElecUserForm> listForm = new ArrayList<ElecUserForm>();
		ElecUserForm userForm = null;
		for (ElecUser elecUser : list) {
			userForm = new ElecUserForm();
			this.convertPoToVo(userForm, elecUser);
			listForm.add(userForm);
		}
		return listForm;
	}

	// 将PO对象转成VO对象
	private void convertPoToVo(ElecUserForm userForm, ElecUser elecUser) {
		userForm.setUserID(elecUser.getUserID());
		userForm.setAddress(elecUser.getAddress());
		userForm.setBirthday(String.valueOf(elecUser.getBirthday()));
		userForm.setContactTel(elecUser.getContactTel());
		userForm.setEmail(elecUser.getEmail());
		userForm.setIsDuty(elecUser.getIsDuty() != null ? elecDictionaryDao
				.findDictionaryName("是否在职", elecUser.getIsDuty()).get(0)
				.toString() : "");
		userForm.setJctID(elecUser.getJctID() != null ? elecDictionaryDao
				.findDictionaryName("地点", elecUser.getJctID()).get(0)
				.toString() : "");
		userForm.setLogonName(elecUser.getLogonName());
		userForm.setLogonPwd(elecUser.getLogonPwd());
		userForm.setMobile(elecUser.getMobile());
		userForm.setOffDutyDate(String.valueOf(elecUser.getOffDutyDate()));
		userForm.setOnDutyDate(String.valueOf(elecUser.getOnDutyDate()));
		userForm.setRemark(elecUser.getRemark());
		userForm.setSexID(elecUser.getSexID() != null ? elecDictionaryDao
				.findDictionaryName("性别", elecUser.getSexID()).get(0)
				.toString() : "");
		userForm.setUserID(elecUser.getUserID());
		userForm.setUserName(elecUser.getUserName());
	}

	// 通过关键字找到相似的user
	private List<ElecUser> findUserByKeyword(String userName) {
		String hqlWhere = " and o.userName like ?";
		Object[] params = { "%" + userName + "%" };
		LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
		orderBy.put(" o.userID ", "asc");
		List<ElecUser> list = elecUserDao.findCollectionByConditionNoPage(
				hqlWhere, params, orderBy);
		return list;
	}

	// 保存user
	@Override
	public void saveUser(ElecUserForm elecUserForm) {
		ElecUser elecUser = this.convertVoToPo(elecUserForm);
		if (elecUserForm.getUserID() != null
				&& !elecUserForm.getUserID().equals("")) {
			elecUserDao.update(elecUser);
		} else {
			elecUserDao.save(elecUser);
		}
	}

	// 将VO对象转成PO对象
	private ElecUser convertVoToPo(ElecUserForm elecUserForm) {
		ElecUser elecUser = new ElecUser();
		if (elecUserForm != null) {
			if (elecUserForm.getUserID() != null
					|| !"".equals(elecUserForm.getUserID())) {
				elecUser.setUserID(elecUserForm.getUserID());
				if (elecUserForm.getOffDutyDate() != null
						&& !"".equals(elecUserForm.getOffDutyDate())) {
					elecUser.setOffDutyDate(StringHelper
							.stringConvertDate(elecUserForm.getOffDutyDate()));
				}
			}
			elecUser.setJctID(elecUserForm.getJctID());
			elecUser.setUserName(elecUserForm.getUserName());
			elecUser.setLogonName(elecUserForm.getLogonName());
			elecUser.setLogonPwd(elecUserForm.getLogonPwd());
			elecUser.setSexID(elecUserForm.getSexID());
			if (elecUserForm.getBirthday() != null
					|| !"".equals(elecUserForm.getBirthday())) {
				elecUser.setBirthday(StringHelper
						.stringConvertDate(elecUserForm.getBirthday()));
			}
			elecUser.setAddress(elecUserForm.getAddress());
			elecUser.setContactTel(elecUserForm.getContactTel());
			elecUser.setEmail(elecUserForm.getEmail());
			elecUser.setMobile(elecUserForm.getMobile());
			elecUser.setIsDuty(elecUserForm.getIsDuty());
			if (elecUserForm.getOnDutyDate() != null
					|| !"".equals(elecUserForm.getOnDutyDate())) {
				elecUser.setOnDutyDate(StringHelper
						.stringConvertDate(elecUserForm.getOnDutyDate()));
			}
			elecUser.setRemark(elecUserForm.getRemark());
		}
		return elecUser;
	}

	@Override
	public ElecUserForm findUser(String userID) {
		ElecUser elecUser = elecUserDao.findObjectByID(userID);
		ElecUserForm elecUserForm = new ElecUserForm();
		this.convertPoToVo(elecUserForm, elecUser);
		return elecUserForm;
	}

	@Override
	public void delete(ElecUserForm elecUserForm) {
		elecUserDao.deleteObjectByIDs(elecUserForm.getUserID());
	}

	// 通过logonName判断该名称是否存在
	// 如果为1，表示已经存在了，需要重新输入
	// 如果为2，表示不存在，可以使用
	@Override
	public String checkLogonName(String logonName) {
		List<ElecUser> elecUserList = elecUserDao.findByLogonName(logonName);
		return elecUserList.size() > 0 ? "1" : "2";
	}

}
