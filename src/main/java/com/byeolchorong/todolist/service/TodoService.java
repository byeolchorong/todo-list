package com.byeolchorong.todolist.service;

import com.byeolchorong.todolist.domain.Todo;
import com.byeolchorong.todolist.repository.TodoRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TodoService {
  
  private final TodoRepository todoRepository;

  public TodoService(TodoRepository todoRepository) {
    this.todoRepository = todoRepository;
  }

  public Todo save(Todo todo) {
    return todoRepository.save(todo);
  }
  
  public List<Todo> findAll() {
    return todoRepository.findAll();
  }
  
  public Todo update(Long id, Todo todo) {
    Todo findTodo = todoRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("해당 할 일이 없습니다."));
    
    findTodo.setTitle(todo.getTitle());
    findTodo.setCompleted(todo.isCompleted());
    
    return todoRepository.save(findTodo);
  }

  public Todo updateCompleted(Long id, boolean completed) {
    Todo findTodo = todoRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("해당 할 일이 없습니다."));
    
    findTodo.setCompleted(completed);
    
    return todoRepository.save(findTodo);
  }
  
  public void deleteById(Long id) {
    todoRepository.deleteById(id);
  }
  
}
