package com.aishang.dao;

import com.aishang.model.Category;
import com.aishang.model.CategoryWapper;
import com.aishang.model.Categorysecond;
import com.aishang.model.User;

import java.util.List;

public interface ICategoryDao {

    // 查询所有一级类目
    List<Category> findAllCategories();

    //查询说有一级类目id
    Integer[] findAllCid();

    //根据一级类目查询二级类目
    List<Categorysecond> findCategorysecondsByCid(Integer cid);

    //一级类目扩展类
    List<CategoryWapper> findAllCategoryWappers();

    //通过二级类目查询所属一级类目
    Integer getCidByCsid(Integer csid);

}