<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
  <title>Todo List</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- CSS -->
  <link rel="stylesheet" href="/css/todos.css">
</head>
<body class="bg-light">

<div class="container mt-5">

  <h1 class="text-center mb-4">할 일 목록</h1>

  <div class="card shadow-sm mb-4 todo-form-card">
    <div class="card-body">
      <h2 class="h5 mb-3">할 일 등록</h2>
      <form action="/todos" method="post" class="d-flex gap-2 flex-column flex-sm-row">
        <input type="text" name="title" placeholder="할 일을 입력하세요" class="form-control">
        <button type="submit" class="btn btn-primary">등록</button>
      </form>
    </div>
  </div>

  <c:choose>
    <c:when test="${empty todos}">
      <div class="alert alert-secondary text-center">
        등록된 할 일이 없습니다.<br>
      </div>
    </c:when>

    <c:otherwise>
      <ul class="list-group shadow-sm">
        <c:forEach var="todo" items="${todos}" varStatus="status">

          <li class="list-group-item todo-item ${todo.completed ? 'is-completed' : ''}">
            <div class="todo-main">
              <div class="todo-text-wrap">
                <span class="todo-number">${status.index + 1}</span>
                <span id="title-text-${todo.id}" class="todo-title-text">${todo.title}</span>
                <input type="text" id="title-input-${todo.id}" value="${todo.title}" class="form-control todo-edit-input" style="display:none;">
              </div>
              <span class="badge ${todo.completed ? 'text-bg-success' : 'text-bg-secondary'}">
                  ${todo.completed ? "완료" : "진행중"}
              </span>
            </div>

            <div class="todo-actions">
              <input type="checkbox" class="form-check-input" ${todo.completed ? "checked" : ""}
                     onchange="toggleCompleted(${todo.id}, this.checked)">

              <button type="button" id="edit-btn-${todo.id}" class="btn btn-sm btn-outline-secondary" onclick="showEdit(${todo.id})">수정</button>
              <button type="button" class="btn btn-sm btn-outline-danger" onclick="deleteTodo(${todo.id})">삭제</button>
              <button type="button" id="save-btn-${todo.id}" class="btn btn-sm btn-success" onclick="saveTodo(${todo.id}, ${todo.completed})" style="display:none;">저장</button>
              <button type="button" id="cancel-btn-${todo.id}" class="btn btn-sm btn-warning" onclick="cancelTodo(${todo.id})" style="display:none;">취소</button>
            </div>
          </li>
        </c:forEach>
      </ul>
    </c:otherwise>
  </c:choose>
</div>

<script src="/js/todos.js"></script>
</body>
</html>