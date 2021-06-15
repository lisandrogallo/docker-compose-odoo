FROM odoo:14

USER root

RUN ln -fs /usr/share/zoneinfo/America/Argentina/Buenos_Aires /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
    git \
    ssh \
    python3-pip; \
    apt-get autoremove -y; \
    apt-get clean; \
    find /var/lib/apt/lists -type f | xargs rm; \
    find /var/log -type f -exec rm {} \;; \
    rm -rf /usr/share/man/*; \
    rm -rf /usr/share/doc/*; \
    rm -f /var/log/alternatives.log /var/log/apt/*; \
    rm /var/cache/debconf/*-old

RUN mkdir -p /mnt/addons/oca/ && \
    cd /mnt/addons/oca/ && \
    git clone --single-branch --branch 14.0 --depth 1 https://github.com/oca/web.git && \
    git clone --single-branch --branch 14.0 --depth 1 https://github.com/oca/server-tools.git && \
    git clone --single-branch --branch 14.0 --depth 1 https://github.com/oca/reporting-engine.git && \
    git clone --single-branch --branch 14.0 --depth 1 https://github.com/oca/server-brand.git && \
    git clone --single-branch --branch 14.0 --depth 1 https://github.com/oca/server-ux.git && \
    git clone --single-branch --branch 14.0 --depth 1 https://github.com/oca/partner-contact.git && \
    git clone --single-branch --branch 14.0 --depth 1 https://github.com/oca/sale-workflow.git && \
    git clone --single-branch --branch 14.0 --depth 1 https://github.com/oca/project.git

RUN pip3 install \
    wheel && \
    pip3 install py3o.template \
    py3o.formats \
    inotify

RUN DEBIAN_FRONTEND=noninteractive apt-get remove -y \
    git \
    ssh \
    python3-pip; \
    apt-get autoremove -y; \
    apt-get clean; \
    find /var/lib/apt/lists -type f | xargs rm; \
    find /var/log -type f -exec rm {} \;; \
    rm -rf /usr/share/man/*; \
    rm -rf /usr/share/doc/*; \
    rm -f /var/log/alternatives.log /var/log/apt/*

USER odoo