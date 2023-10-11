package kr.co.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.mappers.BeerMapper;
import kr.co.mappers.SojuMapper;
import kr.co.mappers.UserMapper;
import kr.co.mappers.VodkaMapper;
import kr.co.mappers.WhiskeyMapper;
import kr.co.mappers.WineMapper;
import kr.co.service.UserService;
import kr.co.vo.BeerVo;
import kr.co.vo.SojuVo;
import kr.co.vo.UserVo;
import kr.co.vo.VodkaVo;
import kr.co.vo.WhiskeyVo;
import kr.co.vo.WineVo;

@Controller
public class UserController {

	@Autowired
	private UserService service;
	@Autowired
	private SojuMapper sojuMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private BeerMapper beerMapper;
	@Autowired
	private VodkaMapper vodkaMapper;
	@Autowired
	private WhiskeyMapper whiskeyMapper;
	@Autowired
	private WineMapper wineMapper;
	
	@GetMapping(value = { "/", "index" })
	public String home(Model model) {
		return "index";
	}
	
	@GetMapping("indexBoard")
	public String indexBoard() {
		return "indexBoard";
	}
	
	@GetMapping("findIdPage")
	public String findIdPage() {
		return "findIdPage";
	}
	
	@GetMapping("findPwPage")
	public String findPwPage() {
		return "findPwPage";
	}
	
	@GetMapping("loginPage")
	public String loginPage() {
		return "loginPage";
	}
	
	@GetMapping("registPage")
	public String registPage() {
		return "registPage";
	}
	
	@GetMapping("myInfoPage")
	public String myInfoPage() {
		return "myInfoPage";
	}
	
	@GetMapping("myInfoEdit")
	public String myInfoEdit() {
		return "myInfoEdit";
	}
	
	@GetMapping("deleteInfoPage")
	public String deleteInfoPage() {
		return "deleteInfoPage";
	}
	
	@GetMapping("choiceSulPage")
	public String choiceSulPage() {
		return "choiceSulPage";
	}

	@PostMapping("/regist")
	public String registAfter(@RequestParam String userName, @RequestParam String userId, @RequestParam String userPw,
			@RequestParam("rn1") String rnString1, @RequestParam("rn2") String rnString2, HttpServletRequest req) {
		UserVo vo = new UserVo();
		String rnString = rnString1 + rnString2;
		long rnN = Long.parseLong(rnString);

		vo.setUserName(userName);
		vo.setUserId(userId);
		vo.setUserPw(userPw);
		vo.setRegistNumber(rnN);
		service.insertUser(vo);

		return "index";
	}
	
	@ResponseBody
	@PostMapping("/loginCheck")
	public int loginCheck(HttpServletRequest req, @RequestParam String reqId, @RequestParam String reqPw) {
		UserVo vo = new UserVo();
		vo.setUserId(reqId);
		vo.setUserPw(reqPw);
		int passOrNo = userMapper.beforeLogin(vo).size();
		System.out.println(passOrNo);
		return passOrNo;
	}

	@PostMapping("/login")
	public String loginAfter(@RequestParam String userId, @RequestParam String userPw, HttpServletRequest req) {
		UserVo vo = new UserVo();
		vo = service.selectUserById(userId);
		if (vo != null) {
			System.out.println("아이디일치!!!!!!");
			if (vo.getUserPw().equals(userPw)) {
				System.out.println("로그인 성공!!!!!!!");
				HttpSession session = req.getSession(false);
				session.setAttribute("sessionVo", vo);
				session.setAttribute("check", true);
				
				ArrayList<SojuVo> al = sojuMapper.selectByWriter(vo.getUserName());
				List<SojuVo> menuList = sojuMapper.selectDistinctSojuList();
				session.setAttribute("cnt", al.size());
				session.setAttribute("menuList", menuList);
				return "index";
			} else {
				System.out.println("아이디 일치, 비밀번호 틀림 ㅅㄱ");
				return "loginFail";
			}
		} else {
			System.out.println("해당아이디없음 ㅅㄱ");
			return "loginFail";
		}
	}

	@RequestMapping(value = "/logout")
	public String logoutAfter(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		session.invalidate();
		System.out.println("로그아웃 ㅅㄱ");
		return "index";
	}

	@RequestMapping(value = "/deleteInfo")
	public String deleteAfter(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		UserVo vo = (UserVo) session.getAttribute("sessionVo");
		if (service.deleteUser(vo) > 0) {
			System.out.println("회원탈퇴함");
			session.invalidate();
		} else {
			System.out.println("회원탈퇴안됨 ㄷㄷ");
		}
		return "index";
	}

	@ResponseBody
	@PostMapping("/pwCheck")
	public int pwCheck(HttpServletRequest req, @RequestParam String reqPw) {
		HttpSession session = req.getSession(false);
		UserVo vo = (UserVo) session.getAttribute("sessionVo");
		String nowPw = vo.getUserPw();
		if (nowPw.equals(reqPw)) {
			return 0;
		} else {
			return 1;
		}
	}
	
