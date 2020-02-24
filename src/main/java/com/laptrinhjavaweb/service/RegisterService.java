package com.laptrinhjavaweb.service;

import java.util.Collections;
import java.util.List;

import javax.persistence.Tuple;
import javax.transaction.RollbackException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.entity.Users;
import com.laptrinhjavaweb.repository.UsersRepository;

@Service
public class RegisterService {
	@Autowired
	UsersRepository repository;
	
	@Autowired
	BaseService baseService;
	
	@Transactional(rollbackOn = RollbackException.class)
	public void saveUser(final Users users) throws RollbackException  {
		try {
			repository.save(users);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RollbackException("Can't registry, try again.");
		}
	}
	
	public int countAccount() {
		String jqpl = "select count(a) from Users a";
		@SuppressWarnings("unchecked")
		List<Tuple> user = (List<Tuple>) baseService.executeListQuery(jqpl, Tuple.class, Collections.EMPTY_MAP);
		long count = (long) user.get(0).get(0);
		int i=0;
		while(i < count) {
			i++;
		}
		return i+1;
	}
}
