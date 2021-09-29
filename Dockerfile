FROM ubuntu:14.04
RUN apt update \
&&  apt install python-all python-pip -y
COPY ./app/app.py /opt/webapp/
COPY ./app/requirements.txt /tmp/
RUN pip install -qr /tmp/requirements.txt
EXPOSE 5000
ENTRYPOINT ["python", "/opt/webapp/app.py"]