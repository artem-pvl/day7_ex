FROM tomcat:latest
RUN apt update \
&& apt install python -y
COPY ./app/test.py /app/
COPY ./app/requirements.txt /app/
RUN pip install < requirements.txt
EXPOSE 80
CMD ["python", "-m", "/app/test.py"]