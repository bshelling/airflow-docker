FROM python:3.11-bookworm
WORKDIR /airflow

LABEL "com.gusotechnologies.vendor"="GUSO Technologies"
LABEL "com.gusotechnologies.author"="bshelling"
LABEL "com.gusotechnologies.email"="info@gusotechnologies.com"

LABEL "description"="Airflow Docker Instance for development"
LABEL "version"="1.0"

ENV AIRFLOW_VERSION=2.7.3
ENV PYTHON_VERSION=3.11
ENV CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt"
ENV AIRFLOW__CORE__DAGS_FOLDER=/airflow/dags

COPY ./requirements.txt .
COPY entrypoint.sh /etc/entrypoint.sh

RUN touch requirements.txt
RUN apt update
RUN chmod +x /etc/entrypoint.sh
RUN pip freeze > requirements.txt
RUN pip install "apache-airflow==$AIRFLOW_VERSION" --constraint "$CONSTRAINT_URL"

EXPOSE 8080

ENTRYPOINT [ "sh","/etc/entrypoint.sh" ]