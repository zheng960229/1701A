package com.jk.controler;


import com.jk.entity.Role;
import com.jk.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;


    @RequestMapping(value="queryRole")
    @ResponseBody
    public List<Role> queryRole(){
       List list= userService.queryRole();
        return  list;
    }
    @RequestMapping(value="delRole")
    @ResponseBody
    public String  delRole(Integer roleid){
        userService.delRole(roleid);
        return   "delsuccess";
    }
    @RequestMapping(value="updateHx")
    @ResponseBody
    public Role  updatehx(Integer roleid){
         Role role= userService.updatehx(roleid);
        return   role;
    }
    @RequestMapping(value = "upRole")
    @ResponseBody
    public void upRole(Role role){
        userService.upRole(role);
    }
    @RequestMapping(value="/addrole")
    @ResponseBody
    public String  addrole(Role role){
        userService.addrole(role);
        return "addsuccess";

    }



}


