package com.spring.sample.common;

public class CommonProperties {
	/**
	 * 기본 셋
	 */
	//기본 리스트 사이즈
	public static final int VIEWCOUNT = 10;
	public static final int VIEWCOUNTBOARD = 6;
	public static final int VIEWCOUNTUSER = 5;
	public static final int VIEWCOUNTADMIN = 5;
	public static final int VIEWCOUNTSEARCH = 3;
	//기본 페이지 사이즈
	public static final int PAGECOUNT = 10;
	public static final int PAGECOUNTBOARD = 10;
	public static final int PAGECOUNTUSER = 10;
	public static final int PAGECOUNTADMIN = 10;
	public static final int PAGECOUNTSEARCH = 10;
	//검색 기준일
	public static final int SEARCHDATEAREA = 30;
	public static final int SEARCHDATEAREABOARD = 30;
	public static final int SEARCHDATEAREAUSER = 30;
	public static final int SEARCHDATEAREAADMIN = 30;
	public static final int SEARCHDATEAREASEARCH = 30;
	
	/**
	 * Ajax Result
	 */
	public static final String RESULT_SUCCESS = "SUCCESS";
	
	public static final String RESULT_SUCCESS2 = "SUCCESS2";
	
	public static final String RESULT_ERROR = "ERROR";
	
	/**
	 * 파일 업로드
	 */
	//파일 업로드 경로
	public static final String FILE_UPLOAD_PATH ="D:\\MyWork\\workspace\\"
			+ "\\SampleSpring\\src\\main\\webapp\\resources\\upload"; 
			/*"D:\\MyWork\\workspace\\.metadata"
			+ "\\.plugins\\org.eclipse.wst.server.core"
			+ "\\tmp0\\wtpwebapps\\SampleSpring\\resources\\upload";*/
	
	//파일 다운로드 경로
	public static final String FILE_DOWNLOAD_PATH = "http://localhost:8080/SampleSpring";
	
	//허용파일 확장자
	public static final String FILE_EXT = "xls|ppt|doc|xlsx|pptx|docx|hwp|csv|jpg|png|tld|txt";
	public static final String IMG_EXT = "jpg|png|gif|bmp";

}
