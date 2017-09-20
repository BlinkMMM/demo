package com.zh.controller;

import com.zh.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by hzheng2 on 17-9-19.
 */
@RequestMapping("/book")
@Scope("prototype")
@Controller
public class BookController {
    @Autowired
    private BookService bookService;
    @RequestMapping(value = "/showBooks", method = RequestMethod.POST)
    public ModelAndView showAllBooks(){
        ModelAndView mv = bookService.findAllBooks();
        mv.setViewName("/index");
        return mv;
    }
}
