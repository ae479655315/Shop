package com.aishang.util;

import java.util.List;

public class PageBeanForProduct<T> extends PageBean {
   private Integer cid;
   private Integer csid;
   private String pname;

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
}
