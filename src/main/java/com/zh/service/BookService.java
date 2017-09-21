package com.zh.service;

import com.zh.entity.Book;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by hzheng2 on 17-9-19.
 */
public interface BookService {
    ModelAndView findAllBooks();
    ModelAndView saveBook(Book book);
}
