FROM python:3.7

ENV PYTHONUNBUFFERED 1

RUN mkdir /app
WORKDIR /app

# Copying & Installing python requirements
COPY requirements.txt /app/
RUN pip3 install -r requirements.txt

# Syncing the source of the application
COPY . /app/

EXPOSE 8000

# Run the gunicorn web server
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
