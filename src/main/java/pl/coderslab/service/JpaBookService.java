package pl.coderslab.service;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import pl.coderslab.model.Book;
import pl.coderslab.repository.BookRepository;

import java.util.List;
import java.util.Optional;

@Service
@Primary
public class JpaBookService  implements BookService{

    private final BookRepository bookRepository;

    public JpaBookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }


    @Override
    public List<Book> getBooks() {
        return bookRepository.findAll();
    }

    @Override
    public void add(Book book) {
        bookRepository.save(book);
    }

    @Override
    public Optional<Book> get(Long id) {
        return bookRepository.findById(id).stream().filter(item -> item.getId().equals(id)).findFirst();
//        return Optional.empty();
    }

    @Override
    public void delete(Long id) {
        bookRepository.deleteById(id);
    }

    @Override
    public void update(Book book) {
        bookRepository.save(book);
    }

    public List<Book> sortByIsbn(String isbn){
        return bookRepository.findByIsbn(isbn);
    }

    public List<Book> sortByTitle(String title){
        return bookRepository.findByTitle(title);
    }

    public List<Book> sortByAuthor(String author){
        return bookRepository.findByAuthor(author);
    }
    public List<Book> sortByPublisher(String publisher){
        return bookRepository.findByPublisher(publisher);
    }
    public List<Book> sortByType(String type){
        return bookRepository.findByType(type);
    }

}
