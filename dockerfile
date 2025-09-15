# Use a lightweight base image
FROM python:3.10-slim

# Set environment variables to prevent Python from writing .pyc files and buffer output
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory inside the container
WORKDIR /app

# Copy only the required files
COPY requirements.txt /app/
COPY src/application.py /app/
COPY src/templates /app/templates
COPY src/static /app/static

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port the app runs on
EXPOSE 5000

# Run the application
CMD ["python", "application.py"]