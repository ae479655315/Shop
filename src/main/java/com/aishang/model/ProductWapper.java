package com.aishang.model;

public class ProductWapper extends Product {
    private Store store;
    private ProductsState ps;

    public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
    }

    public ProductsState getPs() {
        return ps;
    }

    public void setPs(ProductsState ps) {
        this.ps = ps;
    }
}
