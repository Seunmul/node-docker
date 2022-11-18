# 어떤 환경에서 도커 이미지를 만들지 결정하기.
FROM node:lts-slim

# 도커 컨테이너 내부의 작업 디렉토리 결정하기. 원하는 대로 정하면 됩니다.
WORKDIR /app

# 외부 패키지 설치를 위해 package.json과 yarn.lock 파일 복사
COPY package.json .
COPY package-lock.json .

# 패키지 설치
RUN npm install

# 나머지 모두 복사
COPY . .

# 패키지 빌드 (배포용)
RUN npm run build

# 도커 컨테이너에 접근할 수 있게 포트 열어주기
EXPOSE 3000

# 앱 실행시키기
CMD [ "npm", "start" ]