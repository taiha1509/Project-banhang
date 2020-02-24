package com.laptrinhjavaweb.Controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.laptrinhjavaweb.utils.HttpUtils;

@Controller
public class AdminSercurityController {
	
	@RequestMapping(value = {"/403"})
	public String error(Model model, HttpServletRequest request, HttpServletResponse response) {
		return "/views/error-page/403";
	}
	@RequestMapping(value = {"/admin/login"})
	public String adminLogin(Model model, HttpServletRequest request, HttpServletResponse response) {
		return "/views/admin/loginOfAdmin";
	}
	
	
	@RequestMapping(value = {"/perform_logout"})
	public String adminLogout(Model model, HttpServletRequest request, HttpServletResponse response) {
		return "/views/web/home";
	}
}
