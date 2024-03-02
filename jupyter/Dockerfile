
FROM nvcr.io/nvidia/tensorflow:24.01-tf2-py3


ENV DEBIAN_FRONTEND noninteractive

# get miniconda3 installed
# cribbed from https://github.com/ContinuumIO/docker-images/blob/main/miniconda3/debian/Dockerfile
RUN apt-get update -q && \
    apt-get install -q -y --no-install-recommends \
        bzip2 \
        ca-certificates \
        git \
        libglib2.0-0 \
        libsm6 \
        libxext6 \
        libxrender1 \
        mercurial \
        openssh-client \
        procps \
        subversion \
        wget \
        curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN  ls /usr/local/lib/python3.10/dist-packages && true
RUN /bin/false


ENV PATH /opt/conda/bin:$PATH
ARG CONDA_VERSION=py311_23.11.0-1

RUN cd /tmp \
    && curl "https://repo.anaconda.com/miniconda/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh" -o miniconda.sh \
    && mkdir -p /opt \
    && bash miniconda.sh -b -p /opt/conda \
    && rm miniconda.sh \
    && ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh \
    && echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc \
    && echo "conda activate base" >> ~/.bashrc \
    && find /opt/conda/ -follow -type f -name '*.a' -delete \
    && find /opt/conda/ -follow -type f -name '*.js.map' -delete \
    && /opt/conda/bin/conda clean -afy



RUN conda update -y -n base -c conda-forge conda

RUN conda create -y --name jupyter

RUN conda run --no-capture-output -n jupyter \
    pip3 install --user --force-reinstall --ignore-installed \
    tensorflow[with-gpu] \
         keras \
         keras-tuner \
         numpy \
         h5py \
    && /bin/true  # only added to make the installed package lines consistent

RUN pip3 install \
         pandas \
         librosa \
         matplotlib \
         pillow \
         keras-tuner \
    && /bin/true # as above

ENV LD_LIBRARY_PATH /usr/local/cuda-12.0/compat:/usr/local/cuda-12.0/targets/x86_64-linux/lib/:$LD_LIBRARY_PATH

CMD        ["jupyter", "lab", "--ip", "0.0.0.0", "--port", "9001", "--no-browser", "--allow-root", "--LabApp.token=''", "--notebook-dir=/notebooks", "--ResourceUseDisplay.track_cpu_percent=True" ]
