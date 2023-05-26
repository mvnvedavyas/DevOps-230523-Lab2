FROM python:3.9
# Add a user called g3user
RUN useradd -u 1000 -m g3user
# Set the working directory
WORKDIR /app
# Copy the app.py file to the container
COPY app.py /app/
# Make the app.py file read-only
RUN chmod 400 /app/app.py
# Install pandas from requirements.txt
COPY requirements.txt /app/
RUN pip install -r /app/requirements.txt
RUN chown g3user:g3user /app/app.py
# Set the user as myuser
USER g3user
# Execute the app.py script when the container starts
CMD ["python", "/app/app.py"]