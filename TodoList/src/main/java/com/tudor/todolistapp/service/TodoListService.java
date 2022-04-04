
package com.tudor.todolistapp.service;


import com.tudor.todolistapp.model.TodoList;
import java.util.List;

 
public interface TodoListService {

    public void save(TodoList t);

    public void update(TodoList t);

    public void delete(Integer todoListId);

    public TodoList findById(Integer todoListId);

    public List<TodoList> findUserTodoList(Integer userId);

    public List<TodoList> findByStatus(Integer userId);

    public List<TodoList> findUserTodoList(Integer userId, String txt);

    public List<TodoList> findUserTodoListOnlyHigh(Integer userId);

    public List<TodoList> findUserTodoListOnlyMedium(Integer userId);

    public List<TodoList> findUserTodoListOnlyLow(Integer userId);
    
    

}
