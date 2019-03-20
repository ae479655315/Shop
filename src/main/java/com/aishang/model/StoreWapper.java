package com.aishang.model;

import java.util.List;

public class StoreWapper extends Store {
    private List<ProductWapper> productWapperList;

    public List<ProductWapper> getProductWapperList() {
        return productWapperList;
    }

    public void setProductWapperList(List<ProductWapper> productWapperList) {
        this.productWapperList = productWapperList;
    }
}
