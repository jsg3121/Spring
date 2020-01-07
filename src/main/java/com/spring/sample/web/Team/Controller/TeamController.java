package com.spring.sample.web.Team.Controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.sample.common.CommonProperties;
import com.spring.sample.common.bean.PagingBean;
import com.spring.sample.common.service.IPagingService;
import com.spring.sample.web.Team.Service.iTeamService;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

@Controller
public class TeamController {
	@Autowired
	public iTeamService ITeamService;
	@Autowired
	public IPagingService iPagingService;

	@RequestMapping(value = "/main")
	public ModelAndView main(@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {

		HashMap<String, String> logo = ITeamService.logoon(params);
		modelAndView.addObject("logo", logo);

		int getCNtTomon = ITeamService.getCNtTomon();
		modelAndView.addObject("getCNtTomon", getCNtTomon);// 이달의 문화행사 개수
		
		modelAndView.setViewName("Team/main");

		return modelAndView;
	}
	
	@RequestMapping(value = "/slide", method = RequestMethod.POST, produces = "test/json;charset=UTF-8")
	@ResponseBody
	public String slide(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int imglistcnt = ITeamService.getimglistcnt();
			modelMap.put("imglistcnt", imglistcnt);// 리스트 이미지 개수
			List<HashMap<String, String>> imglist = ITeamService.getimglist(params);
			modelMap.put("imglist", imglist);// 리스트 이미지 불러오기
			
			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
			
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "/MonImg", method = RequestMethod.POST, produces = "test/json;charset=UTF-8")
	@ResponseBody
	public String MonImg(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {
	ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> modelMap = new HashMap<String, Object>();
	
	try {
		
	List<HashMap<String, String>> getTomon = ITeamService.getTomon(params);
	modelMap.put("getTomon", getTomon);// 이달의 문화행사 불러오기

		
	modelMap.put("res", CommonProperties.RESULT_SUCCESS);
	} catch (Exception e) {
	e.printStackTrace();
	modelMap.put("res", CommonProperties.RESULT_ERROR);
	
	}
	
	return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "/New_Cult", method = RequestMethod.POST, produces = "test/json;charset=UTF-8")
	@ResponseBody
	public String New_Cult(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			List<HashMap<String, String>> New_Cult = ITeamService.New_Cult();
			modelMap.put("New_Cult", New_Cult);// 이달의 문화행사 불러오기
			
			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
			
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "/Hit_Cult", method = RequestMethod.POST, produces = "test/json;charset=UTF-8")
	@ResponseBody
	public String Hit_Cult(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			List<HashMap<String, String>> Hit_Cult = ITeamService.Hit_Cult();
			modelMap.put("Hit_Cult", Hit_Cult);// 이달의 문화행사 불러오기
			
			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}
		
		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/Search")
	public ModelAndView Saerch(@RequestParam HashMap<String, String> params, ModelAndView modelAndView)
			throws Throwable {

		HashMap<String, String> logo = ITeamService.logoon(params);
		modelAndView.addObject("logo", logo);

		modelAndView.setViewName("Team/Search");

		return modelAndView;
	}

	@RequestMapping(value = "/Search_S", method = RequestMethod.POST, produces = "test/json;charset=UTF-8")
	@ResponseBody
	public String Search_S(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		if (params.get("page") == null) {
			params.put("page", "1");
		}

		int cnt_C = ITeamService.Search_Cn(params);
		int cnt_B = ITeamService.Search_Bn(params);

		List<HashMap<String, String>> Search_C = ITeamService.Search_C(params);
		List<HashMap<String, String>> Search_B = ITeamService.Search_B(params);
		modelMap.put("Search_C", Search_C);
		modelMap.put("Search_B", Search_B);
		modelMap.put("cnt_C", cnt_C);
		modelMap.put("cnt_B", cnt_B);

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/LeftMenu") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView LeftMenu(@RequestParam HashMap<String, String> params, ModelAndView modelAndView)
			throws Throwable {

		modelAndView.setViewName("Team/LeftMenu");
		return modelAndView;

	}

	@RequestMapping(value = "/Bottom") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView Bottom(@RequestParam HashMap<String, String> params, ModelAndView modelAndView)
			throws Throwable {

		modelAndView.setViewName("Team/Bottom");
		return modelAndView;

	}

	@RequestMapping(value = "/Login") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView Login(HttpSession session, @RequestParam HashMap<String, String> params,
			ModelAndView modelAndView) throws Throwable {

		HashMap<String, String> logo = ITeamService.logoon(params);// 로고 불러오기
		modelAndView.addObject("logo", logo);// 로고 불러오기

		if (session.getAttribute("sMemNo") != null) {// 값이 있다 로그인 상태
			modelAndView.setViewName("redirect:main");

		} else {// 값이 없다 (비로그인)

			modelAndView.setViewName("Team/Login");
		}
		return modelAndView;

	}

	@RequestMapping(value = "/cul_1") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView cul_1(HttpSession session, @RequestParam HashMap<String, String> params,
			ModelAndView modelAndView) throws Throwable {

		HashMap<String, String> logo = ITeamService.logoon(params);// 로고 불러오기
		modelAndView.addObject("logo", logo);// 로고 불러오기

		HashMap<String, String> CulInfo = ITeamService.getCulInfo(params);
		List<HashMap<String, String>> Review = ITeamService.getReview(params);
		List<HashMap<String, String>> Comment = ITeamService.getComment(params);

		session.setAttribute("sCULTCODE", CulInfo.get("CULTCODE"));

		boolean check = true;
		if ((session.getAttribute("historyno1") != null
				&& session.getAttribute("historyno1").toString().equals(String.valueOf(CulInfo.get("CULTCODE"))))
				|| (session.getAttribute("historyno2") != null && session.getAttribute("historyno2").toString()
						.equals(String.valueOf(CulInfo.get("CULTCODE"))))
				|| (session.getAttribute("historyno3") != null && session.getAttribute("historyno3").toString()
						.equals(String.valueOf(CulInfo.get("CULTCODE"))))) {
			check = false;
		}
		if (check) {
			if (session.getAttribute("historyno1") == null) {
				session.setAttribute("historyno1", CulInfo.get("CULTCODE"));

			} else if (session.getAttribute("historyno1") != null && session.getAttribute("historyno2") == null
					&& session.getAttribute("historyno3") == null) {
				session.setAttribute("historyno2", session.getAttribute("historyno1"));
				session.setAttribute("historyno1", CulInfo.get("CULTCODE"));
			} else if (session.getAttribute("historyno2") != null && session.getAttribute("historyno1") != null
					&& session.getAttribute("historyno3") == null) {
				session.setAttribute("historyno3", session.getAttribute("historyno2"));
				session.setAttribute("historyno2", session.getAttribute("historyno1"));
				session.setAttribute("historyno1", CulInfo.get("CULTCODE"));
			} else if (session.getAttribute("historyno2") != null && session.getAttribute("historyno1") != null
					&& session.getAttribute("historyno3") != null) {

				session.setAttribute("historyno4", session.getAttribute("historyno2"));
				session.setAttribute("historyno2", session.getAttribute("historyno1"));
				session.setAttribute("historyno3", session.getAttribute("historyno4"));
				session.setAttribute("historyno1", CulInfo.get("CULTCODE"));
				session.removeAttribute("historyno4");

			}
		}
		boolean check1 = true;
		if ((session.getAttribute("historyimg1") != null
				&& session.getAttribute("historyimg1").toString().equals(String.valueOf(CulInfo.get("MAIN_IMG"))))
				|| (session.getAttribute("historyimg2") != null && session.getAttribute("historyimg2").toString()
						.equals(String.valueOf(CulInfo.get("MAIN_IMG"))))
				|| (session.getAttribute("historyimg3") != null && session.getAttribute("historyimg3").toString()
						.equals(String.valueOf(CulInfo.get("MAIN_IMG"))))) {
			check1 = false;
		}
		if (check1) {
			if (session.getAttribute("historyimg1") == null) {
				session.setAttribute("historyimg1", CulInfo.get("MAIN_IMG"));

			} else if (session.getAttribute("historyimg1") != null && session.getAttribute("historyimg2") == null
					&& session.getAttribute("historyimg3") == null) {
				session.setAttribute("historyimg2", session.getAttribute("historyimg1"));
				session.setAttribute("historyimg1", CulInfo.get("MAIN_IMG"));
			} else if (session.getAttribute("historyimg2") != null && session.getAttribute("historyimg1") != null
					&& session.getAttribute("historyimg3") == null) {
				session.setAttribute("historyimg3", session.getAttribute("historyimg2"));
				session.setAttribute("historyimg2", session.getAttribute("historyimg1"));
				session.setAttribute("historyimg1", CulInfo.get("MAIN_IMG"));
			} else if (session.getAttribute("historyimg2") != null && session.getAttribute("historyimg1") != null
					&& session.getAttribute("historyimg3") != null) {
				session.setAttribute("historyimg4", session.getAttribute("historyimg2"));
				session.setAttribute("historyimg2", session.getAttribute("historyimg1"));
				session.setAttribute("historyimg3", session.getAttribute("historyimg4"));

				session.setAttribute("historyimg1", CulInfo.get("MAIN_IMG"));
				session.removeAttribute("historyimg4");
			}
		}
		boolean check2 = true;
		if ((session.getAttribute("historytitle1") != null
				&& session.getAttribute("historytitle1").toString().equals(String.valueOf(CulInfo.get("TITLE"))))
				|| (session.getAttribute("historytitle2") != null && session.getAttribute("historytitle2").toString()
				.equals(String.valueOf(CulInfo.get("TITLE"))))
				|| (session.getAttribute("historytitle3") != null && session.getAttribute("historytitle3").toString()
				.equals(String.valueOf(CulInfo.get("TITLE"))))) {
			check1 = false;
		}
		if (check1) {
			if (session.getAttribute("historytitle1") == null) {
				session.setAttribute("historytitle1", CulInfo.get("TITLE"));
				
			} else if (session.getAttribute("historytitle1") != null && session.getAttribute("historytitle2") == null
					&& session.getAttribute("historytitle3") == null) {
				session.setAttribute("historytitle2", session.getAttribute("historytitle1"));
				session.setAttribute("historytitle1", CulInfo.get("TITLE"));
			} else if (session.getAttribute("historytitle2") != null && session.getAttribute("historytitle1") != null
					&& session.getAttribute("historytitle3") == null) {
				session.setAttribute("historytitle3", session.getAttribute("historytitle2"));
				session.setAttribute("historytitle2", session.getAttribute("historytitle1"));
				session.setAttribute("historytitle1", CulInfo.get("TITLE"));
				
			} else if (session.getAttribute("historytitle2") != null && session.getAttribute("historytitle1") != null
					&& session.getAttribute("historytitle3") != null) {
				session.setAttribute("historytitle4", session.getAttribute("historytitle2"));
				session.setAttribute("historytitle2", session.getAttribute("historytitle1"));
				session.setAttribute("historytitle3", session.getAttribute("historytitle4"));
				
				session.setAttribute("historytitle1", CulInfo.get("TITLE"));
				session.removeAttribute("historytitle4");
			}
		}
		modelAndView.addObject("Review", Review);
		modelAndView.addObject("Comment", Comment);
		modelAndView.addObject("CulInfo", CulInfo);
		modelAndView.setViewName("Team/cul_1");
		return modelAndView;

	}

	@RequestMapping(value = "/updateComment", method = RequestMethod.POST, produces = "test/json;charset=UTF-8") // 페이징
																													// 아작스
	@ResponseBody
	public String updateComment(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			ITeamService.updateComment(params);
			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);

		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/repotComment", method = RequestMethod.POST, produces = "test/json;charset=UTF-8") // 페이징
																												// 아작스
	@ResponseBody
	public String repotComment(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		System.out.println(params);
		try {
			ITeamService.repotComment(params);
			ITeamService.reportComment(params);
			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}
		return mapper.writeValueAsString(modelMap);

	}

	@RequestMapping(value = "/deleteComment", method = RequestMethod.POST, produces = "test/json;charset=UTF-8") // 페이징
																													// 아작스
	@ResponseBody
	public String deleteComment(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			ITeamService.deleteComment(params);
			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}
		return mapper.writeValueAsString(modelMap);

	}

	@RequestMapping(value = "/changeComment", method = RequestMethod.POST, produces = "test/json;charset=UTF-8") // 페이징
																													// 아작스
	@ResponseBody
	public String changeComment(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			ITeamService.changeComment(params);
			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}
		return mapper.writeValueAsString(modelMap);

	}

	@RequestMapping(value = "/C_Board") // 게시물 목록 페이지
	public ModelAndView board(HttpSession session, @RequestParam HashMap<String, String> params,
			ModelAndView modelAndView) throws Throwable {

		if (params.get("page") == null||params.get("page")=="") {
			params.put("page", "1");
		}

		int cnt = ITeamService.getBoardListCnt(params);

		PagingBean paging = iPagingService.getBPageingBean(Integer.parseInt(params.get("page")), cnt);

		params.put("startCnt", Integer.toString(paging.getStartCount()));
		params.put("endCnt", Integer.toString(paging.getEndCount()));

		List<HashMap<String, String>> list = ITeamService.getlist(params);

		HashMap<String, String> logo = ITeamService.logoon(params);// 로고 불러오기
		modelAndView.addObject("logo", logo);// 로고 불러오기

		modelAndView.addObject("page", params.get("page"));
		modelAndView.addObject("paging", paging);
		modelAndView.addObject("list", list);

		modelAndView.setViewName("Team/C_Board");
		return modelAndView;

	}

	@RequestMapping(value = "/boardWrite") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView boardWrite(@RequestParam HashMap<String, String> params, ModelAndView modelAndView)
			throws Throwable {

		HashMap<String, String> logo = ITeamService.logoon(params);// 로고 불러오기
		modelAndView.addObject("logo", logo);// 로고 불러오기

		modelAndView.setViewName("Team/boardWrite");
		return modelAndView;

	}

	@RequestMapping(value = "/CommuBoard") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView CommuBoard(@RequestParam HashMap<String, String> params, ModelAndView modelAndView)
			throws Throwable {

		HashMap<String, String> logo = ITeamService.logoon(params);// 로고 불러오기
		modelAndView.addObject("logo", logo);// 로고 불러오기
		if(params.get("no1")!=null ||params.get("no1")!="") {
			params.put("no",params.get("no1"));		
		}
		try {
			ITeamService.boardHit(params);

			HashMap<String, String> detail = ITeamService.getBoard(params);

			modelAndView.addObject("detail", detail);

			modelAndView.setViewName("Team/CommuBoard");
		} catch (Exception e) {
			// 비정상적 주소로 진입시 이동
			if (params.get("codename") == "" || params.get("codename") == null) {
				params.put("codename", "0");
			}

			modelAndView.setViewName("Team/community");
		}
		return modelAndView;

	}

	@RequestMapping(value = "/community") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView community(@RequestParam HashMap<String, String> params, ModelAndView modelAndView)
			throws Throwable {
		if (params.get("codename") == "" || params.get("codename") == null) {
			params.put("codename", "0");
		}

		if (params.get("page") == null) {
			params.put("page", "1");
		}

		// 총 데이터 개수
		int cnt = ITeamService.getListCnt(params);

		PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), cnt);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = ITeamService.getListCo(params);

