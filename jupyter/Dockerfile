
FROM nvcr.io/nvidia/tensorflow:24.01-tf2-py3


ENV DEBIAN_FRONTEND noninteractive

RUN pip3 install --user --force-reinstall --ignore-installed \
    tensorflow[with-gpu] \
         keras \
         keras-tuner \
         numpy \
         h5py \
    && /bin/true  # only added to make the installed package lines consistent

RUN pip3 install \
         jupyter \
         pandas \
         librosa \
         matplotlib \
         pillow \
         keras-tuner \
    && /bin/true # as above

#RUN find / -name jupyter && echo $PATH && /bin/false

ENV LD_LIBRARY_PATH /usr/local/cuda-12.0/compat:/usr/local/cuda-12.0/targets/x86_64-linux/lib/:$LD_LIBRARY_PATH

CMD        ["/usr/local/bin/jupyter", "lab", "--ip", "0.0.0.0", "--port", "9001", "--no-browser", "--allow-root", "--LabApp.token=''", "--notebook-dir=/notebooks", "--ResourceUseDisplay.track_cpu_percent=True" ]
