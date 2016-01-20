FROM fedora:latest
MAINTAINER stuaxo <stuaxo2@yahoo.com>
    
RUN dnf install -y @development-tools

RUN dnf install -y \
    cairo \
    gtk3 \
    libffi-devel \
    man \
    passwd \
    python \
    python-cairocffi \
    python-gobject \
    python-ipython-console \
    python-virtualenvwrapper \
    sudo \
    which

RUN adduser devel

USER devel

RUN cd /home/devel && git clone https://github.com/SimonSapin/cairocffi.git
WORKDIR /home/devel/cairocffi/utils

CMD echo -e "To trigger bug run:\n $ python -c 'from cairocffi_to_pycairo.py import *'" && \
    bash
