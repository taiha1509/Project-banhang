package com.laptrinhjavaweb.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="Cart")
public class Cart {
	
	
	public Cart() {
		super();
	}

	public Cart( String cartName, Double price) {
		super();		
		this.cartName = cartName;
		this.price = price;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="CartID")
	private int CartID;
	
	@Column(name="CartName", length= 45, nullable = false)
	private String cartName;
	
	@Column(name="Price", nullable= false)
	private Double price;
	
	@ManyToMany
	@JoinTable(
		name= "product_has_Cart",
		joinColumns = {@JoinColumn(name="product_ProductID")},
		inverseJoinColumns = {@JoinColumn(name="Cart_CartID")}
			)
	private List<Product> product;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="Users_UserID")
	private Users users;

	public int getCartID() {
		return CartID;
	}

	public void setCartID(int cartID) {
		CartID = cartID;
	}

	public String getCartName() {
		return cartName;
	}

	public void setCartName(String cartName) {
		this.cartName = cartName;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public List<Product> getProduct() {
		return product;
	}

	public void setProduct(List<Product> product) {
		this.product = product;
	}
	
	
	
	
}
