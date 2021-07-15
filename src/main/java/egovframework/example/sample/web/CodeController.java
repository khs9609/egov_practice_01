package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.CodeVO;

@Controller
public class CodeController {
	
	/* codeService를 사용하기 위해선 어노테이션으로 받아 와야 한다.*/
	@Resource(name="codeService")
	private CodeService codeService;
	
	@RequestMapping(value="codeWrite.do")
	public String codeWrite() {
		
		return "code/codeWrite";
	}
	
	@RequestMapping(value="/codeWriteSave.do")
	public String insertCode(CodeVO vo) throws Exception {
		
		// String result = null; -> 이러면 성공한 거
		// insert의 특징
		String result = codeService.insertCodes(vo);
		if(result == null) {
			System.out.println("저장완료");
		}else{
			System.out.println("else일 확률이 없지만 저장실패");
		}
		return "redirect:codeList.do"; 
		// save는 화면이 없음 // redirect : 저장을하고 이동할 위치 설정
	}
	
	@RequestMapping(value="/codeList.do")
	public String selectcodesList(CodeVO vo, ModelMap model) throws Exception{
		
		int total = codeService.selectCodesCount(vo);
		
		List<?> list = codeService.selectCodesList(vo);
		model.addAttribute("resultTotal", total);
		model.addAttribute("resultList", list); // jsp가 열릴 때 담아서 전송이 되게 해주는
		
		return "code/codeList";
	}
	@RequestMapping(value="/codeDelete.do")
	public String deleteCodes(int code) throws Exception{
		
		int result = codeService.deleteCodes(code);
		
		return "redirect:codeList.do";
	}
	@RequestMapping(value="/codeModifyWrite.do")
	public String selectCodesDetail(int code, ModelMap model) throws Exception{
		
		CodeVO vo = codeService.selectCodesDetail(code);
		model.addAttribute("vo", vo);
				
		return "code/codeModifyWrite";
	}
	
	@RequestMapping(value="/codeModifySave.do")
	public String updateCodes(CodeVO vo) throws Exception{
		
		int result = codeService.updateCodes(vo);
		
		return "redirect:codeList.do";
	}

	
}
