package junit;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sw.elec.domain.ElecText;
import com.sw.elec.service.IElecCommonMsgService;
import com.sw.elec.service.IElecTextService;
import com.sw.elec.web.form.ElecCommonMsgForm;
import com.sw.elec.web.form.ElecTextForm;

public class TestService {

	@Test
	public void saveElecText() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		IElecTextService ielecTextService = (IElecTextService) ac
				.getBean(IElecTextService.SERVICE_NAME);
		// 实例化PO对象，赋值，执行保存
		ElecText elecText = new ElecText();
		elecText.setTextName("测试DAO名称");
		elecText.setTextDate(new Date());
		elecText.setTextRemark("测试DAO备注");
		ielecTextService.saveText(elecText);
	}

	@Test
	public void findCollection() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		IElecTextService ielecTextService = (IElecTextService) ac
				.getBean(IElecTextService.SERVICE_NAME);
		// 实例化PO对象，赋值，执行保存
		ElecTextForm elecTextForm = new ElecTextForm();
		elecTextForm.setTextName("张");
		elecTextForm.setTextRemark("李");
		List<ElecText> list = ielecTextService
				.findCollectionByConditionNoPage(elecTextForm);
	}

	@Test
	public void getElecCommonMsg() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		IElecCommonMsgService ieleccomMsgService = (IElecCommonMsgService) ac
				.getBean(IElecCommonMsgService.SERVICE_NAME);
		List<ElecCommonMsgForm> list = ieleccomMsgService
				.findElecCommonMsgList();
		for (ElecCommonMsgForm elecCommonMsgForm : list) {
			System.out.println(elecCommonMsgForm.getStationRun());
		}
	}
}
