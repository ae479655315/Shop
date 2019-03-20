package com.aishang.dao;

import com.aishang.model.*;

import java.util.List;

public interface IOrdersDao {
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
}