package com.spring.sample.web.Team.Dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

@Repository
public class TeamDao implements iTeamDao {

	@Autowired
	public SqlSession sqlSession;

	@Override
	public int idcheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Team.idcheck", params);
	}

	@Override
	public void insertup(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("Team.insertup", params);
	}

	@Override
	public HashMap<String, String> loginCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Team.loginCheck", params);
	}

	@Override
	public String findPw(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Team.findPw", params);
	}

	@Override
	public HashMap<String, String> mypageim(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Team.mypageim", params);
	}

	@Override
	public List<HashMap<String, String>> getlist(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Team.getlist", params);
	}

	@Override
	public int getBoardListCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Team.getBoardListCnt", params);
	}

	@Override
	public String findId(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Team.findId", params);
	}

	@Override
	public void fileinsert(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("Team.fileinsert", params);
	}

	@Override
	public List<HashMap<String, String>> getUserList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Team.getUserList", params);
	}

	@Override
	public int getUserListCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Team.getUserListCnt", params);
	}

	@Override
	public HashMap<String, String> getUserInfoList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Team.getUserInfoList", params);
	}

	@Override
	public HashMap<String, String> getUserboard(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Team.getUserboard", params);
	}

	@Override
	public HashMap<String, String> getUserConment(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Team.getUserConment", params);
	}

	@Override
	public HashMap<String, String> getUserReport(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Team.getUserReport", params);
	}

	@Override
	public void pwupdate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("Team.pwupdate", params);
	}

	@Override
	public void deluser(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("Team.deluser", params);
	}

	@Override
	public void intoduce(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("Team.intoduce", params);
	}

	@Override
	public void writeAjax(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("Team.writeAjax", params);
	}

	@Override
	public void insertAjax(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("Team.insertAjax", params);
	}

	@Override
	public int getListCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Team.getListCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getListCo(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Team.getListCo", params);
	}

	@Override
	public void reportAjax(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("Team.reportAjax", params);
	}

	@Override
	public void boardHit(HashMap<String, String> params) throws Throwable {
		sqlSession.update("Team.boardHit", params);
	}

	@Override
	public HashMap<String, String> getBoard(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Team.getBoard", params);
	}

	@Override
	public List<HashMap<String, String>> reple(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Team.reple", params);
	}

	@Override
	public List<HashMap<String, String>> allim(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Team.allim", params);
	}

	@Override
	public void ChangeJoinDate() {
		sqlSession.insert("Team.ChangeJoinDate");
	}

	@Override
	public void Joinmem() {
		sqlSession.update("Team.Joinmem");
	}

	@Override
	public HashMap<String, String> getCulInfo(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Team.getCulInfo", params);
	}

	@Override
	public List<HashMap<String, String>> getReview(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Team.getReview", params);
	}

	@Override
	public void deleteAjax(HashMap<String, String> params) throws Throwable {
		
		for(int i=0; i<2;i++) {
			sqlSession.update("Team.deleteAjax", params);
			sqlSession.update("Team.deleteajaxComment",params);
			}
	}

	@Override
	public void logoinsert(HashMap<String, String> params) throws Throwable {
		sqlSession.update("Team.logoinsert", params);
	}

	@Override
	public HashMap<String, String> logoon(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Team.logoon", params);
	}

	@Override
	public int getJoin_day() {
		return sqlSession.selectOne("Team.getJoin_day");
	}

	@Override
	public int getJoin_week() {
		return sqlSession.selectOne("Team.getJoin_week");
	}

	@Override
	public int getboard_day() {
		return sqlSession.selectOne("Team.getboard_day");
	}

	@Override
	public int getJoin_month() {
		return sqlSession.selectOne("Team.getJoin_month");
	}

	@Override
	public int getboard_week() {
		return sqlSession.selectOne("Team.getboard_week");
	}

	@Override
	public int getboard_month() {
		return sqlSession.selectOne("Team.getboard_month");
	}

	@Override
	public int A_getListCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Team.A_getListCnt", params);
	}
	@Override
	public List<HashMap<String, String>> getComment(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Team.getComment", params);
	}
	@Override
	public void updateComment(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("Team.updateComment", params);
	}
	@Override
	public List<HashMap<String, String>> A_getlist(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Team.A_getlist", params);
	}

	@Override
	public void cimginsert(HashMap<String, String> params) throws Throwable {

		try {

			// 파일 목록 저장
			if (params.get("imgatt") != null && params.get("imgatt") != "") {
				String[] fileNames = params.get("imgatt").split(",");

				for (int i = 0; i < fileNames.length; i++) {

					HashMap<String, String> fileData = new HashMap<String, String>();

					fileData.put("imgatt", fileNames[i]);

					if (params.get("imgNO1").toString() == "") {
						if (params.get("imgNO2").toString() == "") {
							if (params.get("imgNO3".toString()) == "") {
								if (params.get("imgNO4").toString() == "") {
								} else {
									fileData.put("no", params.get("imgNO4"));
									sqlSession.update("Team.cimginsert", fileData);
									params.put("imgNO4", "");
								}
							} else {
								fileData.put("no", params.get("imgNO3"));
								sqlSession.update("Team.cimginsert", fileData);
								params.put("imgNO3", "");
							}

						} else {
							fileData.put("no", params.get("imgNO2"));
							sqlSession.update("Team.cimginsert", fileData);
							params.put("imgNO2", "");
						}
					} else {
						fileData.put("no", params.get("imgNO1"));
						sqlSession.update("Team.cimginsert", fileData);
						params.put("imgNO1", "");
					}
				}
			}
		} catch (Exception e) {

			throw e;// 롤벡후 문제 강제 발생
			// 실패했음을 알리기 위해 예외를 발생
		}

	}

	@Override
	public List<HashMap<String, String>> getimglist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Team.getimglist", params);
	}

	@Override
	public void imgdelajax(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("Team.imgdelajax", params);
	}

	@Override
	public HashMap<String, String> updateAjax(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Team.updateAjax", params);
	}

	@Override
	public void updateAjaxCo(HashMap<String, String> params) throws Throwable {
		sqlSession.update("Team.updateAjaxCo", params);

	}
	@Override
	public HashMap<String, Object> GetoldRogo() throws Throwable {
		return sqlSession.selectOne("Team.GetoldRogo");
	}

	@Override
	public void repotComment(HashMap<String, String> params) throws Throwable {
		sqlSession.update("Team.repotComment", params);
	}

	@Override
	public void deleteComment(HashMap<String, String> params) throws Throwable {
		sqlSession.update("Team.deleteComment", params);
	}

	@Override
	public void changeComment(HashMap<String, String> params) throws Throwable {
		sqlSession.update("Team.changeComment", params);
	}

	@Override
	public void un_deleteAjax(HashMap<String, String> params) throws Throwable {
		sqlSession.update("Team.un_deleteAjax",params);
	}

	@Override
	public void C_delete(HashMap<String, String> params) throws Throwable {
		sqlSession.update("Team.C_delete",params);
	}

	@Override
	public void WriteReview(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("Team.WriteReview", params);
	}

	@Override
	public void changeBoardComment(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("Team.changeBoardComment", params);
	}
	
	@Override
	public List<HashMap<String, String>> myreviewcheck(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Team.myreviewcheck",params);
	}

	@Override
	public List<HashMap<String, String>> myreplecheck(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Team.myreplecheck",params);
	}
	@Override
	public List<HashMap<String, String>> Search_C(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Team.Search_C",params);
	}

	@Override
	public List<HashMap<String, String>> Search_B(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Team.Search_B",params);
	}

	@Override
	public int Search_Cn(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Team.Search_Cn",params);
	}

	@Override
	public int Search_Bn(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Team.Search_Bn",params);
	}

	@Override
	public int acListCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Team.acListCnt",params);
	}

	@Override
	public List<HashMap<String, String>> acgetlist(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Team.acgetlist",params);
	}

	@Override
	public void activebtnajax(HashMap<String, String> params) throws Throwable {
		sqlSession.update("Team.activebtnajax",params);
	}

	@Override
	public void unactivebtnajax(HashMap<String, String> params) throws Throwable {
		sqlSession.update("Team.unactivebtnajax",params);
	}
	@Override
	public List<HashMap<String, String>> getTomon(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Team.getTomon",params);
	}

	@Override
	public int getCNtTomon() throws Throwable {
		return sqlSession.selectOne("Team.getCNtTomon");
	}

	@Override
	public List<HashMap<String, String>> New_Cult() throws Throwable {
		return sqlSession.selectList("Team.New_Cult");
	}

	@Override
	public List<HashMap<String, String>> Hit_Cult() throws Throwable {
		return sqlSession.selectList("Team.Hit_Cult");
	}

	@Override
	public void userDelet(HashMap<String, String> params) throws Throwable {
		sqlSession.update("Team.userDelet",params);
	}

	@Override
	public void user_unDelet(HashMap<String, String> params) throws Throwable {
		sqlSession.update("Team.user_unDelet",params);
	}

	@Override
	public void grade_update(HashMap<String, String> params) throws Throwable {
		sqlSession.update("Team.grade_update",params);
	}

	
	@Override
	public List<HashMap<String, String>> getReportList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Team.getReportList", params);
	}

	@Override
	public int ReportListCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Team.ReportListCnt",params);
	}

	@Override
	public HashMap<String, String> getBoard2(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Team.getBoard2", params);
	}

	@Override
	public HashMap<String, String> getReportInfo(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Team.getReportInfo", params);
	}

	@Override
	public void reportCommentAjax(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("Team.reportCommentAjax", params);
	}
	@Override
	public void C_undelete(HashMap<String, String> params) throws Throwable {
		sqlSession.update("Team.C_undelete",params);
	}

	@Override
	public List<HashMap<String, String>> Admin_reple(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Team.Admin_reple",params);
	}

	@Override
	public void alldelajax(HashMap<String, String> params) {
		sqlSession.update("Team.alldelajax", params);
	}

	@Override
	public void unalldeleteAjax(HashMap<String, String> params) throws Throwable {
		sqlSession.update("Team.unalldeleteAjax", params);
	}

	@Override
	public void Reload_Cult() {
		sqlSession.update("Team.Reload_Cult");
	}

	@Override
	public void reportCount(HashMap<String, String> params) throws Throwable {
		sqlSession.update("Team.reportCount", params);
	}

	@Override
	public void reportCommentCount(HashMap<String, String> params) throws Throwable {
		sqlSession.update("Team.reportCommentCount", params);
	}

	@Override
	public void reportComment(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("Team.reportComment", params);
	}
	
	@Override
	public int SYMPATHYcheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Team.SYMPATHYcheck",params);
	}

	@Override
	public void SYMPATHYhitinsert(HashMap<String, String> params) {
		sqlSession.update("Team.SYMPATHYhitinsert",params);
	}

	@Override
	public void SYMPATHYhitupdate(HashMap<String, String> params) {
		sqlSession.update("Team.SYMPATHYhitupdate",params);
	}

	@Override
	public int getimglistcnt() {
		return sqlSession.selectOne("Team.getimglistcnt");
	}

}
