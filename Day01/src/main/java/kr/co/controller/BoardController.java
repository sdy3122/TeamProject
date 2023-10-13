package kr.co.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mappers.SulMapper;
import kr.co.vo.Criteria;
import kr.co.vo.PagingVo;
import kr.co.vo.SulVo;
import kr.co.vo.UserVo;

@Controller
public class BoardController {
	@Autowired
	private SulMapper sulMapper;
	
	@GetMapping("boardPage")
	public ModelAndView boardPage(Model model, Criteria cri, PagingVo pagingVo) throws Exception {
		ModelAndView mav = new ModelAndView("/boardPage");
		ArrayList<SulVo> alLike = sulMapper.selectUnionAllLikeBtnDesc();
		model.addAttribute("allBoardLike",alLike);
		int total = sulMapper.countSul();
		pagingVo.setCri(cri);
		pagingVo.setTotalCount(total);
		System.out.println("등록된 게시글 수 = " + total);
		
		List<SulVo> list = sulMapper.selectLimit(cri);
		mav.addObject("list", list);
		mav.addObject("pagingVo", pagingVo);
		
		for (int i = 0; i < list.size(); i++) {
			list.get(i).getMenu();
		}
		
		System.out.println(pagingVo.getStartPage());
		System.out.println(pagingVo.getCri().getPerPageNum());
		return mav;
	}
	
	@GetMapping("singleBoardPage")
	public String singleBoardPage(SulVo sulVo, Model model, @RequestParam Long var1, @RequestParam String var2) {
		sulVo = new SulVo();
		sulVo.setBno(var1);
		sulVo.setRegdate(var2);
		sulVo = sulMapper.selectBnoRegdate(sulVo).get(0);
		model.addAttribute("showBoard", sulVo);
		return "singleBoardPage";
	}
	
	@GetMapping("boardLoginPage")
	public String loginPage(Model model) {
		model.addAttribute("checkPath", 990122);
		return "loginPage";
	}
	
	@RequestMapping(value = "/boardLogout")
	public String logoutAfter(HttpSession session, HttpServletRequest req) {
		session = req.getSession(false);
		session.invalidate();
		System.out.println("로그아웃 ㅅㄱ");
		return "redirect:/boardPage";
	}
	
	@GetMapping("myBoardPage")
	public ModelAndView myBoardPage(HttpSession session, UserVo vo, Model model, Criteria cri, PagingVo pagingVo) throws Exception {
		ModelAndView mav = new ModelAndView("/myBoardPage");
		vo = (UserVo) session.getAttribute("sessionVo");
		
		System.out.println("시발");
		System.out.println(vo.getUserName());
		
		ArrayList<SulVo> alLike = sulMapper.selectMyLikeBtnDesc(vo);
		
		System.out.println("시발1");
		
		model.addAttribute("allBoardLike",alLike);
		
		System.out.println("시발2");
		
		int total = sulMapper.countMySul(vo);
		cri.setName(vo.getUserName());
		
		System.err.println("시발3");
		System.out.println(cri.getName());
		
		pagingVo.setCri(cri);
		pagingVo.setTotalCount(total);
		System.out.println("등록된 게시글 수 = " + total);
		
		List<SulVo> list = sulMapper.selectMyLimit(cri);
		mav.addObject("list", list);
		mav.addObject("pagingVo", pagingVo);
		
		for (int i = 0; i < list.size(); i++) {
			list.get(i).getMenu();
		}
		
		System.out.println(pagingVo.getStartPage());
		System.out.println(pagingVo.getCri().getPerPageNum());
		return mav;
	}
}
