# Ponerle una version mas actualizada de airflow
FROM apache/airflow:2.6.2

USER root

# Update and install required packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    openjdk-11-jdk \
    ant && \
    rm -rf /var/lib/apt/lists/*

# Set JAVA_HOME
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

USER airflow

# Install Apache Spark provider
RUN pip install apache-airflow-providers-apache-spark

# Copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Upgrade Airflow database
RUN airflow db upgrade