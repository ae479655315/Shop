package com.aishang.util;

import java.util.List;

public class PageBeanForProduct<T> extends PageBean {
    private Integer cid;
    private Integer csid;
    private String pname;
    private String sort;
    private Integer shortId;   //店铺id
    private Integer uid;
    private String storeName;

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getShortId() {
        return shortId;
    }

    public void setShortId(Integer shortId) {
        this.shortId = shortId;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getCsid() {
        return csid;
    }

    public void setCsid(Integer csid) {
        this.csid = csid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String proName) {
        this.pname = proName;
    }

    public String getSort() {return sort;}

    public void setSort(String sort) {this.sort = sort;}

    @Override
    public String toString() {
        return "PageBeanForProduct{" +
                "cid=" + cid +
                ", csid=" + csid +
                ", pname='" + pname + '\'' +
                ", sort='" + sort + '\'' +
                '}';
    }
}
