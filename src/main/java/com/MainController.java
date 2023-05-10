package com;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.ExecutionException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.dao.CallApi;
import com.entity.Authors;
import com.entity.Books;

@Controller
public class MainController {
	
	
	@Autowired
	CallApi api;
	
	@RequestMapping("/login")
	public String login(HttpServletRequest req,HttpServletRequest res) throws JsonMappingException, JsonProcessingException, InterruptedException, ExecutionException {
		
		HttpSession session = req.getSession();
		Books book= new Books();
		String name=req.getParameter("username");
		String pass=req.getParameter("password");
		System.out.println(name+":"+pass);
		if(name.equals("admin") && pass.equals("admin")) {
			session.setAttribute("username", name);
			
			List<Books> list=api.getData();
//					api.postData(book);
			System.out.println(list.toString());
			req.getSession().setAttribute("list",list);
			
			return "login";
		}
		return "index";
		 
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req,HttpServletRequest res) {
		HttpSession session = req.getSession();
		session.removeAttribute("username");
		return "index";
		
	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest req,HttpServletRequest res) throws JsonMappingException, JsonProcessingException, InterruptedException, ExecutionException {
		List<Authors> AuthorList=api.getAuthors();
		req.getSession().setAttribute("AuthorList", AuthorList);
		return "add";
	}
	
	@RequestMapping("/data")
	public String dataAdd(HttpServletRequest req,HttpServletRequest res) throws InterruptedException, ExecutionException, IOException {
		//adding logic
		String bookcode = req.getParameter("bookcode");
		String bookname = req.getParameter("bookname");
		String author = req.getParameter("author");
		String dataadded = req.getParameter("datadded");
		Books book =new Books();
		book.setBookcode(bookcode);
		book.setBookname(bookname);
		book.setAuthor(author);
		book.setDataadded(dataadded);
		System.out.println("calling api");
		
		CallApi api=new CallApi();
		api.postData(book);

		List<Books> list=api.getData();
		System.out.println(list.toString());
		req.getSession().setAttribute("list",list);
		
		return "add";
	}
	@RequestMapping("/Deleted")
    public String deleteBook(HttpServletRequest req) throws InterruptedException, ExecutionException, IOException {
		String bookId = req.getParameter("id");
		api.deleteData(bookId);
		List<Books> list=api.getData();
//		api.postData(book);
			System.out.println(list.toString());
			req.getSession().setAttribute("list",list);
        return "login";
		
	}
	
	@RequestMapping("/editpage")
	public String editPage(HttpServletRequest req,HttpServletRequest res) throws InterruptedException, ExecutionException, IOException {
		String bookId = req.getParameter("id");
		List<Authors> AuthorList=api.getAuthors();
		req.getSession().setAttribute("AuthorList", AuthorList);
		return "editpage";
	}
	
	@RequestMapping("/editBook")
	public String editBook(@ModelAttribute("book") Books book, HttpServletRequest req,BindingResult result) throws InterruptedException, ExecutionException, IOException {
		String bookId = req.getParameter("id");
	    api.updateBook(bookId, book);
	    List<Books> list=api.getData();
//		api.postData(book);
			System.out.println(list.toString());
			req.getSession().setAttribute("list",list);
	    return "login";
	}


}