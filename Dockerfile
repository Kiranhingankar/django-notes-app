FROM python:3.9

WORKDIR /app/backend

# Install dependencies for MySQL client if needed
RUN apt-get update \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN pip install gunicorn  # Needed for running production server

# Copy project files
COPY . .

# Expose port 8000 for testing
EXPOSE 8000

# Run Django app for testing
CMD python manage.py runserver 0.0.0.0:8000
