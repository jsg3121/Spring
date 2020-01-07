package com.spring.sample.web.Team.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.sample.web.Team.Dao.iTeamDao;

@Service
public class TeamService implements iTeamService{
	@Autowired
	public iTeamDao ITeamDao;

	@Override
	public int idcheck(HashMap<String, String> params) throws Throwable {
		
		return ITeamDao.idcheck(params);
	}

	@Override
	public void insertup(HashMap<String, String> params) throws Throwable {
		ITeamDao.insertup(params);
	}

	@Override
	public HashMap<String, String> loginCheck(HashMap<String, String> params) throws Throwable {
		return ITeamDao.loginCheck(params);
	}

	@Override
	public String findPw(HashMap<String, String> params) throws Throwable {
		return ITeamDao.findPw(params);
	}

	@Override
	public HashMap<String, String> mypageim(HashMap<String, String> params) throws Throwable {
		return ITeamDao.mypageim(params);
	}
	@Override
	public List<HashMap<String, String>> getlist(HashMap<String, String> params) throws Throwable {
		return ITeamDao.getlist(params);
	}

	@Override
	public int getBoardListCnt(HashMap<String, String> params) throws Throwable {
		return ITeamDao.getBoardListCnt(params);
	}
	@Override
	public String findId(HashMap<String, String> params) throws Throwable {
		return ITeamDao.findId(params);
	}

	@Override
	public void fileinsert(HashMap<String, String> params) throws Throwable {
		ITeamDao.fileinsert(params);
	}

	@Override
	public void pwupdate(HashMap<String, String> params) throws Throwable {
		ITeamDao.pwupdate(params);
	}

	@Override
	public void deluser(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		ITeamDao.deluser(params);
	}

	@Override
	public void intoduce(HashMap<String, String> params) throws Throwable {
		ITeamDao.intoduce(params);
	}

	@Override
	public void writeAjax(HashMap<String, String> params) throws Throwable {
		ITeamDao.writeAjax(params);
	}

	@Override
	public void insertAjax(HashMap<String, String> params) throws Throwable {
		ITeamDao.insertAjax(params);
	}

