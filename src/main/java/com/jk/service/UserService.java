package com.jk.service;

import com.jk.entity.Role;

import java.util.List;

public interface UserService {
    List<Role> queryRole();

    void delRole(Integer roleid);

    Role updatehx(Integer roleid);

    void upRole(Role role);

    void addrole(Role role);
}
