package com.tj.health_kitchen2.Service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.health_kitchen2.dao.NBoardDao;
import com.tj.health_kitchen2.model.NBoard;

@Service
public class NBoardServiceImpl implements NBoardService{
	
	@Autowired
	private NBoardDao nBoardDao;
	
	@Override
	public List<NBoard> admin_NoticeListSercie(NBoard nBoard) {
		// TODO Auto-generated method stub
		return nBoardDao.getNBoardList(nBoard);
	}
	
	@Override
	public int admin_NoticeContentHitService(int nbno) {
		// TODO Auto-generated method stub
		return nBoardDao.admin_NoticeContentHit(nbno);
	}
	
	@Override
	public NBoard admin_NoticeContentService(int nbno) {
		// TODO Auto-generated method stub
		return nBoardDao.getNBoardDetail(nbno);
	}
	
	@Override
	public int admin_NoticeDeleteService(int nbno) {
		// TODO Auto-generated method stub
		return nBoardDao.getNBoardDelete(nbno);
	}

	@Override
	public int total() {
		// TODO Auto-generated method stub
		return nBoardDao.total();
	}

	@Override
	public int admin_NoticeWriteService(MultipartHttpServletRequest nRequest, NBoard nBoard, Model model) {
		// TODO Auto-generated method stub
	      String uploadPath = nRequest.getRealPath("upload/");
	      String savePath="C:/TG-IT/source/7_spring/tg-Nboard/src/main/webapp/upload/";
	      Iterator<String> iterator = nRequest.getFileNames();
	      String fileName[] = {"",""};
	      int idx = 0;
	      while(iterator.hasNext()) {
	         String uploadFileName = iterator.next();
	         MultipartFile mFile = nRequest.getFile(uploadFileName);
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
	      if(nRequest.getParameter("aid")!=null) {
	    	  nBoard.setAid(nRequest.getParameter("aid"));
	      }
	      nBoard.setNbtitle(nRequest.getParameter("title"));
	      nBoard.setNbcontent(nRequest.getParameter("content"));
	      nBoard.setNbfile(fileName[0]);
	      System.out.println("작성자:"+nBoard.getAid()+"\n제목:"+nBoard.getNbtitle()+"\n내용:"+nBoard.getNbcontent()+"\n파일명:"+nBoard.getNbfile());
	      return nBoardDao.NBoardWrite(nBoard);
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
	public int admin_NoticeModifyService(MultipartHttpServletRequest nRequest, NBoard nBoard) {
		// TODO Auto-generated method stub
		String uploadPath = nRequest.getRealPath("upload/");
	      String savePath="C:/TG-IT/source/7_spring/tg-Nboard/src/main/webapp/upload/";
	      Iterator<String> iterator = nRequest.getFileNames();
	      String fileName[] = {"",""};
	      int idx = 0;
	      while(iterator.hasNext()) {
	         String uploadFileName = iterator.next();
	         MultipartFile mFile = nRequest.getFile(uploadFileName);
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
	      
	      nBoard.setNbno(Integer.parseInt(nRequest.getParameter("nbno")));
	      nBoard.setNbtitle(nRequest.getParameter("nbtitle"));
	      nBoard.setNbcontent(nRequest.getParameter("nbcontent"));
	      nBoard.setNbfile(fileName[0]);
	      System.out.println("\n11제목:"+nBoard.getNbtitle()+"\n내용:"+nBoard.getNbcontent()+"\n파일명:"+nBoard.getNbfile());
	      
	      return nBoardDao.NBoardUpdate(nBoard);
	}

}//NBoardServiceImpl
