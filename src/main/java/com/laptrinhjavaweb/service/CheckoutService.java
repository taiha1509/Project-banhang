package com.laptrinhjavaweb.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.laptrinhjavaweb.entity.Product;
import com.laptrinhjavaweb.repository.ProductRepository;

@Service
public class CheckoutService extends BaseService {
	@Autowired ProductRepository proRepository;
	
	@Transactional
	public void buyPro(int id, int amount) {
		String sql = "select a from Product a where a.status = 1";
		@SuppressWarnings("unchecked")
		List<Product> product = (List<Product>) executeListQuery(sql, Product.class, Collections.EMPTY_MAP);
		for(int i=0; i< product.size(); i++) {
			if(product.get(i).getProductId() == id) {
				 Product pro = (Product)entityManager.find(Product.class , product.get(i).getProductId());
				 entityManager
				     .createQuery("update Product set amount =:amount where id=:id")
				     .setParameter("amount", product.get(i).getAmount()-amount)
				     .setParameter("id", product.get(i).getProductId())
				     .executeUpdate();
			}
		}
	}
}
