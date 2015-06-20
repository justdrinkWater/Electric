package com.sw.elec.service.impl;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sw.elec.dao.IElecDictionaryDao;
import com.sw.elec.dao.IElecUserDao;
import com.sw.elec.domain.ElecUser;
import com.sw.elec.service.IElecUserService;
import com.sw.elec.util.ImportExecl;
import com.sw.elec.util.MD5keyBean;
import com.sw.elec.util.PageInfo;
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
			// 需要将密码进行加密才存到数据库中
			MD5keyBean md5keyBean = new MD5keyBean();
			if (elecUserForm.getLogonPwd() != null
					|| !"".equals(elecUserForm.getLogonPwd())) {
				// 还需要判断是否是首次保存用户或者是否在编辑用户的时候修改了密码，
				// 如果是则md5Flag标志位为0，则需要进行加密操作
				if (elecUserForm.getMd5Flag() != null
						&& "0".equals(elecUserForm.getMd5Flag())) {
					elecUser.setLogonPwd(md5keyBean
							.getkeyBeanofStr(elecUserForm.getLogonPwd()));
				} else {
					// 如果不是，则说明md5Flag标志位不为空，不需要再次加密
					elecUser.setLogonPwd(elecUserForm.getLogonPwd());
				}

			}
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

	// 通过用户名找到是否存在这个用户名的用户
	@Override
	public ElecUser findUserByName(String logonName) {
		List<ElecUser> list = elecUserDao.findByLogonName(logonName);
		ElecUser elecUser = null;
		if (list != null && list.size() > 0) {
			elecUser = list.get(0);
		}
		return elecUser;
	}

	// 通过登录名获得用户的权限
	@Override
	public String getPopedomByLogonName(String logonName) {
		List<Object> list = elecUserDao.getPopedomByLogonName(logonName);
		StringBuffer stringBuffer = new StringBuffer();
		for (Object object : list) {
			stringBuffer.append(object.toString());
		}
		return stringBuffer.toString();
	}

	// 通过登录名获得用户的角色
	@Override
	public HashMap<String, String> findUserRoles(String logonName) {
		List<Object[]> list = elecUserDao.findUserRoles(logonName);
		HashMap<String, String> map = new HashMap<String, String>();
		for (Object[] objects : list) {
			map.put(objects[0].toString(), objects[1].toString());
		}
		return map;
	}

	// 查找用户分页形式
	/**
	 * 现在需要考虑两种情况 1、带关键字的条件的查找 2、不带关键字的查找，就是查找所有的用户
	 */
	@Override
	public List<ElecUserForm> findUsersWithPage(ElecUserForm elecUserForm,
			HttpServletRequest request) {
		String userName = elecUserForm.getUserName();
		PageInfo pageInfo = new PageInfo(request);
		List<ElecUserForm> listUserForm = new ArrayList<ElecUserForm>();
		String hqlWhere = "";
		LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
		orderBy.put(" o.userID", "desc");
		List<ElecUser> listUser = null;
		// 现在考虑不带关键字的查找
		if (elecUserForm != null && userName != null) {
			hqlWhere = " and o.userName like ?";
			Object[] params = { "%" + userName + "%" };
			listUser = elecUserDao.findCollectionByConditionWithPage(hqlWhere,
					params, orderBy, pageInfo);
		} else {
			listUser = elecUserDao.findCollectionByConditionWithPage(hqlWhere,
					null, orderBy, pageInfo);
		}
		listUserForm = this.convertPoToVoList(listUser);
		request.setAttribute("page", pageInfo.getPageBean());
		return listUserForm;
	}
	//从excel中得到sql语句，在进行往数据库存储
	@Override
	public void saveUserByFile(ElecUserForm elecUserForm) {
		File file = elecUserForm.getFile();
		String filePath = file.getAbsolutePath();
		List<Object[]> list = ImportExecl.read(filePath,elecUserForm.getFileExtension());
		List<ElecUser> userList = new ArrayList<ElecUser>();
		ElecUser user = null;
		//取出各个Object数组的值组成User对象
		for (Object[] objects : list) {
			user = new ElecUser();
			user.setLogonName(objects[0].toString());
			user.setLogonPwd(objects[1].toString());
			user.setUserName(objects[2].toString());
			user.setSexID(objects[3].toString());
			user.setJctID(objects[4].toString());
			user.setContactTel(objects[5].toString());
			user.setIsDuty(objects[6].toString());
			userList.add(user);
		}
		//存入数据库中
		elecUserDao.saveObjectsByCollection(userList);
	}

	//得到导出excel时的属性名称
	@Override
	public ArrayList<String> getFiledNamesWhenExportExcel(ElecUserForm elecUserForm) {
		//就是在界面上显示的属性：登录名 用户姓名 性别 联系电话 是否在职
		//当然这里写死了，可以写成从配置文件中读取需要哪些属性
		ArrayList<String> list = new ArrayList<String>();
		list.add("登录名");
		list.add("用户姓名");
		list.add("性别");
		list.add("联系电话");
		list.add("是否在职");
		return list;
	}
	//得到导出excel的数据，需要从数据库中查出来
	@Override
	public ArrayList<ArrayList<String>> getFiledDateWhenExportExcel(
			ElecUserForm elecUserForm) {
		//得到从数据库中查到的user列表
		String userName = "";
		try {
			userName = new String(elecUserForm.getUserName().getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List<ElecUser> list = new ArrayList<ElecUser>();
		if (elecUserForm != null && userName != null) {
			list = this.findUserByKeyword(userName);
		} else {
			list = this.findAllUser();
		}
		//再将需要导出到excel的属性挑出来
		ArrayList<String> fieldList = null;
		ArrayList<ArrayList<String>> fieldLists = new ArrayList<ArrayList<String>>();
		List<ElecUserForm> listForm = this.convertPoToVoList(list);
		for (ElecUserForm elecUserF : listForm) {
			fieldList = new ArrayList<String>();
			fieldList.add(elecUserF.getLogonName());
			fieldList.add(elecUserF.getUserName());
			fieldList.add(elecUserF.getSexID());
			fieldList.add(elecUserF.getContactTel());
			fieldList.add(elecUserF.getIsDuty());
			fieldLists.add(fieldList);
		}
		return fieldLists;
	}
	
}
