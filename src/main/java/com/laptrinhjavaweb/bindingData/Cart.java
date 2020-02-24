package com.laptrinhjavaweb.bindingData;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	private String name;
	private List<Product> product = new ArrayList<Product>();

	public Cart() {

	}

	public Cart(String name, List<Product> product) {
		super();
		this.name = name;
		this.product = product;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Product> getProduct() {
		return product;
	}

	public void setProduct(List<Product> product) {
		this.product = product;
	}

}
