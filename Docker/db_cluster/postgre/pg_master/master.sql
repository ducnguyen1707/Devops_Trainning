-- Tạo user replication
CREATE USER replicator WITH REPLICATION ENCRYPTED PASSWORD 'replicator_password';

-- Tạo user app (nếu bạn cần ứng dụng kết nối)
CREATE ROLE appuser WITH LOGIN ENCRYPTED PASSWORD 'app_pass';

-- Tạo database chính
CREATE DATABASE appdb OWNER appuser;

-- Cấp quyền cho appuser
GRANT ALL PRIVILEGES ON DATABASE appdb TO appuser;