package dao;

import com.zh.dao.BookDao;
import com.zh.entity.Book;
import org.junit.Before;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.testng.annotations.Test;

import java.util.List;

/**
 * Created by hzheng2 on 17-9-19.
 */
public class BookDaoTest {
    private ApplicationContext ctx;
    private BookDao bookDao;

    @Before
    public void setUp() throws Exception {
        ctx = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        bookDao = ctx.getBean(BookDao.class);
    }
    @Test
    public void testSaveBook(){
        Book book = new Book(3,"三国演义",88,"罗贯中");
        Book book1 = bookDao.saveBook(book);
        System.out.println("====="+book1);
    }
    @Test
    public void testFindAllBook(){
        List<Book> list = bookDao.findAllBook();
        System.out.println(list);
    }
}
