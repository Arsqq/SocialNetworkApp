package com.example.socialnetworkv2.repo;

import com.example.socialnetworkv2.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository <User,Long> {

    User findByUsername(String username);
}
