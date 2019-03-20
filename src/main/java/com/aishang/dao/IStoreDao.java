package com.aishang.dao;

import com.aishang.model.*;
import com.aishang.util.PageBeanForProduct;

import java.util.List;

public interface IStoreDao {

    // 查询所有店铺
    List<Store> findAllStores();

    //查看收藏的店铺
    List<StoreWapper> findMyCollectStore(Integer uid);

    //模糊查询店铺
    List<StoreWapper> findStoreBySname(String sname);

    //查询某店铺下商品总记录数
    Integer getRowCoutBySid(Integer sid);

    //查询某店铺下的商品分页列表
    List<ProductWapper> findProductsBySid(PageBeanForProduct<ProductWapper> pageBeanForProduct);

    //查询某店铺下的推荐商品
    List<ProductWapper> findNewProductBySid(Integer sid);

    //查询是否收藏过该店铺
    Collectstore checkProductIsExist(Collectstore collectstore);

    //收藏店铺
    void collectStore(Collectstore collectstore);

    //取消收藏
    void cancelCollection(Collectstore collectstore);
}