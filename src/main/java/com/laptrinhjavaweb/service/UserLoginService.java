package com.laptrinhjavaweb.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.entity.Users;
import com.laptrinhjavaweb.repository.UsersRepository;

@Service
public class UserLoginService {
	@PersistenceContext protected EntityManager entityManager;
	@Autowired UsersRepository usersRepository;
	
	public boolean checkUser(String username,String password) {
		String jpql = "select u from Users u where u.username = '"+username+"'";
		Query query = entityManager.createQuery(jpql, Users.class);
		@SuppressWarnings("unchecked")
		List<Users> result = query.getResultList();
		if(username == null || password == null || username.isEmpty()||password.isEmpty())
		{
			return false;
		}
		if(result.size() == 0)
		{
			return false;
		}
		if(result.get(0) != null && !result.get(0).getPassword().equals(password))
		{
			return false;
		}
		return true;
	}
	
	public List<Users> getUser(String username) {
		String jpql = "select u from Users u where u.username = '"+username+"'";
		Query query = entityManager.createQuery(jpql, Users.class);
		@SuppressWarnings("unchecked")
		List<Users> result = query.getResultList();
		return result;
	}
}
