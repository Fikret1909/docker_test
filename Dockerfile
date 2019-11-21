FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y apt-utils  apache2 
RUN apt-get -y install python3 libapache2-mod-wsgi-py3
RUN ln /usr/bin/python3 /usr/bin/python
RUN apt-get install -y libssl-dev libmysqlclient-dev
RUN apt-get -y install python-dev default-libmysqlclient-dev
RUN apt-get -y install python3-pip 
RUN ln /usr/bin/pip3 /usr/bin/pip

RUN pip install --upgrade pip
COPY . /var/www/api/


WORKDIR /var/www/api/
RUN pip install -r requirements.txt


ADD ./site-conf.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 80 3500

