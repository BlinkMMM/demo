package com.zh.service.impl;

import com.zh.dao.BookDao;
import com.zh.entity.Book;
import com.zh.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by hzheng2 on 17-9-19.
 */
public class BookServiceImpl implements BookService{
    @Autowired
    private BookDao bookDao;
    public ModelAndView findAllBooks() {
        ModelAndView mv = new ModelAndView();
        List<Book> bookList = bookDao.findAllBook();
        mv.addObject("bookList",bookList);
        return mv;
    }
}
