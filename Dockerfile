from python:3.9
WORKDIR/app
COPY flask_app.
RUN pip install -r requirements.txt

ENV FLASK_APP=app.py
ENV FLASK_ENV=production
EXPOSE 5000
CMD ["flask", "run", "--host", "0.0.0.0", "--port", "5000"]

COPY fastapi_app.
RUN pip install -r requirements.txt
EXPOSE 8000
CMD["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]

Flask==2.1.0

fastapi==0.73.0
uvicorn[standard]==0.15.0

version:"3"
services:
  flask:
    build:
      context:./flask.app
    ports:
       -"5000:5000"
  fastapi:
    build:
       context: ./fastapi_app
    ports:
      - "8000:8000
      
docker-compose up -- build"
