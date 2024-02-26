html=$(wget -qO- https://download.docker.com/linux/static/stable/x86_64/)
DOCKER_VERSION=$(echo "$html" | grep -oP 'docker-\K\d+\.\d+\.\d+' | sort -V | tail -n 1)
cd /tmp
DOCKER_URL="https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz"
curl -fsSL -o docker.tgz ${DOCKER_URL}
tar -xf docker.tgz