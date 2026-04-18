function toggleCompleted(id, completed) { // 완료 상태 바꾸는 함수
  fetch('/todos/' + id + '/completed', {  // 서버에 수정 요청 보내기
    method: 'put',                        // put: 수정
    headers: {
      'Content-Type': 'application/json'  // 내가 보내는 데이터는 JSON 형식
    },
    body: JSON.stringify({
      completed: completed
    })
  })
    .then(response => {
      if (!response.ok) {
        throw new Error('완료 상태 변경 실패');
      }
      return response.json();
    })
    .then(data => {
      location.reload();
    })
    .catch(error => {
      alert('완료 상태 변경 중 오류가 발생했습니다.');
    });
}
function saveTodo(id, completed) {
  const newTitle = document.getElementById('title-input-' + id).value;

  if (newTitle.trim() === '') {
    alert('제목을 입력해주세요.');
    return;
  }

  fetch('/todos/' + id, {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      title: newTitle,
      completed: completed
    })
  })
    .then(response => {
      if (!response.ok) {
        throw new Error('수정 실패');
      }
      return response.json();
    })
    .then(data => {
      location.reload();
    })
    .catch(error => {
      alert('수정 중 오류 발생');
    });
}
function showEdit(id) {
  document.getElementById('title-text-' + id).style.display = 'none';
  document.getElementById('title-input-' + id).style.display = 'inline';

  document.getElementById('edit-btn-' + id).style.display = 'none';
  document.getElementById('save-btn-' + id).style.display = 'inline';
  document.getElementById('cancel-btn-' + id).style.display = 'inline';
}

function cancelTodo(id) {
  const originalTitle = document.getElementById('title-text-' + id).innerText;

  // 입력값 원래 제목으로 복구
  document.getElementById('title-input-' + id).value = originalTitle;

  // 입력창 숨기기
  document.getElementById('title-input-' + id).style.display = 'none';

  // 기존 텍스트 다시 보이기
  document.getElementById('title-text-' + id).style.display = 'inline';

  // 버튼 원상복구
  document.getElementById('edit-btn-' + id).style.display = 'inline';
  document.getElementById('save-btn-' + id).style.display = 'none';
  document.getElementById('cancel-btn-' + id).style.display = 'none';
}

function deleteTodo(id) {
  fetch('/todos/' + id, {
    method: 'DELETE'
  })
    .then(response => {
      if (!response.ok) {
        throw new Error('삭제 실패');
      }
      location.reload();
    })
    .catch(error => {
      alert('삭제 중 오류가 발생하였습니다.');
    })
}