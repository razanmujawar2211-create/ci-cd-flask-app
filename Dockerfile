# Use Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy requirements file from app folder
COPY app/requirements.txt .

# Install dependencies
RUN pip install -r requirements.txt

# Copy all application files from app folder
COPY app/ .

# Expose port
EXPOSE 5000

# Run the app
CMD ["python", "main.py"]


