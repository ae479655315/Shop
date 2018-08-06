package com.aishang.service.impl;

import com.aishang.dao.ICategoryDao;
import com.aishang.dao.IProductDao;
import com.aishang.model.Product;
import com.aishang.model.ProductWapper;
import com.aishang.service.IProductService;
import com.aishang.util.PageBean;
import com.aishang.util.PageBeanForProduct;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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


    //按照一级类目查询全部商品
  /*  @Override
    public PageBeanForProduct<Product> findProductsByCid(Integer pageNow, Integer cid) {
        //创建pageBean
        PageBeanForProduct<Product> pageBeanForProduct = new PageBeanForProduct();
        //封装cid
        pageBeanForProduct.setCid(cid);
        //封装pageBean
        pageBeanForProduct.setPageNow(pageNow);
        //封装pageSize
        pageBeanForProduct.setPageSize(pageSize);
        //封装rowCount
        int rowCount = productDao.getRowCoutByCid(cid);
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

        //封装list
        List<Product> products = productDao.findProductsByCaOrPn(pageBeanForProduct);
        pageBeanForProduct.setList(products);

        return pageBeanForProduct;
    }
*/
    //按照二级类目查询全部商品
 /*   @Override
    public PageBeanForProduct<Product> findProductsByCsid(Integer pageNow, Integer csid) {
        //创建pageBean
        PageBeanForProduct<Product> pageBeanForProduct = new PageBeanForProduct();
        //封装csids
        pageBeanForProduct.setCsid(csid);
        //封装pageBean
        pageBeanForProduct.setPageNow(pageNow);
        //封装pageSize
        pageBeanForProduct.setPageSize(pageSize);
        //封装rowCount
        int rowCount = productDao.getRowCoutByCsid(csid);
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

        //封装list
        List<Product> products = productDao.findProductsByCaOrPn(pageBeanForProduct);
        pageBeanForProduct.setList(products);

        //封装cid
        pageBeanForProduct.setCid(categoryDao.getCidByCsid(csid));
        return pageBeanForProduct;
    }
*/
    //根据商品id查询商品
    @Override
    public ProductWapper findProductByPid(Integer pid) {
        return productDao.findProductByPid(pid);
    }

    //根据条件查询商品
    public PageBeanForProduct<Product> fingProuctsByCaOrPn(Integer cid,Integer csid,String pname, Integer pageNow) {
        //创建pageBean
        PageBeanForProduct<Product> pageBeanForProduct = new PageBeanForProduct();
        //封装cid
        pageBeanForProduct.setCid(cid);
        //封装csids
        pageBeanForProduct.setCsid(csid);
        //封装pname
        pageBeanForProduct.setPname(pname);
        //封装pageBean
        pageBeanForProduct.setPageNow(pageNow);
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

        //封装startLimit分页起始参数
        int startLimit = (pageNow - 1) * pageSize;
        pageBeanForProduct.setStartLimit(startLimit);

        List<Product> products = productDao.findProductsByCaOrPn(pageBeanForProduct);

        //封装list
        pageBeanForProduct.setList(products);
        if(csid!=null){
            pageBeanForProduct.setCid(categoryDao.getCidByCsid(csid));
        }

        if(pname!=null){
            pageBeanForProduct.setCid(1);
        }
        return pageBeanForProduct;
    }



}
