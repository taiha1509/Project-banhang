package com.laptrinhjavaweb.bindingData;

public class Product {
	private int id;
	private String name;
	private String image;
	private int number;
	private float price;

	public Product() {
	}

	public Product(int id, String name, String image, int number, float price) {
		super();
		this.id = id;
		this.name = name;
		this.image = image;
		this.number = number;
		this.price = price;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

}
