package com.aishang.service.impl;

import com.aishang.dao.IStoreDao;
import com.aishang.dao.IUserDao;
import com.aishang.model.Store;
import com.aishang.model.User;
import com.aishang.service.IStoreService;
import com.aishang.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("storeService")
public class StoreServiceImpl implements IStoreService {

    @Resource
    private IStoreDao storeDao;


    @Override
    public List<Store> findAllStores() {
        return storeDao.findAllStores();
    }
}