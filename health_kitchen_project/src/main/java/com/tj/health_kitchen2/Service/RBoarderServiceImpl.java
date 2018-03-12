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

import com.tj.health_kitchen2.dao.RBoarderDao;
import com.tj.health_kitchen2.model.Rboarder;

@Service
public class RBoarderServiceImpl implements RBoarderService {
	@Autowired
	private RBoarderDao rBoarderDao;

	@Override
	public List<Rboarder> member_ReviewList(Rboarder rboarder) {
		// TODO Auto-generated method stub

		return rBoarderDao.member_ReviewList(rboarder);
	}

	@Override
	public int member_ReviewtHit(int rbno) {
		// TODO Auto-generated method stub
		return rBoarderDao.member_ReviewtHit(rbno);
	}

	@Override
	public Rboarder member_ReviewContentView(int rbno) {
		// TODO Auto-generated method stub
		return rBoarderDao.member_ReviewContentView(rbno);
	}

	@Override
	public int member_ReviewDelete(int rbno) {
		// TODO Auto-generated method stub
		return rBoarderDao.member_ReviewDelete(rbno);
	}

	@Override
	public int cntRboard() {
		// TODO Auto-generated method stub
		return rBoarderDao.cntRboad();
	}

	@Override
	public int member_ReviewWrite(MultipartHttpServletRequest multipartHttpServletRequest, Model model) {
		String Rboarder_uploadPath = multipartHttpServletRequest.getRealPath("food_pic/");
		String Rboarder_savePath = "C:/Users/user/Desktop/health_kitchen/src/main/webapp/food_pic/";
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		String RboarderImg = "";
		String Rboarder_uploadFileName = iterator.next();
		MultipartFile multipartFile = multipartHttpServletRequest.getFile(Rboarder_uploadFileName);
		String originalFileName = multipartFile.getOriginalFilename();
		RboarderImg = originalFileName;
		if (RboarderImg != null && !RboarderImg.equals("")) {
			if (new File(Rboarder_uploadPath + RboarderImg).exists()
					|| new File(Rboarder_savePath + RboarderImg).exists()) {
				RboarderImg = System.currentTimeMillis() + "_" + RboarderImg;
			}
			try {
				multipartFile.transferTo(new File(Rboarder_uploadPath + RboarderImg));
				int result = copy(Rboarder_uploadPath + RboarderImg, Rboarder_savePath + RboarderImg);
				System.out.println(result > 0 ? "���ϳֱ� ����" : "���ϳֱ� ����");
			} catch (IllegalStateException e) {
				System.out.println(e.getMessage() + "�˺���");
			} catch (IOException e) {
				System.out.println(e.getMessage() + "�˺���");
			}
		} else {
			RboarderImg = "noImg.jpg";
		}
		Rboarder rboarder = new Rboarder();
		rboarder.setMid(multipartHttpServletRequest.getParameter("mid"));
		rboarder.setPid(multipartHttpServletRequest.getParameter("aid"));
		rboarder.setRbtitle(multipartHttpServletRequest.getParameter("rbtitle"));
		rboarder.setRbcontent(multipartHttpServletRequest.getParameter("rbcontent"));
		rboarder.setRbfile(RboarderImg);

		return rBoarderDao.member_ReviewWrite(rboarder);

	}

