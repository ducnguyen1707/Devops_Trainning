# =========================
# Stage 1: Build ứng dụng React
# =========================
FROM node:22-alpine AS builder



# Tạo thư mục làm việc trong container
WORKDIR /lifehub/react/react_web

# Copy file cấu hình trước để cài dependencies
#package.json: liệt kê package + version mong muốn.
#package-lock.json: ghi lại version chính xác của từng package đã cài.
COPY package*.json ./

# Cài dependencies
RUN npm install

# Copy toàn bộ source code
COPY . .


# Mở port 5173 (mặc định của Vite)
EXPOSE 3000

# Chạy server dev
CMD ["npm", "run", "dev", "--", "--host"]

# Port mapping
# docker run -d -p 5173:5173 react_web