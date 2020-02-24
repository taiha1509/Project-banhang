package com.laptrinhjavaweb.Controller.admin;

import java.io.IOException;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.RollbackException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.laptrinhjavaweb.entity.Category;
import com.laptrinhjavaweb.entity.Image;
import com.laptrinhjavaweb.entity.Product;
import com.laptrinhjavaweb.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	ProductService proService;

	@RequestMapping(value = { "/admin/product" }, method = RequestMethod.GET)
	public String productsList(@RequestParam Map<String, Object> data, final ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		int page = 1;
		int size = proService.SearchProPage(data, page).size();
		model.addAttribute("size", size - 1);
		model.addAttribute("page", page);
		model.addAttribute("product", proService.SearchProPage(data, page));
		model.addAllAttributes(data);
		return "/views/admin/productTable";
	}

	@RequestMapping(value = { "/admin/product" }, method = RequestMethod.POST)
	public String productsListPost(@RequestParam Map<String, Object> data, final ModelMap model,
			HttpServletRequest request, HttpServletResponse response) {
		int page = Integer.parseInt(String.valueOf(data.get("page")));
		int size = proService.SearchProPage(data, page).size();
		model.addAttribute("size", size - 1);
		Long l = new Long(proService.amountPro());
		int n = l.intValue();
		model.addAttribute("product", proService.SearchProPage(data, page));
		model.addAttribute("maxPage", (n + 4) / 5);
		model.addAllAttributes(data);
		return "/views/admin/productTable";
	}

	@RequestMapping(value = "/admin/product/delete/{id}")
	public String deletePro(@PathVariable int id, @RequestParam Map<String, Object> data, final ModelMap model,
			HttpServletRequest request, HttpServletResponse response) {
		proService.deletePro(id);
		int page = 1;
		int size = proService.SearchProPage(data, page).size();
		model.addAttribute("size", size - 1);
		model.addAttribute("page", page);
		model.addAttribute("product", proService.SearchProPage(data, page));
		model.addAllAttributes(data);
		return "/views/admin/productTable";
	}

	@RequestMapping(value = "/admin/product/edit/{id}", method = RequestMethod.POST)
	public String editPro(@PathVariable int id, @RequestParam Map<String, Object> data, final ModelMap model,
			HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String description = String.valueOf(request.getParameter("des"));
		double price = Double.parseDouble(String.valueOf(request.getParameter("price")));
		int amount = Integer.parseInt(String.valueOf(request.getParameter("amount")));
		proService.editPro(id, name, description, price, amount);
		int page = 1;
		int size = proService.SearchProPage(data, page).size();
		model.addAttribute("size", size - 1);
		model.addAttribute("page", page);
		model.addAttribute("product", proService.SearchProPage(data, page));
		model.addAllAttributes(data);
		return "/views/admin/productTable";
	}

	@RequestMapping(value = "/admin/product/add", method = RequestMethod.POST)
	public void addPro(@RequestParam Map<String, Object> data,
			@RequestParam("uploadFile") MultipartFile customerImage, final ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Category category = new Category();
		if (request.getParameter("category").toString().equals("Men")) {
			category.setCategoryId(1001);
			category.setCategoryName("Men");
		} else if (request.getParameter("category").toString().equals("Woman")) {
			category.setCategoryId(1002);
			category.setCategoryName("Woman");
		} else {
			category.setCategoryId(1003);
			category.setCategoryName("Kids");
		}
		Long l = new Long(proService.amountPro());
		int n = 200 + l.intValue();

		Product product = new Product(Integer.parseInt(String.valueOf(request.getParameter("amount"))),
				request.getParameter("proName").toString(),
				Integer.parseInt(String.valueOf(request.getParameter("price"))), "$", 0.01d,
				request.getParameter("description"), 1);
		
		Set<Image> img = new HashSet<Image>();
		Image image = new Image(request.getParameter("category") + "/" + customerImage.getOriginalFilename());
		image.setProduct(product);
		img.add(image);

		product.setImage(img);
		product.setCategory(category);
		
		try {
			proService.addPro(product, customerImage);
			response.sendRedirect("/admin/product");
		} catch (RollbackException e) {
			e.printStackTrace();
		}
	}
}
