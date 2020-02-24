package com.laptrinhjavaweb.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AboutController {
	@RequestMapping(value = "/about")
	public String aboutUs() {
		return "/views/web/about";
	}
}
