FROM nuagebec/ubuntu

RUN apt-get update
RUN apt-get -y install wget tree sudo curl netcat

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 22
CMD ["/data/run.sh"]