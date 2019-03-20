package com.aishang.service.impl;

import com.aishang.dao.IUserDao;
import com.aishang.model.Category;
import com.aishang.model.User;
import com.aishang.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.util.List;

@Transactional
@Service("userService")
public class UserServiceImpl implements IUserService {

    @Resource
    private IUserDao userDao;

    //检验username是否重复
    @Override
    public List<User> checkUsername(String username) {
        return userDao.checkUsername(username);
    }

    public User selectUser(Integer userId) {
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

    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
    }
}