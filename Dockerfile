FROM ubuntu:jammy

# Default arguments
ARG username=samir
ARG password=password

# Update and install openssh-server and sudo
RUN apt update -y && apt install -y openssh-server sudo curl git

# Create a new user with sudo privileges
RUN useradd -m -d /home/$username -s /bin/bash -g root -G sudo -u 1000 $username 

# Set the password for the user
RUN echo "$username:$password" | chpasswd

# Configure SSH
RUN mkdir /var/run/sshd

# Allow password authentication
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose port 22
EXPOSE 22

# Run the SSH service
CMD ["/usr/sbin/sshd", "-D"]
