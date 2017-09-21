package com.zh.dao;

import com.zh.entity.Book;

import java.util.List;

/**
 * Created by hzheng2 on 17-9-19.
 */
public interface BookDao {
    Book findBookByName(String name);
    List<Book> findAllBook();
    boolean saveBook(Book book);
    Book deleteBookById(int id);
    Book updateBookById(int id);
}