	@PostMapping("/userInfoEdit")
	public String infoEdit(HttpServletRequest req, @RequestParam String userPw) {
		HttpSession session = req.getSession(false);
		UserVo vo = (UserVo) session.getAttribute("sessionVo");
		vo.setUserPw(userPw);
		service.updateUser(vo);
		System.out.println("비밀변호 변경됨..");
		return "index";
	}

	@PostMapping("/findId")
	public String findId(@RequestParam String userName, @RequestParam("rn1") String rnString1,
		@RequestParam("rn2") String rnString2, Model model) {
		UserVo vo = new UserVo();
		String rnString = rnString1 + rnString2;
		long rnN = Long.parseLong(rnString);

		vo.setUserName(userName);
		vo.setRegistNumber(rnN);
		
		String findID = service.findIdByNameRn(vo);
		if (findID != null) {
			System.out.println("해당정보로 나온 아이디있음");
			model.addAttribute("inputName", userName);
			model.addAttribute("inputRn1", rnString1);
			model.addAttribute("findId", findID);
			return "findSuccessId";
		} else {
			System.out.println("그런 계정없음");
			model.addAttribute("inputName", userName);
			model.addAttribute("inputRn1", rnString1);
			return "findFailId";
		}
	}

	@PostMapping("/findPw")
	public String findPw(@RequestParam String userName, @RequestParam String userId, @RequestParam("rn1") String rnString1,
		@RequestParam("rn2") String rnString2, Model model) {
		UserVo vo = new UserVo();
		String rnString = rnString1 + rnString2;
		long rnN = Long.parseLong(rnString);

		vo.setUserId(userId);
		vo.setUserName(userName);
		vo.setRegistNumber(rnN);
		
		String findPW = service.findPwByNameRn(vo);
		if (findPW != null) {
			System.out.println("해당정보로 나온 비밀번호있음");
			model.addAttribute("inputName", userName);
			model.addAttribute("inputRn1", rnString1);
			model.addAttribute("inputId", userId);
			model.addAttribute("findPw", findPW);
			return "findSuccessPw";
		} else {
			System.out.println("그런 계정없음");
			model.addAttribute("inputName", userName);
			model.addAttribute("inputRn1", rnString1);
			model.addAttribute("inputId", userId);
			return "findFailPw";
		}
	}
	
	@ResponseBody
	@PostMapping("/idCheck")
	public int idCheck(HttpServletRequest req) {
		String id = req.getParameter("sdy");
		int countDupId = userMapper.findSameId(id).size();
		return countDupId;
	}

	@ResponseBody
	@PostMapping("/rnCheck")
	public int rnCheck(HttpServletRequest req) {
		String rn = req.getParameter("checkRegistNumber");
		int countDupRn = userMapper.findSameRn(rn).size();
		return countDupRn;
	}
	
	@ResponseBody
	@PostMapping("/sojuFood")
	public List<SojuVo> sojuFood(HttpServletRequest req) {
		System.out.println("소주 안주 찾으러 옴");
		List<SojuVo> menuList = sojuMapper.selectDistinctSojuList();
		for (int i = 0; i < menuList.size(); i++) {
			System.out.println(menuList.get(i));
		}
		return menuList;
	}
	
	@ResponseBody
	@PostMapping("/beerFood")
	public List<BeerVo> beerFood(HttpServletRequest req) {
		System.out.println("맥주 안주 찾으러 옴");
		List<BeerVo> menuList = beerMapper.selectDistinctBeerList();
		for (int i = 0; i < menuList.size(); i++) {
			System.out.println(menuList.get(i));
		}
		return menuList;
	}
	
	@ResponseBody
	@PostMapping("/wineFood")
	public List<WineVo> wineFood(HttpServletRequest req) {
		System.out.println("와인 안주 찾으러 옴");
		List<WineVo> menuList = wineMapper.selectDistinctWineList();
		for (int i = 0; i < menuList.size(); i++) {
			System.out.println(menuList.get(i));
		}
		return menuList;
	}
	
	@ResponseBody
	@PostMapping("/vodkaFood")
	public List<VodkaVo> vodkaFood(HttpServletRequest req) {
		System.out.println("보드카 안주 찾으러 옴");
		List<VodkaVo> menuList = vodkaMapper.selectDistinctVodkaList();
		for (int i = 0; i < menuList.size(); i++) {
			System.out.println(menuList.get(i));
		}
		return menuList;
	}
	
	@ResponseBody
	@PostMapping("/whiskeyFood")
	public List<WhiskeyVo> whiskeyFood(HttpServletRequest req) {
		System.out.println("위스키 안주 찾으러 옴");
		List<WhiskeyVo> menuList = whiskeyMapper.selectDistinctWhiskeyList();
		for (int i = 0; i < menuList.size(); i++) {
			System.out.println(menuList.get(i));
		}
		return menuList;
	}
	
	@GetMapping("/board")
	public String board() {
		
		return "index";
	}
}