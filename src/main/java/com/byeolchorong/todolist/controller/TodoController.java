package com.byeolchorong.todolist.controller;

import com.byeolchorong.todolist.domain.Todo;
import com.byeolchorong.todolist.service.TodoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/todos")
public class TodoController {

  private final TodoService todoService;
  
  public TodoController(TodoService todoService) {
    this.todoService = todoService;
  }
  
  @GetMapping
  public String todos(Model model) {
    model.addAttribute("todos", todoService.findAll());
    return "todos";
  }
  
  @PostMapping
  public String addTodo(@RequestParam("title") String title) {
    Todo todo = new Todo();
    todo.setTitle(title);
    todo.setCompleted(false);
    
    todoService.save(todo);
    
    return "redirect:/todos";
  }

  @PutMapping("{id}")
  @ResponseBody
  public Todo update(@PathVariable Long id, @RequestBody Todo todo) {
    return todoService.update(id, todo);
  }

  @PutMapping("/{id}/completed")
  @ResponseBody
  public Todo updateCompleted(@PathVariable Long id, @RequestBody Todo todo) {
    return todoService.updateCompleted(id, todo.isCompleted());
  }
  
  @DeleteMapping("/{id}")
  @ResponseBody
  public void delete(@PathVariable Long id) {
    todoService.deleteById(id);
  }
}
