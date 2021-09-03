package pl.coderslab.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import pl.coderslab.model.Book;
import pl.coderslab.service.BookService;
import pl.coderslab.service.JpaBookService;

import javax.validation.Valid;
import javax.validation.Validator;
import java.util.List;

@Controller
@RequestMapping("/admin/books")
public class ManageBookController {

    private final BookService bookService;
    private final JpaBookService jpaBookService;


    @Autowired
    public ManageBookController(BookService bookService, JpaBookService jpaBookService) {
        this.bookService = bookService;
        this.jpaBookService = jpaBookService;

    }

    @GetMapping("/all")
    public String showPosts(@RequestParam(required = false) String sort,
            @RequestParam(required = false) String val,
            Model model) {
        List<Book> books = null;
        if(sort != null){
            switch (sort){
                case "isbn" : {
                   books = jpaBookService.sortByIsbn(val);
                   break;
                }
                case "title" : {
                    books = jpaBookService.sortByTitle(val);
                    break;
                }
                case "author" : {
                    books = jpaBookService.sortByAuthor(val);
                    break;
                }
                case "publisher" : {
                    books = jpaBookService.sortByPublisher(val);
                    break;
                }
                case "type" : {
                    books = jpaBookService.sortByType(val);
                    break;
                }
                default : books = bookService.getBooks();
            }
        } else {
            books = bookService.getBooks();
        }

        model.addAttribute("books", books);
        return "bookList";
    }

    @GetMapping("/add")
    public String addBook(Long id, Model model) {
        Book book = new Book();
        model.addAttribute("book", book);
        return "addBook";
    }

    @PostMapping("/add")
    public String addBook(@Valid Book book, BindingResult result) {
       if(result.hasErrors()){
           return "addBook";
       }
        bookService.add(book);
        return "redirect:/admin/books/all";
    }

    @GetMapping("/edit/{id}")
    public String editBook(@PathVariable Long id, Model model) {
        Book book = bookService.get(id).orElseThrow(() -> {
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "entity not found"
            );
        });
        model.addAttribute("book", book);
        return "addBook";
    }

    @GetMapping("/delete/{id}")
    public String deleteBook(@PathVariable Long id, Model model){
        Book book = bookService.get(id).get();
        model.addAttribute("book", book);
        return "accept";
    }

    @GetMapping("/deleteAccepted")
    public String deleteAccepted(@RequestParam Long id){
        bookService.delete(id);
        return "redirect:/admin/books/all";
    }


}