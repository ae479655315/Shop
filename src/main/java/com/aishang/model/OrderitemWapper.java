package com.aishang.model;

public class OrderitemWapper extends Orderitem {
    private ProductWapper product;

    public Product getProduct() {
        return product;
    }

    public void setProduct(ProductWapper product) {
        this.product = product;
    }
}
