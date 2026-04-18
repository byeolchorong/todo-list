package com.byeolchorong.todolist.repository;

import com.byeolchorong.todolist.domain.Todo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TodoRepository extends JpaRepository<Todo, Long> {

}
