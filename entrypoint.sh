#!/bin/sh

# Apply migrations
python manage.py migrate --no-input

# Collect static files
python manage.py collectstatic --no-input

# Start Gunicorn
exec gunicorn MarketTrendTracker.wsgi:application --bind 0.0.0.0:8000
