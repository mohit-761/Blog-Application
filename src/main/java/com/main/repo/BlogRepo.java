package com.main.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.main.model.User;

@Repository
public interface BlogRepo extends JpaRepository<User, Integer> {

}
