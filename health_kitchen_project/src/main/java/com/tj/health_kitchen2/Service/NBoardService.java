package com.tj.health_kitchen2.Service;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.health_kitchen2.model.NBoard;

public interface NBoardService {
	public List<NBoard> admin_NoticeListSercie(NBoard nBoard);
	public int admin_NoticeContentHitService(int nbno);
	public NBoard admin_NoticeContentService(int nbno);
	public int admin_NoticeDeleteService(int nbno);
	public int admin_NoticeWriteService(MultipartHttpServletRequest nRequest, NBoard nBoard, Model model);
	public int admin_NoticeModifyService(MultipartHttpServletRequest nRequest, NBoard nBoard);
	public int total();
	
}//NBoardService
