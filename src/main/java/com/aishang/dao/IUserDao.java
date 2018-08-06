package com.aishang.dao;

import com.aishang.model.Category;
import com.aishang.model.User;

import java.util.List;

public interface IUserDao {

    User selectUser(long id);

    List<Category> findAllCategories();

    //添加用户
    void addUser(User user);

    //查询用户
    User findUser(User user);
}