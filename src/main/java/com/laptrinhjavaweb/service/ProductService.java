package com.laptrinhjavaweb.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Tuple;
import javax.transaction.RollbackException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.laptrinhjavaweb.entity.Image;
import com.laptrinhjavaweb.entity.Product;
import com.laptrinhjavaweb.repository.ImageRepositoy;
import com.laptrinhjavaweb.repository.ProductRepository;

@Service 
public class ProductService extends BaseService {
	
	@Autowired ProductRepository productRepository;
	
	@Autowired ImageRepositoy imageRepositoy;
	
	@Value("${attachment.path}") private String attachmentPath; 
	public ProductService() {
	}
	
	public List<Tuple> display(){ 
		String jpql = "select a, b from Image a, Product b where a.product.ProductId = b.ProductId and b.status = 1";
		
		@SuppressWarnings("unchecked")
		List<Tuple> result = (List<Tuple>) executeListQuery(jpql,  Tuple.class, Collections.EMPTY_MAP);
		return result;
	}
	
	public List<Tuple> searchProduct(final Map<String, Object> data) {
		String jpql = "select a, b from Image a, Product b where a.product.ProductId = b.ProductId and b.status = 1";
		if (data.containsKey("name") && !String.valueOf(data.get("name")).isEmpty()) {
			String title = (String) data.get("name");
			jpql = jpql + " AND (lower(b.productName) LIKE '%" + title.toLowerCase() + "%')";
		}
		@SuppressWarnings("unchecked")
		List<Tuple> result = (List<Tuple>) executeListQuery(jpql, Tuple.class, Collections.EMPTY_MAP);
		return result;
	}
	
	public List<Tuple> productDetail(int id){
		String jpql = "select a, b from Image a, Product b where a.product.ProductId = b.ProductId and b.status = 1"
				+ " and b.ProductId ="
				+ id;
		List<Tuple> results = executeListQuery(jpql, Tuple.class, Collections.emptyMap());
		return results;
	}
	
	public List<Tuple> productDetail1(int id){
		String jpql = "select a, b from Image a, Product b where a.product.ProductId = b.ProductId"
				+ " and b.ProductId ="
				+ id;
		List<Tuple> results = executeListQuery(jpql, Tuple.class, Collections.emptyMap());
		return results;
	}
	
	
	public List<Tuple> SearchProPage(final Map<String, Object> data, int page) {
		String jpql = "select a, b from Image a, Product b where a.product.ProductId = b.ProductId and b.status = 1";
		if (data.containsKey("name") && !String.valueOf(data.get("name")).isEmpty()) {
			String title = (String) data.get("name");
			jpql = jpql + " AND (lower(b.productName) LIKE '%" + title.toLowerCase() + "%')";
		}
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("limit", 5);
		param.put("page", page);
		@SuppressWarnings("unchecked")
		List<Tuple> result = (List<Tuple>) executeListQuery(jpql, Tuple.class, param);
		return result;
	}
	
	public long amountPro() {
		String jpql="select count(a) from Product a where a.status = 1";
		List<Tuple> results = executeListQuery(jpql, Tuple.class, Collections.emptyMap());
		return (long) results.get(0).get(0);
	}

	public List<Tuple> getProMen(){
		String sql="select a, b, c from Image a, Product b, Category c where a.product.ProductId = b.ProductId"
				+ " and b.status = 1 "
				+ " and b.category.categoryId = c.categoryId "
				+ " and c.categoryId = 1001 ";
		List<Tuple> results = executeListQuery(sql, Tuple.class, Collections.emptyMap());
		return results;
	}
	
	public long amountProMen() {
		String jpql="select count(a) from Product a where a.status = 1 and a.category.categoryId = 1001 ";
		List<Tuple> results = executeListQuery(jpql, Tuple.class, Collections.emptyMap());
		return (long) results.get(0).get(0);
	}
	
	public List<Tuple> getProWoman(){
		String sql="select a, b, c from Image a, Product b, Category c where a.product.ProductId = b.ProductId"
				+ " and b.status = 1 "
				+ " and b.category.categoryId = c.categoryId "
				+ " and c.categoryId = 1002 ";
		List<Tuple> results = executeListQuery(sql, Tuple.class, Collections.emptyMap());
		return results;
	}
	
	public long amountProWoman() {
		String jpql="select count(a) from Product a where a.status = 1 and a.category.categoryId = 1002 ";
		List<Tuple> results = executeListQuery(jpql, Tuple.class, Collections.emptyMap());
		return (long) results.get(0).get(0);
	}
	
	public List<Tuple> getProKids(){
		String sql="select a, b, c from Image a, Product b, Category c where a.product.ProductId = b.ProductId"
				+ " and b.status = 1 "
				+ " and b.category.categoryId = c.categoryId "
				+ " and c.categoryId = 1003 ";
		List<Tuple> results = executeListQuery(sql, Tuple.class, Collections.emptyMap());
		return results;
	}
	
	public long amountProKids() {
		String jpql="select count(a) from Product a where a.status = 1 and a.category.categoryId = 1003 ";
		List<Tuple> results = executeListQuery(jpql, Tuple.class, Collections.emptyMap());
		return (long) results.get(0).get(0);
	}
	
	@Transactional
	public void deletePro(int id) {
		String sql = "UPDATE FROM Product a SET a.status = 0 WHERE a.ProductId=:id";
		entityManager.createQuery(sql)
					 .setParameter("id", id)
					 .executeUpdate();
	}
	
	@Transactional
	public void editPro(int id, String name, String description, double price, int amount) {
		String sql = "UPDATE Product a SET a.productName = :name ,"
				+ "a.description = :description ,"
				+ "a.price = :price ,"
				+ "a.amount = :amount "
				+ " WHERE a.ProductId= :id ";
		entityManager.createQuery(sql)
					 .setParameter("id", id)
					 .setParameter("name", name)
					 .setParameter("description", description)
					 .setParameter("amount", amount)
					 .setParameter("price", price)
					 .executeUpdate();
	}
	
	@Transactional(rollbackOn = RollbackException.class)
	public void addPro(final Product product, final MultipartFile file)
			throws RollbackException {
		try {
			productRepository.save(product);			
			file.transferTo(new File(attachmentPath + product.getCategory().getCategoryName() + "/" + file.getOriginalFilename()));
				
		} catch (Exception e) {
			throw new RollbackException("Can't add new product");
		}
	}
}
