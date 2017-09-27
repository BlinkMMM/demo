package com.zh.controller;

import com.zh.entity.Book;
import com.zh.service.BookService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

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
    public ModelAndView showAllBooks() {
        ModelAndView mv = bookService.findAllBooks();
        mv.setViewName("/index");
        return mv;
    }

    @RequestMapping(value = "/addBook", method = RequestMethod.POST)
    public ModelAndView addBook(Book book) {
        ModelAndView mv = bookService.saveBook(book);
        mv.setViewName("/index");
        return mv;
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public ModelAndView goHome() {
        ModelAndView mv = new ModelAndView("redirect:/index.jsp");
        return mv;
    }

    @RequestMapping(value = "/showBooksWithJson", method = RequestMethod.POST)
    public void showBooksWithJson(PrintWriter printWriter) {
        List<Book> bookList = bookService.findBooks();
        JSONArray jsonArray = JSONArray.fromObject(bookList);
        String jsonString = jsonArray.toString();
        printWriter.write(jsonString);
    }

    @RequestMapping(value = "/getData", method = RequestMethod.POST)
    public ModelAndView getData(HttpServletRequest request, HttpServletResponse response) {
        //request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("utf-8");
        ModelAndView mv = new ModelAndView();
        String s = request.getParameter("GXY");
        JSONObject jsonObject = JSONObject.fromObject(s);
        System.out.println(jsonObject);
        mv.setViewName("/index");
        return mv;
    }


}
