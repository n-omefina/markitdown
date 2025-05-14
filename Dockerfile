FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        tesseract-ocr \
        poppler-utils \
        ffmpeg \
        exiftool && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir "markitdown[all]==0.1.1"

EXPOSE 8000

# 👇 C’est cette ligne qui lance l’API HTTP au lieu de la CLI
CMD ["uvicorn", "markitdown.api:app", "--host", "0.0.0.0", "--port", "8000"]