		HashMap<String, String> logo = ITeamService.logoon(params);// 로고 불러오기
		modelAndView.addObject("logo", logo);// 로고 불러오기

		modelAndView.addObject("page", params.get("page"));
		modelAndView.addObject("list", list);
		modelAndView.addObject("pb", pb);

		modelAndView.setViewName("Team/community");

		return modelAndView;
	}

	@RequestMapping(value = "/A_C_List") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView culList(HttpSession session, @RequestParam HashMap<String, String> params,
			ModelAndView modelAndView) throws Throwable {
		if (session.getAttribute("sGrade") != null) {
			modelAndView.setViewName("Team/A_C_List");
		} else {
			HashMap<String, String> logo = ITeamService.logoon(params);// 로고 불러오기
			modelAndView.addObject("logo", logo);// 로고 불러오기

			modelAndView.setViewName("Team/main");
		}
		
		if (params.get("page") == null) {
			params.put("page", "1");
		}

		int cnt = ITeamService.acListCnt(params);

		PagingBean paging = iPagingService.getBPageingBean(Integer.parseInt(params.get("page")), cnt);

		params.put("startCnt", Integer.toString(paging.getStartCount()));
		params.put("endCnt", Integer.toString(paging.getEndCount()));

		List<HashMap<String, String>> list = ITeamService.acgetlist(params);

		modelAndView.addObject("page", params.get("page"));
		modelAndView.addObject("paging", paging);
		modelAndView.addObject("list", list);
		

		return modelAndView;
	}

	@RequestMapping(value = "/deluser") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView deluser(@RequestParam HashMap<String, String> params, ModelAndView modelAndView)
			throws Throwable {

		modelAndView.setViewName("Team/deluser");
		return modelAndView;

	}

	@RequestMapping(value = "/insert") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView insert(@RequestParam HashMap<String, String> params, ModelAndView modelAndView)
			throws Throwable {
		HashMap<String, String> logo = ITeamService.logoon(params);// 로고 불러오기
		modelAndView.addObject("logo", logo);// 로고 불러오기

		modelAndView.setViewName("Team/insert");
		return modelAndView;

	}

	@RequestMapping(value = "/A_MainSet") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView mainSet(HttpSession session, @RequestParam HashMap<String, String> params,
			ModelAndView modelAndView) throws Throwable {
		if (session.getAttribute("sGrade") != null) {
			HashMap<String, String> logo = ITeamService.logoon(params);// 로고 불러오기
			modelAndView.addObject("logo", logo);// 로고 불러오기

			List<HashMap<String, String>> imglist = ITeamService.getimglist(params);
			modelAndView.addObject("imglist", imglist);// 리스트 이미지 불러오기

			modelAndView.setViewName("Team/A_MainSet");
		} else {
			HashMap<String, String> logo = ITeamService.logoon(params);// 로고 불러오기
			modelAndView.addObject("logo", logo);// 로고 불러오기

			modelAndView.setViewName("Team/main");
		}
		return modelAndView;
	}

	@RequestMapping(value = "/map") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView map(@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {

		HashMap<String, String> logo = ITeamService.logoon(params);// 로고 불러오기
		modelAndView.addObject("logo", logo);// 로고 불러오기

		modelAndView.setViewName("Team/map");
		return modelAndView;

	}

	@RequestMapping(value = "/map3") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView map3(@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {

		HashMap<String, String> logo = ITeamService.logoon(params);// 로고 불러오기
		modelAndView.addObject("logo", logo);// 로고 불러오기

		modelAndView.setViewName("Team/map3");
		return modelAndView;

	}

	@RequestMapping(value = "/A_Userlist") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView mlist(HttpSession session, @RequestParam HashMap<String, String> params,
			ModelAndView modelAndView) throws Throwable {
		if (session.getAttribute("sGrade") != null) {
			modelAndView.setViewName("Team/A_Userlist");
		} else {
			HashMap<String, String> logo = ITeamService.logoon(params);// 로고 불러오기
			modelAndView.addObject("logo", logo);// 로고 불러오기

			modelAndView.setViewName("Team/main");
		}
		return modelAndView;
	}

	@RequestMapping(value = "/MyPage") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView MyPage(@RequestParam HashMap<String, String> params, ModelAndView modelAndView)
			throws Throwable {

		modelAndView.setViewName("Team/MyPage");
		return modelAndView;

	}

	@RequestMapping(value = "/MyPageUpdate") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView MyPageUpdate(@RequestParam HashMap<String, String> params, ModelAndView modelAndView)
			throws Throwable {

		modelAndView.setViewName("Team/MyPageUpdate");
		return modelAndView;

	}

	@RequestMapping(value = "/PwUpdate") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView PwUpdate(@RequestParam HashMap<String, String> params, ModelAndView modelAndView)
			throws Throwable {

		modelAndView.setViewName("Team/PwUpdate");
		return modelAndView;

	}

	@RequestMapping(value = "/A_Reort") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView A_Reort(HttpSession session, @RequestParam HashMap<String, String> params,
			ModelAndView modelAndView) throws Throwable {
		
		
		if (session.getAttribute("sGrade") != null) {
			
			modelAndView.setViewName("Team/A_Reort");
			
		} else {
			HashMap<String, String> logo = ITeamService.logoon(params);// 로고 불러오기
			modelAndView.addObject("logo", logo);// 로고 불러오기

			modelAndView.setViewName("Team/main");
		}
		return modelAndView;
	}

	@RequestMapping(value = "/Top") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView Top(@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {

		modelAndView.setViewName("Team/Top");
		return modelAndView;

	}

	@RequestMapping(value = "/Top2") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView Top2(@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {

		modelAndView.setViewName("Team/Top2");
		return modelAndView;

	}

	@RequestMapping(value = "/A_Total") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView total(HttpSession session, @RequestParam HashMap<String, String> params,
			ModelAndView modelAndView) throws Throwable {
		if (session.getAttribute("sGrade") != null) {
			int J_days = ITeamService.getJoin_day();
			int J_weeks = ITeamService.getJoin_week();
			int J_months = ITeamService.getJoin_month();
			modelAndView.addObject("J_days", J_days);
			modelAndView.addObject("J_weeks", J_weeks);
			modelAndView.addObject("J_months", J_months);

			int B_days = ITeamService.getboard_day();
			int B_weeks = ITeamService.getboard_week();
			int B_months = ITeamService.getboard_month();
			modelAndView.addObject("B_days", B_days);
			modelAndView.addObject("B_weeks", B_weeks);
			modelAndView.addObject("B_months", B_months);

			modelAndView.setViewName("Team/A_Total");
		} else {
			HashMap<String, String> logo = ITeamService.logoon(params);// 로고 불러오기
			modelAndView.addObject("logo", logo);// 로고 불러오기

			modelAndView.setViewName("Team/main");
		}
		return modelAndView;

	}

	@RequestMapping(value = "/A_Board") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView userlist(HttpSession session, @RequestParam HashMap<String, String> params,
			ModelAndView modelAndView) throws Throwable {
		if (session.getAttribute("sGrade") != null) {
			modelAndView.setViewName("Team/A_Board");
		} else {
			HashMap<String, String> logo = ITeamService.logoon(params);// 로고 불러오기
			modelAndView.addObject("logo", logo);// 로고 불러오기

			modelAndView.setViewName("Team/main");
		}
		return modelAndView;
	}

	@RequestMapping(value = "/A_Board_search", method = RequestMethod.POST, produces = "test/json;charset=UTF-8")
	@ResponseBody
	public String A_Board_search(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		if (params.get("page") == "" || params.get("page") == null) {
			params.put("page", "1");
		}
		int cnt = ITeamService.A_getListCnt(params);
		PagingBean pb = iPagingService.getAPageingBean(Integer.parseInt(params.get("page")), cnt);

		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = ITeamService.A_getlist(params);

		modelMap.put("page", params.get("page"));
		modelMap.put("list", list);
		modelMap.put("pb", pb);

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/A_Board_list", method = RequestMethod.POST, produces = "test/json;charset=UTF-8")
	@ResponseBody
	public String A_Board_list(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		params.put("no", params.get("bno"));

		HashMap<String, String> detail = ITeamService.getBoard(params);
		List<HashMap<String, String>> retext = ITeamService.Admin_reple(params);

		modelMap.put("retext", retext);
		modelMap.put("detail", detail);

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/listpage", method = RequestMethod.POST, produces = "test/json;charset=UTF-8") // 페이징 아작스
	@ResponseBody
	public String listpage(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = ITeamService.getUserListCnt(params);

		PagingBean paging = iPagingService.getUPageingBean(Integer.parseInt(params.get("page")), cnt);

		params.put("startCnt", Integer.toString(paging.getStartCount()));
		params.put("endCnt", Integer.toString(paging.getEndCount()));

		List<HashMap<String, String>> userlist = ITeamService.getUserList(params);

		modelMap.put("userlist", userlist);
		modelMap.put("paging", paging);

		return mapper.writeValueAsString(modelMap);

	}

	@RequestMapping(value = "/userInfo", method = RequestMethod.POST, produces = "test/json;charset=UTF-8") // 페이징 아작스
	@ResponseBody
	public String userInfo(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		HashMap<String, String> userInfo = ITeamService.getUserInfoList(params);
		HashMap<String, String> userBoard = ITeamService.getUserboard(params);
		HashMap<String, String> userComent = ITeamService.getUserConment(params);
		HashMap<String, String> userReport = ITeamService.getUserReport(params);

		modelMap.put("userInfo", userInfo);
		modelMap.put("userBoard", userBoard);
		modelMap.put("userComent", userComent);
		modelMap.put("userReport", userReport);

		return mapper.writeValueAsString(modelMap);

	}

	@RequestMapping(value = "/idcheck", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json;charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String idcheck(@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {// 에외처리 후 문제처리
			int cnt = ITeamService.idcheck(params);

			if (cnt > 0) {
				modelMap.put("res", CommonProperties.RESULT_ERROR);
			} else {
				ITeamService.Joinmem();
				modelMap.put("res", CommonProperties.RESULT_SUCCESS);
			}
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/pwfind", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String pwfind(@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		System.out.println(params);
		try {// 에외처리 후 문제처리
			String pw = ITeamService.findPw(params);
			modelMap.put("pw", pw);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/idfind", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String idfind(@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {// 에외처리 후 문제처리
			String id = ITeamService.findId(params);
			modelMap.put("id", id);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/insertup", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json;charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String insertup(@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {// 에외처리 후 문제처리
			ITeamService.insertup(params);
			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/loginAjax", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json;charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String loginAjax(HttpSession session, @RequestParam HashMap<String, String> params,
			ModelAndView modelAndView) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		// HttpSession session = request.getSession();

		HashMap<String, String> mem = ITeamService.loginCheck(params);

		boolean res = false;
		if (mem != null && !mem.isEmpty()) {// 조회결과가 있을때
			session.setAttribute("sMemNo", mem.get("NO"));
			session.setAttribute("sNAME", mem.get("NAME"));
			session.setAttribute("sEmail", mem.get("EMAIL"));
			session.setAttribute("sNick", mem.get("NICKNAME"));
			session.setAttribute("sGrade", mem.get("GRADE"));
			// 세션값 가져오기
			res = true;
		}
		ITeamService.Joinmem();
		modelMap.put("res", res);

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/Logout") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView Logout(HttpSession session, ModelAndView modelAndView) throws Throwable {

		session.invalidate();

		modelAndView.setViewName("Team/Logout");

		modelAndView.setViewName("redirect:main");
		return modelAndView;

	}

	@RequestMapping(value = "/findID") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView findID(@RequestParam HashMap<String, String> params,ModelAndView modelAndView) throws Throwable {

		HashMap<String, String> logo = ITeamService.logoon(params);// 로고 불러오기
		modelAndView.addObject("logo", logo);// 로고 불러오기
		
		modelAndView.setViewName("Team/findID");

		return modelAndView;

	}

	@RequestMapping(value = "/mypageim", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json;charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String mypageim(@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {// 에외처리 후 문제처리
			HashMap<String, String> mem = ITeamService.mypageim(params);
			//List<HashMap<String, String>> alllist = ITeamService.allim(params);
			List<HashMap<String, String>> myrp = ITeamService.myreplecheck(params);
			List<HashMap<String, String>> myre = ITeamService.myreviewcheck(params);
			
			modelMap.put("myre", myre);
			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
			modelMap.put("mem", mem);
			modelMap.put("myrp", myrp);
			
			//modelMap.put("alllist", alllist);

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/fileinsert", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String fileinsert(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {// 에외처리 후 문제처리
			ITeamService.fileinsert(params);

			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/pwupdate", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String pwupdate(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {// 에외처리 후 문제처리
			ITeamService.pwupdate(params);

			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/deluserpage", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String deluserpage(

			@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {// 에외처리 후 문제처리
			ITeamService.deluser(params);

			modelMap.put("res", CommonProperties.RESULT_SUCCESS);

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/intoduce", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String intoduce(

			@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {// 에외처리 후 문제처리
			ITeamService.intoduce(params);

			modelMap.put("res", CommonProperties.RESULT_SUCCESS);

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/writeAjax", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String writeAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {// 에외처리 후 문제처리
			ITeamService.writeAjax(params);

			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/insertAjax", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String insertAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {// 에외처리 후 문제처리
			ITeamService.insertAjax(params);

			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/reportAjax", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String reportAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {// 에외처리 후 문제처리
			ITeamService.reportAjax(params);
			ITeamService.reportCount(params);
			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/reple", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String reple(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {// 에외처리 후 문제처리

			List<HashMap<String, String>> retext = ITeamService.reple(params);
			modelMap.put("retext", retext);
			modelMap.put("res", CommonProperties.RESULT_SUCCESS);

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/deleteAjax", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String deleteAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			ITeamService.deleteAjax(params);

			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/un_deleteAjax", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String un_deleteAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			ITeamService.un_deleteAjax(params);

			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}
		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/C_delete", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String C_delete(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			ITeamService.C_delete(params);

			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}

		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "/C_undelete", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String C_undelete(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			ITeamService.C_undelete(params);
			
			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}
		
		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/imgdelajax", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String imgdelajax(@RequestParam HashMap<String, String> params,
			@RequestParam(value = "imgdel") String[] imgdel) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		for(int i=0; i<imgdel.length; i++) {
			
			System.out.println(imgdel[i]);
		}
		System.out.println("확인");
		

		try {// 에외처리 후 문제처리
			for (int i = 0; i < imgdel.length; i++) {
				params.put("no", imgdel[i]);

				ITeamService.imgdelajax(params);
			}

			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/boardUpdate") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView boardUpdate(@RequestParam HashMap<String, String> params, ModelAndView modelAndView)
			throws Throwable {
		
		HashMap<String, String> logo = ITeamService.logoon(params);// 로고 불러오기
		modelAndView.addObject("logo", logo);// 로고 불러오기

		HashMap<String, String> mem = ITeamService.updateAjax(params);

		modelAndView.addObject("mem", mem);

		modelAndView.setViewName("Team/boardUpdate");

		return modelAndView;
	}

	@RequestMapping(value = "/updateAjaxCo", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String updateAjaxCo(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			ITeamService.updateAjaxCo(params);

			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/logoinsert", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String logoinsert(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {// 에외처리 후 문제처리
				// 파일 위치 찾기 후 삭제

			String path = "D:\\MyWork\\workspace\\SampleSpring\\src\\main\\webapp\\resources\\upload\\"
					+ params.get("old");
			System.out.println(path);
			File file = new File(path);
			if (file.exists() == true) {
				file.delete();
			}
			ITeamService.logoinsert(params);

			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/cimgupinsert", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String cimgupinsert(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {// 에외처리 후 문제처리
			ITeamService.cimginsert(params);

			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/History") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView History(HttpSession session, @RequestParam HashMap<String, String> params,
			ModelAndView modelAndView) throws Throwable {

		HashMap<String, String> CulInfo = ITeamService.getCulInfo(params);
		modelAndView.addObject("CulInfo", CulInfo);

		modelAndView.setViewName("Team/History");
		return modelAndView;
	}

	@RequestMapping(value = "/myreviewcheck", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String myreviewcheck(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			List<HashMap<String, String>> myre = ITeamService.myreviewcheck(params);
			modelMap.put("myre", myre);

			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/myreplecheck", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String myreplecheck(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			List<HashMap<String, String>> myrp = ITeamService.myreplecheck(params);
			modelMap.put("myrp", myrp);

			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/apiajax", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String apiajax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String clientId = "As4bo4pRTupE04D88849";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "Uf0I23lErr";// 애플리케이션 클라이언트 시크릿값";

		String txt = "";
		try {

			System.out.println(params.get("text1"));

			String text = URLEncoder.encode("" + params.get("text1") + "", "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text; // json 결과
			// String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text;
			// // xml 결과
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			modelMap.put("response", response);

			txt = response.toString();
			//System.out.println(response.toString());
		} catch (Exception e) {
			System.out.println(e);
		}
		return txt;
	}

	@RequestMapping(value = "/reportComment", method = RequestMethod.POST, produces = "test/json;charset=UTF-8")
	@ResponseBody
	public String reportComment(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		ITeamService.repotComment(params);

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/changeBoardComment", method = RequestMethod.POST, produces = "test/json;charset=UTF-8")
	@ResponseBody
	public String changeBoardComment(HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			ITeamService.changeBoardComment(params);
			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}
		return mapper.writeValueAsString(modelMap);

	}

	@RequestMapping(value = "/WriteReview", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String WriteReview(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {// 에외처리 후 문제처리
			ITeamService.WriteReview(params);

			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}

		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "/activebtnajax", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String activebtnajax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {// 에외처리 후 문제처리
			ITeamService.activebtnajax(params);
			
			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "/unactivebtnajax", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String unactivebtnajax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {// 에외처리 후 문제처리
			ITeamService.unactivebtnajax(params);
			
			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "/Review_Write") // 외부에 접근하는부분은 예외처리가 필수 이다 throws Throwable
	public ModelAndView Review_Write(@RequestParam HashMap<String, String> params, ModelAndView modelAndView)
			throws Throwable {

		HashMap<String, String> logo = ITeamService.logoon(params);// 로고 불러오기
		modelAndView.addObject("logo", logo);// 로고 불러오기

		modelAndView.setViewName("Team/Review_Write");
		return modelAndView;

	}
	@RequestMapping(value = "/userDelet", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String userDelet(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {// 에외처리 후 문제처리
			ITeamService.userDelet(params);
			
			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "/user_unDelet", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String user_unDelet(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {// 에외처리 후 문제처리
			ITeamService.user_unDelet(params);
			
			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "/grade_update", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String grade_update(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {// 에외처리 후 문제처리
			ITeamService.grade_update(params);
			
			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/ReportUserInfo", method = RequestMethod.POST, produces = "test/json;charset=UTF-8")
	@ResponseBody
	public String ReportUserInfo(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		HashMap<String, String> ReportInfo = ITeamService.getReportInfo(params);
		
		modelMap.put("ReportInfo", ReportInfo);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/reportCommentAjax", method = RequestMethod.POST, // 요청되는 메소트 형태를 POST로(전송방식 설정)
			produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String reportCommentAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		System.out.println(params);
		try {// 에외처리 후 문제처리
			ITeamService.reportCommentAjax(params);
			ITeamService.reportCommentCount(params);
			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/ReportUserList", method = RequestMethod.POST, produces = "test/json;charset=UTF-8") // 페이징 아작스
	@ResponseBody
	public String ReportUserList(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		if (params.get("page") == null) {
			params.put("page", "1");
		}

		int cnt = ITeamService.ReportListCnt(params);
		
		PagingBean paging = iPagingService.getBPageingBean(Integer.parseInt(params.get("page")), cnt);
		
		params.put("startCnt", Integer.toString(paging.getStartCount()));
		params.put("endCnt", Integer.toString(paging.getEndCount()));
		
		List<HashMap<String, String>> ReportList = ITeamService.getReportList(params);
		
		modelMap.put("page", params.get("page"));
		modelMap.put("paging", paging);
		modelMap.put("ReportList", ReportList);

		return mapper.writeValueAsString(modelMap);

	}
	
	
	@RequestMapping(value = "/alldeleteAjax", method = RequestMethod.POST,produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String alldeleteAjax(@RequestParam HashMap<String, String> params,
			@RequestParam(value = "alldela") String[] alldela) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		for(int i=0; i<alldela.length; i++) {
			
			System.out.println(alldela[i]);
		}
		System.out.println("확인");
		
		
		try {// 에외처리 후 문제처리
			for (int i = 0; i < alldela.length; i++) {
				params.put("no", alldela[i]);

				ITeamService.alldelajax(params);
			}

			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}

		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "/unalldeleteAjax", method = RequestMethod.POST,produces = "text/json; charset=UTF-8") // 형식 / 형태 지정
	@ResponseBody
	public String unalldeleteAjax(@RequestParam HashMap<String, String> params,
			@RequestParam(value = "alldela") String[] alldela) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		for(int i=0; i<alldela.length; i++) {
			
			System.out.println(alldela[i]);
		}
		System.out.println("확인");
		
		
		try {// 에외처리 후 문제처리
			for (int i = 0; i < alldela.length; i++) {
				params.put("no", alldela[i]);
				
				ITeamService.unalldeleteAjax(params);
			}
			
			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "/Reload_Cult", method = RequestMethod.POST, produces = "test/json;charset=UTF-8")
	@ResponseBody
	public String Reload_Cult() throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			ITeamService.Reload_Cult();
		}catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);		
			}

		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "/SYMPATHYhit", method = RequestMethod.POST, produces = "test/json;charset=UTF-8") // 페이징 아작스
	@ResponseBody
	public String SYMPATHYhit(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = ITeamService.SYMPATHYcheck(params);
		try {
			if(cnt==0) {
				ITeamService.SYMPATHYhitinsert(params);
				ITeamService.SYMPATHYhitupdate(params);
				modelMap.put("res", CommonProperties.RESULT_SUCCESS);
			}
			if(cnt==1){
				modelMap.put("res", CommonProperties.RESULT_SUCCESS2);	
			}
		}catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);	
		}
		
		return mapper.writeValueAsString(modelMap);

	}
}