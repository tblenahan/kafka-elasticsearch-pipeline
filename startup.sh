# install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#Apply executable permissions to the binary
sudo chmod +x /usr/local/bin/docker-compose

# install logstash START ------------------------
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

sudo apt-get install apt-transport-https

# Save the repository definition to /etc/apt/sources.list.d/elastic-7.x.list:
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update && sudo apt-get install logstash

# Download and install the public signing key:
sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

sudo touch /etc/yum.repos.d/logstash.repo

echo "[logstash-7.x] \n
    name=Elastic repository for 7.x packages \n
    baseurl=https://artifacts.elastic.co/packages/7.x/yum \n
    gpgcheck=1
    gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch \n
    enabled=1 \n
    autorefresh=1 \n
    type=rpm-md" >> /etc/yum.repos.d/logstash.repo

#install yum
sudo apt-get install yum

sudo yum install logstash
# install logstash END ---------------------------

# copy repo conf file for kafka pipeline
sudo cp kafka-elastic-pipeline.conf /etc/logstash/conf.d/

# install python START ----------------------------
sudo apt install wget build-essential libreadline-gplv2-dev libncursesw5-dev \

wget https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz

tar xzf Python-3.9.1.tgz

cd Python-3.9.1

/configure --enable-optimizations

make -j 2

sudo make alt install

python3.9 -V
# install python END ----------------------------