package com.cos.board.controller;

import java.util.List;
import java.util.Optional;
import java.util.function.Supplier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.board.config.ex.MyArgsNotFound;
import com.cos.board.dto.BoardSaveRequestDto;
import com.cos.board.model.Board;
import com.cos.board.repository.BoardRepository;
import com.cos.board.service.BoardService;

@Controller
//@RequestMapping("/board") 하나밖에없어서 리퀘스트맵핑안씀
public class BoardController {

	
	
	//의존성 주입 DI
	@Autowired
	private BoardService boardService; 
	
	//http://localhost:8000/board/saveForm
	@GetMapping("/saveForm")
	public String saveForm() {
		return "saveForm";
	}
	
	@PostMapping("/save")
	@ResponseBody  //데이터 응답으로 바꿔준다.
	public String save(@RequestBody BoardSaveRequestDto dto) {
		boardService.글쓰기(dto);	
		return "ok";
	}
	
	// 스프링에서 컨트롤러의 메서드의 파라메터 부분은 자동 DI가 됨.
	@GetMapping({"","/","/list"}) //아래 페이지에이블 페이징방법
	public String list(Model model,@PageableDefault(size = 5,sort = "id",direction = Direction.DESC) Pageable pageable) {
		
		model.addAttribute("boards",boardService.글목록보기(pageable));
		return "list";
	}
	@GetMapping("/list/test")
	@ResponseBody
	public Page<Board> list(@PageableDefault(size = 5,sort = "id",direction = Direction.DESC) Pageable pageable) {
		return boardService.글목록보기(pageable);
	}
	
	@GetMapping("/board/{id}")
	public String detail(@PathVariable int id,Model model) throws Exception {
		//Board board = boardRepository.findById(id).get(); // 서버터짐(없는 id번호를 넣었을때)
		//Board board = boardRepository.findById(id).orElse(new Board()); // 빈객체를 던져주는것
//		Board board = boardRepository.findById(id).orElseGet(new Supplier<Board>() 
//			@Override
//			public Board get() {
//				System.out.println("못찾으면 어떻게 할지에 대한");
//				return new Board();
//			}
		//Board board = boardRepository.findById(id).orElseGet(()->new Board()); //약식(윗 3번째줄~8번째줄의 주석 처리와 같음)  
//		Board board = boardRepository.findById(id).orElseThrow(new Supplier<Exception>() {
//
//				@Override
//				public Exception get() {
//					return new Exception("뭔가 잘못된 것을 직감했다.");
//				}
//			});
		//Board board = boardRepository.findById(id).orElseThrow(()-> new Exception("뭔가 잘못된 것을 직감했다.")); //약식임
		
		model.addAttribute("board",boardService.글상세보기(id));
		return "detail";
	}
	
	@DeleteMapping("/board/{id}")
	@ResponseBody  //데이터 응답으로 바꿔준다.
	public String delete(@PathVariable int id) {
		boardService.글삭제하기(id);
		return "ok";
	}
	@PutMapping("/board/{id}")
	@ResponseBody  //데이터 응답으로 바꿔준다.
	public String update(@PathVariable int id,@RequestBody BoardSaveRequestDto dto) {
		boardService.글수정하기(id,dto);
		return "ok";
	}
	
	
}
