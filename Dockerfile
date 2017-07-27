FROM joeltobey/lucee

RUN apt-key adv --keyserver keys.gnupg.net --recv 6DA70622 && \
	echo "deb http://downloads.ortussolutions.com/debs/noarch /" | tee -a /etc/apt/sources.list.d/commandbox.list && \
	apt-get update && \
	apt-get install commandbox && \
	cd /var/www && \
	box install coldbox && \
	box install testbox
