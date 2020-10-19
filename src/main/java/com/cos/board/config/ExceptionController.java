package com.cos.board.config;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;

import com.cos.board.config.ex.MyArgsNotFound;

@ControllerAdvice //내 프로젝트 전체를 관리함.
@RestController //데이터를 응답해줌
public class ExceptionController {
	
	@ExceptionHandler(value=Exception.class) //IllegalArgumentException이 터지면 실행
	public String 모든오류(Exception e) {
		return e.getMessage();
	}
}
