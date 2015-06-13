package junit;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sw.elec.container.ServiceProvider;
import com.sw.elec.dao.IElecTextDao;
import com.sw.elec.domain.ElecText;

public class TestDao {

	@Test
	public void saveElecText() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		IElecTextDao elecTextDao = (IElecTextDao) ac
				.getBean(IElecTextDao.SERVICE_NAME);
		// 实例化PO对象，赋值，执行保存
		ElecText elecText = new ElecText();
		elecText.setTextName("测试DAO名称");
		elecText.setTextDate(new Date());
		elecText.setTextRemark("测试DAO备注");
		elecTextDao.save(elecText);
	}

	@Test
	public void update() {
		IElecTextDao elecTextDao = (IElecTextDao) ServiceProvider
				.getService(IElecTextDao.SERVICE_NAME);
		// 实例化PO对象，赋值，执行保存
		ElecText elecText = new ElecText();
		elecText.setTextID("4aa6d49f4dbe3ff3014dbe4073310001");

		elecText.setTextName("我是大神");
		elecText.setTextDate(new Date());
		elecText.setTextRemark("你有意见啊");
		elecTextDao.update(elecText);
	}

	@Test
	public void findObjectByID() {
		IElecTextDao elecTextDao = (IElecTextDao) ServiceProvider
				.getService(IElecTextDao.SERVICE_NAME);

		Serializable id = "4aa6d49f4dbe3181014dbe3183f60000";
		ElecText elecText = elecTextDao.findObjectByID(id);
		System.out.println(elecText.getTextName());
	}
	
	@Test
	public void deleteObjectByIDs() {
		IElecTextDao elecTextDao = (IElecTextDao) ServiceProvider
				.getService(IElecTextDao.SERVICE_NAME);

		Serializable[] ids = {"4aa6d49f4dbe3181014dbe3183f60000","4aa6d49f4dbe30b0014dbe30b2eb0000"};
		elecTextDao.deleteObjectByIDs(ids);
	}
	@Test
	public void deleteObjectByCollection() {
		IElecTextDao elecTextDao = (IElecTextDao) ServiceProvider
				.getService(IElecTextDao.SERVICE_NAME);
		List<ElecText> list = new ArrayList<ElecText>();
		ElecText elecText1= new ElecText();
		elecText1.setTextID("4aa6d4754db83e5d014db83e633e0001");
		ElecText elecText2= new ElecText();
		elecText2.setTextID("4aa6d49f4dbe26f8014dbe26faaf0000");
		list.add(elecText1);
		list.add(elecText2);
		elecTextDao.deleteObjectByCollection(list);
	}
}
