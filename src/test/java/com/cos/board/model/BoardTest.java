package com.cos.board.model;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.junit.jupiter.api.Test;

public class BoardTest {

	@Test
	public void 롬복_테스트() {
		System.out.println("==================");
		//1. Board 모델
		Board board1= new Board();
		board1.setId(1);
		board1.setTitle("아제목1");
		System.out.println(board1);
		
		
		Board board2= new Board(
				2,
				"제목2",
				"내용2",
				0,
				Timestamp.valueOf(LocalDateTime.now())
				);
		System.out.println(board2);
		//경우 : id는 추가 안하고 싶음.
		//경우 : 순서가 기억이 안남.
		//해결 : 빌더패턴 -일할때 다 빌더패턴씀
		Board board3 = Board.builder().title("제목3").content("내용3").build();
		System.out.println(board3);
		
		System.out.println("==================");
	}

}
