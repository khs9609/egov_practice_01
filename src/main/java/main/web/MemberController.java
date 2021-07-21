package main.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import main.service.BoardService;

@Controller
public class MemberController {

	/* 멤버 등록 화면 */
	@RequestMapping("memberWrite.do")
	public String memberWrite() {
		
		return "member/memberWrite";
	}
}
