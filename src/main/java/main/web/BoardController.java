package main.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.BoardService;
import main.service.BoardVO;

@Controller
public class BoardController {
	
	@Resource(name="boardService") //컨트롤러와 동일해야 한다.
	private BoardService boardService;
	
	@RequestMapping("/boardWrite.do")
	public String boardWrite() {

		return "board/boardWrite";
	}
	@RequestMapping("/boardWriteSave.do")
	@ResponseBody
	public String insertNBoard(BoardVO vo) throws Exception {
		// 정상저장이 됬으면 result = null;
		String result =  boardService.insertNBoard(vo);
		String msg = "";
		if(result == null) msg = "ok";
		else msg = "fail";
		
		return msg;
	}
	@RequestMapping("/boardList.do")
	public String selectNBoardList(BoardVO vo, ModelMap model) throws Exception {
		
		//Total개수 가져오기
		int total = boardService.selectNBoardTotal(vo);
		// 12/10 = ceil(1.2) -> Integer(2.0) -> 2
		int totalPage = (int)Math.ceil((double)total/10);
		
		int viewPage = vo.getViewPage();
		// startIndex : (1-1)*10 + 1 -> 1
		// startIndex : (2-1)*10 + 1 -> 11
		int startIndex = (viewPage-1) * 10 + 1;
		int endIndex = startIndex + (10-1);
		
		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);
		
		List<?> list = boardService.selectNBoardList(vo);
		System.out.println("list : " + list); //컨트롤러에서 오류가 난다면 list가 표시되지 않을 것이다.
		
		//페이징 처리를 위한 처리
		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
		
		model.addAttribute("resultList", list);
		
		return "board/boardList";
	}
}
