package com.example.socialnetworkv2.domain;



import lombok.Data;

import javax.persistence.*;

@Data
@Entity
public class Message {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    private String text;
    private String tag;
    private String filename;


    public Message(String text, String tag,User user) {
        this.text=text;
        this.tag=tag;
        this.author=user;
    }

    public String getAuthorName(){
        return author !=null ? author.getUsername():"<none>";
    }

    public Message() {

    }
}