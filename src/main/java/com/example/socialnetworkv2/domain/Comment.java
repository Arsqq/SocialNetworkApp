package com.example.socialnetworkv2.domain;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table
@Data
public class Comment {

    @Id
    @GeneratedValue
    private Long id;


    @Temporal(TemporalType.TIMESTAMP)
    private Date dateOfCreation;

    private String text;

    @ManyToOne
    @JoinColumn(name="message_id")
    private Message message;

    @ManyToOne
    @JoinColumn(name="user_id",nullable = false,updatable = false)
    private User author;
}
