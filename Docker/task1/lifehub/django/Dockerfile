# Sử dụng Python 3.12.3 làm base image
FROM python:3.12.3-slim


ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Thiết lập thư mục làm việc bên trong container
WORKDIR /lifehub/django/

COPY requirements.txt /lifehub/django/
RUN pip install --upgrade pip
# Cài đặt dependencies
RUN pip install -r requirements.txt

# Copy toàn bộ source code Django vào container
COPY . /lifehub/django



# Lệnh chạy Django khi container khởi động
CMD ["sh", "-c", "python manage.py runserver 0.0.0.0:${DJANGO_PORT}"]
