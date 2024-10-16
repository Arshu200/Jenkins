# addition.py
FROM python:2.7-alpine

LABEL maintainer="arshad22shaik@gmail.com"

RUN pip install web.py 

WORKDIR /app

COPY . /app

EXPOSE 8080

ENTRYPOINT ["python", "addition.py"]
