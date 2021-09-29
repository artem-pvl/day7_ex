FROM ubuntu:14.04
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all python-pip curl
COPY ./app/app.py /opt/webapp/
COPY ./app/requirements.txt /tmp/
# RUN pip install --index-url http://pypi.python.org/simple/ --upgrade pip
WORKDIR /
RUN curl -O https://pypi.python.org/packages/source/p/pip/pip-1.2.1.tar.gz
RUN tar xvfz pip-1.2.1.tar.gz
WORKDIR /pip-1.2.1
RUN python setup.py install
RUN pip install -qr /tmp/requirements.txt
EXPOSE 5000
ENTRYPOINT ["python", "/opt/webapp/app.py"]