FROM python:3.11-slim

# 设置为中国国内源（针对 Bookworm/Debian 12）
RUN rm -rf /etc/apt/sources.list.d/* && \
    echo "deb http://mirrors.ustc.edu.cn/debian bookworm main" > /etc/apt/sources.list && \
    echo "deb http://mirrors.ustc.edu.cn/debian bookworm-updates main" >> /etc/apt/sources.list && \
    echo "deb http://mirrors.ustc.edu.cn/debian-security bookworm-security main" >> /etc/apt/sources.list

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    libcurl4-openssl-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first to leverage Docker cache
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

# Copy the rest of the application
COPY . .

# Expose the port the app runs on
EXPOSE 7860

# Environment variables with defaults
ENV OPENAI_API_KEY=None
ENV ENVIRONMENT="production"
ENV PORT=7860

# Command to run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "7860"] 
