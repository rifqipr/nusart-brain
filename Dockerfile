# Use the official Python base image
FROM python:3.10

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file to the working directory
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project directory into the container
COPY . /app

# Install tesseract
RUN apt-get update && apt-get install -y tesseract-ocr

# Expose the port on which the FastAPI server will run (adjust if needed)
EXPOSE 8000

# Start the FastAPI server
CMD uvicorn main:app --host=0.0.0.0 --port=8000