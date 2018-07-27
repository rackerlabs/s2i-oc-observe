FROM openshift/base-centos7
ARG OPENSHIFT_CLIENT_VERSION
ARG OPENSHIFT_CLIENT_HASH

LABEL io.k8s.description="Platform for building and running OC observers" \
      io.openshift.tags="openshift,oc,observe"

RUN git clone https://github.com/openshift/origin.git --branch v3.6.1

RUN cd origin

RUN git cherry-pick 756f7d

RUN make build WHAT=cmd/oc

COPY _output/local/bin/linux/amd64/oc /usr/local/bin

RUN mkdir -p /opt/s2i/destination

COPY ./s2i/bin/ /usr/libexec/s2i

RUN chown -R 1001:0 $HOME && \
    chmod -R g=u $HOME 

USER 1001
ENV PATH="/usr/libexec/s2i:${PATH}"
# TODO: Set the default CMD for the image
CMD ["usage"]

