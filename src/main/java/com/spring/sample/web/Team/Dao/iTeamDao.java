package com.spring.sample.web.Team.Dao;

import java.util.HashMap;
import java.util.List;

public interface iTeamDao {

	public  int idcheck(HashMap<String, String> params)throws Throwable;

	public void insertup(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> loginCheck(HashMap<String, String> params)throws Throwable;

	public String findPw(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> mypageim(HashMap<String, String> params)throws Throwable;
	
	public List<HashMap<String, String>> getlist(HashMap<String, String> params) throws Throwable;

	public int getBoardListCnt(HashMap<String, String> params) throws Throwable;
	
	public String findId(HashMap<String, String> params)throws Throwable;

	public void fileinsert(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getUserList(HashMap<String, String> params) throws Throwable;

	public int getUserListCnt(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getUserInfoList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getUserboard(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getUserConment(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getUserReport(HashMap<String, String> params) throws Throwable;
	
	public void pwupdate(HashMap<String, String> params)throws Throwable;

	public void deluser(HashMap<String, String> params)throws Throwable;

	public void intoduce(HashMap<String, String> params)throws Throwable;

	public void writeAjax(HashMap<String, String> params)throws Throwable;

	public void insertAjax(HashMap<String, String> params)throws Throwable;

	public int getListCnt(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getListCo(HashMap<String, String> params)throws Throwable;

	public void reportAjax(HashMap<String, String> params)throws Throwable;

	public void boardHit(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getBoard(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> reple(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> allim(HashMap<String, String> params)throws Throwable;

	public void ChangeJoinDate();//접속자수 구하기 쿼리

	public void Joinmem();

	public HashMap<String, String> getCulInfo(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getReview(HashMap<String, String> params) throws Throwable;

	public void deleteAjax(HashMap<String, String> params)throws Throwable;

	public void logoinsert(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> logoon(HashMap<String, String> params)throws Throwable;

	public int getJoin_day();

	public int getJoin_week();

	public int getboard_day();

	public int getJoin_month();

	public int getboard_week();

	public int getboard_month();

	public List<HashMap<String, String>> getComment(HashMap<String, String> params) throws Throwable;

	public void updateComment(HashMap<String, String> params) throws Throwable;

	public void cimginsert(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getimglist(HashMap<String, String> params)throws Throwable;
		
	public int A_getListCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> A_getlist(HashMap<String, String> params) throws Throwable;
	
	public HashMap<String, String> updateAjax(HashMap<String, String> params)throws Throwable;

	public void imgdelajax(HashMap<String, String> params)throws Throwable;

	public HashMap<String, Object> GetoldRogo() throws Throwable;

	public void updateAjaxCo(HashMap<String, String> params)throws Throwable;

	public void repotComment(HashMap<String, String> params) throws Throwable;

	public void deleteComment(HashMap<String, String> params) throws Throwable;

	public void changeComment(HashMap<String, String> params) throws Throwable;
	
	public void un_deleteAjax(HashMap<String, String> params)throws Throwable;

	public void C_delete(HashMap<String, String> params)throws Throwable;

	public void WriteReview(HashMap<String, String> params) throws Throwable;

	public void changeBoardComment(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> myreviewcheck(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> myreplecheck(HashMap<String, String> params)throws Throwable;
	
	public List<HashMap<String, String>> Search_C(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> Search_B(HashMap<String, String> params)throws Throwable;

	public int Search_Cn(HashMap<String, String> params)throws Throwable;

	public int Search_Bn(HashMap<String, String> params)throws Throwable;
	
	public int acListCnt(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> acgetlist(HashMap<String, String> params)throws Throwable;

	public void activebtnajax(HashMap<String, String> params)throws Throwable;

	public void unactivebtnajax(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getTomon(HashMap<String, String> params)throws Throwable;

	public int getCNtTomon()throws Throwable;

	public List<HashMap<String, String>> New_Cult()throws Throwable;

	public List<HashMap<String, String>> Hit_Cult()throws Throwable;

	public void userDelet(HashMap<String, String> params)throws Throwable;

	public void user_unDelet(HashMap<String, String> params)throws Throwable;

	public void grade_update(HashMap<String, String> params)throws Throwable;
	
	public List<HashMap<String, String>> getReportList(HashMap<String, String> params) throws Throwable;

	public int ReportListCnt(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getBoard2(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getReportInfo(HashMap<String, String> params) throws Throwable;

	public void reportCommentAjax(HashMap<String, String> params)throws Throwable;

	public void C_undelete(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> Admin_reple(HashMap<String, String> params) throws Throwable;

	public void alldelajax(HashMap<String, String> params)throws Throwable;

	public void unalldeleteAjax(HashMap<String, String> params)throws Throwable;

	public void Reload_Cult();

	public void reportCount(HashMap<String, String> params) throws Throwable;

	public void reportCommentCount(HashMap<String, String> params) throws Throwable;

	public void reportComment(HashMap<String, String> params) throws Throwable;

	public int SYMPATHYcheck(HashMap<String, String> params)throws Throwable;

	public void SYMPATHYhitinsert(HashMap<String, String> params);

	public void SYMPATHYhitupdate(HashMap<String, String> params);

	public int getimglistcnt();

}
