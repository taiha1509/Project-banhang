package com.laptrinhjavaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.laptrinhjavaweb.entity.Image;
@Repository
public interface ImageRepositoy extends JpaRepository<Image, Integer>  {

}
