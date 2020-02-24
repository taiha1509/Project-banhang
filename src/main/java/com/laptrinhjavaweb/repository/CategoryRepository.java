package com.laptrinhjavaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.laptrinhjavaweb.entity.Category;
@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {

}
