package com.tj.health_kitchen2.Service;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.health_kitchen2.model.Rboarder;

public interface RBoarderService {
	public List<Rboarder> member_ReviewList(Rboarder rboarder);

	public int member_ReviewtHit(int rbno);
	
	public Rboarder member_ReviewContentView(int rbno);

	public int member_ReviewDelete(int rbno);
	
	public int member_ReviewWrite(MultipartHttpServletRequest multipartHttpServletRequest, Model model);

	public int member_ReviewModify(MultipartHttpServletRequest multipartHttpServletRequest, Model model);

	public int member_ReviewReply(MultipartHttpServletRequest multipartHttpServletRequest, Model model);

	public int cntRboard();
}
