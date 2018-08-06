package com.aishang.service.impl;

import com.aishang.dao.IUserDao;
import com.aishang.model.Category;
import com.aishang.model.User;
import com.aishang.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements IUserService {

    @Resource
    private IUserDao userDao;

    public User selectUser(long userId) {
        return this.userDao.selectUser(userId);
    }

    @Override
    public void addUser(User user) {
        userDao.addUser(user);
    }

    @Override
    public User findUser(User user) {
        return userDao.findUser(user);
    }
}