# Todo List

## 소개
간단한 할 일 관리 기능을 구현한 토이 프로젝트입니다.  
Spring Boot 기반으로 CRUD 흐름과 MVC 구조를 이해하기 위해 제작했습니다.

---

## 기술 스택
- Backend: Java 17, Spring Boot
- Database: MySQL
- Frontend: JSP, JavaScript (Fetch API)
- UI: Bootstrap

---

## 주요 기능
- 할 일 등록 / 목록 조회 / 수정 / 삭제
- 완료 상태 변경 (체크박스 기반)
- Fetch API를 활용한 비동기 요청 처리
- Bootstrap 기반 UI 구성

---

## API 설계
| 기능 | Method | URL |
|------|--------|-----|
| 목록 조회 | GET | /todos |
| 등록 | POST | /todos |
| 수정 | PUT | /todos/{id} |
| 삭제 | DELETE | /todos/{id} |
| 완료 상태 변경 | PUT | /todos/{id}/completed |

---

## 프로젝트 구조
Controller → Service → Repository 구조로 구성하여  
계층 간 역할을 분리하고 데이터 흐름을 이해하는 데 집중했습니다.

---

## 실행 방법
1. MySQL 실행
2. DB 및 테이블 생성

```sql
CREATE TABLE todo (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    completed BOOLEAN DEFAULT FALSE
);
