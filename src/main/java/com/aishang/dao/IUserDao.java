package com.aishang.dao;

import com.aishang.model.Category;
import com.aishang.model.User;

import java.util.List;

public interface IUserDao {
    //根据id查询用户
    User selectUser(Integer id);

    List<Category> findAllCategories();

    //添加用户
    void addUser(User user);

    //查询用户
    User findUser(User user);

    //修改用户
    void updateUser(User user);

    //检验username是否重复
    List<User> checkUsername(String username);
}