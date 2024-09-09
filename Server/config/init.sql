-- init.sql
\c test_db;

CREATE TABLE IF NOT EXISTS creds (
    uid SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    numberOfResumes INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS personal_information (
    uid SERIAL PRIMARY KEY,
    creds_uid INT REFERENCES creds(uid),
    full_name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS additional_information (
    id SERIAL PRIMARY KEY,
    location VARCHAR(255),
    profession VARCHAR(255),
    about_me TEXT,
    soft_skills TEXT[],
    technical_skills TEXT[],
    languages TEXT[]
);

CREATE TABLE IF NOT EXISTS social_media (
    uid SERIAL PRIMARY KEY,
    creds_uid INT REFERENCES creds(uid),
    linkedin VARCHAR(255),
    github VARCHAR(255),
    twitter VARCHAR(255),
    facebook VARCHAR(255),
    instagram VARCHAR(255),
    portfolio VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS user_experience (
    uid SERIAL PRIMARY KEY,
    additional_info_id INT REFERENCES additional_information(id),
    company_name VARCHAR(255) NOT NULL,
    position VARCHAR(255) NOT NULL,
    start_date INT NOT NULL,
    end_date INT,
    description TEXT
);

CREATE TABLE IF NOT EXISTS user_fun_projects (
    uid SERIAL PRIMARY KEY,
    additional_info_id INT REFERENCES additional_information(id),
    project_name VARCHAR(255) NOT NULL,
    project_description TEXT NOT NULL,
    project_link VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS user_professional_projects (
    uid SERIAL PRIMARY KEY,
    additional_info_id INT REFERENCES additional_information(id),
    project_name VARCHAR(255) NOT NULL,
    project_description TEXT NOT NULL,
    project_link VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS user_education (
    uid SERIAL PRIMARY KEY,
    additional_info_id INT REFERENCES additional_information(id),
    school_name VARCHAR(255) NOT NULL,
    field_of_study VARCHAR(255) NOT NULL,
    degree VARCHAR(255),
    start_date INT NOT NULL,
    end_date INT
);

CREATE TABLE IF NOT EXISTS user_references (
    uid SERIAL PRIMARY KEY,
    additional_info_id INT REFERENCES additional_information(id),
    full_name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL,
    profession VARCHAR(255) NOT NULL
);