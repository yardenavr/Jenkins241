FROM python:3.8
WORKDIR /app
COPY . /app
ENV FLASK_APP=flask-app.py
EXPOSE 5000
RUN pip install --no-cache-dir flask
CMD ["flask", "run", "--host=0.0.0.0"]
