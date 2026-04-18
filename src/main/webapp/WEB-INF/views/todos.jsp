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

  <div class="card p-4 mb-4 shadow-sm">
    <h2 class="h5 mb-3">할 일 등록</h2>

    <form action="/todos" method="post" class="d-flex gap-2">
      <input type="text" name="title"
             class="form-control"
             placeholder="할 일을 입력하세요">

      <button type="submit" class="btn btn-primary">등록</button>
    </form>
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

          <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">

            <div class="d-flex align-items-center gap-2 flex-grow-1">

              <span class="text-muted">${status.index + 1}</span>

              <!-- 평소 -->
              <span id="title-text-${todo.id}" class="fw-medium">
                  ${todo.title}
              </span>

              <!-- 수정 -->
              <input type="text"
                     id="title-input-${todo.id}"
                     value="${todo.title}"
                     class="form-control"
                     style="display:none; max-width: 200px;">

              <span class="badge bg-secondary">
                  ${todo.completed ? "완료" : "미완료"}
              </span>

              <input type="checkbox"
                     class="form-check-input"
                ${todo.completed ? "checked" : ""}
                     onchange="toggleCompleted(${todo.id}, this.checked)">
            </div>

            <div class="d-flex gap-2 mt-2 mt-md-0">

              <button type="button"
                      id="edit-btn-${todo.id}"
                      class="btn btn-sm btn-outline-secondary"
                      onclick="showEdit(${todo.id})">
                수정
              </button>

              <button type="button"
                      class="btn btn-sm btn-outline-danger"
                      onclick="deleteTodo(${todo.id})">
                삭제
              </button>

              <button type="button"
                      id="save-btn-${todo.id}"
                      class="btn btn-sm btn-success"
                      onclick="saveTodo(${todo.id}, ${todo.completed})"
                      style="display:none;">
                저장
              </button>

              <button type="button"
                      id="cancel-btn-${todo.id}"
                      class="btn btn-sm btn-warning"
                      onclick="cancelTodo(${todo.id})"
                      style="display:none;">
                취소
              </button>
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