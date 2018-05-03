package com.jk.service.Impl;

import com.jk.dao.UserDao;
import com.jk.entity.Role;
import com.jk.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserDao userDao;


    @Override
    public List<Role> queryRole() {

        return userDao.queryRole();
    }

    @Override
    public void delRole(Integer roleid) {
        userDao.delRole(roleid);
    }

    @Override
    public Role updatehx(Integer roleid) {
        return userDao.updatehx(roleid);
    }

    @Override
    public void upRole(Role role) {
        userDao.upRole(role);
    }

    @Override
    public void addrole(Role role) {
        userDao.addrole(role);
    }
}
