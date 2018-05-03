package com.jk.dao;

import com.jk.entity.Role;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;
@Mapper
@Component
public interface UserDao {

    @Select("select * from t_role")
    List<Role> queryRole();

    @Delete(" delete from t_role where roleid=#{roleid} ")
    void delRole(Integer roleid);

    @Select(" select * from t_role where roleid=#{roleid}" )
    Role updatehx(Integer roleid);

    @Update("update t_role set rolename=#{rolename} where roleid=#{roleid}")
    void upRole(Role role);

    @Insert("insert into t_role values(#{roleid},#{rolename})")
    void addrole(Role role);
}



