package org.zerock.service;

import java.util.List;


import org.zerock.domain.MessageVO;

public interface MessageService {
    public boolean mesinsert(MessageVO vo);
	public List<MessageVO> getList();

}