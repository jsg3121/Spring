package com.spring.sample.common.service;

import org.springframework.stereotype.Service;

import com.spring.sample.common.CommonProperties;
import com.spring.sample.common.bean.PagingBean;

@Service
public class PagingService implements IPagingService{
	/*
	 * Paging
	 * getStart()Count
	 * ()= B Board / U User / A Admin / S Search
	 */
	//테이블 시작row
	@Override
	public int getStartCount(int page) {
		int startCount = 0;
		int viewCount = CommonProperties.VIEWCOUNT;
		startCount = (page - 1) * viewCount + 1;
		return startCount;
	}
	@Override
	public int getStartBCount(int page) {
		int startCount = 0;
		int viewCount = CommonProperties.VIEWCOUNTBOARD;
		startCount = (page - 1) * viewCount + 1;
		return startCount;
	}
	@Override
	public int getStartUCount(int page) {
		int startCount = 0;
		int viewCount = CommonProperties.VIEWCOUNTUSER;
		startCount = (page - 1) * viewCount + 1;
		return startCount;
	}
	@Override
	public int getStartACount(int page) {
		int startCount = 0;
		int viewCount = CommonProperties.VIEWCOUNTUSER;
		startCount = (page - 1) * viewCount + 1;
		return startCount;
	}
	@Override
	public int getStartSCount(int page) {
		int startCount = 0;
		int viewCount = CommonProperties.VIEWCOUNTSEARCH;
		startCount = (page - 1) * viewCount + 1;
		return startCount;
	}
	//테이블 종료row
	@Override
	public int getEndCount(int page) {
		int endCount = 0;
		endCount = page * CommonProperties.VIEWCOUNT;
		return endCount;
	}
	@Override
	public int getEndBCount(int page) {
		int endCount = 0;
		endCount = page * CommonProperties.VIEWCOUNTBOARD;
		return endCount;
	}
	@Override
	public int getEndUCount(int page) {
		int endCount = 0;
		endCount = page * CommonProperties.VIEWCOUNTUSER;
		return endCount;
	}
	@Override
	public int getEndACount(int page) {
		int endCount = 0;
		endCount = page * CommonProperties.VIEWCOUNTUSER;
		return endCount;
	}
	@Override
	public int getEndSCount(int page) {
		int endCount = 0;
		endCount = page * CommonProperties.VIEWCOUNTSEARCH;
		return endCount;
	}
	
	//페이징 최대 크기
	@Override
	public int getMaxPcount(int maxCount) {
		int maxPcount = 0;
		
		if(maxCount % CommonProperties.VIEWCOUNT > 0){
			maxPcount = (maxCount / CommonProperties.VIEWCOUNT) + 1;
		} else {
			maxPcount = (maxCount / CommonProperties.VIEWCOUNT);
		}
		
		if(maxCount == 0) {
			maxPcount = 1;
		}
		
		return maxPcount;
	}
	@Override
	public int getMaxPBcount(int maxCount) {
		int maxPcount = 0;
		
		if(maxCount % CommonProperties.VIEWCOUNTBOARD > 0){
			maxPcount = (maxCount / CommonProperties.VIEWCOUNTBOARD) + 1;
		} else {
			maxPcount = (maxCount / CommonProperties.VIEWCOUNTBOARD);
		}
		
		if(maxCount == 0) {
			maxPcount = 1;
		}
		
		return maxPcount;
	}
	@Override
	public int getMaxPUcount(int maxCount) {
		int maxPcount = 0;
		
		if(maxCount % CommonProperties.VIEWCOUNTUSER > 0){
			maxPcount = (maxCount / CommonProperties.VIEWCOUNTUSER) + 1;
		} else {
			maxPcount = (maxCount / CommonProperties.VIEWCOUNTUSER);
		}
		
		if(maxCount == 0) {
			maxPcount = 1;
		}
		
		return maxPcount;
	}
	@Override
	public int getMaxPAcount(int maxCount) {
		int maxPcount = 0;
		
		if(maxCount % CommonProperties.VIEWCOUNTUSER > 0){
			maxPcount = (maxCount / CommonProperties.VIEWCOUNTUSER) + 1;
		} else {
			maxPcount = (maxCount / CommonProperties.VIEWCOUNTUSER);
		}
		
		if(maxCount == 0) {
			maxPcount = 1;
		}
		
		return maxPcount;
	}
	@Override
	public int getMaxPScount(int maxCount) {
		int maxPcount = 0;
		
		if(maxCount % CommonProperties.VIEWCOUNTSEARCH > 0){
			maxPcount = (maxCount / CommonProperties.VIEWCOUNTSEARCH) + 1;
		} else {
			maxPcount = (maxCount / CommonProperties.VIEWCOUNTSEARCH);
		}
		
		if(maxCount == 0) {
			maxPcount = 1;
		}
		
		return maxPcount;
	}
	
