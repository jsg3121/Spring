package com.spring.sample.common.service;

import com.spring.sample.common.bean.PagingBean;

public interface IPagingService {
		//테이블 시작row
		public int getStartCount(int page);
		public int getStartBCount(int page);
		public int getStartUCount(int page);
		public int getStartACount(int page);
		public int getStartSCount(int page);
		
		//테이블 종료row
		public int getEndCount(int page);
		public int getEndBCount(int page);
		public int getEndUCount(int page);
		public int getEndACount(int page);
		public int getEndSCount(int page);
		
		//페이징 최대 크기
		public int getMaxPcount(int maxCount);
		public int getMaxPBcount(int maxCount);
		public int getMaxPUcount(int maxCount);
		public int getMaxPAcount(int maxCount);
		public int getMaxPScount(int maxCount);
		
		//현재페이지 기준 시작페이지
		public int getStartPcount(int page);
		public int getStartPBcount(int page);
		public int getStartPUcount(int page);
		public int getStartPAcount(int page);
		public int getStartPScount(int page);
		
		//현재페이지 기준 종료페이지
		public int getEndPcount(int page, int maxCount);
		public int getEndPBcount(int page, int maxCount);
		public int getEndPUcount(int page, int maxCount);
		public int getEndPAcount(int page, int maxCount);
		public int getEndPScount(int page, int maxCount);
		
		//빈형식으로 취득
		public PagingBean getPageingBean(int page, int maxCount);
		public PagingBean getBPageingBean(int page, int maxCount);
		public PagingBean getUPageingBean(int page, int maxCount);
		public PagingBean getAPageingBean(int page, int maxCount);
		public PagingBean getSPageingBean(int page, int maxCount);


}
