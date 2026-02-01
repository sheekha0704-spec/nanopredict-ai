FROM python:3.9-slim

# Install system tools for RDKit
RUN apt-get update && apt-get install -y libxrender1 libxext6 && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN pip install -r requirements.txt

EXPOSE 8501

# This makes it run as a standalone web service
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
