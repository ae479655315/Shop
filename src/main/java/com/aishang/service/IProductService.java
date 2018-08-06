package com.aishang.service;

import com.aishang.model.Product;
import com.aishang.model.ProductWapper;
import com.aishang.util.PageBeanForProduct;

import java.util.List;

public interface IProductService {
    //查询热门商品
    List<Product> findHotProducts();

    //查询最新商品
    List<Product> findNewProducts();

    //查询当前类目下最新商品
    List<Product> findNewProductsByCid(Integer cid);

    //查询当前二级类目下最新商品
    List<Product> findNewProductsByCsid(Integer csid);

    //按照一级类目查询商品
    //PageBeanForProduct<Product> findProductsByCid(Integer pageNow, Integer cid);

    //按照二级类目查询商品
    //PageBeanForProduct<Product> findProductsByCsid(Integer pageNow, Integer csid);

    //根据商品id查询商品
    ProductWapper findProductByPid(Integer pid);

    //根据商品名称查询商品
    PageBeanForProduct<Product> fingProuctsByCaOrPn(Integer cid,Integer csid,String pname, Integer pageNow);
}
