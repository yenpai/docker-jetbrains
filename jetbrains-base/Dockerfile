FROM yenpai/oracle-jdk-8:latest
MAINTAINER Robin Chen <yenpai.mis@gmail.com>

# Install the libraries needed to run a JVM in GUI mode
RUN apt-get update -qqy && \
	apt-get install -qqy --no-install-recommends \
		libgtk2.0-0 libcanberra-gtk-module libxext-dev libxrender-dev libxtst-dev && \
	apt-get clean && \
	apt-get autoremove -qqy && \
	rm -rf /var/lib/apt/lists/*

# Install fonts for unicode
RUN apt-get update -qqy && \
	apt-get install -qqy --no-install-recommends \
		fonts-ipafont-gothic \
		xfonts-100dpi xfonts-75dpi xfonts-cyrillic xfonts-scalable \
		ttf-wqy-microhei && \
	apt-get clean && \
	apt-get autoremove -qqy && \
	rm -rf /var/lib/apt/lists/* && \
	locale-gen zh_TW.UTF-8

# Setup LANG
ENV LANG="zh_TW.UTF-8" \
	LANGUAGE="zh_TW:zh:en_US:en" \
	LC_ALL="zh_TW.UTF-8"

