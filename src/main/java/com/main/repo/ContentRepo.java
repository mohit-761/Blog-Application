package com.main.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.main.model.Content;

@Repository
public interface ContentRepo extends JpaRepository<Content, Integer> {
	/* If you are using second type as Integer then while using findById() you need 
	 * to pass int variable as parameter
	 * if you are using seconnd type as String then you need to pass String variable as
	 * parameter
	 */

}
