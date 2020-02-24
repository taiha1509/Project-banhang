package com.laptrinhjavaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.laptrinhjavaweb.entity.Bill;

public interface BillRepository extends JpaRepository<Bill, Integer> {

}
