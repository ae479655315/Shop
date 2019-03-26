package com.aishang.model;

import java.util.*;

public class Cart {
    private Map<Integer, List<CartItem>> cartItemMap = new LinkedHashMap<>();
    private double total;

    public Map<Integer, List<CartItem>> getCartItemMap() {
        return cartItemMap;
    }

    //获取总价
    public double getTotal() {
        return total;
    }

    //清空购物车
    public void clearCatr() {
        cartItemMap.clear();
        total = 0.0;
    }


    //删除某个购物项
    public Integer removeItem(Integer pid, Integer storeId) {
        List<CartItem> cartItems = cartItemMap.get(storeId);
        for (CartItem cartItem : cartItems) {
            //如果入参pid == 循环遍历过程中订单项下的商品id
            if (pid.intValue() == cartItem.getProduct().getPid().intValue()) {
                //移除当前订单项
                cartItems.remove(cartItem);
                //总计变化
                total = total - cartItem.getSubTotal();
            }
        }
        //如果改店铺下无订单项了，移除店铺
        if(cartItems.size()==0){
            cartItemMap.remove(storeId);
        }
        return cartItems.size();
    }


    //加入购物车
    public void addCartItem(CartItem cartItem) {
        List<CartItem> cartItems = null;
        if (cartItemMap.containsKey(cartItem.getProduct().getStoreId())) {
            //购物车中已存有该店铺的商品
            cartItems = cartItemMap.get(cartItem.getProduct().getStoreId());
            boolean flag = false; //标记商品是否为新加入购物车的
            int i = 0; //若已经加入过，记录此时商品的索引
            for (i = 0; i < cartItems.size(); i++) {
                if (cartItems.get(i).getProduct().getPid() == cartItem.getProduct().getPid()) {
                    //已存在商品
                    flag = true;
                    break;
                }
            }
            if (flag) {
                //已存在商品，先获取原本数量
                CartItem oldcartItem = cartItems.get(i);
                Integer count = oldcartItem.getCount();
                //在原本数量基础上，添加指定商品数量
                oldcartItem.setCount(cartItem.getCount() + count);
                System.out.println(cartItem.getCount()+".,.,.,.,.,.,.,.,.,.,");
            } else {
                //未存在该商品，该商品为新加入的商品
                cartItems.add(cartItem);
            }
        } else {
            //该店铺首次加入购物车中
            cartItems = new LinkedList<>();
            cartItems.add(cartItem);
        }
         //计算总价
        total = total + cartItem.getSubTotal();
        System.out.println("Cart.java中total:"+total);
        //重新加入集合中
        cartItemMap.put(cartItem.getProduct().getStoreId(), cartItems);
    }
}
