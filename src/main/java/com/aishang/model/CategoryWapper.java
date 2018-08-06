package com.aishang.model;

import java.util.List;

public class CategoryWapper extends  Category {
    private List<CategorysecondWapper> categorysecondWappers;

    public List<CategorysecondWapper> getCategorysecondWappers() {
        return categorysecondWappers;
    }

    public void setCategorysecondWappers(List<CategorysecondWapper> categorysecondWappers) {
        this.categorysecondWappers = categorysecondWappers;
    }
}
