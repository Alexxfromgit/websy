package com.alexxrw.websy.domain.util;

import com.alexxrw.websy.domain.User;

public class MessageHelper {

    public static String getAuthorName(User author) {
        return author != null ? author.getUsername() : "<none>";
    }
}
