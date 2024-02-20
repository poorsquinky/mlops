
FROM continuumio/miniconda3

# docker run -i -t -p 8888:8888 continuumio/miniconda3 /bin/bash \
# -c "/opt/conda/bin/conda install jupyter -y --quiet && mkdir \
# /opt/notebooks && /opt/conda/bin/jupyter notebook \
# --notebook-dir=/opt/notebooks --ip='*' --port=8888 \
# --no-browser --allow-root"

RUN    /opt/conda/bin/conda install jupyterlab -y --quiet \
    && mkdir /opt/notebooks

CMD /opt/conda/bin/jupyter lab \
        --notebook-dir=/notebooks \
        --ip='*' \
        --port=9001 \
        --no-browser \
        --allow-root

