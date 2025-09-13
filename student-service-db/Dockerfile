FROM postgres:16

ENV POSTGRES_USER=admin
ENV POSTGRES_PASSWORD=password
ENV POSTGRES_DB=student_db

COPY ./init.sql /docker-entrypoint-initdb.d/

EXPOSE 5432
