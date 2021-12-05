package com.example.socialnetworkv2.domain;



import com.example.socialnetworkv2.domain.utils.MessageHelper;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Getter
@Setter
@Entity
public class Message implements Serializable {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    @NotBlank(message="Please fill the field")
    @Length(max=2048,message = "Too long")
    private String text;
    private String tag;
    private String filename;


    @ManyToMany
    @JoinTable(
            name="message_likes",
            joinColumns = {@JoinColumn(name="message_id")},
            inverseJoinColumns = {@JoinColumn(name="user_id")}
    )
    private Set<User> likes=new HashSet<>();


    @OneToMany(mappedBy = "message",orphanRemoval = true)
    private List<Comment> comments=new ArrayList<>();




    public String getAuthorName(){
        return MessageHelper.getAuthorName(author);
    }

    public Message(String text, String tag,User user) {
        this.text=text;
        this.tag=tag;
        this.author=user;
    }



    public Message() {

    }
}