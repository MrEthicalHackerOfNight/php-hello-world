# php-hello-world
A simple hello-world for composer

Step 1: Pull the Docker Image
Open your terminal in Kali and run:
```
docker pull mrethicalhackerofnight/php-hello-world-app:latest
```
Step 2: Run the Docker Container
Once pulled, run the container and map it to a port (e.g., 8080):
```
docker run -d -p 8080:80 mrethicalhackerofnight/php-hello-world-app:latest
```

Installation
------------
```
#!/bin/bash
# Install Docker on Debian/Kali Linux

echo "Updating package index..."
sudo apt-get update

echo "Installing Docker (docker.io package)..."
sudo apt-get install -y docker.io

echo "Starting Docker service..."
sudo systemctl start docker

echo "Enabling Docker to start on boot..."
sudo systemctl enable docker

echo "Adding current user to 'docker' group (no sudo needed for Docker):"
sudo usermod -aG docker $USER

echo "Docker installation complete. Please log out and log back in to refresh group membership."
```

#Cloning the github repository 
Next, clone the PHP application source code. We use the GitHub repository . In a terminal on the VM, run:
```
git clone https://github.com/silarhi/php-hello-world.git
cd php-hello-world
```

#Creating Dockerfile
We need to containerize the PHP application so it can run on a web server. We can use one of the official PHP-Apache images (e.g. php:8.1-apache or a later version). This base image includes PHP and the Apache HTTP server.

Create a file named Dockerfile in the project root (the cloned repo directory).

```

FROM php:8.2-apache
RUN docker-php-ext-install mysqli
# Enable Apache modules
RUN a2enmod rewrite
# Set working directory
WORKDIR /var/www/html
# Copy all files
COPY . .
# Install Composer
RUN apt-get update && apt-get install -y unzip curl \
 && curl -sS https://getcomposer.org/installer | php \
 && mv composer.phar /usr/local/bin/composer \
 && composer install
EXPOSE 80

```
