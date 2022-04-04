
package com.tudor.todolistapp.mapper;

import com.tudor.todolistapp.model.TodoList;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

 
public class TodoListRowMapper implements RowMapper<TodoList>{

    @Override
    public TodoList mapRow(ResultSet rs, int i) throws SQLException {
       TodoList t=new TodoList();
       t.setTodoListId(rs.getInt("todoListId"));
       t.setUserId(rs.getInt("userId"));
       t.setMonth(rs.getString("month"));
       t.setDay(rs.getString("day"));
       t.setYear(rs.getString("year"));
       t.setTitle(rs.getString("title"));
       t.setDescription(rs.getString("description"));
       t.setStatus(rs.getString("status"));
       return t;
       
    }
    
}
