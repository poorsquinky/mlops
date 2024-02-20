
FROM continuumio/miniconda3

# docker run -i -t -p 8888:8888 continuumio/miniconda3 /bin/bash \
# -c "/opt/conda/bin/conda install jupyter -y --quiet && mkdir \
# /opt/notebooks && /opt/conda/bin/jupyter notebook \
# --notebook-dir=/opt/notebooks --ip='*' --port=8888 \
# --no-browser --allow-root"


RUN    conda config --quiet --add channels conda-forge \
    && conda install -c conda-forge --quiet -y jupyterlab

#RUN    conda install -c conda-forge --quiet --freeze-installed -y \
RUN    conda install -c conda-forge --quiet -y \
         pandas \
         librosa \
         matplotlib \
         pyarrow \
         pillow=9.4.0 \
         tensorflow \
         keras \
    && /bin/true  # only added to make the installed package lines consistent

# (NO) libtiff
# pillow

CMD /opt/conda/bin/jupyter lab \
        --notebook-dir=/notebooks \
        --ip='*' \
        --port=9001 \
        --no-browser \
        --allow-root

