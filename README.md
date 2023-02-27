# game_dongduk

npc 축제의 밤 개발자 공유 깃 


### opening.lua 
- 게임 시작하기 
- 동적 기능: 시작하기 버튼 누르면 -> Intro.lua 로

### intro.lua
- 양갱이와 교수님의 대화 
- tap하면 (화면 아무데나) 대화 넘어감 + 마지막 대화 후엔 -> map.lua로 이동

### map.lua
- 인문관, 숭인관, 대학원, 본관으로 이동할 수 있는 맵 (해당 관을 tap하면 해당 관내로 이동)

### soongin.lua
- 숭인관 내부
- 양갱이가 키오스크로 가면 미니게임이 시작 -> card_game.lua  <--------아직 구현중(현재는 아무거나 tap)

### card_game.lua
- 미니게임: 카드 뒤집기 
- 30초이전 = A+, 30~60초 = B, 60초 이상 = F <----- 아직 구현중

### F_ending.lua (나중에 이름 바꿀 예정)
- 미니게임 엔딩: 게임 다시하기 or 맵으로 이동 

### inmoon.lua
- 인문관 내부
- 양갱이가 문으로 가면 미니게임이 시작 -> miro_game.lua <--------아직 구현중(현재는 문을 tap)

### miro_game.lua
- 미로게임 설명
- skip 버튼 누르면 -> miro_game2.lua

### miro_game2.lua
- 미로게임 
- 화살표를 누르면 양갱이가 움직임
