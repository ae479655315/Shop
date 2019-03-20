package com.aishang.service.impl;

import com.aishang.dao.IStoreDao;
import com.aishang.dao.IUserDao;
import com.aishang.model.*;
import com.aishang.service.IStoreService;
import com.aishang.service.IUserService;
import com.aishang.util.PageBeanForProduct;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.util.List;

@Transactional
@Service("storeService")
public class StoreServiceImpl implements IStoreService {

    @Resource
    private IStoreDao storeDao;
    private final Integer pageSize = 12;

    //查询所有店铺
    @Override
    public List<Store> findAllStores() {
        return storeDao.findAllStores();
    }

    //查询收藏的店铺
    @Override
    public List<StoreWapper> findMyCollectStore(Integer uid) {
        return storeDao.findMyCollectStore(uid);
    }
    @Override
    public PageBeanForProduct<ProductWapper> findProductBySid(Integer sid, Integer pageNow) {
        PageBeanForProduct<ProductWapper> pageBeanForProduct = new PageBeanForProduct<ProductWapper>();
        //封装店铺id
        pageBeanForProduct.setShortId(sid);
        //封装pageBean
        pageBeanForProduct.setPageNow(pageNow);
        //封装pageSize
        pageBeanForProduct.setPageSize(pageSize);
        //封装rowCount
        Integer rowCount = storeDao.getRowCoutBySid(sid);
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
        List<ProductWapper> products = storeDao.findProductsBySid(pageBeanForProduct);
        pageBeanForProduct.setList(products);
        pageBeanForProduct.setStoreName(products.get(0).getStore().getStoreName());

        return pageBeanForProduct;
    }

    @Override
    public List<ProductWapper> findNewProductBySid(Integer sid) {
        return storeDao.findNewProductBySid(sid);
    }

    //模糊查询店铺
    @Override
    public List<StoreWapper> findStoreBySname(String sname) {
        return storeDao.findStoreBySname(sname);
    }

    //查询是否收藏过该店铺
    @Override
    public Collectstore checkProductIsExist(Collectstore collectstore) {
        return storeDao.checkProductIsExist(collectstore);
    }

    //收藏店铺
    @Override
    public void collectStore(Collectstore collectstore) {
        storeDao.collectStore(collectstore);
    }

    @Override
    public void cancelCollection(Collectstore collectstore) {
        storeDao.cancelCollection(collectstore);
    }
}