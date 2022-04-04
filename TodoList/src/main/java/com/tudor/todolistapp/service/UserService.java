
package com.tudor.todolistapp.service;


import com.tudor.todolistapp.model.TodoList;
import com.tudor.todolistapp.model.User;

 
public interface UserService {
    public void register(User u);
    
    public User login(String loginName, String password);
    public void saveTodoList(TodoList t);
   
      
}
