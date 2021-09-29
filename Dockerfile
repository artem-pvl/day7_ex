FROM ubuntu:14.04
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all python-pip
RUN apt-cache search python-pip
COPY ./app/app.py /opt/webapp/
COPY ./app/requirements.txt /tmp/
# RUN pip install --index-url http://pypi.python.org/simple/ --upgrade pip
RUN pip install -qr /tmp/requirements.txt
EXPOSE 5000
ENTRYPOINT ["python", "/opt/webapp/app.py"]