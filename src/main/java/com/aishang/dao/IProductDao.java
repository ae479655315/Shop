package com.aishang.dao;

import com.aishang.model.Product;
import com.aishang.model.ProductWapper;
import com.aishang.util.PageBeanForProduct;

import java.util.List;

public interface IProductDao {
    //查询热门商品
    List<Product> findHotProducts();

    //查询最新商品
    List<Product> findNewProducts();

    //根据条件查询商品数量
    Integer getRowCoutByCaOrPn(PageBeanForProduct pageBeanForProduct);

    //根据条件查询商品
    List<Product> findProductsByCaOrPn(PageBeanForProduct pageBeanForProduct);

    //查询当前类目下最新商品
    List<Product> findNewProductsByCid(Integer cid);

    //查询当前二级类目下最新商品
    List<Product> findNewProductsByCsid(Integer csid);

    //根据商品id查询商品
    ProductWapper findProductByPid(Integer pid);


}
