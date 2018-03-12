package com.tj.health_kitchen2.Service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.health_kitchen2.dao.QnaBoardDao;
import com.tj.health_kitchen2.model.QnaBoard;
@Service
public class QnaBoardServiceImpl implements QnaBoardService{

	@Autowired
	private QnaBoardDao qnaBoardDao;
	
	@Override
	public List<QnaBoard> member_QnAListService(QnaBoard qnaBoard) {
		// TODO Auto-generated method stub
		return qnaBoardDao.getQnaBoardList(qnaBoard);
	}

	@Override
	public int member_QnAContentHitService(int qbno) {
		// TODO Auto-generated method stub
		return qnaBoardDao.member_QnAContentHit(qbno);
	}
	
	@Override
	public QnaBoard member_QnAContentService(int qbno) {
		// TODO Auto-generated method stub
		return qnaBoardDao.getQnaBoardDetail(qbno);
	}

	@Override
	public int member_QnADeleteService(int qbno) {
		// TODO Auto-generated method stub
		return qnaBoardDao.getQnaBoardDelete(qbno);
	}

	@Override
	public int total() {
		// TODO Auto-generated method stub
		return qnaBoardDao.total();
	}
	
	
	@Override
	public int member_QnAWriteService(MultipartHttpServletRequest mRequest, QnaBoard qnaBoard, Model model) {
		// TODO Auto-generated method stub
	      String uploadPath = mRequest.getRealPath("upload/");
	      String savePath="C:/Duck/source/team_project/team_project/src/main/webapp/upload/";
	      Iterator<String> iterator = mRequest.getFileNames();
	      String fileName[] = {"",""};
	      int idx = 0;
	      while(iterator.hasNext()) {
	         String uploadFileName = iterator.next();
	         MultipartFile mFile = mRequest.getFile(uploadFileName);
	         String originalFileName = mFile.getOriginalFilename();
	         fileName[idx] = originalFileName;
	         if(fileName[idx]!=null && !fileName[idx].equals("")) {
	            if(new File(uploadPath+fileName[idx]).exists() || new File(savePath+fileName[idx]).exists()) {
	            	fileName[idx] = System.currentTimeMillis()+"_"+fileName[idx];
	            }
	            try {
	               mFile.transferTo(new File(uploadPath+fileName[idx]));
	               int result = copy(uploadPath+fileName[idx], savePath+fileName[idx]);
	               System.out.println(result==1? fileName[idx]+"프로필 이미지 넣음":fileName[idx]+"프로필 이미지 못 넣음");
	            }catch (IllegalStateException e) {
	               e.printStackTrace();
	            }catch (IOException e) {
	               e.printStackTrace();
	            }
	         }else {
	        	 fileName[idx] = "noImage.png";
	         }
	         idx++;
	      }
	      if(mRequest.getParameter("mid")!=null) {
	    	  qnaBoard.setAid(mRequest.getParameter("mid"));
	      }else if(mRequest.getParameter("aid")==null){
	    	  qnaBoard.setMid(mRequest.getParameter("mid"));
	      }
	      qnaBoard.setQbtitle(mRequest.getParameter("title"));
	      qnaBoard.setQbcontent(mRequest.getParameter("content"));
	      qnaBoard.setQbfile(fileName[0]);
	      System.out.println("작성자:"+qnaBoard.getAid()+"\n제목:"+qnaBoard.getQbtitle()+"\n내용:"+qnaBoard.getQbcontent()+"\n파일명:"+qnaBoard.getQbfile());
	      return qnaBoardDao.QnaBoardWrite(qnaBoard);
	   }
	
	private int copy(String originalFile, String targetFile) {
	      int isCopy = 0;
	      FileInputStream is = null;
	      FileOutputStream os = null;
	      try {
	         is = new FileInputStream(originalFile);
	         os = new FileOutputStream(targetFile);
	         byte[] buff = new byte[1024*1024];
	         int nRead;
	         while((nRead = is.read(buff))!=-1) {
	            os.write(buff, 0, nRead);
	         }
	         isCopy = 1;
	      } catch (IOException e) {
	         e.printStackTrace();
	      } finally {
	         try{
	            if(is!=null) is.close();
	            if(os!=null) os.close();
	         }catch(IOException e){
	            System.out.println(e.getMessage());
	         }
	      }
	      return isCopy;
	   }

	
	
