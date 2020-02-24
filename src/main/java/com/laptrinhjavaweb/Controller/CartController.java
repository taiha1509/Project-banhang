package com.laptrinhjavaweb.Controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.laptrinhjavaweb.bindingData.Cart;
import com.laptrinhjavaweb.service.ProductService;
import com.laptrinhjavaweb.utils.HttpUtils;

@Controller
public class CartController {
	@Autowired
	ProductService proService;

	@RequestMapping(value = { "/cart" }, method = { RequestMethod.GET })
	public String cart(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		model.addAttribute("pr1", proService.productDetail1(200));
		model.addAttribute("pr2", proService.productDetail1(203));
		model.addAttribute("pr3", proService.productDetail1(210));
		model.addAttribute("pr4", proService.productDetail1(220));
		model.addAttribute("pr5", proService.productDetail1(215));
		model.addAttribute("pr6", proService.productDetail1(225));
		model.addAttribute("pr7", proService.productDetail1(205));

		model.addAttribute("totalPrice", HttpUtils.getSessionValue(HttpUtils.TOTAL_PRICE, request));
		if (HttpUtils.isSessionExits(HttpUtils.CART_NAME, request)) {
			model.addAttribute("nameCart", HttpUtils.getSessionValue(HttpUtils.CART_NAME, request));
		}
		return "/views/web/cart";
	}

	@RequestMapping(value = { "/cart/{id}" })
	public String removeItem(@PathVariable int id, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) {
		model.addAttribute("pr1", proService.productDetail1(200));
		model.addAttribute("pr2", proService.productDetail1(203));
		model.addAttribute("pr3", proService.productDetail1(210));
		model.addAttribute("pr4", proService.productDetail1(220));
		model.addAttribute("pr5", proService.productDetail1(215));
		model.addAttribute("pr6", proService.productDetail1(225));
		model.addAttribute("pr7", proService.productDetail1(205));
		
		Cart cart = null;
		if (HttpUtils.isSessionExits(HttpUtils.CART_NAME, request)) {
			cart = HttpUtils.getSessionValue(HttpUtils.CART_NAME, request);
		} else {
			cart = new Cart();
		}

		for(int i=0; i<cart.getProduct().size(); i++) {
			if(cart.getProduct().get(i).getId() == id) {
				cart.getProduct().remove(i);
			}
		}
		
		float total = 0;
		for (int i = 0; i < cart.getProduct().size(); i++) {
			total += cart.getProduct().get(i).getPrice()*cart.getProduct().get(i).getNumber();
		}
		int count = 0;
		for (int i = 0; i < cart.getProduct().size(); i++) {
			count += cart.getProduct().get(i).getNumber();
		}
		HttpUtils.setSessionValue("count", count, request);
		HttpUtils.setSessionValue(HttpUtils.TOTAL_PRICE, total, request);
		HttpUtils.setSessionValue(HttpUtils.CART_NAME, cart, request);
		model.addAttribute("nameCart", HttpUtils.getSessionValue(HttpUtils.CART_NAME, request));
		return "/views/web/cart";
	}
}
