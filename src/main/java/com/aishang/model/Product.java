package com.aishang.model;

import java.util.Date;

public class Product {
    private Integer pid;           //编号
    private String pname;          //名称
    private double market_price;   //市场价
    private double shop_price;     //商城价
    private String image;          //图片
    private String pdesc;          //商品简介
    private Integer is_hot;        //是否热门
    private Date pdate;            //生产日期
    private Integer csid;          //所属二级类目
    private Integer storeId;       //店铺id

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public double getMarket_price() {
        return market_price;
    }

    public void setMarket_price(double market_price) {
        this.market_price = market_price;
    }

    public double getShop_price() {
        return shop_price;
    }

    public void setShop_price(double shop_price) {
        this.shop_price = shop_price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getPdesc() {
        return pdesc;
    }

    public void setPdesc(String pdesc) {
        this.pdesc = pdesc;
    }

    public Integer getIs_hot() {
        return is_hot;
    }

    public void setIs_hot(Integer is_hot) {
        this.is_hot = is_hot;
    }

    public Date getPdate() {
        return pdate;
    }

    public void setPdate(Date pdate) {
        this.pdate = pdate;
    }

    public Integer getCsid() {
        return csid;
    }

    public void setCsid(Integer csid) {
        this.csid = csid;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    @Override
    public String toString() {
        return "Product{" +
                "pid=" + pid +
                ", pname='" + pname + '\'' +
                ", market_price=" + market_price +
                ", shop_price=" + shop_price +
                ", image='" + image + '\'' +
                ", pdesc='" + pdesc + '\'' +
                ", is_hot=" + is_hot +
                ", pdate=" + pdate +
                ", csid=" + csid +
                ", storeId=" + storeId +
                '}';
    }
}
