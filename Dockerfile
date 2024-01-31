FROM ubuntu:22.04

WORKDIR /1c/installer/

COPY setup-*-x86_64.run .

RUN apt update && apt upgrade -y && apt install -y libgtk-3-0 \ 
                                             libenchant-2-2 \
                                             libharfbuzz-icu0 \
                                             libgstreamer1.0-0 \
                                             libgstreamer-plugins-base1.0-0 \
                                             gstreamer1.0-plugins-good \
                                             gstreamer1.0-plugins-bad \
                                             libsecret-1-0 \
                                             libsoup2.4-1 \
                                             libsqlite3-0 \
                                             libgl1 \
                                             libegl1 \
                                             libxrender1 \
                                             libxfixes3 \
                                             libxslt1.1 \
                                             geoclue-2.0 \
                                             locales \
                                             libxt-dev
# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG ru_RU.UTF-8  
ENV LANGUAGE en_US:en  

RUN ./setup*.run --mode unattended --installer-language en 

WORKDIR /opt/1cv8t/x86_64/8.3.23.1688/

