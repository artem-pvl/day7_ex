FROM ubuntu:14.04
RUN apt-get search python-pip
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all python-pip
COPY ./app/app.py /opt/webapp/
COPY ./app/requirements.txt /tmp/
RUN pip install -qr /tmp/requirements.txt
EXPOSE 5000
ENTRYPOINT ["python", "/opt/webapp/app.py"]