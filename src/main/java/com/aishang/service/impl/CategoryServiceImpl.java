package com.aishang.service.impl;

import com.aishang.dao.ICategoryDao;
import com.aishang.dao.IUserDao;
import com.aishang.model.Category;
import com.aishang.model.CategoryWapper;
import com.aishang.model.Categorysecond;
import com.aishang.model.User;
import com.aishang.service.ICategoryService;
import com.aishang.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("categoryService")
public class CategoryServiceImpl implements ICategoryService {

    @Resource
    private ICategoryDao categoryDao;

    @Override
    public List<Category> findAllCategories() {
        return categoryDao.findAllCategories();
    }

    @Override
    public Integer[] findAllCid() {
        return categoryDao.findAllCid();
    }

    @Override
    public List<Categorysecond> findCategorysecondsByCid(Integer cid) {
        return categoryDao.findCategorysecondsByCid(cid);
    }

    @Override
    public List<CategoryWapper> findAllCategoryWappers() {
        return categoryDao.findAllCategoryWappers();
    }
}