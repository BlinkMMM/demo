package com.zh.service.impl;

import com.zh.dao.BookDao;
import com.zh.entity.Book;
import com.zh.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by hzheng2 on 17-9-19.
 */
@Service(value = "bookService")
@Scope("prototype")
public class BookServiceImpl implements BookService{
    @Autowired
    private BookDao bookDao;
    public ModelAndView findAllBooks() {
        ModelAndView mv = new ModelAndView();
        List<Book> bookList = bookDao.findAllBook();
        mv.addObject("bookList",bookList);
        return mv;
    }

    public ModelAndView saveBook(Book book) {
        ModelAndView mv = new ModelAndView();
        bookDao.saveBook(book);
        return mv;
    }

    public List<Book> findBooks() {
        List<Book> bookList = bookDao.findAllBook();
        return bookList;
    }
}
