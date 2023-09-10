package com.itbank.libook;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value= {"/", "index.do"})
	public String home() {
		return "libookMain";
	}
	/*
	 * @RequestMapping(value="main.do") public String goMain() { return
	 * "libookMain"; }
	 */
	@RequestMapping(value="goCompany.do")
	public String goCompany() {
		return "showCompany";
	}

}
