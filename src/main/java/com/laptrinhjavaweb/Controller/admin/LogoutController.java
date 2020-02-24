package com.laptrinhjavaweb.Controller.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.laptrinhjavaweb.utils.HttpUtils;

@Controller
public class LogoutController {
	@SuppressWarnings("deprecation")
	@RequestMapping(value = {"/logout"}, method = { RequestMethod.GET })
	public void logout(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) throws IOException
	{
			HttpSession httpSession = request.getSession();
			httpSession.removeAttribute(HttpUtils.USER);
			httpSession.removeAttribute(HttpUtils.CART_NAME);
			httpSession.removeAttribute(HttpUtils.TOTAL_PRICE);
			httpSession.removeAttribute(HttpUtils.SoLuongHang);
			httpSession.removeAttribute("users");
			model.remove("model");
			response.sendRedirect("/home");
	}
		
}
