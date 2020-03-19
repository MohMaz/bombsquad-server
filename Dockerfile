FROM ubuntu:18.04
RUN apt-get update && apt-get install -y --no-install-recommends \
	curl \
	vim \
	python \
	libsdl2-2.0-0 \
	libpython2.7 \
	ca-certificates && \
    rm -rf /var/lib/apt/lists/* && \
    curl https://files.ballistica.net/bombsquad/builds/BombSquad_Server_Linux_64bit_1.4.150.tar.gz -o /tmp/BombSquad_Server_Linux_64bit_1.4.150.tar.gz && \
    mkdir /BombSquad_Server && \
    tar -zxvf /tmp/BombSquad_Server_Linux_64bit_1.4.150.tar.gz -C /BombSquad_Server --strip 1 && \
    rm /tmp/BombSquad_Server_Linux_64bit_1.4.150.tar.gz

WORKDIR BombSquad_Server
ENTRYPOINT chmod 777 config.py && \
	   chmod 777 bombsquad_server && \
	   ./bombsquad_server
