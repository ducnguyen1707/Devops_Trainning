# =========================
# Stage 1: Build ứng dụng React
# =========================
FROM node:22-alpine 



# Tạo thư mục làm việc trong container
WORKDIR /lifehub/node/

# Copy file cấu hình trước để cài dependencies
#package.json: liệt kê package + version mong muốn.
#package-lock.json: ghi lại version chính xác của từng package đã cài.

COPY package.json /lifehub/node/

COPY src /lifehub/node/src
# Cài dependencies
RUN npm install

# Copy toàn bộ source code
# COPY ./src/ /lifehub/node/
 
# Chạy server dev
CMD ["npm", "start"]

# Port mapping
# docker run -d -p 5173:5173 react_web