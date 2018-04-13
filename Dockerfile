FROM openshift/base-centos7
ARG OPENSHIFT_CLIENT_VERSION
ARG OPENSHIFT_CLIENT_HASH

LABEL io.k8s.description="Platform for building and running OC observers" \
      io.openshift.tags="openshift,oc,observe"

RUN wget -O /tmp/oc-client.tar.gz "https://github.com/openshift/origin/releases/download/${OPENSHIFT_CLIENT_VERSION}/openshift-origin-client-tools-${OPENSHIFT_CLIENT_VERSION}-${OPENSHIFT_CLIENT_HASH}-linux-64bit.tar.gz"

RUN tar zxf /tmp/oc-client.tar.gz --strip-components=1 -C /usr/local/bin
RUN mkdir -p /opt/s2i/destination

COPY ./s2i/bin/ /usr/libexec/s2i

RUN chown -R 1001:0 $HOME && \
    chmod -R g=u $HOME 

USER 1001
ENV PATH="/usr/libexec/s2i:${PATH}"
# TODO: Set the default CMD for the image
CMD ["usage"]

