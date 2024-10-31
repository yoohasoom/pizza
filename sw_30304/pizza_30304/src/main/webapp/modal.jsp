<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Modal Example</title>
<style>
  /* 기본 스타일 */
  body {
    font-family: Arial, sans-serif;
  }
  
  /* 모달 배경 스타일 */
  .modal-background {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.9); /* 검은색 배경 */
    justify-content: center;
    align-items: center;
  }

  /* 모달 컨텐츠 스타일 */
  .modal-content {
    background-color: white;
    padding: 20px;
    border-radius: 8px;
    width: 300px;
    border: 2px solid #333; /* 검은색 테두리 */
    text-align: center;
  }

  /* 닫기 버튼 스타일 */
  .close-button {
    margin-top: 15px;
    padding: 10px;
    background-color: #333;
    color: white;
    border: none;
    cursor: pointer;
  }
</style>
</head>
<body>

<!-- 모달 배경 -->
<div class="modal-background" id="modalBackground">
  <!-- 모달 컨텐츠 -->
  <div class="modal-content">
    <h2>모달창</h2>
    <p>이 모달창은 검은 배경 위에 표시됩니다.</p>
    <button class="close-button" onclick="closeModal()">닫기</button>
  </div>
</div>

<button onclick="openModal()">모달 열기</button>

<script>
  function openModal() {
    document.getElementById('modalBackground').style.display = 'flex';
  }

  function closeModal() {
    document.getElementById('modalBackground').style.display = 'none';
  }
</script>

</body>
</html>
