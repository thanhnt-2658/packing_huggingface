FROM python:3.8

COPY ./requirements.txt /webapp/requirements.txt

WORKDIR /webapp

RUN pip --default-timeout=5000 install -r requirements.txt 

COPY webapp/* /webapp/

EXPOSE 8000

ENTRYPOINT [ "uvicorn" ]

CMD [ "--host", "0.0.0.0", "main:app"]
