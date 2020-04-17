package com.luv2code.springdemo.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.luv2code.springdemo.entity.Customer;

@Repository  // applied to DAO only
public class CustomerDAOImplement implements CustomerDAO {

	// need to inject the sessionFactory (web.xml)
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	//@Transactional // for auto beginTransaction and commit
	public List<Customer> getcustomers() {
		
		// create hibernate session
		Session session=sessionFactory.getCurrentSession();
		
		// create query
		Query<Customer> query = session.createQuery("from Customer order by lastName",Customer.class);
		
		// execute query
		List<Customer> customers = query.getResultList();
		
		// return results
		return customers;
	}

	@Override
	public void addCustomer(Customer tempCustomer) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(tempCustomer);
		
	}

	@Override
	public Customer getcustomer(int id) {
		Session session = sessionFactory.getCurrentSession();
		Customer tempCustomer = new Customer();
		tempCustomer = session.get(Customer.class,id);
		return tempCustomer;
	}

	@Override
	public void deleteCustomer(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		session.createQuery("Delete from Customer where id="+id).executeUpdate();
	}

	@Override
	public List<Customer> search(String name) {
		
		Session session=sessionFactory.getCurrentSession();
		List<Customer> ls = session.createQuery("from Customer where firstName='"+name+"'",Customer.class).getResultList();
		if(ls!=null) {
			return ls;
		}
		
		return session.createQuery("from Customer order by lastName",Customer.class).getResultList();
	}

}
