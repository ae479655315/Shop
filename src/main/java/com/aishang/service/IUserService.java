package com.aishang.service;

import com.aishang.model.Category;
import com.aishang.model.User;

import java.util.List;

public interface IUserService {

    public User selectUser(long userId);

    //添加用户
    public void addUser(User user);

    //查询用户
    User findUser(User user);
}