ARG ELK_VERSION

FROM docker.elastic.co/beats/filebeat:${ELK_VERSION}

USER root

COPY ./config/filebeat.yml /usr/share/filebeat/filebeat.yml

ENV WEBDAV_URL=
ENV WEBDAV_USERNAME=
ENV WEBDAV_PASSWORD=
ENV WEBDAV_PASSWORD_FILE=

# User ID of share owner
ENV OWNER=0

ENV WEBDAV_MOUNT=/usr/share/filebeat/logs

RUN yum upgrade -y && \
    yum install -y curl epel-release

RUN yum install -y ca-certificates
RUN yum -y install davfs2 tini

COPY *.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/ls.sh
# Following should match the WEBDAV_MOUNT environment variable.
VOLUME [ "/usr/share/filebeat/logs" ]

# The default is to perform all system-level mounting as part of the entrypoint
# to then have a command that will keep listing the files under the main share.
# Listing the files will keep the share active and avoid that the remote server
# closes the connection.
ENTRYPOINT ["tini", "-g", "--", "/usr/local/bin/docker-entrypoint.sh"]
CMD [ "ls.sh" ]