package com.laptrinhjavaweb.Controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.laptrinhjavaweb.entity.Admin;
import com.laptrinhjavaweb.repository.ProductRepository;
import com.laptrinhjavaweb.service.BillService;
import com.laptrinhjavaweb.service.ProductService;
import com.laptrinhjavaweb.service.UserService;
import com.laptrinhjavaweb.utils.HttpUtils;

@Controller
public class AdminHomeController {

	@Autowired
	ProductRepository proRepository;
	@Autowired
	UserService userService;
	@Autowired
	BillService billService;

	@RequestMapping(value = { "/admin", "admin/home" }, method = RequestMethod.GET)
	public String index(final ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		return "/views/admin/admin";
	}
	
	@RequestMapping(value = { "/admin/bills" }, method = RequestMethod.GET)
	public String bills(@RequestParam Map<String, Object> data, final ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		int page = 1;
		int size = billService.listBills(page).size();
		model.addAttribute("size", size - 1);
		model.addAttribute("page", page);
		model.addAttribute("bills", billService.listBills(page));
		model.addAllAttributes(data);
		return "/views/admin/billTable";
	}
	
	@RequestMapping(value = { "/admin/bills" }, method = RequestMethod.POST)
	public String billsPost(@RequestParam Map<String, Object> data, final ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		int page = Integer.parseInt(String.valueOf(data.get("page")));
		int size = billService.listBills(page).size();
		Long l = new Long(billService.amountBill());
		int n = l.intValue();
		model.addAttribute("maxPage", (n + 4) / 5);
		model.addAttribute("size", size - 1);
		model.addAttribute("page", page);
		model.addAttribute("bills", billService.listBills(page));
		model.addAllAttributes(data);
		return "/views/admin/billTable";
	}

	@RequestMapping(value = { "/admin/customers" }, method = RequestMethod.GET)
	public String customer(@RequestParam Map<String, Object> data, final ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		int page = 1;
		int size = userService.listUser(page).size();
		model.addAttribute("size", size - 1);
		model.addAttribute("page", page);
		model.addAttribute("users", userService.listUser(page));
		model.addAllAttributes(data);
		return "/views/admin/customTable";
	}
	
	@RequestMapping(value = { "/admin/customers" }, method = RequestMethod.POST)
	public String customerPost(@RequestParam Map<String, Object> data, final ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		int page = Integer.parseInt(String.valueOf(data.get("page")));
		int size = userService.listUser(page).size();
		model.addAttribute("size", size - 1);
		Long l = new Long(userService.amountUser());
		int n = l.intValue();
		model.addAttribute("maxPage", (n + 4) / 5);
		model.addAttribute("page", page);
		model.addAttribute("users", userService.listUser(page));
		model.addAllAttributes(data);
		return "/views/admin/customTable";
	}

	

}
