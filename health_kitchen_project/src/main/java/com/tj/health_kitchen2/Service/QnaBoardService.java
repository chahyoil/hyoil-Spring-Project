package com.tj.health_kitchen2.Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.health_kitchen2.model.QnaBoard;

public interface QnaBoardService {
	public List<QnaBoard> member_QnAListService(QnaBoard qnaBoard);
	public int member_QnAContentHitService(int qbno);
	public QnaBoard member_QnAContentService(int qbno); 
	public int member_QnADeleteService(int qbno);
	public int member_QnAWriteService(MultipartHttpServletRequest mRequest, QnaBoard qnaBoard, Model model);
	public int member_QnAModifyService(MultipartHttpServletRequest mRequest, QnaBoard qnaBoard);
	public int total();
	
	public int member_QnAReplyView(String qbid);
	public int member_QnAReply(HttpServletRequest request, QnaBoard qnaBoard);
}
