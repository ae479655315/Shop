package com.aishang.service.impl;

import com.aishang.dao.ICategoryDao;
import com.aishang.dao.IProductDao;
import com.aishang.model.Collectproduct;
import com.aishang.model.Product;
import com.aishang.model.ProductWapper;
import com.aishang.service.IProductService;
import com.aishang.util.PageBean;
import com.aishang.util.PageBeanForProduct;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.util.List;

@Transactional
@Service("ProductService")
public class ProductServiceImpl implements IProductService {
    @Resource
    private IProductDao productDao;
    @Resource
    private ICategoryDao categoryDao;

    private final Integer pageSize = 12;

    @Override
    public List<Product> findHotProducts() {
        return productDao.findHotProducts();
    }

    @Override
    public List<Product> findNewProducts() {
        return productDao.findNewProducts();
    }

    //按照一级类目查询商品
    @Override
    public List<Product> findNewProductsByCid(Integer cid) {
        return productDao.findNewProductsByCid(cid);
    }

    //按照二级类目查询最新商品
    @Override
    public List<Product> findNewProductsByCsid(Integer csid) {
        return productDao.findNewProductsByCsid(csid);
    }

    //根据商品id查询商品
    @Override
    public ProductWapper findProductByPid(Integer pid) {
        return productDao.findProductByPid(pid);
    }

    //根据条件查询商品
    public PageBeanForProduct<ProductWapper> fingProuctsByCaOrPn(PageBeanForProduct pageBeanForProduct) {
        //创建pageBean
        //封装sort
        //pageBeanForProduct.setSort(sort);
        //封装cid
        // pageBeanForProduct.setCid(cid);
        //封装csids
        //pageBeanForProduct.setCsid(csid);
        //封装pname
        //pageBeanForProduct.setPname(pname);

        //封装pageSize
        pageBeanForProduct.setPageSize(pageSize);
        //封装rowCount
        Integer rowCount = productDao.getRowCoutByCaOrPn(pageBeanForProduct);
        pageBeanForProduct.setRowCount(rowCount);
        //封装pageCount
        int pageCount;
        if (rowCount % pageSize == 0) {
            pageCount = rowCount / pageSize;
        } else {
            pageCount = rowCount / pageSize + 1;
        }
        pageBeanForProduct.setPageCount(pageCount);

        //封装pageBean
        if(pageCount < 1){
            pageBeanForProduct.setPageNow(1);
        }
        if(pageCount>pageCount){
            pageBeanForProduct.setPageNow(pageCount);
        }
        //封装startLimit分页起始参数
        int startLimit = (pageBeanForProduct.getPageNow() - 1) * pageSize;
        pageBeanForProduct.setStartLimit(startLimit);

        List<ProductWapper> products = productDao.findProductsByCaOrPn(pageBeanForProduct);

        //封装list
        pageBeanForProduct.setList(products);
        if (pageBeanForProduct.getCsid() != null) {
            pageBeanForProduct.setCid(categoryDao.getCidByCsid(pageBeanForProduct.getCsid()));
        }

        if (pageBeanForProduct.getPname() != null) {
            pageBeanForProduct.setCid(1);
        }
        return pageBeanForProduct;
    }

    //店铺下的全部商品
    @Override
    public PageBeanForProduct<ProductWapper> findProductByUid(int uid, Integer pageNow) {
        //创建pageBean
        PageBeanForProduct<ProductWapper> pageBeanForProduct = new PageBeanForProduct();
        //封装uid
        pageBeanForProduct.setUid(uid);
        //封装pageBean
        pageBeanForProduct.setPageNow(pageNow);
        //封装pageSize
        pageBeanForProduct.setPageSize(pageSize);
        //封装rowCount
        Integer rowCount = productDao.findProductCountByUid(uid);
        pageBeanForProduct.setRowCount(rowCount);
        //封装pageCount
        int pageCount;
        if (rowCount % pageSize == 0) {
            pageCount = rowCount / pageSize;
        } else {
            pageCount = rowCount / pageSize + 1;
        }
        pageBeanForProduct.setPageCount(pageCount);

        //封装startLimit分页起始参数
        int startLimit = (pageNow - 1) * pageSize;
        pageBeanForProduct.setStartLimit(startLimit);
        System.out.println("startLimit..............."+startLimit);
        System.out.println("pageSize..............."+pageSize);

        List<ProductWapper> products = productDao.findProductByUid(pageBeanForProduct);
        for (ProductWapper product : products) {
            System.out.println(product);
        }
        //封装list
        pageBeanForProduct.setList(products);
        return pageBeanForProduct;
    }

    //修改商品的销量与库存
    @Override
    public void updateProductState(Integer pid) {
        productDao.updateProductState(pid);
    }

    //收藏商品
    @Override
    public void collectProduct(Collectproduct collectproduct) {
        productDao.collectProduct(collectproduct);
    }

    //查看当前用户是否已经搜藏过该商品
    @Override
    public Collectproduct checkProductIsExist(Collectproduct collectproduct) {
        return productDao.checkProductIsExist(collectproduct);
    }

    @Override
    public void cancelCollection(Collectproduct collectproduct) {
        productDao.cancelCollection(collectproduct);
    }
}



