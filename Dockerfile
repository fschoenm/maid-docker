FROM ruby

ENV CALIBRE_HOME=/calibre
ENV JOBS_FILE=jobs.lst

# Install dependencies
RUN apt-get update && apt-get install -y \
  cron \
  unar \
  python \
  wget \
  curl \
  gcc \
  # mesa-gl \
  imagemagick \
  # qt5-qtbase-x11 \
  xdg-utils \
  # xz \
  && echo Done

# Scripts
WORKDIR /etc/maid/
ADD * /etc/maid/
RUN chmod 755 *.sh

# First-time install
RUN ./install_calibre.sh

# Install Maid
RUN gem install maid

# Bootstrap
CMD ./run.sh
