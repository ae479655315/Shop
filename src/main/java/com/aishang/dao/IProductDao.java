package com.aishang.dao;

import com.aishang.model.Collectproduct;
import com.aishang.model.Product;
import com.aishang.model.ProductWapper;
import com.aishang.model.User;
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
    List<ProductWapper> findProductsByCaOrPn(PageBeanForProduct pageBeanForProduct);

    //查询当前类目下最新商品
    List<Product> findNewProductsByCid(Integer cid);

    //查询当前二级类目下最新商品
    List<Product> findNewProductsByCsid(Integer csid);

    //根据商品id查询商品
    ProductWapper findProductByPid(Integer pid);

    //收藏的商品
    List<ProductWapper> findProductByUid(PageBeanForProduct<ProductWapper> pageBean);

    //收藏的商品总记录数
    Integer findProductCountByUid(int uid);

    //修改商品的销量与库存
    void updateProductState(Integer pid);

    //收藏商品
    void collectProduct(Collectproduct collectproduct);

    //查看当前用户是否已经搜藏过该商品
    Collectproduct checkProductIsExist(Collectproduct collectproduct);

    //取消收藏
    void cancelCollection(Collectproduct collectproduct);
}
