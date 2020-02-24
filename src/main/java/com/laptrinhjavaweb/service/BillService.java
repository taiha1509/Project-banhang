package com.laptrinhjavaweb.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Tuple;
import javax.transaction.RollbackException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.entity.Bill;
import com.laptrinhjavaweb.repository.BillRepository;

@Service
public class BillService  extends BaseService{
	@Autowired
	BillRepository billRepository;
	
	public List<Tuple> listBills(int page) {
		String jpql = "select a from Bill a";
		Map<String, Object> p = new HashMap<String, Object>();
		p.put("page", page);
		p.put("limit", 5);
		@SuppressWarnings("unchecked")
		List<Tuple> result = (List<Tuple>) executeListQuery(jpql, Tuple.class,p);
		return result;
	}
	
	public long amountBill() {
		String jpql="select count(a) from Bill a";
		List<Tuple> results = executeListQuery(jpql, Tuple.class, Collections.emptyMap());
		return (long) results.get(0).get(0);
	}
	
	@Transactional(rollbackOn = RollbackException.class)
	public void saveBill(Bill bill) {
		try {
			billRepository.save(bill);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
