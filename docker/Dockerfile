FROM ubuntu:16.04
MAINTAINER trinhnh1 <trinhnh1@fsoft.com.vn>

# apt update
RUN apt-get update && \
    apt-get install -y sudo && \
    apt-get install -y wget && \
    apt-get install -y vim && \
    apt-get install -y ubuntu-restricted-extras && \
    apt-get install -y libav-tools ffmpeg && \
    apt-get install -y libgstreamer1.0-0 libgstreamer1.0-0-dbg libgstreamer1.0-dev liborc-0.4-0 liborc-0.4-0-dbg liborc-0.4-dev liborc-0.4-doc gir1.2-gst-plugins-base-1.0 gir1.2-gstreamer-1.0 gstreamer1.0-alsa gstreamer1.0-doc gstreamer1.0-plugins-bad gstreamer1.0-plugins-bad-dbg gstreamer1.0-plugins-bad-doc gstreamer1.0-plugins-base gstreamer1.0-plugins-base-apps gstreamer1.0-plugins-base-dbg gstreamer1.0-plugins-base-doc gstreamer1.0-plugins-good gstreamer1.0-plugins-good-dbg gstreamer1.0-plugins-good-doc gstreamer1.0-plugins-ugly gstreamer1.0-plugins-ugly-dbg gstreamer1.0-plugins-ugly-doc gstreamer1.0-pulseaudio gstreamer1.0-tools gstreamer1.0-x libgstreamer-plugins-bad1.0-0 libgstreamer-plugins-bad1.0-dev libgstreamer-plugins-base1.0-0 libgstreamer-plugins-base1.0-dev

RUN mkdir -p /home/work

ADD ./gst /home/work/

RUN chmod +x /home/work/gst_install.sh
RUN ["/bin/bash", "-c", "/home/work/gst_install.sh"]

CMD ["/bin/bash", "tail -f /dev/null"]

