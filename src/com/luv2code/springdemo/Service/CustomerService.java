package com.luv2code.springdemo.Service;

import java.util.List;

import com.luv2code.springdemo.entity.Customer;

public interface CustomerService {
	public List<Customer> getCustomers();
	public void addCustomer(Customer tempCustomer);
	public Customer getCustomer(int id);
	public void deleteCustomer(int id);
	public List<Customer> search(String name);
}
