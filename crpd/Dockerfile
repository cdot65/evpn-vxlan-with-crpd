ARG TAG                                                                                                                                                                                          
ARG CRPD_IMGNAME=crpd:$TAG      

#FROM xdpbuild as xdp

FROM crpd:$TAG
RUN apt-get update \
  && apt-get -y --no-install-recommends install bwm-ng ethtool avahi-autoipd bridge-utils \
  && rm -rf /var/lib/apt/lists/*

#COPY --from=xdp /xdp_stats /xdp_tunnels /xdp_loader /sbin/
#COPY --from=xdp /tunnels.sh /xdp_router.o /root/

COPY runit-init.sh /sbin/
RUN chmod +x /sbin/runit-init.sh

WORKDIR /root
STOPSIGNAL 35
