package com.aishang.model;


import java.util.List;

public class OrdersWapper extends Orders {
    private List<OrderitemWapper> orderites;

    public List<OrderitemWapper> getOrderites() {
        return orderites;
    }

    public void setOrderites(List<OrderitemWapper> orderites) {
        this.orderites = orderites;
    }
}
