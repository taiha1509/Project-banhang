package com.laptrinhjavaweb.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.laptrinhjavaweb.entity.Contact;
import com.laptrinhjavaweb.repository.ContactRepository;
import com.laptrinhjavaweb.service.ContactService;

@Controller
public class ContactController {

	@Autowired
	ContactService contactService;
	@Autowired
	ContactRepository contactRepository;

	@RequestMapping(value = { "/contact" }, method = { RequestMethod.GET })
	public String contact(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		System.out.println(request.getContextPath());
		model.addAttribute("contact", new Contact());
		model.remove("message");
		return "/views/web/contact";
	}

	@RequestMapping(value = { "/contact" }, method = { RequestMethod.POST })
	public String saveContact(@ModelAttribute("contact") Contact contact, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) {
		try {
			contactRepository.save(contact);
			model.addAttribute("message", "Success. You have send contact");
		} catch (Exception e) {
			model.addAttribute("message", "Oh no!. Your contact can not send. Please check");
		}
		return "/views/web/contact";
	}
}
