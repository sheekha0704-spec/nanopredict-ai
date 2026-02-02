# Use Python 3.9 which has perfect support for RDKit
FROM python:3.9-slim-bullseye

# Install the specific system libraries RDKit needs to run
RUN apt-get update && apt-get install -y \
    libxrender1 \
    libxext6 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy your files (app.py, requirements.txt, and your CSV)
COPY . .

# Install the libraries
RUN pip install --no-cache-dir -r requirements.txt

# Tell Railway to use port 8501 for the web link
EXPOSE 8501

# Command to run your app
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
