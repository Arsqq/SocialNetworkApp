package com.example.socialnetworkv2.domain.dto;

import com.example.socialnetworkv2.domain.Comment;
import com.example.socialnetworkv2.domain.Message;
import com.example.socialnetworkv2.domain.User;
import com.example.socialnetworkv2.domain.utils.MessageHelper;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class MessageDto {
    private Long id;
    private String text;
    private String tag;
    private User author;
    private String filename;
    private Long likes;
    private Boolean meLiked;
    private int commentsAmount;

    public MessageDto(Message message, Long likes, Boolean meLiked) {
        this.id = message.getId();
        this.text = message.getText();
        this.tag = message.getTag();
        this.author = message.getAuthor();
        this.filename = message.getFilename();
        this.likes = likes;
        this.meLiked = meLiked;
        this.commentsAmount=message.getComments().size();
    }

    public String getAuthorName(){
        return MessageHelper.getAuthorName(author);
    }



    @Override
    public String toString() {
        return "MessageDto{" +
                "id=" + id +
                ", author=" + author +
                ", likes=" + likes +
                ", meLiked=" + meLiked +
                '}';
    }
}
