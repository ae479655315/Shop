package com.aishang.model;

public class CartItem {
    private Product product;
    private Integer count;
    private double subTotal;


    public double getSubTotal() {
        return product.getShop_price()*count;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}
