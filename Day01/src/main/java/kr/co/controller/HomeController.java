package kr.co.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class HomeController {
	
	@GetMapping(value = "/")
	public String home() {
		return "index";
	}
	
	@PostMapping(value ="/regist")
	public String registAfter() {
		
		return "board";
	}
	
}
