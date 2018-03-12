package com.tj.health_kitchen2.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.health_kitchen2.Service.AdminLogService;
import com.tj.health_kitchen2.Service.NBoardService;
import com.tj.health_kitchen2.Service.Paging;
import com.tj.health_kitchen2.model.NBoard;

@Controller
public class TGController {

	@Autowired
	private NBoardService nservice;
	
	@Autowired
	private AdminLogService adminLogService;
	

	@RequestMapping(value = "admin_LoginView", method = {RequestMethod.GET, RequestMethod.POST})
	public String admin_LoginView(Locale locale, Model model) {
		return "adminLogin/admin_Login";
	}
	
	@RequestMapping(value = "admin_Login", method = {RequestMethod.GET, RequestMethod.POST})
	public String admin_Login(String aid,String apw, Model model, HttpSession httpSession) {
		int result = adminLogService.admin_Login(aid, apw);
		if(result==1) {
			httpSession.setAttribute("aid", aid);
			return "forward:productAllList.do";
		}else {
			httpSession.setAttribute("admin_LoginResult", "아이디나 비밀번호를 확인하세요.");
			return "redirect:admin_LoginView.do";
		}
	}
	
	@RequestMapping(value = "admin_LogOut",method = {RequestMethod.GET, RequestMethod.POST})
	public String admin_LogOut(HttpSession httpSession) {
		httpSession.invalidate();
		return "forward:full.do";
	}
	
	@RequestMapping(value = "admin_NoticeList")
	public String admin_NoticeList(NBoard nBoard, String pageNum, Model model,HttpSession httpSession) {
		Paging paging = new Paging(nservice.total(), pageNum);
		System.out.println(nBoard.getAid()+"이거 있기는 해??"); 
		nBoard.setStartRow(paging.getStartRow());
		nBoard.setEndRow(paging.getEndRow());
		httpSession.setAttribute("aid", nBoard.getAid());
		model.addAttribute("nBoardList", nservice.admin_NoticeListSercie(nBoard));
		model.addAttribute("paging", paging);
		return "NboardView/Notice_BoardAllList";
	}
	
	@RequestMapping(value = "admin_NoticeContent", method = RequestMethod.GET)
	public String admin_NoticeContent(int nbno, Model model) {
		nservice.admin_NoticeContentHitService(nbno);
		model.addAttribute("nBoardDetail", nservice.admin_NoticeContentService(nbno));
		return "NboardView/admin_NoticeContent";
	}
	
	@RequestMapping(value = "admin_NoticeWriteView", method = RequestMethod.GET)
	public String admin_NoticeWriteView(HttpServletRequest request, Model model) {
		/*HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("");*/
		return "NboardView/admin_NoticeWriteView";
	}
	
	@RequestMapping(value = "admin_NoticeWrite", method = RequestMethod.POST)
	public String admin_NoticeWrite(MultipartHttpServletRequest nRequest, NBoard nBoard, Model model) {
		System.out.println("여기까지오나");
		int result = nservice.admin_NoticeWriteService(nRequest, nBoard, model);
		System.out.println(result);
		if(result>0) {
			model.addAttribute("admin_NoticeWrite", "글쓰기 성공");
		}else {
			model.addAttribute("admin_NoticeWrite", "글쓰기 실패");
		}
		
		return "redirect:admin_NoticeList.do";
	}
	
	@RequestMapping(value = "admin_NoticeModifyView", method = RequestMethod.GET)
	public String admin_NoticeModifyView(NBoard nBoard, Model model) {
		return "NboardView/admin_NoticeModifyView";
	}
	
	@RequestMapping(value = "admin_NoticeModify", method = RequestMethod.POST)
	public String admin_NoticeModify(MultipartHttpServletRequest nRequest, NBoard nBoard, Model model) {
		int result = nservice.admin_NoticeModifyService(nRequest, nBoard);
		if(result>0) {
			model.addAttribute("admin_NoticeModify", "글 수정 성공");
		}else {
			model.addAttribute("admin_NoticeModify", "글 수정 실패");
		}
		return "redirect:admin_NoticeList.do";
	}
	
	@RequestMapping(value = "admin_NoticeDelete", method = RequestMethod.GET)
	public String admin_NoticeDelete(int nbno, Model model) {
		int result = nservice.admin_NoticeDeleteService(nbno);
		if(result>0) {
			model.addAttribute("admin_NoticeDelete", "글 삭제 성공");
			return "redirect:admin_NoticeList.do";
		}else {
			model.addAttribute("admin_NoticeDelete", "글 삭제 실패"); 
			return "redirect:admin_NoticeList.do";
		}
	}
}//TGController
