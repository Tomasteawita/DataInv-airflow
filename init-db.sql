CREATE DATABASE DataInvAirflowDB;

-- Crear la tabla 'log'
CREATE TABLE log (
    id SERIAL PRIMARY KEY,
    dttm TIMESTAMP WITH TIME ZONE NOT NULL,
    event VARCHAR(255) NOT NULL,
    owner VARCHAR(255) NOT NULL,
    extra JSON NOT NULL
);

-- Crear la tabla 'connection'
CREATE TABLE connection (
    conn_id SERIAL PRIMARY KEY,
    conn_type VARCHAR(255)
);

-- Crear la tabla 'ab_user'
CREATE TABLE ab_user (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL
);

-- Crear la tabla 'ab_register_user'
CREATE TABLE ab_register_user (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL
);