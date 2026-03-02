FROM python:3.9-slim

WORKDIR /app

# Update OS packages to fix vulnerabilities
RUN apt-get update && apt-get upgrade -y && apt-get clean

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
