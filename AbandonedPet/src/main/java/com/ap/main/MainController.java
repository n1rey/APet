package com.ap.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/main")
	public String goMain() {
		return "test";
	}
	
	@GetMapping("/")
	public String Main() {
		return "main";
	}
	
}
