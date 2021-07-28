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
	
	/* 게시판 글 작성화면 */
	@RequestMapping("/boardWrite.do")
	public String boardWrite() {

		return "board/boardWrite";
	}
	/* 글 저장처리 */
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
	/* 게시판 목록 */
	@RequestMapping("/boardList.do")
	public String selectNBoardList(BoardVO vo, ModelMap model) throws Exception {
		
		// 보여줄 페이지 수 설정(보여줄 페이지를 수정할 때 변수 값만 변경하면 되도록)
		int unit = 8;
		
		/* Total개수 가져오기 */
		int total = boardService.selectNBoardTotal(vo);
		// 12/10 = ceil(1.2) -> Integer(2.0) -> 2
		int totalPage = (int)Math.ceil((double)total/unit);
		
		int viewPage = vo.getViewPage();
		
		/* 임의로 주소창에 viewPage를 건드렸을 상황을 대비 (1페이지를 출력하도록) */
		if( viewPage > totalPage || viewPage < 1) {
			viewPage = 1;
		}
		
		// startIndex : (1-1)*10 + 1 -> 1
		// startIndex : (2-1)*10 + 1 -> 11
		int startIndex = (viewPage-1) * unit + 1;
		int endIndex = startIndex + (unit-1);
		
		// total = 12 // 1page -> 12번, 2page -> 2번
		// total = 34 // 1page -> 34번~25번, 2page -> 24번~15번 , 3page -> 14~5, 4page -> 4 ~ 1
		
		int startRowno = total - (viewPage-1)*unit;
		
		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);
		
		List<?> list = boardService.selectNBoardList(vo);
		System.out.println("list : " + list); //컨트롤러에서 오류가 난다면 list가 표시되지 않을 것이다.
		
		//페이징 처리를 위한 처리
		model.addAttribute("rowNumber", startRowno);
		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
		
		model.addAttribute("resultList", list);
		
		return "board/boardList";
	}
	/* 게시판 상세보기 화면 */
	@RequestMapping("/boardDetail.do")
	public String selectNBoardDetail(BoardVO vo,ModelMap model) throws Exception{
		
		// 조회수 증가
		boardService.updateNBoardHits(vo.getUnq());
		// 상세보기
		BoardVO boardVO = boardService.selectNBoardDetail(vo.getUnq());
		
		// 게시판 글 내용 줄 바꿈 적용
		String content = boardVO.getContent();
		boardVO.setContent(content.replace("\n", "<br>") );
		
		model.addAttribute("boardVO", boardVO);
		
		return "board/boardDetail";
	}
	@RequestMapping("boardModifyWrite.do")
	public String selectNBoardModifyWrite(BoardVO vo, ModelMap model) throws Exception{
		
		BoardVO boardVO = boardService.selectNBoardDetail(vo.getUnq());
		model.addAttribute("boardVO", boardVO);
		
		return "board/boardModifyWrite";
	}
	
	@RequestMapping("/boardModifySave.do")
	@ResponseBody
	public String updateNBoard(BoardVO vo) throws Exception{
	
		int result = 0;
		
		int count = boardService.selectNBoardPass(vo); // int count = 1 (성공)
		if(count == 1) {
			result =  boardService.updateNBoard(vo); // int result = 1 
		}else {
			result = -1;
		}
		return result+"";
	 }
	@RequestMapping("/passWrite.do")
	public String passWrite(int unq, ModelMap model) {
		
		model.addAttribute("unq", unq);
		return "board/passWrite";
	}
	
	@RequestMapping("/boardDelete.do")
	@ResponseBody
	public String deleteNBoard(BoardVO vo) throws Exception{
		
		int result = 0;
		/* 암호 일치 검사 */
		int count = boardService.selectNBoardPass(vo);
		
		if(count == 1) {
			result =  boardService.deleteNBoard(vo); // int result = 1 
		}else if(count == 0) {
			result = -1;
		} 
		
		return result+"";
	}
	
	

	
	
}
