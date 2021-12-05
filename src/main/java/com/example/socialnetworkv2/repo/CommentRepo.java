package com.example.socialnetworkv2.repo;

import com.example.socialnetworkv2.domain.Comment;
import com.example.socialnetworkv2.domain.Message;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CommentRepo extends JpaRepository<Comment,Long> {
    List<Comment> findAllByMessageId(Long message_id);
    List<Comment> findAllByAuthorId(Long author_id);
}
