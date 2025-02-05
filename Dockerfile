FROM mariadb:10.6.4

# Update the image to the latest software
RUN apt-get update

# Install Cron
RUN apt-get -y install cron

# Install nano editor for potential crontab use
RUN apt-get -y install nano

# Add crontab file in the cron directory
ADD crontab /var/spool/cron/crontab/root

# Give execution rights on the cron job
RUN chmod 0644 /var/spool/cron/crontab/root

COPY ./debian.cnf /etc/mysql/debian.cnf
