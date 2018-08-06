package com.aishang.util;

import com.aishang.model.CategoryWapper;
import com.aishang.service.ICategoryService;

import com.aishang.service.impl.CategoryServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import javax.annotation.PostConstruct;
import java.util.List;

@Component
public class CategoryUtil {
    @Autowired
    private static ICategoryService categoryService;

    public static CategoryUtil categoryUtil;

    @PostConstruct
    public void init() {
        categoryUtil = this;
    }

    public static Model findAllCategoryWappers(Model model){
        List<CategoryWapper> categoryWappers = CategoryUtil.categoryService.findAllCategoryWappers();
        model.addAttribute("categoryWappers",categoryWappers);
        return model;
    };
}
