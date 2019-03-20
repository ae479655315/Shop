package com.aishang.service;

import com.aishang.model.Collectproduct;
import com.aishang.model.Product;
import com.aishang.model.ProductWapper;
import com.aishang.model.User;
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
    PageBeanForProduct<ProductWapper> fingProuctsByCaOrPn(PageBeanForProduct pageBeanForProduct);

    //查询收藏商品
    PageBeanForProduct<ProductWapper> findProductByUid(int uid,Integer pageNow);

    //修改商品的销量与库存
    void updateProductState(Integer pid);

    //收藏商品
    void collectProduct(Collectproduct collectproduct);

    //查看当前用户是否已经搜藏过该商品
    Collectproduct checkProductIsExist(Collectproduct collectproduct);

    //取消收藏
    void cancelCollection(Collectproduct collectproduct);
}
