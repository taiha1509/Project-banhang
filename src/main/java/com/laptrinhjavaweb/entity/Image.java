package com.laptrinhjavaweb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Image")
public class Image {
	public Image() {
		
	}

	public Image( String image ) {
		super();
		this.image = image;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ProductImageID")
	private int ProductImageID;
	
	@Column(name="Image", columnDefinition = "TEXT")
	private String image;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="product_ProductId", nullable = false)
	private Product product;
	
	public int getProductImageID() {
		return ProductImageID;
	}

	public void setProductImageID(int productImageID) {
		ProductImageID = productImageID;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
}