	@Override
	public int member_QnAModifyService(MultipartHttpServletRequest mRequest, QnaBoard qnaBoard) {
		// TODO Auto-generated method stub
		String uploadPath = mRequest.getRealPath("upload/");
	      String savePath="C:/Duck/source/team_project/team_project/src/main/webapp/upload/";
	      Iterator<String> iterator = mRequest.getFileNames();
	      String fileName[] = {"",""};
	      int idx = 0;
	      while(iterator.hasNext()) {
	         String uploadFileName = iterator.next();
	         MultipartFile mFile = mRequest.getFile(uploadFileName);
	         String originalFileName = mFile.getOriginalFilename();
	         fileName[idx] = originalFileName;
	         if(fileName[idx]!=null && !fileName[idx].equals("")) {
	            if(new File(uploadPath+fileName[idx]).exists() || new File(savePath+fileName[idx]).exists()) {
	            	fileName[idx] = System.currentTimeMillis()+"_"+fileName[idx];
	            }
	            try {
	               mFile.transferTo(new File(uploadPath+fileName[idx]));
	               int result = copy(uploadPath+fileName[idx], savePath+fileName[idx]);
	               System.out.println(result==1? fileName[idx]+"프로필 이미지 넣음":fileName[idx]+"프로필 이미지 못 넣음");
	            }catch (IllegalStateException e) {
	               e.printStackTrace();
	            }catch (IOException e) {
	               e.printStackTrace();
	            }
	         }else {
	        	 fileName[idx] = "noImage.png";
	         }
	         idx++;
	      }
	      
	      qnaBoard.setQbno(Integer.parseInt(mRequest.getParameter("qbno")));
	      qnaBoard.setQbtitle(mRequest.getParameter("qbtitle"));
	      qnaBoard.setQbcontent(mRequest.getParameter("qbcontent"));
	      qnaBoard.setQbfile(fileName[0]);
	      System.out.println("\n11제목:"+qnaBoard.getQbtitle()+"\n내용:"+qnaBoard.getQbcontent()+"\n파일명:"+qnaBoard.getQbfile());
	      
	      return qnaBoardDao.QnaBoardUpdate(qnaBoard);
		
	}

	
	// 

	
	@Override
	public int member_QnAReplyView(String qbid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int member_QnAReply(HttpServletRequest request, QnaBoard qnaBoard) {
		// TODO Auto-generated method stub
		/*int qbno = Integer.parseInt(request.getParameter("qbno"));*/
		String aid = request.getParameter("aid");
		String mid = request.getParameter("mid");
		String qbtitle = request.getParameter("title");
		String qbcontent = request.getParameter("content");
		
		int qbref = Integer.parseInt(request.getParameter("qbref"));
		int qbstep = Integer.parseInt(request.getParameter("qbstep"));
		int qblevel = Integer.parseInt(request.getParameter("qblevel")); 
		
		/*System.out.println(qbno);*/
		System.out.println(aid);
		System.out.println(qbtitle);
		System.out.println(qbcontent);
		
		System.out.println(qbref);
		System.out.println(qbstep);
		System.out.println(qblevel);
		
		
		qnaBoard.setQbref(qbref);
		qnaBoard.setQbstep(qbstep);
		qnaBoard.setQblevel(qblevel);
		
		replyAstep(qnaBoard);
		
		
		if(aid!=null) {
			qnaBoard.setAid(aid);
		}else {
			qnaBoard.setMid(mid);
		}
		/*qnaBoard.setQbno(qbno);*/
		qnaBoard.setQbtitle(qbtitle);
		qnaBoard.setQbcontent(qbcontent);
		qnaBoard.setQbstep(qbstep+1);
		qnaBoard.setQblevel(qblevel+1);
		System.out.println("wow"+qnaBoard.getQbstep());
		System.out.println("wow"+qnaBoard.getQblevel());
		return qnaBoardDao.QnaBoardReply(qnaBoard);
	}

	private void replyAstep(QnaBoard qnaBoard) {
		// TODO Auto-generated method stub
		qnaBoardDao.replyAstep(qnaBoard);
	}


}