	@Override
	public int getListCnt(HashMap<String, String> params) throws Throwable {
		return ITeamDao.getListCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getListCo(HashMap<String, String> params) throws Throwable {
		return ITeamDao.getListCo(params);
	}

	@Override
	public void reportAjax(HashMap<String, String> params) throws Throwable {
		ITeamDao.reportAjax(params);
	}

	@Override
	public void boardHit(HashMap<String, String> params) throws Throwable {
		ITeamDao.boardHit(params);
	}

	@Override
	public HashMap<String, String> getBoard(HashMap<String, String> params) throws Throwable {
		return ITeamDao.getBoard(params);
	}

	@Override
	public List<HashMap<String, String>> reple(HashMap<String, String> params) throws Throwable {
		return ITeamDao.reple(params);
	}

	@Override
	public List<HashMap<String, String>> allim(HashMap<String, String> params) throws Throwable {
		return ITeamDao.allim(params);
	}

	@Override
	public void Joinmem() {
		ITeamDao.Joinmem();
	}

	@Override
	public void logoinsert(HashMap<String, String> params) throws Throwable {
		ITeamDao.logoinsert(params);
	}

	@Override
	public HashMap<String, String> logoon(HashMap<String, String> params) throws Throwable {
		return ITeamDao.logoon(params);
	}

	@Override
	public void deleteAjax(HashMap<String, String> params) throws Throwable {
		ITeamDao.deleteAjax(params);
	}
	
	@Override
	public List<HashMap<String, String>> getUserList(HashMap<String, String> params) throws Throwable {
		return ITeamDao.getUserList(params);
	}

	@Override
	public int getUserListCnt(HashMap<String, String> params) throws Throwable {
		return ITeamDao.getUserListCnt(params);
	}

	@Override
	public HashMap<String, String> getUserInfoList(HashMap<String, String> params) throws Throwable {
		return ITeamDao.getUserInfoList(params);
	}

	@Override
	public HashMap<String, String> getUserboard(HashMap<String, String> params) throws Throwable {
		return ITeamDao.getUserboard(params);
	}

	@Override
	public HashMap<String, String> getUserConment(HashMap<String, String> params) throws Throwable {
		return ITeamDao.getUserConment(params);
	}

	@Override
	public HashMap<String, String> getUserReport(HashMap<String, String> params) throws Throwable {
		return ITeamDao.getUserReport(params);
	}

	@Override
	public HashMap<String, String> getCulInfo(HashMap<String, String> params) throws Throwable {
		return ITeamDao.getCulInfo(params);
	}

	@Override
	public List<HashMap<String, String>> getReview(HashMap<String, String> params) throws Throwable {
		return ITeamDao.getReview(params);
	}	
	@Override
	public int getJoin_day() {
		return ITeamDao.getJoin_day();
	}

	@Override
	public int getJoin_week() {
		return ITeamDao.getJoin_week();
	}

	@Override
	public int getJoin_month() {
		return ITeamDao.getJoin_month();
	}

	@Override
	public int getboard_day() {
		return ITeamDao.getboard_day();
	}

	@Override
	public int getboard_week() {
		return ITeamDao.getboard_week();
	}

	@Override
	public int getboard_month() {
		return ITeamDao.getboard_month();
	}

	@Override
	public List<HashMap<String, String>> getComment(HashMap<String, String> params) throws Throwable {
		return ITeamDao.getComment(params);
	}

	@Override
	public void updateComment(HashMap<String, String> params) throws Throwable {
		ITeamDao.updateComment(params);
	}

	@Override
	public void cimginsert(HashMap<String, String> params) throws Throwable {
		ITeamDao.cimginsert(params);
	}

	@Override
	public List<HashMap<String, String>> getimglist(HashMap<String, String> params) throws Throwable {
		return ITeamDao.getimglist(params);
	}

	@Override
	public int A_getListCnt(HashMap<String, String> params) throws Throwable{
		return ITeamDao.A_getListCnt(params);
	}

	@Override
	public List<HashMap<String, String>> A_getlist(HashMap<String, String> params) throws Throwable{
		return ITeamDao.A_getlist(params);
	}
	@Override
	public void imgdelajax(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		ITeamDao.imgdelajax(params);
	}
	@Override
	public HashMap<String, String> updateAjax(HashMap<String, String> params) throws Throwable {
		return ITeamDao.updateAjax(params);
	}

	@Override
	public void updateAjaxCo(HashMap<String, String> params) throws Throwable {
		ITeamDao.updateAjaxCo(params);
	}

	@Override
	public void repotComment(HashMap<String, String> params) throws Throwable {
		ITeamDao.repotComment(params);
	}

	@Override
	public void deleteComment(HashMap<String, String> params) throws Throwable {
		ITeamDao.deleteComment(params);
	}

	@Override
	public void changeComment(HashMap<String, String> params) throws Throwable {
		ITeamDao.changeComment(params);
	}
	
	@Override
	public HashMap<String, Object> GetoldRogo() throws Throwable {
		return ITeamDao.GetoldRogo();
	}

	@Override
	public void un_deleteAjax(HashMap<String, String> params) throws Throwable {
		ITeamDao.un_deleteAjax(params);
	}

	@Override
	public void C_delete(HashMap<String, String> params) throws Throwable {
		ITeamDao.C_delete(params);
	}
	@Override
	public List<HashMap<String, String>> myreviewcheck(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return ITeamDao.myreviewcheck(params);
	}
	@Override
	public List<HashMap<String, String>> myreplecheck(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return ITeamDao.myreplecheck(params);
	}
	@Override
	public List<HashMap<String, String>> Search_C(HashMap<String, String> params) throws Throwable {
		return ITeamDao.Search_C(params);
	}

	@Override
	public List<HashMap<String, String>> Search_B(HashMap<String, String> params) throws Throwable {
		return ITeamDao.Search_B(params);
	}

	@Override
	public int Search_Cn(HashMap<String, String> params) throws Throwable {
		return ITeamDao.Search_Cn(params);
	}

	@Override
	public int Search_Bn(HashMap<String, String> params) throws Throwable {
		return ITeamDao.Search_Bn(params);
	}

	@Override
	public void WriteReview(HashMap<String, String> params) throws Throwable {
		ITeamDao.WriteReview(params);
	}

	@Override
	public void changeBoardComment(HashMap<String, String> params) throws Throwable {
		ITeamDao.changeBoardComment(params);
	}
	
	@Override
	public int acListCnt(HashMap<String, String> params) throws Throwable {
		return ITeamDao.acListCnt(params);
	}

	@Override
	public List<HashMap<String, String>> acgetlist(HashMap<String, String> params) throws Throwable {
		return ITeamDao.acgetlist(params);
	}

	@Override
	public void activebtnajax(HashMap<String, String> params) throws Throwable {
		ITeamDao.activebtnajax(params);
	}

	@Override
	public void unactivebtnajax(HashMap<String, String> params) throws Throwable {
		ITeamDao.unactivebtnajax(params);
	}

	@Override
	public List<HashMap<String, String>> getTomon(HashMap<String, String> params) throws Throwable {
		return ITeamDao.getTomon(params);
	}

	@Override
	public int getCNtTomon() throws Throwable {
		return ITeamDao.getCNtTomon();
	}

	@Override
	public List<HashMap<String, String>> New_Cult() throws Throwable {
		return ITeamDao.New_Cult();
	}

	@Override
	public List<HashMap<String, String>> Hit_Cult() throws Throwable {
		return ITeamDao.Hit_Cult();
	}

	@Override
	public void userDelet(HashMap<String, String> params) throws Throwable {
		ITeamDao.userDelet(params);
	}
	
	@Override
	public void user_unDelet(HashMap<String, String> params) throws Throwable {
		ITeamDao.user_unDelet(params);
	}

	@Override
	public void grade_update(HashMap<String, String> params) throws Throwable {
		ITeamDao.grade_update(params);
	}
	@Override
	public List<HashMap<String, String>> getReportList(HashMap<String, String> params) throws Throwable {
		return ITeamDao.getReportList(params);
	}

	@Override
	public int ReportListCnt(HashMap<String, String> params) throws Throwable {
		return ITeamDao.ReportListCnt(params);
	}

	@Override
	public HashMap<String, String> getBoard2(HashMap<String, String> params) throws Throwable {
		return ITeamDao.getBoard2(params);
	}
	@Override
	public HashMap<String, String> getReportInfo(HashMap<String, String> params) throws Throwable {
		return ITeamDao.getReportInfo(params);
	}

	@Override
	public void reportCommentAjax(HashMap<String, String> params) throws Throwable {
		ITeamDao.reportCommentAjax(params);
	}

	@Override
	public void C_undelete(HashMap<String, String> params) throws Throwable {
		ITeamDao.C_undelete(params);
	}

	@Override
	public List<HashMap<String, String>> Admin_reple(HashMap<String, String> params) throws Throwable {
		return ITeamDao.Admin_reple(params);
	}
	
	@Override
	public void alldelajax(HashMap<String, String> params) throws Throwable {
		ITeamDao.alldelajax(params);
	}

	@Override
	public void unalldeleteAjax(HashMap<String, String> params) throws Throwable {
		ITeamDao.unalldeleteAjax(params);
	}

	@Override
	public void Reload_Cult() {
		ITeamDao.Reload_Cult();
	}

	@Override
	public void reportCount(HashMap<String, String> params) throws Throwable {
		ITeamDao.reportCount(params);
	}

	@Override
	public void reportCommentCount(HashMap<String, String> params) throws Throwable {
		ITeamDao.reportCommentCount(params);
	}

	@Override
	public void reportComment(HashMap<String, String> params) throws Throwable {
		ITeamDao.reportComment(params);
	}
	
	@Override
	public int SYMPATHYcheck(HashMap<String, String> params) throws Throwable {
		return ITeamDao.SYMPATHYcheck(params);
	}

	@Override
	public void SYMPATHYhitupdate(HashMap<String, String> params) {
		ITeamDao.SYMPATHYhitupdate(params);
	}

	@Override
	public void SYMPATHYhitinsert(HashMap<String, String> params) {
		ITeamDao.SYMPATHYhitinsert(params);
	}

	@Override
	public int getimglistcnt() {
		return ITeamDao.getimglistcnt();
	}
}
