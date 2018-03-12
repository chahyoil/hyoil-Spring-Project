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

import com.tj.health_kitchen2.Service.CurrentProductService;
import com.tj.health_kitchen2.Service.MemberService;
import com.tj.health_kitchen2.Service.Paging;
import com.tj.health_kitchen2.Service.Paging2;
import com.tj.health_kitchen2.Service.ProductService;
import com.tj.health_kitchen2.Service.QnaBoardService;
import com.tj.health_kitchen2.model.CurrentProduct;
import com.tj.health_kitchen2.model.Product;
import com.tj.health_kitchen2.model.QnaBoard;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeControllerL {
	
	@Autowired
	private QnaBoardService qservice;
	
	@Autowired
	private ProductService pservice;
	
	@Autowired
	private CurrentProductService cservice;
	
	@Autowired
	private MemberService mservice;
	
	@RequestMapping(value = "member_QnAList", method = RequestMethod.GET)
	public String member_QnAList(QnaBoard qnaBoard, String pageNum, Model model) {
		Paging2 paging = new Paging2(qservice.total(), pageNum);
		qnaBoard.setStartRow(paging.getStartRow());
		qnaBoard.setEndRow(paging.getEndRow());
		model.addAttribute("qnaBoardList", qservice.member_QnAListService(qnaBoard));
		model.addAttribute("paging", paging);
		
		return "qnaBoard/qna_BoardAllList";
	}
	
	@RequestMapping(value = "member_QnAContent", method = RequestMethod.GET)
	public String member_QnAContent(HttpServletRequest request, int qbno, Model model) {
		qservice.member_QnAContentHitService(qbno);
		HttpSession session = request.getSession();
		String aid = (String)session.getAttribute("aid");
		String mid = (String)session.getAttribute("mid");
		if(mid!=null) {
			model.addAttribute("session", mid);
		}else if(aid!=null) {
			model.addAttribute("session", aid);
		}
		model.addAttribute("qbBoardDetail", qservice.member_QnAContentService(qbno));
		return "qnaBoard/member_QnAContent";
	}
	
	@RequestMapping(value = "member_QnAWriteView", method = RequestMethod.GET)
	public String member_QnAWriteView(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("mid");
		String aid = (String)session.getAttribute("aid");
		
		if(mid!=null) {
			model.addAttribute("writer", mid);
			model.addAttribute("whoIsWriter", "mid");
		}else if(aid!=null) {
			model.addAttribute("writer", aid);
			model.addAttribute("whoIsWriter", "aid");
		}
		
		return "qnaBoard/member_QnAWriteView";
	}
	
	@RequestMapping(value = "member_QnAWrite", method = RequestMethod.POST)
	public String member_QnAWrite(MultipartHttpServletRequest mRequest, QnaBoard qnaBoard, Model model) {
		System.out.println("여기까지오나");
		int result = qservice.member_QnAWriteService(mRequest, qnaBoard, model);
		System.out.println(result);
		if(result>0) {
			model.addAttribute("member_QnAWrite", "글쓰기 성공");
		}else {
			model.addAttribute("member_QnAWrite", "글쓰기 실패");
		}
		
		return "redirect:member_QnAList.do";
	}
	
	@RequestMapping(value = "member_QnAModifyView", method = RequestMethod.GET)
	public String member_QnAModifyView(QnaBoard qnaBoard, Model model) {
		return "qnaBoard/member_QnAModifyView";
	}
	
	@RequestMapping(value = "member_QnAModify", method = RequestMethod.POST)
	public String member_QnAModifyView(MultipartHttpServletRequest mRequest, QnaBoard qnaBoard, Model model) {
		int result = qservice.member_QnAModifyService(mRequest, qnaBoard);
		if(result>0) {
			model.addAttribute("member_QnAModifyView", "글 수정 성공");
		}else {
			model.addAttribute("member_QnAModifyView", "글 수정 실패");
		}
		return "redirect:member_QnAList.do";
	}
	
	
	@RequestMapping(value = "member_QnADelete", method = RequestMethod.GET)
	public String member_QnADelete(int qbno, Model model) {
		int result = qservice.member_QnADeleteService(qbno);
		if(result>0) {
			model.addAttribute("qbBoardDelete", "글 삭제 성공");
			return "redirect:member_QnAList.do?안쓴애=값";
		}else {
			model.addAttribute("qbBoardDelete", "글 삭제 실패"); 
			return "redirect:member_QnAList.do";
		}
	}
	
	
	@RequestMapping(value="member_QnAReplyView", method=RequestMethod.GET)
	public String member_QnAReplyView(String qbno, Model model) {
		
		model.addAttribute("member_QnAReplyView", qservice.member_QnAContentService(Integer.parseInt(qbno)));
		return "qnaBoard/member_QnAReplyView";
	}
	
	@RequestMapping(value="member_QnAReply", method=RequestMethod.GET)
	public String member_QnAReply(HttpServletRequest request, Model model) {
		QnaBoard qnaBoard = new QnaBoard();
		
		qservice.member_QnAReply(request, qnaBoard);
		return "redirect:member_QnAList.do";
	}
	
	@RequestMapping(value = "admin_buyList", method = RequestMethod.GET)
	   public String admin_productList(String pageNum, Model model) {
	      model.addAttribute("admin_buyList", pservice.admin_buyList());
	      return "main/admin_buyList";
	   }	
	
	
	
	@RequestMapping(value = "newProductList", method = RequestMethod.GET)
	public String newProductList(Product product, String pageNum, Model model) {
		Paging2 paging = new Paging2(9, pservice.total(), pageNum);
		product.setStartRow(paging.getStartRow());
		product.setEndRow(paging.getEndRow());
		model.addAttribute("newProductList", pservice.newProductList(product));
		model.addAttribute("paging", paging);
		return "main/newProductList";
	}
	
	
	
	
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String search(String inp_search, String pageNum, Product product, Model model) {
		System.out.println(inp_search);
		Paging paging = new Paging(pservice.total(), pageNum, 9, 10);
		product.setStartRow(paging.getStartRow());
		product.setEndRow(paging.getEndRow());
		product.setPname(inp_search);
		model.addAttribute("search", pservice.searchService(product));
		model.addAttribute("inp_search", inp_search);
		model.addAttribute("paging", paging);
		return "main/searchResult";
	}
	
	
	@RequestMapping(value = "detailSearchView", method = RequestMethod.GET)
	public String detailSearchView(Model model) {
		model.addAttribute("detailSearchView", pservice.detailSearchViewService());
		return "main/detailSearchView";
	}
	
	
	@RequestMapping(value = "detailSearch", method = RequestMethod.GET)
	public String detailSearch(String pcal, String pprice, String pmain, Model model) {
		System.out.println(pcal);
		System.out.println(pprice);
		System.out.println(pmain);
		model.addAttribute("pcal", pcal);
		model.addAttribute("pprice", pprice);
		model.addAttribute("pmain", pmain);
		model.addAttribute("detailSearch", pservice.detailSearchService(pcal, pprice, pmain));
		return "main/searchResult";
	}
	
	@RequestMapping(value = "currentProductInsert", method = RequestMethod.GET)		/*이거 곳곳에 넣쟈*/
	public String currentProductInsert(String pid,String mid, Model model) {
		System.out.println(pid);
		int result = cservice.currentProductInsert(pid,mid);
		System.out.println(result>0 ? "11":"00");
		model.addAttribute("detailSearch", result);
		return "product/ProductContentView";  
	}
	
	@RequestMapping(value = "currentProductList", method = RequestMethod.GET)
	public String currentProductList(HttpServletRequest request, String pageNum, CurrentProduct currentProduct, Model model) {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("mid");
		if(mid==null) {
			mid="duck";
		}
		Paging2 paging = new Paging2(cservice.total(), pageNum);
		currentProduct.setStartRow(paging.getStartRow());
		currentProduct.setEndRow(paging.getEndRow());
		currentProduct.setMid(mid);
		model.addAttribute("currentProductList", cservice.CurrentProductList(currentProduct));
		model.addAttribute("paging", paging);
		return "currentProduct/currentProductList";
		
	}
	
	
	@RequestMapping(value = "test", method = RequestMethod.GET)
	public String test(QnaBoard qnaBoard, String pageNum, Model model) {
		Paging2 paging = new Paging2(qservice.total(), pageNum);
		qnaBoard.setStartRow(paging.getStartRow());
		qnaBoard.setEndRow(paging.getEndRow());
		model.addAttribute("qnaBoardList", qservice.member_QnAListService(qnaBoard));
		model.addAttribute("paging", paging);
		return "main/test";
	}
	
	@RequestMapping(value = "admin_main", method = RequestMethod.GET)
	   public String testmain(String pid, String pageNum, Model model) {
	      return "main/admin_main";
	   }
	   
	   @RequestMapping(value = "admin_OrderList", method = RequestMethod.GET)
	   public String admin_OrderListDetail(String pid, String pageNum, Model model) {
	      model.addAttribute("admin_OrderListDetail", pservice.Admin_OrderListService(pid));
	      return "main/admin_OrderList";
	   }
	   
	   @RequestMapping(value = "admin_UserList", method = RequestMethod.GET)
	   public String admin_getMember(String pageNum, Model model) {
	      model.addAttribute("admin_UserList", mservice.Admin_UserListService());
	      return "main/admin_UserList";
	   }
	   
	   
	   
	   
	   
	   
	   @RequestMapping(value = "admin_full", method = {RequestMethod.GET, RequestMethod.POST})
	   public String home(HttpSession httpSession, HttpServletRequest request, CurrentProduct currentProduct, Product product, String pageNum, Locale locale, Model model) {
	      
	      return "main/admin_full";
	   }
	   
	   @RequestMapping(value = "category_kcal", method = RequestMethod.GET)
	   public String category_kcal(Product product, String pcal, String pageNum, Model model) {
	      
	      int pkcal = Integer.parseInt(pcal);
	      System.out.println(pcal);
	      
	      Paging2 paging = new Paging2(9, pservice.total(pkcal), pageNum);
	      product.setPcal(pkcal);
	      product.setStartRow(paging.getStartRow());
	      product.setEndRow(paging.getEndRow());
	      model.addAttribute("category_kcal", pservice.category_kcal(product));
	      model.addAttribute("paging", paging);
	      return "main/searchResult";
	   }
	   
}
