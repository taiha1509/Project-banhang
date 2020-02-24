package com.laptrinhjavaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.laptrinhjavaweb.entity.Users;
@Repository
public interface UsersRepository extends JpaRepository<Users, Integer>{
	Users findByUsername(String username);
}
