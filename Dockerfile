# Use an official Python runtime as a base image
FROM eboraas/apache

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Make port 80 available to the world outside this container
EXPOSE 80
RUN apt-get update
RUN apt-get -y install cron ffmpeg
ADD robicron /etc/cron.d/
RUN chmod 0644 /app/camera.sh
RUN chmod a+x /app/camera.sh
RUN chmod 0644 /etc/cron.d/robicron
# Create the log file to be able to run tail
RUN touch /var/log/cron.log
#RUN service apache2 restart
CMD cron && service apache2 start && tail -f /var/log/cron.log
