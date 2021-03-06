
package com.tudor.todolistapp.dao;

import com.tudor.todolistapp.model.User;
import java.util.HashMap;
import java.util.Map;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

 
@Repository
public class UserDbOperationsImplementation extends BaseDbOperations implements UserDbOperations{

    @Override
    public void save(User u) {
       String sql ="INSERT INTO USER(name,surname,loginName,password)"
               +"VALUES(:name,:surname,:loginName,:password)";
       Map m = new HashMap();
       m.put("name", u.getName());
       m.put("surname", u.getSurname());
       m.put("loginName", u.getLoginName());
       m.put("password", u.getPassword());
       
        KeyHolder kh = new GeneratedKeyHolder(); // Ths object holds Auto incrementing value like userId after inserting data
        SqlParameterSource ps = new MapSqlParameterSource(m); // This object shows from where The parameter of named parameter is obtained
        super.getNamedParameterJdbcTemplate().update(sql, ps, kh);
        Integer userId = kh.getKey().intValue();
        u.setUserId(userId);

    }

    @Override
    public void update(User u) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
