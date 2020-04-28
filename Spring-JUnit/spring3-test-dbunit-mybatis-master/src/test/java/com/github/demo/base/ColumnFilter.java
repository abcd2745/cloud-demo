package com.github.demo.base;

import org.dbunit.dataset.Column;
import org.dbunit.dataset.filter.IColumnFilter;

public class ColumnFilter implements IColumnFilter {

    @Override
    public boolean accept(String tableName, Column column) {
        return !(tableName.equals("t_user")
                && (
                column.getColumnName().equals("id")
                        || column.getColumnName().equals("create_datetime")
                        || column.getColumnName().equals("update_datetime")
        )
        );
    }
}