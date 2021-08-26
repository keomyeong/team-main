package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.SProductVO;

public interface SProductMapper {

	// 데이터 추가 
	public int insert(SProductVO svo);
	
	public int insertSelectKey(SProductVO svo); 
	
	// 데이터 조회
	public SProductVO read(long pno);
	
	// 데이터 수정 
	public int update(SProductVO svo);
	
	// 데이터 삭제
	public int delete(long pno);	
	
	// 데이터 리스트
	public List<SProductVO> getList();
		
	// 페이징 : 게시글 총 갯수
	public int getTotalCount(Criteria cri);
	
	// 페이징 리스트
	public List<SProductVO> getListWithPaging(Criteria cri);	
	
	// 카테고리 리스트
	public List<SProductVO> getCateWithPaging(Criteria cri); 
	

}

