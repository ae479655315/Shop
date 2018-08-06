package com.aishang.service;

import com.aishang.model.Store;

import java.util.List;

public interface IStoreService {
    //查询所有店铺信息
    List<Store> findAllStores();
}
