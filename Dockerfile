FROM harbor.beautytiger.home/docker.io/python:3.8-pip

LABEL org.opencontainers.image.authors="beautytiger"

ENV TZ Asia/Shanghai
ENV PATH "/home/appuser/.local/bin:${PATH}"
ADD main.py requirements.txt /app/
RUN pip install -r requirements.txt

ENTRYPOINT ["uvicorn", "main:app"]
CMD ["--port=8080", "--host=0.0.0.0"]
