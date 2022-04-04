package com.tudor.todolistapp.dao;

import com.tudor.todolistapp.model.User;


public interface UserDbOperations {

    public void save(User u);

    public void update(User u);
}
