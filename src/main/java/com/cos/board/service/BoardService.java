package com.cos.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.board.dto.BoardSaveRequestDto;
import com.cos.board.model.Board;
import com.cos.board.repository.BoardRepository;

import net.bytebuddy.dynamic.loading.ClassReloadingStrategy.Strategy;

@Service
public class BoardService {

	@Autowired
	private BoardRepository boardRepository;

	@Transactional
	public void 글쓰기(BoardSaveRequestDto dto) {
		Board boardEntity = BoardSaveRequestDto.toEntity(dto);	 
		System.out.println(dto);
		boardRepository.save(boardEntity);	
	}
	
	@Transactional(readOnly = true) //Transactional걸린것에 대한 의문을 가질 것 insert delete update 데이터베이스 변경이 일어나는함수
	public Page<Board> 글목록보기(Pageable pageable) {
		return boardRepository.findAll(pageable);
	}
	
	@Transactional
	public Board 글상세보기(int id) throws Exception {
		Board board = boardRepository.findById(id).orElseThrow(()-> new RuntimeException("뭔가 잘못된 것을 직감했다.")); //약식임
		board.setReadCount(board.getReadCount()+1);
		return board;
	}
	@Transactional
	public void 글삭제하기(int id) {
		boardRepository.mDeleteById(id);
	}
	@Transactional
	public void 글수정하기(int id,BoardSaveRequestDto dto) {
		//더티 체킹
		Board boardEntity = boardRepository.mFindById(id);
		boardEntity.setTitle(dto.getTitle());
		boardEntity.setContent(dto.getContent());
	}
}
