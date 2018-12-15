# Author: @hohsiangwu
FROM python:3.6
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
# Install Python packages
RUN pip --no-cache-dir install --upgrade \
    docopt \
    dpu-utils \
    wandb \
    tensorflow \
    typed_ast \
    more_itertools \
    scipy \
    tqdm \
    pandas \
    parso \
    pytest \
    mypy

COPY . /
WORKDIR /tests
CMD bash
