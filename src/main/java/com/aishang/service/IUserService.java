package com.aishang.service;

import com.aishang.model.Category;
import com.aishang.model.User;

import java.util.List;

public interface IUserService {

    public User selectUser(Integer userId);

    //检验username是否重复
    List<User> checkUsername(String username);

    //添加用户
    public void addUser(User user);

    //查询用户
    User findUser(User user);

    void updateUser(User user);


}