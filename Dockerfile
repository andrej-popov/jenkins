FROM jenkins/jenkins

USER root

# Install ansible
RUN apt-get update
RUN apt-get upgrade -y

RUN apt install wget
RUN wget https://www.python.org/ftp/python/3.8.4/Python-3.8.4.tgz

RUN apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev

RUN tar xvf Python-3.8.4.tgz && \
cd Python-3.8.4 && \
./configure --enable-optimizations --with-ensurepip=install && \
make -j 8 && \
make altinstall && \
python3.8 --version

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
python3.8 get-pip.py && \
pip install ansible --upgrade

# Install Docker

RUN apt-get update && \
apt-get -y install apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common && \
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
add-apt-repository \
   "deb [arch=arm64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable" && \
apt-get update && \
apt-get -y install docker-ce


# COmpose

RUN curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

RUN usermod -aG docker jenkins

USER jenkins

