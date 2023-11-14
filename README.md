# Airflow Development Docker Instance

```
# Run Docker Image
docker build -t airflowdev . 
docker run --name airflowdev --port 8080:8080 --volume ./dags:/airflow/dags -d airflowdev
```