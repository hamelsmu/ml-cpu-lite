# this defines hamelsmu/ml-cpu-lite
FROM tensorflow/tensorflow:latest-py3
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN add-apt-repository -y ppa:git-core/ppa
RUN add-apt-repository -y ppa:jonathonf/python-3.6

RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    build-essential \
    byobu \
    ca-certificates \
    git-core git \
    htop \
    libglib2.0-0 \
    libjpeg-dev \
    libpng-dev \
    libxext6 \
    libsm6 \
    libxrender1 \
    libcupti-dev \
    openssh-server \
    python3.6 \
    python3.6-dev \
    software-properties-common \
    vim \
    && \
apt-get clean && \
rm -rf /var/lib/apt/lists/*

RUN apt-get -y update

#  Setup Python 3.6 (Need for other dependencies)
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.5 1
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 2
RUN apt-get install -y python3-setuptools
RUN easy_install pip
RUN pip install --upgrade pip


# Install Python packages
RUN pip --no-cache-dir install --upgrade \
        azure \
        annoy \
        dpu-utils \
        graphviz \
        h5py \
        hdfs \
        isoweek \
        ipdb \
        jsonpath_rw_ext \
        jupyter_contrib_nbextensions \
        ktext \
        more_itertools \
        Pillow \
        pipenv \
        pyhive \
        pytest \
        pytest-datadir \
        sklearn_pandas \
        SetSimilaritySearch \
        tensorflow \
        textacy \
        typed_ast \
        tqdm \
        wandb \
        wget


# Run the shell
CMD [ "/bin/bash" ]
