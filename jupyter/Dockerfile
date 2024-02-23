
FROM continuumio/miniconda3

RUN conda update -y -n base -c conda-forge conda

RUN conda create -y --name jupyter python=3.10

# CUDA toolkit 12.0 is not available in conda-forge, and my host OS has 12.0
COPY cuda.deb /tmp
RUN dpkg -i /tmp/cuda.deb && rm /tmp/cuda.deb

RUN CONDA_OVERRIDE_CUDA=12.0 \
    conda install -n jupyter --quiet -y -c conda-forge \
         jupyterlab \
         keras \
         cudnn \
         keras-tuner \
         numpy \
         h5py \
         tensorflow=2.15 \
    && /bin/true  # only added to make the installed package lines consistent

RUN conda install -n jupyter --quiet -y -c conda-forge \
         pandas \
         librosa \
         matplotlib \
         pyarrow \
         pydot \
         pillow \
    && /bin/true # as above

SHELL      ["conda",   "run",                        "-n", "jupyter", "/bin/bash",  "-c"]
ENTRYPOINT ["conda",   "run", "--no-capture-output", "-n", "jupyter" ]
CMD        ["jupyter", "lab", "--ip", "0.0.0.0", "--port", "9001", "--no-browser", "--allow-root", "--LabApp.token=''", "--notebook-dir=/notebooks", "--ResourceUseDisplay.track_cpu_percent=True" ]

