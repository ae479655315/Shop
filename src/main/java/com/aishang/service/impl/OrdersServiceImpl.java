package com.aishang.service.impl;

import com.aishang.dao.ICategoryDao;
import com.aishang.dao.IOrdersDao;
import com.aishang.dao.IProductDao;
import com.aishang.model.*;
import com.aishang.service.ICategoryService;
import com.aishang.service.IOrdersService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Transactional
@Service("ordersServiceImpl")
public class OrdersServiceImpl implements IOrdersService {

    @Resource
    private IOrdersDao ordersDao;
    @Resource
    private IProductDao productDao;

    //创建订单
    @Override
    public void creatOrder(Orders orders) {
        ordersDao.creatOrder(orders);
    }

    //创建订单项
    @Override
    public void creatOrderitem(Orderitem orderitem) {
        ordersDao.creatOrderitem(orderitem);
    }

    @Override
    public OrdersWapper findOrderByOid(Integer oid) {
        return ordersDao.findOrderByOid(oid);
    }

    @Override
    public List<OrdersWapper> findOrdersByUid(Integer uid) {
        return ordersDao.findOrdersByUid(uid);
    }

    @Override
    public void changeState(Orders order) {
        ordersDao.changeState(order);
    }

    @Override
    public List<Integer> creatOrdersAndItems(Cart cart, Orders formOrder, Integer uid) {
        //记录多个oid
        List<Integer> oids = new ArrayList<>();
        Orders order = null;
        //添加订单项
        Map<Integer, List<CartItem>> cartItemMap = cart.getCartItemMap();
        for (Map.Entry<Integer, List<CartItem>> integerListEntry : cartItemMap.entrySet()) {
            //获取当前店铺下订单总金额
            double orderTotal = 0;
            List<CartItem> itemList = integerListEntry.getValue();
            for (CartItem cartItem : itemList) {
                //封装Orderitem
                orderTotal = orderTotal + cartItem.getSubTotal();
            }
            //添加订单
            order = new Orders();
            order.setName(formOrder.getName());
            order.setPhone(formOrder.getPhone());
            order.setAddr(formOrder.getAddr());
            order.setState(1);
            order.setUid(uid);
            order.setTotal(orderTotal);
            order.setStoreId(integerListEntry.getKey());
            //封装日期
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date time = null;
            try {
                time = sdf.parse(sdf.format(new Date()));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            order.setOrdertime(time);
            ordersDao.creatOrder(order);
            int oid = order.getOid();
            oids.add(oid);
            for (CartItem cartItem : itemList) {
                productDao.updateProductState(cartItem.getProduct().getPid());
                //封装Orderitem
                Orderitem orderitem = new Orderitem();
                orderitem.setOid(oid);
                orderitem.setCount(cartItem.getCount());
                orderitem.setPid(cartItem.getProduct().getPid());
                orderitem.setSubtotal(cartItem.getSubTotal());
                ordersDao.creatOrderitem(orderitem);
            }
        }
        return oids;
    }
}