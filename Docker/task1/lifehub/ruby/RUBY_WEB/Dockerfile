FROM ruby:3.0

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  yarn \
  libvips \
  sqlite3 \
  && rm -rf /var/lib/apt/lists/*

# Tạo thư mục app
WORKDIR /lifehub/ruby/RUBY_WEB/

# Copy Gemfile trước để cache layer gem
COPY Gemfile Gemfile.lock /lifehub/ruby/RUBY_WEB/

# Cài gem (không dùng bundler deployment mode trong dev)
RUN gem install bundler 
RUN gem install bundle
RUN gem install rails
# Copy toàn bộ mã nguồn vào container
COPY . /lifehub/ruby/RUBY_WEB/

# Cài node modules nếu có package.json (optional)
# RUN yarn install --check-files

# Thiết lập biến môi trường mặc định
ENV RAILS_ENV=development \
    NODE_ENV=development \
    BUNDLE_PATH=/gems

# Mở cổng mặc định của Rails dev server
EXPOSE 3000

# Lệnh mặc định khi container chạy
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
