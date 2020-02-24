package com.laptrinhjavaweb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.repository.ContactRepository;

@Service
public class ContactService {
	@Autowired
	ContactRepository contactRepository;

}
