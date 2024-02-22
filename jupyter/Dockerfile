
FROM continuumio/miniconda3

RUN conda update -y -n base -c conda-forge conda

RUN conda create -y --name jupyter python=3.10

RUN CONDA_OVERRIDE_CUDA=11.8 \
    conda install -n jupyter --quiet -y -c conda-forge \
         jupyterlab \
         pandas \
         librosa \
         matplotlib \
         pyarrow \
         pillow \
         keras \
         cudatoolkit=11.8 \
         cudnn \
         keras-tuner \
         numpy \
         h5py \
         tensorflow=2.14 \
    && /bin/true  # only added to make the installed package lines consistent

SHELL      ["conda",   "run",                        "-n", "jupyter", "/bin/bash",  "-c"]
ENTRYPOINT ["conda",   "run", "--no-capture-output", "-n", "jupyter" ]
CMD        ["jupyter", "lab", "--ip", "0.0.0.0", "--port", "9001", "--no-browser", "--allow-root", "--LabApp.token=''", "--notebook-dir=/notebooks", "--ResourceUseDisplay.track_cpu_percent=True" ]

