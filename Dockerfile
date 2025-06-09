# Gunakan image dasar Python dengan TensorFlow
FROM python:3.10-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Buat direktori kerja
WORKDIR /app

# Salin semua file ke container
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir \
    flask \
    flask-cors \
    tensorflow \
    numpy \
    pillow \
    opencv-python-headless

# Expose port Flask
EXPOSE 5000

# Jalankan API
CMD ["python", "api.py"]
