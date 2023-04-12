package com.ap.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ErrorController {

	@ExceptionHandler(RuntimeException.class)
	private ModelAndView handleErrorCommon(Exception e) {
		ModelAndView modelAndView = new ModelAndView();
		
		return modelAndView;
		
			
	}
	

}
