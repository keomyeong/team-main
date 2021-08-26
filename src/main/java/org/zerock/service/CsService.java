package org.zerock.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.NoticeVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.OtoAnswerVO;
import org.zerock.domain.OtoVO;

public interface CsService {
	public List<OtoVO> getotolist(OtoVO ovo);
	public List<NoticeVO> getNoticeList(NoticeVO nvo);
	
	public void otowriting(OtoVO ovo);
	public void otowriting(OtoVO ovo, MultipartFile[] oto_file);
	public OtoVO otoreading(int qono);
	public boolean otodelete(int qono);
	public OtoAnswerVO otoanswer(OtoAnswerVO vo);
	
	public void noticeWriting(NoticeVO nvo);
	public void noticeWriting(NoticeVO nvo, MultipartFile[] notice_file);
	public NoticeVO noticeReading(int nno);
	public boolean noticeModify(NoticeVO nvo);
    public boolean noticeModify(NoticeVO nvo, MultipartFile[] notice_file);
	public boolean noticeDelete(int nno);

}
