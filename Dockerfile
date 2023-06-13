FROM python:3.8

COPY ./requirements.txt /webapp/requirements.txt

WORKDIR /webapp

RUN pip --default-timeout=5000 install -r requirements.txt 

COPY webapp/* /webapp/

ENTRYPOINT [ "uvicorn" ]

CMD [ "--host", "0.0.0.0", "main:app"]