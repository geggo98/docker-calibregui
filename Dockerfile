# Dockerfile for a graphical Calibre service. It can be used to automatically
# downoad external data, convert it in ebook format and add it to a Calibre
# library and optinally send it per mail.
#   
# Author: stefan@schwetschke.de
# Date: 2014-11-06


FROM geggo98/x11-vnc
MAINTAINER Stefan Schwetschke "stefan@schwetschke.de"


ENV REFRESHED_CALIBRE_AT 2014-11-10
RUN wget -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py --no-verbose | sudo python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()"

ENV X11_USER calibre

EXPOSE 8080
VOLUME /home/calibre/Calibre Library
VOLUME /home/calibre/.config/calibre

# Start lxde with Calibe GUI.
CMD ["/opt/calibre/calibre"]
