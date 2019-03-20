package com.aishang.service;

import com.aishang.model.Collectstore;
import com.aishang.model.ProductWapper;
import com.aishang.model.Store;
import com.aishang.model.StoreWapper;
import com.aishang.util.PageBeanForProduct;

import java.util.List;

public interface IStoreService {
    //查询所有店铺信息
    List<Store> findAllStores();

    //查看收藏的店铺
    List<StoreWapper> findMyCollectStore(Integer uid);

    //模糊查询店铺
    List<StoreWapper> findStoreBySname(String sname);

    //查询该店铺下商品分页列表
    PageBeanForProduct<ProductWapper> findProductBySid(Integer sid,Integer pageNow);

    //查询该店铺下推荐商品
    List<ProductWapper> findNewProductBySid(Integer sid);

    //查询是否收藏过该店铺
    Collectstore checkProductIsExist(Collectstore collectstore);

    //收藏店铺
    void collectStore(Collectstore collectstore);

    //取消收藏
    void cancelCollection(Collectstore collectstore);
}
