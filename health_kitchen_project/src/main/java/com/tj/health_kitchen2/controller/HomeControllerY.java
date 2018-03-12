package com.tj.health_kitchen2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.health_kitchen2.Service.MemberService;
import com.tj.health_kitchen2.Service.Paging;
import com.tj.health_kitchen2.Service.Paging2;
import com.tj.health_kitchen2.Service.ProductService;
import com.tj.health_kitchen2.Service.RBoarderService;
import com.tj.health_kitchen2.model.Member;
import com.tj.health_kitchen2.model.Product;
import com.tj.health_kitchen2.model.Rboarder;

@Controller
public class HomeControllerY {
	@Autowired
	private ProductService productService;
	
	@Autowired
	private RBoarderService rBoarderService;
	
	@Autowired
	private MemberService memberService;
	// 회원관리

	// 물품등록(리스트, 등록, 수정, 삭제)


	// Rboader 게시판
	@RequestMapping(value = "member_ReviewList")
	public String member_ReviewList(Rboarder rboarder, String pageNum, Model model) {
	Paging paging = new Paging(rBoarderService.cntRboard(), pageNum);
		rboarder.setStartRow(paging.getStartRow());
		rboarder.setEndRow(paging.getEndRow());
		model.addAttribute("member_ReviewList", rBoarderService.member_ReviewList(rboarder));
		model.addAttribute("paging", paging);
		System.out.println("컨드롤러에서 리스트 돌아감");
		return "Rboarder/member_ReviewList";
	}

	// 상세보기
	@RequestMapping(value = "member_ReviewContentView")
	public String member_ReviewContentView(int rbno, Model model) {
		model.addAttribute("member_ReviewContentView", rBoarderService.member_ReviewContentView(rbno));
		System.out.println("컨드롤러에서 컨텐트뷰 돌아감");
		return "Rboarder/member_ReviewContentView";
	}

	// 글쓰기
	@RequestMapping(value = "member_ReviewWriteView")
	public String member_ReviewWriteView() {
		return "Rboarder/member_ReviewWriteView";

	}

	@RequestMapping(value = "member_ReviewWrite", method = RequestMethod.POST)
	public String member_ReviewWrite(MultipartHttpServletRequest multipartHttpServletRequest, Model model) {
		int result = rBoarderService.member_ReviewWrite(multipartHttpServletRequest, model);
		System.out.println(result);
		if (result > 0) {
			model.addAttribute("member_ReviewWrite", "글작성성공");
		} else {
			model.addAttribute("member_ReviewWrite", "글작성실패");
		}
		System.out.println("컨드롤러에서 글쓰기 돌아감");
		return "redirect:member_ReviewList.do";

	}

	@RequestMapping(value = "member_ReviewModifyView")
	public String member_ReviewModifyView(int rbno, Model model) {
		model.addAttribute("member_ReviewContentView", rBoarderService.member_ReviewContentView(rbno));
		return "Rboarder/member_ReviewModifyView";

	}

	@RequestMapping(value = "member_ReviewModify", method = RequestMethod.POST)
	public String member_ReviewModify(MultipartHttpServletRequest multipartHttpServletRequest, Model model) {
		int result = rBoarderService.member_ReviewModify(multipartHttpServletRequest, model);
		if (result > 0) {
			model.addAttribute("member_ReviewModify", "글수정 성공");
		} else {
			model.addAttribute("member_ReviewModify", "글수정 실패");
		}
		System.out.println("컨드롤러에서 글수정 돌아감");
		return "redirect:member_ReviewList.do";

	}

	@RequestMapping(value = "member_ReviewReplyView")
	public String member_ReviewReplyView(int rbno, Model model) {
		model.addAttribute("member_ReviewContentView", rBoarderService.member_ReviewContentView(rbno));
		return "Rboarder/member_ReviewReplyView";

	}

	@RequestMapping(value = "member_ReviewReply", method = RequestMethod.POST)
	public String member_ReviewReply(MultipartHttpServletRequest multipartHttpServletRequest, Model model) {
		int result = rBoarderService.member_ReviewReply(multipartHttpServletRequest, model);
		if (result > 0) {
			model.addAttribute("member_ReviewReply", "답변글 성공");
		} else {
			model.addAttribute("member_ReviewReply", "답변글 실패");
		}
		System.out.println("컨드롤러에서 답변글 돌아감");
		return "redirect:member_ReviewList.do";

	}

	@RequestMapping(value = "member_ReviewDelete")
	public String member_ReviewDelete(int rbno, Model model) {
		int result = rBoarderService.member_ReviewDelete(rbno);
		if (result > 0) {
			model.addAttribute("member_ReviewDelete", "리뷰삭제");
		} else {
			model.addAttribute("member_ReviewDelete", "리뷰삭제");
		}
		System.out.println("컨트롤러 글삭제 돌아감");
		return "redirect:member_ReviewList.do";

	}
	// 인기상품 리스트
		@RequestMapping(value="hotItemList")
		public String hotItemList(Product product,String pageNum,Model model) {
			Paging2 paging = new Paging2(9, productService.total(), pageNum);
			product.setStartRow(paging.getStartRow());
			product.setEndRow(paging.getEndRow());
			model.addAttribute("hotItemList", productService.hotItemList());
			model.addAttribute("paging", paging);
			return "main/hotItemList";  
		}     

		//이거 고쳤음
	      // 메가할인 리스트
	      @RequestMapping(value = "megaSaleList")
	      public String megaSaleList(Product product,String mid,String pageNum,Model model) {
	         Paging2 paging = new Paging2(9, productService.total(), pageNum);
	         product.setStartRow(paging.getStartRow());
	         product.setEndRow(paging.getEndRow());
	         int pmegapick = 1;
	         product.setPmegapick(pmegapick);
	         Member member = memberService.memberSelectOne(mid);
	         int memberGrade = member.getMlevelno();
	         
	         if(memberGrade>=3) {
	         model.addAttribute("megaSaleList", productService.megaSaleList(pmegapick));
	         model.addAttribute("paging", paging);
	         return "main/megaSaleList";
	         }else if(memberGrade<=2){
	         model.addAttribute("returnFalse","골드회원만 이용 가능");
	         
	         }
	         return "forward:full.do";
	      }

		// md추천 리스트
		@RequestMapping(value="mdList")
		public String mdList(Product product, String pageNum,Model model) {
			Paging2 paging = new Paging2(9, productService.total(), pageNum);
			product.setStartRow(paging.getStartRow());
			product.setEndRow(paging.getEndRow());
			int pmdpick = 1;
			model.addAttribute("mdList", productService.mdList(pmdpick));
			model.addAttribute("paging", paging);
			return "main/mdList";
		}
		//전체물품리스트
		@RequestMapping(value = "productAllList")
		   public String productAllList(String pid, Model model) {
		      model.addAttribute("productAllList", productService.productAllList());
		      return "main/admin_full";

		   }
}
