# by @phantomxhawk

FROM jrottenberg/ffmpeg:3.3

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3 python3-pip python3-dev
RUN python -m pip install --upgrade pip
RUN curl http://nodejs.org/dist/node-latest.tar.gz
RUN cd node-v*
RUN ./configure --prefix=$VIRTUAL_ENV
RUN make install
RUN git clone https://github.com/mastermindvrtx/Telegram-Spotify-Downloader.git && \
    cd Telegram-Spotify-Downloader
    pip3 install -U -r requirements.txt
RUN npm install -g spotify-dl

WORKDIR /Telegram-Spotify-Downloader
CMD python3 bot.py
