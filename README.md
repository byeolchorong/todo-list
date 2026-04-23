# Todo List

## 소개

할 일 등록, 조회, 수정, 삭제 및 완료 상태 변경 기능을 구현한 프로젝트입니다.
Spring MVC 구조(Controller → Service → Repository)의 흐름과 CRUD 처리 과정을 이해하기 위해 제작했습니다.

---

## 기술 스택

* Backend: Java 17, Spring Boot
* Database: MySQL
* Frontend: JSP, JavaScript (Fetch API), Bootstrap

---

## 주요 기능

* 할 일 등록 / 목록 조회 / 수정 / 삭제
* 완료 상태 변경 (체크박스 기반)
* Fetch API를 활용한 비동기 처리
* Bootstrap 기반 UI 구성

---

## API 설계

| 기능       | Method | URL                   |
| -------- | ------ | --------------------- |
| 목록 조회    | GET    | /todos                |
| 등록       | POST   | /todos                |
| 수정       | PUT    | /todos/{id}           |
| 삭제       | DELETE | /todos/{id}           |
| 완료 상태 변경 | PUT    | /todos/{id}/completed |

---

## 핵심 구현 포인트

* Controller → Service → Repository 구조 분리
* Fetch API를 활용한 비동기 요청 처리
* PUT 요청을 활용한 상태 변경 처리
* RESTful API 설계 적용

---

## 데이터 구조

```java
public class Todo {
  private Long id;
  private String title;
  private boolean completed;
}
```

---

## DB 구조

```sql
CREATE TABLE todo (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    completed BOOLEAN DEFAULT FALSE
);
```
