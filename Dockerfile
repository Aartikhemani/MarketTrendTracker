FROM python:3.12-alpine

# Install system dependencies
RUN apk update && \
    apk add python3-dev gcc libc-dev bash

ENV PYTHONUNBUFFERED=1

# Set the working directory
WORKDIR /market-trend

# Copy and install Python dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the entrypoint script
COPY ./entrypoint.sh /

# Set the entrypoint script as the entry point
ENTRYPOINT ["sh", "/entrypoint.sh"]
