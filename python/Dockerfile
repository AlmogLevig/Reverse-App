FROM python:3.8.10-alpine

WORKDIR /home/PythonApp/PythonProject

ENV SHELL=/bin/bash
RUN /usr/local/bin/python -m pip install --upgrade pip 

COPY . /home/PythonApp/PythonProject

RUN pip install flask gunicorn

EXPOSE 5000
CMD gunicorn --bind 0.0.0.0:5000 wsgi:app
