airflow db init

airflow users create \
    --username test-user \
    --firstname test \
    --lastname test \
    --role Admin \
    --email spiderman@superhero.org

airflow webserver --port 8282

airflow scheduler