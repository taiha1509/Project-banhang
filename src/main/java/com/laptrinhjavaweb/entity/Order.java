package com.laptrinhjavaweb.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="Orders")
public class Order {
	
	
	public Order() {
		super();
	}

	public Order(String orderName, String date, String adress) {
		super();
		this.orderName = orderName;
		this.orderDate = date;
		this.adress = adress;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="OrderID")
	private int OrderID;
	
	@Column(name="OrderName", length=45)
	private String orderName;
	
	@Column(name="OrderDate", length = 100)
	private String orderDate;
	
	@Column(name="Adress", length =450)
	private String adress;
	
	@ManyToMany()
	@JoinTable(
		name="Orders_has_Product",
		joinColumns = {@JoinColumn(name="Orders_OrderID")},
		inverseJoinColumns = {@JoinColumn(name="Product_ProductID")}
			)
	private List<Product> product;

	public int getOrderID() {
		return OrderID;
	}

	public void setOrderID(int orderID) {
		OrderID = orderID;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}


	public List<Product> getProduct() {
		return product;
	}

	public void setProduct(List<Product> product) {
		this.product = product;
	}
	
	
	
}
