package com.laptrinhjavaweb.entity;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Product")
public class Product extends BaseEntity {
	
	
	public Product() {
		super();
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ProductId")
	private Integer ProductId;

	@Column(name = "Amount", nullable = false)
	private int amount;

	@Column(name = "ProductName", length = 45)
	private String productName;

	@Column(name = "Price", nullable = false)
	private double price;

	@Column(name="currency", nullable = false, columnDefinition = "TEXT")
	private String currency;
	
	@Column(name = "Discount")
	private double discount;

	@Column(name = "Description", length = 500)
	private String description;

	@Column(name="status", nullable = false)
	private int status;
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "product", cascade = CascadeType.ALL)
	private Set<Image> image;

	@ManyToOne()
	@JoinColumn(name="category_CategoryId")
	private Category category;

	@ManyToMany(mappedBy = "product")
	private List<Order> order;
	
	@ManyToMany(mappedBy = "product")
	private List<Cart> cart;
	
	

	public Product(int amount, String productName, double price, String currency, double discount, String description,
			int status) {
		super();
		this.amount = amount;
		this.productName = productName;
		this.price = price;
		this.currency = currency;
		this.discount = discount;
		this.description = description;
		this.status = status;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<Order> getOrder() {
		return order;
	}

	public void setOrder(List<Order> order) {
		this.order = order;
	}

	public List<Cart> getCart() {
		return cart;
	}

	public void setCart(List<Cart> cart) {
		this.cart = cart;
	}

	public Integer getProductId() {
		return ProductId;
	}

	public void setProductId(Integer productId) {
		ProductId = productId;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	

	public Set<Image> getImage() {
		return image;
	}

	public void setImage(Set<Image> image) {
		this.image = image;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}


}
