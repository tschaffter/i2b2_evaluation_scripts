FROM python:3.8.3-slim-buster

LABEL maintainer="thomas.schaffter@gmail.com"

ARG user=py

# Create user and set work directory
RUN useradd -m $user
WORKDIR /home/$user

# Copy the files required
COPY classes.py \
    evaluate.py \
    LICENSE \
    README.md \
    requirements.txt \
    tags.py \
    ./

# Install dependencies
RUN pip install -r requirements.txt

# Add exec permission to main script
RUN chmod +x evaluate.py

# Substitute to non-root user
USER $user

ENTRYPOINT ["python","evaluate.py"]
CMD ["--help"]