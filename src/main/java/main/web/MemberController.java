package main.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.MemberService;
import main.service.MemberVO;

@Controller
public class MemberController {
	
	@Resource(name="memberService")
	public MemberService memberService;
	
	/* 회원 등록 화면 */
	@RequestMapping("memberWrite.do")
	public String memberWrite() {
		
		return "member/memberWrite";
	}
	
	/* 회원 저장 처리*/
	@RequestMapping("/memberWriteSave.do")
	@ResponseBody
	public String insertMember(MemberVO vo) throws Exception{
		
		String message = "";
		
		String result = memberService.insertMember(vo);
		if(result == null) {
			message = "ok";
		}
		
		return message;
	}
	
	@RequestMapping("/idcheck.do")
	@ResponseBody
	public String selectMemberidcheck(String userid) throws Exception{
		
		String message = "";
		
		int count = memberService.selectMemberIdcheck(userid);
		if(count == 0) {
			message = "ok";
		}
		
		return message;
	}
	@RequestMapping("/post1.do")
	public String post1() {
		return "member/post1";
	}
	@RequestMapping("/post2.do")
	public String post2(String dong, ModelMap model) throws Exception {
		
		List<?> list = memberService.selectPostList(dong);
		model.addAttribute("resultList", list);
		
		return "member/post2";
	}
	@RequestMapping("/loginWrite.do")
	public String loginWrite() {
		return "member/loginWrite";
	}
	
	@RequestMapping("/loginWriteSub.do")
	@ResponseBody
	public String loginProcessing(MemberVO vo,HttpSession session) throws Exception {
		
		String message = "";
		int count = memberService.selectMemberCount(vo);
		if(count == 1) {
			//session 생성
			session.setAttribute("SessionUserId", vo.getUserid());
			
			//message 처리
			message = "ok";
		}
		
		return message;
	}
	@RequestMapping("/logout.do")
	public String logout(HttpSession session){
		
		session.removeAttribute("SessionUserId");
		
		return "member/loginWrite";
	}
	
}



