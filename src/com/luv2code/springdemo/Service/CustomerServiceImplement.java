package com.luv2code.springdemo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.luv2code.springdemo.DAO.CustomerDAO;
import com.luv2code.springdemo.entity.Customer;

@Service
public class CustomerServiceImplement implements CustomerService {
	@Autowired
	private CustomerDAO customerDAO;
	
	
	@Override
	@Transactional
	public List<Customer> getCustomers() {
		return customerDAO.getcustomers();
		
	}


	@Override
	@Transactional
	public void addCustomer(Customer tempCustomer) {
		customerDAO.addCustomer(tempCustomer);
		
	}


	@Override
	@Transactional
	public Customer getCustomer(int id) {
		
		return customerDAO.getcustomer(id);
	}


	@Override
	@Transactional
	public void deleteCustomer(int id) {
		
		customerDAO.deleteCustomer(id);
	}


	@Override
	@Transactional
	public List<Customer> search(String name) {
		// TODO Auto-generated method stub
		
		return customerDAO.search(name);
	}

}
