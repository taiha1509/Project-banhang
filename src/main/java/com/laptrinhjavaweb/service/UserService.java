package com.laptrinhjavaweb.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Tuple;

import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.entity.Users;

@Service
public class UserService  extends BaseService{
	public List<Tuple> listUser(int page) {
		String jpql = "select a from Users a";
		Map<String, Object> p = new HashMap<String, Object>();
		p.put("page", page);
		p.put("limit", 5);
		@SuppressWarnings("unchecked")
		List<Tuple> users = (List<Tuple>)executeListQuery(jpql, Tuple.class, p);
		return users;
	}

	public long amountUser() {
		String jpql="select count(a) from Users a";
		List<Tuple> results = executeListQuery(jpql, Tuple.class, Collections.emptyMap());
		return (long) results.get(0).get(0);
	}
	
	public boolean isExistUser(String username) {
		String sql = "select a from Users a";
		List<Users> users = entityManager.createQuery(sql).getResultList();
		for(int i=0; i<users.size(); i++) {
			if(users.get(i).getUsername().equals(username))
				return true;
		}
		return false;
	}
}
