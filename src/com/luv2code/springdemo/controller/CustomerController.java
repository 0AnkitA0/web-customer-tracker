package com.luv2code.springdemo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.luv2code.springdemo.DAO.CustomerDAO;
import com.luv2code.springdemo.Service.CustomerService;
import com.luv2code.springdemo.entity.Customer;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	
	@RequestMapping("/list")
	public String listCustomer(Model theModel) {
		
		
		// retrieve the list using customerDAO's function
		List<Customer> customers = customerService.getCustomers();
		
		// add the result to model
		theModel.addAttribute("customers",customers);
		
		return "list-customer";
		
	}
	@RequestMapping("/showFormAdd")
	public String addCustomer(Model theModel) {
		
		Customer tempCustomer = new Customer();
		theModel.addAttribute("tempCustomer",tempCustomer);
		return "Customer-add";
	}
	
	@RequestMapping("/processForm")
	public String processForm(Model theModel,@ModelAttribute Customer tempCustomer) {
		customerService.addCustomer(tempCustomer);
//		// retrieve the list using customerDAO's function
//		List<Customer> customers = customerService.getCustomers();
//				
//		// add the result to model
//		
//		theModel.addAttribute("customers",customers);
				
		return "redirect:/customer/list";
	}
	
	
	@GetMapping("/showUpdateForm")
	public String showUpdateForm(@RequestParam("customerId")int id,Model theModel) {
		Customer tempCustomer = new Customer();
		
		// get the customer from database
		tempCustomer = customerService.getCustomer(id);
		//tempCustomer.setId(id);
		
		// put it in model
		theModel.addAttribute("updateCustomer",tempCustomer);
		return "customer-update";
		
	}
	@PostMapping("/processUpdate")
	public String processUpdate(@ModelAttribute("updateCustomer") Customer tempCustomer) {
		System.out.println("Adding");
		customerService.addCustomer(tempCustomer);
		System.out.println("Added");
		
		
		return "redirect:/customer/list";
		
	}
	@GetMapping("/delete")
	public String delete(@RequestParam("customerId") int id) {
		
		customerService.deleteCustomer(id);
		System.out.println(id);
		return "redirect:/customer/list";
	}
	@RequestMapping("/search")
	public String search(@RequestParam("name")String name,Model theModel) {
		
		List<Customer> customers=customerService.search(name);
		
		
		return "list-customer2";
		
	}
	
}
	

