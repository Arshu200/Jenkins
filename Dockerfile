FROM python:2.7-alpine
RUN pip install web.py 
WORKDIR /app
COPY . /app
EXPOSE 8080
ENTRYPOINT ["python", "addition.py"]
