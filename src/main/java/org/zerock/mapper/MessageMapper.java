package org.zerock.mapper;

import java.util.List;
import org.zerock.domain.MessageVO;

public interface MessageMapper {
	
    public int mesinsert(MessageVO vo);
    public List<MessageVO> getList();

    
}
