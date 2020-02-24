package com.laptrinhjavaweb.Controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.RollbackException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.laptrinhjavaweb.entity.Users;
import com.laptrinhjavaweb.service.RegisterService;
import com.laptrinhjavaweb.service.UserService;

@Controller
public class RegisterController {
	@Autowired
	RegisterService registerService;
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registry(Model model) {
		model.addAttribute("users", new Users());

		return "/views/web/register";
	}
	
	@RequestMapping(value = {"/register"}, method = RequestMethod.POST)
	public String saveInfo(@ModelAttribute("users") Users users ,Model model, HttpServletRequest request, HttpServletResponse response) {
		model.addAttribute("count", registerService.countAccount());
		if(userService.isExistUser(users.getUsername())) {
			model.addAttribute("exit", "true");
		}else {
			try {
				
				registerService.saveUser(users);
				model.addAttribute("success", "register success !! welcome");
			} catch (RollbackException e) {
				e.printStackTrace();
				model.addAttribute("fail", "can't register, try again");
			}
		}
		
		return "/views/web/register";
	}
}
