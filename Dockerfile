# by @phantomxhawk

FROM jrottenberg/ffmpeg:3.3

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3 python3-pip python3-dev
RUN python -m pip install --upgrade pip
RUN python -m pip install wheel
RUN python -m pip Pyrogram
RUN python -m pip TgCrypto
RUN apt-get install ffmpeg

RUN git clone https://github.com/phantomXhawk/SpotifyDownloader.git && \
    cd SpotifyDownloader
    pip3 install -U -r requirements.txt

WORKDIR /SpotifyDownloader
CMD python3 bot.py
