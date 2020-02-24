package com.laptrinhjavaweb.Controller.ajax;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.bindingData.AddDataResponse;
import com.laptrinhjavaweb.bindingData.Cart;
import com.laptrinhjavaweb.bindingData.Product;
import com.laptrinhjavaweb.utils.HttpUtils;

@RestController
@RequestMapping("/api")
public class AddProduct {

	public int check(int id, Cart cart) {
		for (int i = 0; i < cart.getProduct().size(); i++) {
			if (cart.getProduct().get(i).getId() == id) {
				return i;
			}
		}
		return -1;
	}

	@PostMapping(value = "/add")
	public ResponseEntity<AddDataResponse> add(@RequestBody final Map<String, Object> data, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) {
		int count = 0;
		Cart cart = null;
		if (HttpUtils.isSessionExits(HttpUtils.CART_NAME, request)) {
			cart = HttpUtils.getSessionValue(HttpUtils.CART_NAME, request);
		} else {
			cart = new Cart();
		}

		for (int i = 0; i < cart.getProduct().size(); i++) {
			count += cart.getProduct().get(i).getNumber();
		}
		count += Integer.parseInt(String.valueOf(data.get("number")));
		HttpUtils.setSessionValue("count", count, request);

		int check = check(Integer.parseInt(String.valueOf(data.get("id"))), cart);

		if (check == -1) {
			cart.getProduct()
					.add(new Product(Integer.parseInt(String.valueOf(data.get("id"))), String.valueOf(data.get("name")),
							String.valueOf(data.get("image")), Integer.parseInt(String.valueOf(data.get("number"))),
							Float.parseFloat(String.valueOf(data.get("price")))));

		} else {
			int sl = cart.getProduct().get(check).getNumber();
			sl += Integer.parseInt(String.valueOf(data.get("number")));
			cart.getProduct().get(check).setNumber(sl);
		}
		// đặt lại vào giỏ hàng.
		HttpUtils.setSessionValue(HttpUtils.CART_NAME, cart, request);
		float total = 0;
		for (int i = 0; i < cart.getProduct().size(); i++) {
			total += cart.getProduct().get(i).getPrice()*cart.getProduct().get(i).getNumber();
		}
		HttpUtils.setSessionValue(HttpUtils.TOTAL_PRICE, total, request);
		return ResponseEntity.ok(new AddDataResponse(200, "Bạn đã thêm thành công sản phẩm vào giỏ hàng"));
	}
}