	//현재페이지 기준 시작페이지
	@Override
	public int getStartPcount(int page) {
		int startPcount = 0;
		
		if(page % CommonProperties.PAGECOUNT == 0 ) {
			startPcount = page - CommonProperties.PAGECOUNT + 1;
		} else {
			startPcount = ((page / CommonProperties.PAGECOUNT) * CommonProperties.PAGECOUNT) + 1;
		}
		
		return startPcount;
	}
	public int getStartPBcount(int page) {
		int startPcount = 0;
		
		if(page % CommonProperties.PAGECOUNTBOARD == 0 ) {
			startPcount = page - CommonProperties.PAGECOUNTBOARD + 1;
		} else {
			startPcount = ((page / CommonProperties.PAGECOUNTBOARD) * CommonProperties.PAGECOUNTBOARD) + 1;
		}
		
		return startPcount;
	}
	public int getStartPUcount(int page) {
		int startPcount = 0;
		
		if(page % CommonProperties.PAGECOUNTUSER == 0 ) {
			startPcount = page - CommonProperties.PAGECOUNTUSER + 1;
		} else {
			startPcount = ((page / CommonProperties.PAGECOUNTUSER) * CommonProperties.PAGECOUNTUSER) + 1;
		}
		
		return startPcount;
	}
	public int getStartPAcount(int page) {
		int startPcount = 0;
		
		if(page % CommonProperties.PAGECOUNTUSER == 0 ) {
			startPcount = page - CommonProperties.PAGECOUNTUSER + 1;
		} else {
			startPcount = ((page / CommonProperties.PAGECOUNTUSER) * CommonProperties.PAGECOUNTUSER) + 1;
		}
		
		return startPcount;
	}
	public int getStartPScount(int page) {
		int startPcount = 0;
		
		if(page % CommonProperties.PAGECOUNTSEARCH == 0 ) {
			startPcount = page - CommonProperties.PAGECOUNTSEARCH + 1;
		} else {
			startPcount = ((page / CommonProperties.PAGECOUNTSEARCH) * CommonProperties.PAGECOUNTSEARCH) + 1;
		}
		
		return startPcount;
	}
	
	//현재페이지 기준 종료페이지
	@Override
	public int getEndPcount(int page, int maxCount) {
		int endPcount = 0;
		int maxPcount = getMaxPcount(maxCount);
		
		endPcount = getStartPcount(page) + CommonProperties.PAGECOUNT - 1;
		
		if(endPcount >= maxPcount){
			endPcount = maxPcount;
		}
		
		return endPcount;
	}
	@Override
	public int getEndPBcount(int page, int maxCount) {
		int endPcount = 0;
		int maxPcount = getMaxPBcount(maxCount);
		
		endPcount = getStartPBcount(page) + CommonProperties.PAGECOUNTBOARD - 1;
		
		if(endPcount >= maxPcount){
			endPcount = maxPcount;
		}
		
		return endPcount;
	}
	@Override
	public int getEndPUcount(int page, int maxCount) {
		int endPcount = 0;
		int maxPcount = getMaxPUcount(maxCount);
		
		endPcount = getStartPUcount(page) + CommonProperties.PAGECOUNTUSER - 1;
		
		if(endPcount >= maxPcount){
			endPcount = maxPcount;
		}
		
		return endPcount;
	}
	@Override
	public int getEndPAcount(int page, int maxCount) {
		int endPcount = 0;
		int maxPcount = getMaxPUcount(maxCount);
		
		endPcount = getStartPUcount(page) + CommonProperties.PAGECOUNTUSER - 1;
		
		if(endPcount >= maxPcount){
			endPcount = maxPcount;
		}
		
		return endPcount;
	}
	@Override
	public int getEndPScount(int page, int maxCount) {
		int endPcount = 0;
		int maxPcount = getMaxPUcount(maxCount);
		
		endPcount = getStartPUcount(page) + CommonProperties.PAGECOUNTSEARCH - 1;
		
		if(endPcount >= maxPcount){
			endPcount = maxPcount;
		}
		
		return endPcount;
	}
	
	//빈형식으로 취득
	@Override
	public PagingBean getPageingBean(int page, int maxCount) {
		PagingBean pb = new PagingBean();
		
		pb.setStartCount(getStartCount(page));
		pb.setEndCount(getEndCount(page));
		pb.setMaxPcount(getMaxPcount(maxCount));
		pb.setStartPcount(getStartPcount(page));
		pb.setEndPcount(getEndPcount(page, maxCount));
		
		return pb;
	}
	@Override
	public PagingBean getBPageingBean(int page, int maxCount) {
		PagingBean paging = new PagingBean();
		
		paging.setStartCount(getStartBCount(page));
		paging.setEndCount(getEndBCount(page));
		paging.setMaxPcount(getMaxPBcount(maxCount));
		paging.setStartPcount(getStartPBcount(page));
		paging.setEndPcount(getEndPBcount(page, maxCount));
		
		return paging;
	}
	@Override
	public PagingBean getUPageingBean(int page, int maxCount) {
		PagingBean paging = new PagingBean();
		
		paging.setStartCount(getStartUCount(page));
		paging.setEndCount(getEndUCount(page));
		paging.setMaxPcount(getMaxPUcount(maxCount));
		paging.setStartPcount(getStartPUcount(page));
		paging.setEndPcount(getEndPUcount(page, maxCount));
		
		return paging;
	}
	@Override
	public PagingBean getAPageingBean(int page, int maxCount) {
		PagingBean paging = new PagingBean();
		
		paging.setStartCount(getStartUCount(page));
		paging.setEndCount(getEndUCount(page));
		paging.setMaxPcount(getMaxPUcount(maxCount));
		paging.setStartPcount(getStartPUcount(page));
		paging.setEndPcount(getEndPUcount(page, maxCount));
		
		return paging;
	}
	@Override
	public PagingBean getSPageingBean(int page, int maxCount) {
		PagingBean paging = new PagingBean();
		
		paging.setStartCount(getStartSCount(page));
		paging.setEndCount(getEndSCount(page));
		paging.setMaxPcount(getMaxPScount(maxCount));
		paging.setStartPcount(getStartPScount(page));
		paging.setEndPcount(getEndPScount(page, maxCount));
		
		return paging;
	}
}
