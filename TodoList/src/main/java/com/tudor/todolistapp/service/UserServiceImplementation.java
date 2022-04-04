
package com.tudor.todolistapp.service;

import com.tudor.todolistapp.dao.BaseDbOperations;

import com.tudor.todolistapp.dao.TodoListDbOperations;
import com.tudor.todolistapp.dao.UserDbOperations;
import com.tudor.todolistapp.model.TodoList;

import com.tudor.todolistapp.model.User;
import com.tudor.todolistapp.mapper.UserRowMapper;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

 
@Service
public class UserServiceImplementation extends BaseDbOperations implements UserService {

    @Autowired
    private UserDbOperations userDbOp;
    
    @Autowired
    private TodoListDbOperations todoListDbOp;
    
 
    @Override
    public void register(User u) {
        userDbOp.save(u);
    }

    @Override
    public User login(String loginName, String password) {
        String sql = "SELECT userid, name, surname,loginName FROM user WHERE loginName=:ln AND password=:pw";
        Map m = new HashMap();
        m.put("ln", loginName);
        m.put("pw", password);
        try{
            User u = getNamedParameterJdbcTemplate().queryForObject(sql, m, new UserRowMapper());
            
            return u;
        } catch(EmptyResultDataAccessException ex)
        {
        return null;
        }
        

    }

    @Override
    public void saveTodoList(TodoList t) {
       todoListDbOp.save(t);
    }
    
    

}
