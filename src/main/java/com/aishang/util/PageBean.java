package com.aishang.util;

import java.util.List;

public class PageBean<T> {
    private Integer pageNow;
    private Integer rowCount;
    private Integer pageSize;
    private Integer pageCount;
    private List<T> list;
    private Integer startLimit;

    public Integer getStartLimit() {
        return startLimit;
    }

    public void setStartLimit(Integer startLimit) {
        this.startLimit = startLimit;
    }

    public Integer getPageNow() {
        return pageNow;
    }

    public void setPageNow(Integer pageNow) {
        this.pageNow = pageNow;
    }

    public Integer getRowCount() {
        return rowCount;
    }

    public void setRowCount(Integer rowCount) {
        this.rowCount = rowCount;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageCount() {
        return pageCount;
    }

    public void setPageCount(Integer pageCount) {
        this.pageCount = pageCount;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}
