# docker-compose.yaml 파일 다운로드
# curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.3.3/docker-compose.yaml'

# 폴더 생성
mkdir -p ./dags ./logs ./plugins
# 현재 유저의 uid
echo -e "AIRFLOW_UID=$(id -u)" > .env

# airflow 초기화
# docker-compose up airflow-init

# airflow 시작
docker-compose up

# ID : airflow
# PW : airflow