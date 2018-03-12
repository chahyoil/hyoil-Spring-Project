package com.tj.health_kitchen2.Service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.health_kitchen2.dao.ProductDao;
import com.tj.health_kitchen2.model.Basket;
import com.tj.health_kitchen2.model.Orders;
import com.tj.health_kitchen2.model.Orders_Detail;
import com.tj.health_kitchen2.model.Product;
import com.tj.health_kitchen2.model.ProductBuyList;
import com.tj.health_kitchen2.model.Reservation;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDao productDao;
	private String savePath = "C:\\TG-IT\\source\\7_spring\\health_kitchen_hyoil\\src\\main\\resources\\META-INF\\sqlmap\\config\\";
	@Override
	   public List<Product> newProductList(Product product) {
	      // TODO Auto-generated method stub
	      return productDao.newProductList(product);
	   }
	   
	   @Override
	   public List<Product> hotItemList() {
	      return productDao.hotItemList();
	   }

	   @Override
	   public int total() {
	      // TODO Auto-generated method stub
	      return productDao.total();
	   }

	   @Override
	   public List<Basket> member_BasketList(String mid) {
	      // TODO Auto-generated method stub
	      return productDao.member_BasketList(mid);
	   }

	   @Override
	   public int member_BasketInsert(Basket basket) {

	      return productDao.member_BasketInsert(basket);
	   }

	   @Override
	   public int member_BasketDelete(ArrayList<Integer> bnos,String mid) {
	      // TODO Auto-generated method stub
	      return productDao.member_BasketDelete(bnos,mid);
	   }

	   @Override
	   public List<Product> admin_ProductCountList() {
	      // TODO Auto-generated method stub
	      return productDao.admin_ProductCountList();
	   }
	   
	   

	   @Override
	   public List<Product> productAllList() {
	      // TODO Auto-generated method stub
	      return productDao.productAllList();
	   }

	   @Override
	   public int admin_ProductInsert(MultipartHttpServletRequest multipartHttpServletRequest) {
	      String product_uploadPath = multipartHttpServletRequest.getRealPath("food_pic/");
	      String product_savePath = savePath;
	      Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	      String productImg;
	      String product_uploadFileName = iterator.next();
	      MultipartFile multipartFile = multipartHttpServletRequest.getFile(product_uploadFileName);
	      String originalFileName = multipartFile.getOriginalFilename();
	      productImg = originalFileName;
	      if (productImg != null && !productImg.equals("")) {
	         if (new File(product_uploadPath + productImg).exists()
	               || new File(product_savePath + productImg).exists()) {
	            productImg = System.currentTimeMillis() + "_" + productImg;
	         }
	         try {
	            multipartFile.transferTo(new File(product_uploadPath + productImg));
	            int result = copy(product_uploadPath + productImg, product_savePath + productImg);
	            System.out.println(result > 0 ? "파일넣기 성공" : "파일넣기 실패");
	         } catch (IllegalStateException e) {
	            System.out.println(e.getMessage() + "물품등록");
	         } catch (IOException e) {
	            System.out.println(e.getMessage() + "물품등록");
	         }
	      } else {
	         productImg = "noImg.jpg";
	      }
	      Product product = new Product();
	      product.setPname(multipartHttpServletRequest.getParameter("pname"));
	      product.setPcal(Integer.parseInt(multipartHttpServletRequest.getParameter("pcal")));
	      
	      if(multipartHttpServletRequest.getParameter("pmdpick")==null) {
	    	  product.setPmdpick(0);  
	      }else {
	    	  product.setPmdpick(Integer.parseInt(multipartHttpServletRequest.getParameter("pmdpick")));  
	      }
	      
	      if(multipartHttpServletRequest.getParameter("pmegapick")==null) {
	    	  product.setPmegapick(0);  
	      }else {
	    	  product.setPmegapick(Integer.parseInt(multipartHttpServletRequest.getParameter("pmegapick")));  
	      }
	      
	      product.setPmain(multipartHttpServletRequest.getParameter("pmain"));
	      product.setPstock(Integer.parseInt(multipartHttpServletRequest.getParameter("pstock")));
	      product.setPprice(Integer.parseInt(multipartHttpServletRequest.getParameter("pprice")));
	      product.setPcontent(multipartHttpServletRequest.getParameter("pcontent"));
	      product.setPimage(productImg);
	      return productDao.admin_ProductInsert(product);
	   }

	   @Override
	   public int admin_ProductDelete(String pid) {
	      // TODO Auto-generated method stub
	      return productDao.admin_ProductDelete(pid);
	   }

	   @Override
	   public int admin_ProductModify(MultipartHttpServletRequest multipartHttpServletRequest) {
	      String modify_uploadPath = multipartHttpServletRequest.getRealPath("food_pic/");
	      System.out.println(1);
	      String modify_savePath = "C:/Users/user/Desktop/health_kitchen/src/main/webapp/food_pic/";
	      System.out.println(2);
	      Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	      String modifyImg;
	      System.out.println(3);
	      String modify_uploadFileName = iterator.next();
	      MultipartFile multipartFile = multipartHttpServletRequest.getFile(modify_uploadFileName);
	      System.out.println(4);
	      String originalFileName = multipartFile.getOriginalFilename();
	      modifyImg = originalFileName;
	      if (modifyImg != null && !modifyImg.equals("")) {
	         if (new File(modify_uploadPath + modifyImg).exists() || new File(modify_savePath + modifyImg).exists()) {
	            modifyImg = System.currentTimeMillis() + "_" + modifyImg;
	         }
	         try {
	            multipartFile.transferTo(new File(modify_uploadPath + modifyImg));
	            int result = copy(modify_uploadPath + modifyImg, modify_savePath + modifyImg);
	            System.out.println(result > 0 ? "파일넣기 성공" : "파일넣기 실패");
	         } catch (IllegalStateException e) {
	            System.out.println(e.getMessage() + "물품등록");
	         } catch (IOException e) {
	            System.out.println(e.getMessage() + "물품등록");
	         }
	      } else {
	         modifyImg = "noImg.jpg";
	      }
	      Product product = new Product();
	      product.setPid(multipartHttpServletRequest.getParameter("pid"));
	      product.setPname(multipartHttpServletRequest.getParameter("pname"));
	      product.setMid(multipartHttpServletRequest.getParameter("mid"));
	      product.setPmain(multipartHttpServletRequest.getParameter("pmain"));
	      product.setPcal(Integer.parseInt(multipartHttpServletRequest.getParameter("pcal")));
	      product.setPmdpick(Integer.parseInt(multipartHttpServletRequest.getParameter("pmdpick")));
	      product.setPmegapick(Integer.parseInt(multipartHttpServletRequest.getParameter("pmegapick")));
	     /* product.setPrate(Integer.parseInt(multipartHttpServletRequest.getParameter("prate")));*/
	      product.setPcontent(multipartHttpServletRequest.getParameter("pcontent"));
	      product.setPimage(modifyImg);
	      return productDao.admin_ProductModify(product);
	   }

	   @Override
	   public Product admin_ProductContentView(String pid) {
	      // TODO Auto-generated method stub
	      return productDao.admin_ProductContentView(pid);
	   }
	   
	   private int copy(String originalFile, String targetFile) {
	      int isCopy = 0;
	      FileInputStream is = null;
	      FileOutputStream os = null;
	      try {
	         is = new FileInputStream(originalFile);
	         os = new FileOutputStream(targetFile);
	         byte[] buff = new byte[1024 * 1024];
	         int nRead;
	         while ((nRead = is.read(buff)) != -1) {
	            os.write(buff, 0, nRead);
	         }
	         isCopy = 1;
	      } catch (IOException e) {
	         System.out.println(e.getMessage());
	      } finally {
	         try {
	            if (is != null)
	               is.close();
	            if (os != null)
	               os.close();
	         } catch (IOException e) {
	            System.out.println(e.getMessage());
	         }
	      }
	      return isCopy;
	   }

	   @Override
	   public int member_BasketPlusMinus(Basket basket) {
	      // TODO Auto-generated method stub
	      return productDao.member_BasketPlusMinus(basket);
	   }

	   @Override
	   public int member_OrderInfoInsert(Orders orders, ArrayList<Orders_Detail> order_details, Reservation reservation) {
	      // TODO Auto-generated method stub
	      return productDao.member_OrderInfoInsert(orders,order_details,reservation);
	   }
	   
	   @Override
	   public List<Orders> member_OrderList(String mid) {
	      // TODO Auto-generated method stub
		   System.out.println(mid);
	      return productDao.member_OrderList(mid);
	   }
	   
	   @Override
	   public List<Orders_Detail> member_OrderListDetail(String ono) {
	      // TODO Auto-generated method stub
	      return productDao.member_OrderListDetail(ono);
	   }
	   
	   @Override
	   public int member_OrderListConfirm(String ono,String pid,Model model) {
	      // TODO Auto-generated method stub
	      return productDao.member_OrderListConfirm(ono,pid,model);
	   }

	   
	   

	
	// 재규
	
	@Override
	public List<Product> searchService(Product product) {
		// TODO Auto-generated method stub
		return productDao.searchService(product);
	}

	@Override
	public List<Product> detailSearchService(String pcal, String pprice, String pmain) {
		// TODO Auto-generated method stub
		Product product = new Product();
		product.setPcal(Integer.parseInt(pcal));
		product.setPprice(Integer.parseInt(pprice));
		product.setPmain(pmain);
		return productDao.detailSearchService(product);
	}

	@Override
	public List<Product> detailSearchViewService() {
		// TODO Auto-generated method stub
		return productDao.detailSearchViewService();
	}

	//지원
	
	@Override
	public List<Product> megaSaleList(int pmegapick) {
		// TODO Auto-generated method stub
		return productDao.megaSaleList(pmegapick);
	}

	@Override
	public List<Product> mdList(int pmdpick) {
		// TODO Auto-generated method stub
		return productDao.mdList(pmdpick);
	}

	//이재규
	@Override
	   public List<Orders_Detail> Admin_OrderListService(String pid) {
	      // TODO Auto-generated method stub
	      return productDao.Admin_OrderListService(pid);
	   }

	 @Override
	   public List<ProductBuyList> admin_buyList() {
	      // TODO Auto-generated method stub
	      return productDao.admin_buyList();
	   }  
	 @Override
	   public List<Product> category_kcal(Product product) {
	      // TODO Auto-generated method stub
	      return productDao.category_kcal(product);
	   }
	 @Override
	   public int total(int pcal) {
	      // TODO Auto-generated method stub
	      return productDao.total(pcal);
	   }

	
	
}
