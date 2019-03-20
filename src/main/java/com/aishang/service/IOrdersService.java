package com.aishang.service;

import com.aishang.model.Cart;
import com.aishang.model.Orderitem;
import com.aishang.model.Orders;
import com.aishang.model.OrdersWapper;

import java.util.List;

public interface IOrdersService {
    //创建订单
    void creatOrder(Orders orders);

    //创建订单项
    void creatOrderitem(Orderitem orderitem);

    //根据订单ID查询订单
    OrdersWapper findOrderByOid(Integer oid);

    //订单列表
    List<OrdersWapper> findOrdersByUid(Integer uid);

    //修改订单状态
    void changeState(Orders order);

    //创建订单，订单项
    List<Integer> creatOrdersAndItems(Cart cart,Orders formOrder,Integer uid);



}