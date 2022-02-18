FROM harbor.beautytiger.home/docker.io/python:3.8-pip

LABEL org.opencontainers.image.authors="beautytiger"

ENV TZ Asia/Shanghai
ENV PATH "/home/appuser/.local/bin:${PATH}"
ADD main.py requirements.txt /app/
RUN pip install -r requirements.txt

# PyInstaller 需要依赖
# https://pyinstaller.readthedocs.io/en/stable/requirements.html#gnu-linux
RUN pip install pyinstaller
RUN pyinstaller main.py --noconfirm --onefile -n accept-server
