# Airflow를 Kubernetes에서 설치하고 운영해보자

일단은 공식 홈페이지의 Quick Start를 따라 가본다.
https://airflow.apache.org/docs/apache-airflow/stable/start

### 1. standalone

- ./local-test/standalone.sh에서 pip를 이용해 airflow를 standalone 모드로 실행해볼 수 있다.
- 유저는 admin으로, port는 8080으로 자동 실행된다.
```
./local-test/standalone.sh
```


### 2. standalone의 각 부분을 따로 실행
- ./local-test/airflow_init.sh를 실행하면 standalone의 각 부분을 따로 실행할 수 있다.
- db를 초기화하고, 유저를 생성하고, webserver와 scheduler를 실행한다.

```
./local-test/airflow_init.sh
```

### 3. Docker
- 공식 문서에 따르면 airflow의 각 구성요소를 어떻게 바꿔야하는지 정확히 모른다면 도커 이미지나 docker-compose 파일을 고치지 말라고 한다. 
- 차라리 Airflow의 Helm으로 구성하라고 한다. ([출처](https://airflow.apache.org/docs/apache-airflow/stable/start/docker.html))
- docker의 메모리가 최소 4GB 필요하다. 8GB RAM의 M1 Mac에서 기본 설정(4GB)로 실행하니 메모리 부족 메시지가 떴다.

```
## install
./docker-test/install.sh

## delete
docker-compose down --volumes --remove-orphans

## airflow 명령어
# docker-compose run airflow-worker airflow info
# 위 방법은 매번 docker-compose run airflow-worker를 통해 명령어를 전달해야 한다. 더 짧은 명령어를 사용하기 위해 airflow.sh를 다운 받는 방법이 있다.
# curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.3.3/airflow.sh'
# chmod +x airflow.sh
./airflow.sh info
```

- 정상적으로 올라간다면 localhost:8080으로 접속하면 된다.
- ID : airflow, PW : airflow
- 
