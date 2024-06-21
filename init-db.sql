CREATE DATABASE DataInvAirflowDB;

-- Crear la tabla 'log'
CREATE TABLE log (
    id SERIAL PRIMARY KEY,
    dttm TIMESTAMP WITH TIME ZONE NOT NULL,
    dag_id VARCHAR(255),
    task_id VARCHAR(255),
    map_index INT,
    event VARCHAR(255) NOT NULL,
    execution_date TIMESTAMP WITH TIME ZONE,
    run_id VARCHAR(255),
    owner VARCHAR(255) NOT NULL,
    owner_display_name VARCHAR(255),
    extra JSON 
);

-- Crear la tabla 'connection'
CREATE TABLE connection (
    conn_id SERIAL PRIMARY KEY,
    conn_type VARCHAR(255)
);

-- Crear la tabla 'ab_user'
CREATE TABLE ab_user (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    active BOOLEAN NOT NULL,
    email VARCHAR(255) NOT NULL,
    last_login TIMESTAMP WITH TIME ZONE,
    login_count INTEGER,
    fail_login_count INTEGER,
    created_on TIMESTAMP WITH TIME ZONE NOT NULL,
    changed_on TIMESTAMP WITH TIME ZONE NOT NULL,
    created_by_fk INTEGER,
    changed_by_fk INTEGER
);

-- Crear la tabla 'ab_register_user'
CREATE TABLE ab_register_user (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL
);