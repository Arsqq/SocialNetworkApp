package com.example.socialnetworkv2.domain.utils;

import com.example.socialnetworkv2.domain.User;

public abstract class MessageHelper {
    public static String  getAuthorName(User author){
        return author !=null ? author.getUsername():"<none>";
    }
}
