# API 명세서

## 목차

- [회원가입 API](#회원가입-api)
- [로그인 API](#로그인-api)
- [일기 생성 API](#일기-생성-api)
- [일기 목록 조회 API](#일기-목록-조회-api)
- [일기 수정 API](#일기-수정-api)
- [일기 삭제 API](#일기-삭제-api)
- [게시글 생성 API](#게시글-생성-api)
- [게시글 목록 조회 API](#게시글-목록-조회-api)
- [게시글 수정 API](#게시글-수정-api)
- [게시글 삭제 API](#게시글-삭제-api)
- [댓글 생성 API](#댓글-생성-api)
- [댓글 목록 조회 API](#댓글-목록-조회-api)

## 회원가입 API

- **엔드포인트**: `api/register/`
- **메소드**: `POST`
- **권한**: 모든 사용자 접근 가능
- **설명**: 새로운 사용자를 등록합니다.
- **요청 바디**:
  ```json
  {
      "username": "string",
      "password": "string"
  }
  ```
- **응답**:
  - **성공 (201 Created)**
    ```json
    {
        "id": "int",
        "username": "string"
    }
    ```
  - **실패 (400 Bad Request)**
    ```json
    {
        "error": "에러 메시지"
    }
    ```

## 로그인 API

- **엔드포인트**: `api/login/`
- **메소드**: `POST`
- **권한**: 모든 사용자 접근 가능
- **설명**: 사용자 로그인 인증을 수행합니다.
- **요청 바디**:
  ```json
  {
      "username": "string",
      "password": "string"
  }
  ```
- **응답**:
  - **성공 (200 OK)**
    ```json
    {
        "message": "Login successful"
    }
    ```
  - **실패 (400 Bad Request)**
    ```json
    {
        "error": "Invalid credentials"
    }
    ```

## 일기 생성 API

- **엔드포인트**: `api/diaries/create/`
- **메소드**: `POST`
- **권한**: 인증된 사용자만 접근 가능
- **설명**: 새로운 일기를 생성합니다.
- **요청 바디**:
  ```json
  {
      "title": "string",
      "content": "string"
  }
  ```
- **응답**:
  - **성공 (201 Created)**
    ```json
    {
        "id": "int",
        "user": "int",
        "title": "string",
        "content": "string",
        "created_at": "datetime"
    }
    ```
  - **실패 (400 Bad Request)**
    ```json
    {
        "error": "에러 메시지"
    }
    ```

## 일기 목록 조회 API

- **엔드포인트**: `api/diaries/list/`
- **메소드**: `GET`
- **권한**: 인증된 사용자만 접근 가능
- **설명**: 현재 로그인한 사용자의 모든 일기 목록을 조회합니다.
- **응답**:
  - **성공 (200 OK)**
    ```json
    [
        {
            "id": "int",
            "user": "int",
            "title": "string",
            "content": "string",
            "created_at": "datetime"
        },
        ...
    ]
    ```
  - **실패 (401 Unauthorized)**
    ```json
    {
        "error": "인증 필요"
    }
    ```

## 일기 수정 API

- **엔드포인트**: `api/diaries/<int:pk>/update/`
- **메소드**: `PUT` 또는 `PATCH`
- **권한**: 인증된 사용자만 접근 가능
- **설명**: 특정 일기를 수정합니다.
- **요청 바디**:
  ```json
  {
      "title": "string",
      "content": "string"
  }
  ```
- **응답**:
  - **성공 (200 OK)**
    ```json
    {
        "id": "int",
        "user": "int",
        "title": "string",
        "content": "string",
        "created_at": "datetime"
    }
    ```
  - **실패 (400 Bad Request)**
    ```json
    {
        "error": "에러 메시지"
    }
    ```
  - **실패 (404 Not Found)**
    ```json
    {
        "error": "일기를 찾을 수 없습니다."
    }
    ```

## 일기 삭제 API

- **엔드포인트**: `api/diaries/<int:pk>/delete/`
- **메소드**: `DELETE`
- **권한**: 인증된 사용자만 접근 가능
- **설명**: 특정 일기를 삭제합니다.
- **응답**:
  - **성공 (204 No Content)**
  - **실패 (404 Not Found)**
    ```json
    {
        "error": "일기를 찾을 수 없습니다."
    }
    ```

## 게시글 생성 API

- **엔드포인트**: `posts/create/`
- **메소드**: `POST`
- **권한**: 인증된 사용자만 접근 가능
- **설명**: 새로운 게시글을 생성합니다.
- **요청 바디**:
  ```json
  {
      "title": "string",
      "content": "string"
  }
  ```
- **응답**:
  - **성공 (201 Created)**
    ```json
    {
        "id": "int",
        "user": "int",
        "title": "string",
        "content": "string",
        "created_at": "datetime"
    }
    ```
  - **실패 (400 Bad Request)**
    ```json
    {
        "error": "에러 메시지"
    }
    ```

## 게시글 목록 조회 API

- **엔드포인트**: `posts/`
- **메소드**: `GET`
- **권한**: 인증된 사용자만 접근 가능
- **설명**: 모든 게시글의 목록을 조회합니다.
- **응답**:
  - **성공 (200 OK)**
    ```json
    [
        {
            "id": "int",
            "user": "int",
            "title": "string",
            "content": "string",
            "created_at": "datetime"
        },
        ...
    ]
    ```
  - **실패 (401 Unauthorized)**
    ```json
    {
        "error": "인증 필요"
    }
    ```

## 게시글 수정 API

- **엔드포인트**: `posts/update/<int:pk>/`
- **메소드**: `PUT` 또는 `PATCH`
- **권한**: 인증된 사용자만 접근 가능
- **설명**: 특정 게시글을 수정합니다.
- **요청 바디**:
  ```json
  {
      "title": "string",
      "content": "string"
  }
  ```
- **응답**:
  - **성공 (200 OK)**
    ```json
    {
        "id": "int",
        "user": "int",
        "title": "string",
        "content": "string",
        "created_at": "datetime"
    }
    ```
  - **실패 (400 Bad Request)**
    ```json
    {
        "error": "에러 메시지"
    }
    ```
  - **실패 (404 Not Found)**
    ```json
    {
        "error": "게시글을 찾을 수 없습니다."
    }
    ```

## 게시글 삭제 API

- **엔드포인트**: `posts/delete/<int:pk>/`
- **메소드**: `DELETE`
- **권한**: 인증된 사용자만 접근 가능
- **설명**: 특정 게시글을 삭제합니다.
- **응답**:
  - **성공 (204 No Content)**
  - **실패 (404 Not Found)**
    ```json
    {
        "error": "게시글을 찾을 수 없습니다."
    }
    ```

## 댓글 생성 API

- **엔드포인트**: `comments/create/`
- **메소드**: `POST`
- **권한**: 인증된 사용자만 접근 가능
- **설명**: 새로운 댓글을 등록합니다.
- **요청 바디**:
  ```json
  {
      "post": "int",
      "content": "string"
  }
  ```
- **응답**:
  - **성공 (201 Created)**
    ```json
    {
        "id": "int",
        "user": "int",
        "post": "int",
        "content": "string",
        "created_at": "datetime"
    }
    ```
  - **실패 (400 Bad Request)**
    ```json
    {
        "error": "에러 메시지"
    }
    ```

## 댓글 목록 조회 API

- **엔드포인트**: `posts/<int:post_id>/comments/`
- **메소드**: `GET`
- **권한**: 인증된 사용자만 접근 가능
- **설명**: 특정 게시글의 모든 댓글을 조회합니다.
- **응답**:
  - **성공 (200 OK)**
    ```json
    [
        {
            "id": "int",
            "user": "int",
            "post": "int",
            "content": "string",
            "created_at": "datetime"
        },
        ...
    ]
    ```
  - **실패 (404 Not Found)**
    ```json
    {
        "error": "게시글을 찾을 수 없습니다."
    }
    ```

