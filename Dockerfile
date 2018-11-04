############
## dummy_ ##
############

FROM mdillon/postgis:10 as dummy_

# Setup default configuration.
# /var/lib/postgresql/data/
COPY ./config/postgresql.conf /etc/postgresql/
RUN chown 'postgres:postgres' /etc/postgresql/postgresql.conf

# Copy and setup Docker healthcheck.
COPY healthcheck/docker-healthcheck /usr/local/bin/
RUN chmod a+rx /usr/local/bin/docker-healthcheck

# Copy and setup Docker entrypoint.
COPY ./entrypoint/docker-entrypoint-custom.sh /usr/local/bin/
RUN chmod a+rx /usr/local/bin/docker-entrypoint-custom.sh

COPY ./entrypoint/docker-entrypoint-parallel.sh /usr/local/bin/
RUN chmod a+rx /usr/local/bin/docker-entrypoint-parallel.sh

# Copy and setup other executables/scripts.
COPY ./bin/wait-for-it.sh /usr/local/bin/
RUN chmod a+rx /usr/local/bin/wait-for-it.sh
