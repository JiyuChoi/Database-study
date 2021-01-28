## 📌 Git 명령어

### git clone
* 저장할 위치 입력<br>
  cd Desktop (이름 모르면 ls로 알아보기)
* 레파지토리 url 입력<br>
  git clone https://github.com/JiyuChoi/TIL.git
 
### git status
* 현재 상태 확인 (add나 commit 전에 자주 확인하는 습관 들이기)
<br>

## 📌 협업시 자주 사용하는 명령어

### git pull origin master
* master의 파일을 받는 것

### git branch
* 현재 master에 있는지 어디 branch에 있는지 확인
* git branch branch_name은 branch 생성

### git checkout branch_name (or master)
* branch나 master 선택 (들어감)

### git add .(or 파일명)
* .은 수정한 파일 전부 add

### git commit -m "commit 메세지"
* 선택한 코드(파일) 설명적기 (수정, 추가, 삭제 등등)

### git push origin branch_name(or master)
* branch나 master에 push

### git merge branch_name
* 브랜치에서 변경된 내용을 master로 추가

### pull requests 확인해서 merge 작업 진행
* 충돌나면 해결야지만 merge 가능
