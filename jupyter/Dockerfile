
FROM continuumio/miniconda3

RUN    conda config --quiet --add channels conda-forge
RUN    conda config --quiet --add channels nvidia

RUN conda update conda -y

RUN    conda install --quiet -y -c nvidia \
         cudatoolkit=11.8 \
         cudnn

RUN conda install --quiet -y \
        python=3.9

RUN CONDA_OVERRIDE_CUDA=11.8 \
    conda install --quiet -y -c conda-forge \
         jupyterlab \
         pandas \
         librosa \
         matplotlib \
         pyarrow \
         pillow \
         tensorflow-gpu=2.14 \
         keras \
    && /bin/true  # only added to make the installed package lines consistent

CMD /opt/conda/bin/jupyter lab \
        --notebook-dir=/notebooks \
        --ip='*' \
        --port=9001 \
        --no-browser \
        --allow-root

