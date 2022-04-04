
package com.tudor.todolistapp.dao;

import com.tudor.todolistapp.model.TodoList;
import java.util.List;

 
public interface TodoListDbOperations {

    public void save(TodoList todoList);

    public void update(TodoList todoList);
    
    public void delete(TodoList todoList);

    public void delete(Integer todoListId);

    public TodoList findById(Integer todoListId);

    public List<TodoList> findAll();

    public List<TodoList> findByProperty(String propName, Object propValue);

    public List<TodoList> orderByStatus(String propName, Object propValue);

}
