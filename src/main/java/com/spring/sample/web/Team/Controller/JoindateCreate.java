package com.spring.sample.web.Team.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.spring.sample.web.Team.Dao.iTeamDao;

@Component
public class JoindateCreate {
	@Autowired
	public iTeamDao ITeamDao;

	@Scheduled(cron = "0 0 0 * * *")//정시에 T_LOG테이블에 금일 날짜 데이터 추가
	public void cronTest1() {
		System.out.println("금일 접속기록 새로 추가!");
		ITeamDao.ChangeJoinDate();
	}

}