	@Override
	public int member_ReviewModify(MultipartHttpServletRequest multipartHttpServletRequest, Model model) {
		String uploadPath = multipartHttpServletRequest.getRealPath("food_pic/");
		String savePath = "C:/Users/user/Desktop/health_kitchen/src/main/webapp/food_pic/";
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		String fileName[] = { "", "" };
		int idx = 0;
		while (iterator.hasNext()) {
			String uploadFileName = iterator.next();
			MultipartFile mFile = multipartHttpServletRequest.getFile(uploadFileName);
			String originalFileName = mFile.getOriginalFilename();
			fileName[idx] = originalFileName;
			if (fileName[idx] != null && !fileName[idx].equals("")) {
				if (new File(uploadPath + fileName[idx]).exists() || new File(savePath + fileName[idx]).exists()) {
					fileName[idx] = System.currentTimeMillis() + "_" + fileName[idx];
				}
				try {
					mFile.transferTo(new File(uploadPath + fileName[idx]));
					int result = copy(uploadPath + fileName[idx], savePath + fileName[idx]);
					System.out.println(result == 1 ? fileName[idx] + "������ �̹��� ����" : fileName[idx] + "������ �̹��� �� ����");
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				fileName[idx] = "noImage.png";
			}
			idx++;
		}
		Rboarder rboarder = new Rboarder();
		// rboarder.setRbno(Integer.parseInt(multipartHttpServletRequest.getParameter("rbno")));
		rboarder.setRbtitle(multipartHttpServletRequest.getParameter("rbtitle"));
		rboarder.setRbcontent(multipartHttpServletRequest.getParameter("rbcontent"));
		rboarder.setRbfile(fileName[0]);

		return rBoarderDao.member_ReviewModify(rboarder);

	}

	@Override
	public int member_ReviewReply(MultipartHttpServletRequest multipartHttpServletRequest, Model model) {
		String member_ReviewReply_uploadPath = multipartHttpServletRequest.getRealPath("food_pic/");
		String Rboardermember_ReviewReply_savePath = "C:/Users/user/Desktop/health_kitchen/src/main/webapp/food_pic/";
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		String member_ReviewReplyImg = "";
		String member_ReviewReply_uploadFileName = iterator.next();
		MultipartFile multipartFile = multipartHttpServletRequest.getFile(member_ReviewReply_uploadFileName);
		String originalFileName = multipartFile.getOriginalFilename();
		member_ReviewReplyImg = originalFileName;
		if (member_ReviewReplyImg != null && !member_ReviewReplyImg.equals("")) {
			if (new File(member_ReviewReply_uploadPath + member_ReviewReplyImg).exists()
					|| new File(Rboardermember_ReviewReply_savePath + member_ReviewReplyImg).exists()) {
				member_ReviewReplyImg = System.currentTimeMillis() + "_" + member_ReviewReplyImg;
			}
			try {
				multipartFile.transferTo(new File(member_ReviewReply_uploadPath + member_ReviewReplyImg));
				int result = copy(member_ReviewReply_uploadPath + member_ReviewReplyImg,
						Rboardermember_ReviewReply_savePath + member_ReviewReplyImg);
				System.out.println(result > 0 ? "���ϳֱ� ����" : "���ϳֱ� ����");
			} catch (IllegalStateException e) {
				System.out.println(e.getMessage() + "�˺���");
			} catch (IOException e) {
				System.out.println(e.getMessage() + "�˺���");
			}
		} else {
			member_ReviewReplyImg = "noImg.jpg";
		}
		Rboarder rboarder = new Rboarder();

		rboarder.setRbtitle(multipartHttpServletRequest.getParameter("rbtitle"));
		System.out.println(1 + multipartHttpServletRequest.getParameter("rbtitle"));

		rboarder.setRbcontent(multipartHttpServletRequest.getParameter("rbcontent"));
		System.out.println(2 + multipartHttpServletRequest.getParameter("rbcontent"));

		rboarder.setRbfile(member_ReviewReplyImg);
		System.out.println(member_ReviewReplyImg);

		rboarder.setRbref(Integer.parseInt(multipartHttpServletRequest.getParameter("rbref")));
		System.out.println(5 + Integer.parseInt(multipartHttpServletRequest.getParameter("rbref") + 1));

		rboarder.setRbstep(Integer.parseInt(multipartHttpServletRequest.getParameter("rbstep")+1));
		System.out.println(6 + Integer.parseInt(multipartHttpServletRequest.getParameter("rbstep") + 1));

		rboarder.setRblevel(Integer.parseInt(multipartHttpServletRequest.getParameter("rblevel")+1));
		System.out.println(7 + Integer.parseInt(multipartHttpServletRequest.getParameter("rblevel") + 1));

		System.out.println("���񽺿������� �亯���ư�");
		return rBoarderDao.member_ReviewReply(rboarder);
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

}
