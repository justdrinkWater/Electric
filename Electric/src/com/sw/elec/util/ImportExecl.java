package com.sw.elec.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ImportExecl {
	/** 总行数 */
	private int totalRows = 0;
	/** 总列数 */
	private int totalCells = 0;

	/** 构造方法 */
	public ImportExecl() {
	}

	public int getTotalRows() {
		return totalRows;
	}

	public int getTotalCells() {
		return totalCells;
	}

	/**
	 * 
	 * @描述：根据文件名读取excel文件
	 */

	public static List<Object[]> read(String filePath, String fileExtension) {
		List<Object[]> dataLst = new ArrayList<Object[]>();
		InputStream is = null;
		try {

			boolean isExcel2003 = true;
			if ("xlsx".equals(fileExtension)) {
				isExcel2003 = false;
			}
			File file = new File(filePath);
			is = new FileInputStream(file);
			dataLst = read(is, isExcel2003);
			is.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					is = null;
					e.printStackTrace();
				}
			}
		}
		/** 返回最后读取的结果 */
		return dataLst;
	}

	/**
	 * 
	 * @描述：根据流读取Excel文件
	 */
	private static List<Object[]> read(InputStream inputStream,
			boolean isExcel2003) {
		List<Object[]> dataLst = null;
		try {
			/** 根据版本选择创建Workbook的方式 */
			Workbook wb = null;
			if (isExcel2003) {
				wb = new HSSFWorkbook(inputStream);
			} else {
				wb = new XSSFWorkbook(inputStream);
			}
			dataLst = read2(wb);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return dataLst;
	}

	private static List<Object[]> read2(Workbook wb) {
		ArrayList<Object[]> list = new ArrayList<Object[]>();
		Sheet sheet = wb.getSheet("User");
		if (sheet == null)
			throw new RuntimeException("指定的文件中不含有User的sheet，请重新指定文件！");
		for (int i = 1; i < sheet.getPhysicalNumberOfRows(); i++) {
			String[] valStr = new String[8];
			for (int j = 0; j < sheet.getRow(0).getPhysicalNumberOfCells(); j++) {
				Cell cell = sheet.getRow(i).getCell(j);// 得到第i行第j列的单元格
				String content = "";
				switch (cell.getCellType()) {
				case HSSFCell.CELL_TYPE_STRING:
					String tempcontent = cell.getStringCellValue() == null ? ""
							: cell.getStringCellValue();
					content = tempcontent.trim().replace('\'', ' ');
					// 需要按照数据字典对excel中数据进行转换
					if ("男".equals(content) || "是".equals(content)
							|| "北京".equals(content)) {
						content = "1";
					} else if ("女".equals(content) || "否".equals(content)
							|| "上海".equals(content)) {
						content = "2";
					} else if ("不确定".equals(content) || "广州".equals(content)) {
						content = "3";
					}
					break;
				case HSSFCell.CELL_TYPE_NUMERIC:
					content = String.valueOf(cell.getNumericCellValue());
					content = content.substring(0, content.lastIndexOf('.'));
					break;
				default:
					content = "未知类型";
					break;
				}
				valStr[j] = content;
			}
			list.add(valStr);
		}
		return list;
	}

	// 测试从excel文件中读取数据
	public static void main(String[] args) throws Exception {
		List<Object[]> list = ImportExecl.read(
				"C:\\Users\\sunwei\\Desktop\\test.xls", "xls");
		// List<Object[]> list =
		// poi.read("C:\\Users\\sunwei\\Desktop\\test2.xlsx");
		System.out.println("list的长度：--->" + list.size());
		System.out.println("list的内容：------------------------>");
		for (Object[] objects : list) {
			for (Object object : objects) {
				System.out.println(object + "\t");
			}
			System.out.println();
		}
	}
}
