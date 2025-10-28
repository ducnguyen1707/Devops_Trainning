FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory to the Django app folder containing manage.py
WORKDIR /lifehub_v2/django/app

# Copy contents of current directory (lifehub_v2/django/) into container at /lifehub_v2/django/
COPY . /lifehub_v2/django/

# Install Django (and upgrade pip)
RUN pip install --upgrade pip && pip install django

# Expose port 8083
EXPOSE 8083

# Run Django development server binding to all interfaces on port 8083
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8083"]
