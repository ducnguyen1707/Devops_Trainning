# Sử dụng Python 3.12.3 làm base image
FROM python:3.12.3-slim AS django-server

# Thiết lập thư mục làm việc bên trong container
WORKDIR /lifehub/django

# Copy file requirements.txt vào container
COPY requirements.txt .

# Cài đặt dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy toàn bộ source code Django vào container
COPY . .



# Lệnh chạy Django khi container khởi động
CMD ["sh", "-c", "python manage.py runserver ${DJANGO_HOST}:${DJANGO_PORT}"]
