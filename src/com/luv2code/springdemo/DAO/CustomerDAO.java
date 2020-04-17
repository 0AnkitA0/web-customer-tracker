package com.luv2code.springdemo.DAO;

import java.util.List;

import com.luv2code.springdemo.entity.Customer;

public interface CustomerDAO {
	
	public List<Customer> getcustomers();
	public void addCustomer(Customer tempCustomer);
	public Customer getcustomer(int id);
	public void deleteCustomer(int id);
	public List<Customer> search(String name);

}
