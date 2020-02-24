package com.laptrinhjavaweb.Controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.laptrinhjavaweb.bindingData.Cart;
import com.laptrinhjavaweb.entity.Bill;
import com.laptrinhjavaweb.entity.Users;
import com.laptrinhjavaweb.service.BillService;
import com.laptrinhjavaweb.service.CategoryService;
import com.laptrinhjavaweb.service.CheckoutService;
import com.laptrinhjavaweb.service.ProductService;
import com.laptrinhjavaweb.utils.HttpUtils;

@Controller
public class HomeController {
	@Autowired
	CategoryService categoryService;

	@Autowired
	ProductService proService;
	
	@Autowired 
	BillService billService;
	
	@Autowired
	CheckoutService checkoutService;

	@RequestMapping(value = { "/", "/home", "/product/Men" }, method = { RequestMethod.GET })
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		model.addAttribute("ss", HttpUtils.isSessionExits(HttpUtils.USER, request));
		model.addAttribute("category", categoryService.display());
//		model.addAttribute("product", proService.display());
		model.addAttribute("proMen", proService.getProMen());
		model.addAttribute("sl", proService.amountProMen());
		Users users = null;
		if (HttpUtils.isSessionExits(HttpUtils.USER, request)) {
			users = HttpUtils.getSessionValue(HttpUtils.USER, request);
			HttpSession session = request.getSession();
			session.setAttribute("users", HttpUtils.getSessionValue(HttpUtils.USER, request));
		} else {
			users = new Users();
		}
		return "/views/web/home";
	}

	@RequestMapping(value = { "/error/403" }, method = { RequestMethod.GET })
	public String error(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		System.out.println(request.getContextPath());
		return "/views/error-page/403";
	}

	@RequestMapping(value = { "/checkout" }, method = { RequestMethod.GET })
	public String checkout(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		model.addAttribute("product", proService.display());
		model.addAttribute("bill", new Bill());
		Cart cart = null;
		if (HttpUtils.isSessionExits(HttpUtils.CART_NAME, request)) {
			cart = HttpUtils.getSessionValue(HttpUtils.CART_NAME, request);
		} else {
			cart = new Cart();
		}
		for(int i=0; i<cart.getProduct().size(); i++) {
			checkoutService.buyPro(cart.getProduct().get(i).getId(), cart.getProduct().get(i).getNumber());
		}
		
		model.addAttribute("user", HttpUtils.getSessionValue(HttpUtils.USER, request));
		model.addAttribute("totalPrice", HttpUtils.getSessionValue(HttpUtils.TOTAL_PRICE, request));
		model.addAttribute("cart", cart);
		System.out.println(request.getContextPath());
		return "/views/web/checkout";
	}

	@RequestMapping(value = { "/Woman" }, method = { RequestMethod.GET })
	public String woman(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		model.addAttribute("category", categoryService.display());
		model.addAttribute("proWoman", proService.getProWoman());
		model.addAttribute("sl", proService.amountProWoman());
		return "/views/web/womanProduct";
	}

	@RequestMapping(value = { "/Kid" }, method = { RequestMethod.GET })
	public String kids(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		model.addAttribute("category", categoryService.display());
		model.addAttribute("proKids", proService.getProKids());
		model.addAttribute("sl", proService.amountProKids());
		return "/views/web/kidProduct";
	}

	@RequestMapping(value = { "/Men" }, method = { RequestMethod.GET })
	public String men(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		model.addAttribute("category", categoryService.display());
		model.addAttribute("product", proService.display());
		return "/views/web/menProduct";
	}

	@RequestMapping(value = "/search-product", method = { RequestMethod.POST })
	public String searchProduct(@RequestParam final Map<String, Object> data, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) {
		model.addAllAttributes(data);
		int len = proService.searchProduct(data).size();
		model.addAttribute("len", len);
		int numrow = (int) ((len + 2) / 3);
		model.addAttribute("numrow", numrow);
		model.addAttribute("category", categoryService.display());
		model.addAttribute("proSearch", proService.searchProduct(data));
		return "/views/web/listProduct";
	}

	@RequestMapping(value = { "/single_product/{id}" }, method = { RequestMethod.GET })
	public String detailProduct(@PathVariable int id, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) {
		model.addAttribute("max", proService.productDetail(id));
		model.addAttribute("pr1", proService.productDetail1(200));
		model.addAttribute("pr2", proService.productDetail1(203));
		model.addAttribute("pr3", proService.productDetail1(210));
		model.addAttribute("pr4", proService.productDetail1(220));
		model.addAttribute("pr5", proService.productDetail1(215));
		model.addAttribute("pr6", proService.productDetail1(225));
		model.addAttribute("pr7", proService.productDetail1(205));
		model.addAttribute("product", proService.productDetail(id));
		return "/views/web/single_product";
	}
	
	@RequestMapping(value = "/order", method = { RequestMethod.POST })
	public String order(@ModelAttribute("bill") Bill bill, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) {
		billService.saveBill(bill);
		HttpSession httpSession = request.getSession();
		httpSession.removeAttribute(HttpUtils.SoLuongHang);
		httpSession.removeAttribute(HttpUtils.TOTAL_PRICE);
		httpSession.removeAttribute(HttpUtils.CART_NAME);
		httpSession.removeAttribute("count");
		return "views/web/order";
	}
	
}
