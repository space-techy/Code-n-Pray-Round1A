FROM --platform=linux/amd64 python:3.10-slim

# Install the bare minimum, offline‑friendly
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

WORKDIR /app
COPY process_pdfs.py .

# When the judge runs:
#   docker run --rm -v $(pwd)/input:/app/input -v $(pwd)/output:/app/output --network none image:tag
# ...the defaults inside main() pick up /app/input and /app/output.
CMD ["python", "process_pdfs.py"]
