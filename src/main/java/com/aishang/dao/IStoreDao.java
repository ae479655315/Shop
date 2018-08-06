package com.aishang.dao;

import com.aishang.model.Category;
import com.aishang.model.CategoryWapper;
import com.aishang.model.Categorysecond;
import com.aishang.model.Store;

import java.util.List;

public interface IStoreDao {

    // 查询所有店铺
    List<Store> findAllStores();

}