package com.laptrinhjavaweb.Controller.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.laptrinhjavaweb.service.UserLoginService;
import com.laptrinhjavaweb.utils.HttpUtils;

@Controller
public class LoginController {
	@Autowired UserLoginService userLoginService;
	
	@RequestMapping(value = {"/login"}, method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest request, HttpServletResponse response) {
		if(request.getParameter("error") != null) {
			model.addAttribute("message", "sorry, try again !!");
		}
		return "/views/login/login";
	}
	
	@RequestMapping(value = {"/login"}, method = RequestMethod.POST)
	public void login(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) throws IOException {
		String username	= String.valueOf(request.getParameter("username"));
		String password = String.valueOf(request.getParameter("password"));
		if(userLoginService.checkUser(username, password))
		{
			HttpUtils.setSessionValue(HttpUtils.USER, userLoginService.getUser(username).get(0), request);
			model.addAttribute("login", "dang nhap thanh cong");
			response.sendRedirect("/home");
		}
		else
		{
			model.addAttribute("fail-login", "Tài khoản hoặc mật khẩu không đúng");
			response.sendRedirect("/login?error=true");
		}
		
	}
}
