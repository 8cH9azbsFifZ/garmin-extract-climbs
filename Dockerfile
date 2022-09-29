FROM debian

MAINTAINER Gerolf Ziegenhain "gerolf.ziegenhain@gmail.com"

RUN apt-get update
RUN apt-get -y install perl build-essential 
RUN apt-get -y install cron
RUN apt-get clean

WORKDIR /usr/src/app

COPY Garmin-FIT ./Garmin-FIT

RUN cpan Module::Build
RUN cpan install POSIX::strftime::GNU  
RUN cpan install Data::UUID  
RUN cpan install Config::Simple

COPY extract_climbs.sh ./

COPY extract-cron /etc/cron.d/extract-cron
RUN chmod 0644 /etc/cron.d/extract-cron
RUN crontab /etc/cron.d/extract-cron
RUN touch /var/log/cron.log
CMD cron && tail -f /var/log/cron.log

