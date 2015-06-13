package com.sw.elec.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sw.elec.dao.IElecRolePopedomDao;
import com.sw.elec.dao.IElecUserRoleDao;
import com.sw.elec.domain.ElecRolePopedom;
import com.sw.elec.domain.ElecUserRole;
import com.sw.elec.service.IElecUserRoleService;
import com.sw.elec.util.XMLObject;
import com.sw.elec.web.form.ElecUserForm;
import com.sw.elec.web.form.ElecUserRoleForm;

@Transactional
@Service(IElecUserRoleService.SERVICE_NAME)
public class ElecUserRoleServiceImpl implements IElecUserRoleService {

	@Resource(name = IElecUserRoleDao.SERVICE_NAME)
	private IElecUserRoleDao elecUserRoleDao;

	@Resource(name = IElecRolePopedomDao.SERVICE_NAME)
	private IElecRolePopedomDao elecRolePopedomDao;

	// 从xml文件中读取有哪些权限
	@Override
	public List<XMLObject> readXML() {
		String path = ServletActionContext.getServletContext().getRealPath("/");
		List<XMLObject> listObjects = new ArrayList<XMLObject>();
		XMLObject xmlObject = null;
		try {
			SAXReader reader = new SAXReader();
			Document document = reader.read(path
					+ "WEB-INF\\classes\\Function.xml");
			Element root = document.getRootElement();
			Iterator<XMLObject> it = root.elementIterator();
			while (it.hasNext()) {
				Element element = (Element) it.next();
				xmlObject = new XMLObject();
				xmlObject.setCode(element.elementText("FunctionCode"));
				xmlObject.setName(element.elementText("FunctionName"));
				xmlObject.setParentCode(element.elementText("ParentCode"));
				xmlObject.setParentName(element.elementText("ParentName"));
				listObjects.add(xmlObject);
			}
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return listObjects;
	}

	// 通过角色的id找到所有的用户
	@Override
	public List<ElecUserForm> findElecUserListByRoleID(String roleid) {
		List<Object[]> list = elecUserRoleDao.findElecUserListByRoleID(roleid);
		List<ElecUserForm> listForm = convertObjectToForm(list);
		return listForm;
	}

	// 将获得Object数组转换成elecUserForm列表
	private List<ElecUserForm> convertObjectToForm(List<Object[]> list) {
		List<ElecUserForm> listForm = new ArrayList<ElecUserForm>();
		ElecUserForm elecUserForm = null;
		for (Object[] objects : list) {
			elecUserForm = new ElecUserForm();
			elecUserForm.setFlag(objects[0].toString());
			elecUserForm.setUserID(objects[1].toString());
			elecUserForm.setUserName(objects[2].toString());
			elecUserForm.setLogonName(objects[3].toString());
			listForm.add(elecUserForm);
		}
		return listForm;
	}

	// 找到这个角色拥有哪些权限
	@Override
	public List<XMLObject> readFlagXML(String roleid) {
		String hqlWhere = " and o.roleID = ?";
		Object[] params = { roleid };
		List<ElecRolePopedom> listPopedom = elecRolePopedomDao
				.findCollectionByConditionNoPage(hqlWhere, params, null);
		List<XMLObject> xmlList = this.convertPopedomToXml(listPopedom);
		return xmlList;
	}

	private List<XMLObject> convertPopedomToXml(
			List<ElecRolePopedom> listPopedom) {
		List<XMLObject> list = new ArrayList<XMLObject>();
		String popedom = listPopedom.get(0).getPopedomcode();
		List<XMLObject> listXml = this.readXML();
		for (XMLObject xmlObject : listXml) {
			if (popedom.contains(xmlObject.getCode())) {
				xmlObject.setFlag("1");
			} else {
				xmlObject.setFlag("0");
			}
			list.add(xmlObject);
		}
		return list;
	}

	//保存
	@Override
	public void save(ElecUserRoleForm elecUserRoleForm) {
		String roleid = elecUserRoleForm.getRoleid();//角色的ID
		String[] selectUser = elecUserRoleForm.getSelectuser();//拥有当前角色的用户
		String[] selectOper = elecUserRoleForm.getSelectoper();//得到修改后的角色的权限
		this.updatePopedom(roleid, selectOper);
		this.updateUserRole(roleid, selectUser);
	}

	//修改对应角色的用户
	private void updateUserRole(String roleid, String[] selectUser) {
		String hqlWhere =" and o.roleID = ?";
		Object[] params = {roleid};
		List<ElecUserRole> entities =  elecUserRoleDao.findCollectionByConditionNoPage(hqlWhere, params, null);
		elecUserRoleDao.deleteObjectByCollection(entities);
		ElecUserRole elecUserRole = null;
		entities = new ArrayList<ElecUserRole>();
		for (String string : selectUser) {
			elecUserRole = new ElecUserRole();
			elecUserRole.setUserID(string);
			elecUserRole.setRoleID(roleid);
			elecUserRoleDao.save(elecUserRole);
			entities.add(elecUserRole);
		}
		elecUserRoleDao.saveObjectsByCollection(entities);
	}

	//修改角色的权限
	private void updatePopedom(String roleid, String[] selectOper) {
		ElecRolePopedom entity = new ElecRolePopedom();
		entity.setRoleID(roleid);
		StringBuffer stringBuffer = new StringBuffer();
		for (String string : selectOper) {
			stringBuffer.append(string);
		}
		entity.setPopedomcode(stringBuffer.toString());
		elecRolePopedomDao.update(entity);
	}

}
