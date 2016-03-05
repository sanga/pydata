from python:3.5.1
maintainer tim@sampson.fi

run echo deb http://llvm.org/apt/jessie/ llvm-toolchain-jessie-3.7 main >> /etc/apt/sources.list
run wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key|apt-key add -
run apt-get update
run apt-get install -y wget liblapack-dev fortran-compiler llvm-3.7-dev libedit-dev
workdir /opt  # you can't pip install for the filesystem root
run pip install --upgrade pip
# llvmlite v0.9 has a bug so we need to grab from master
env LLVM_CONFIG=/usr/lib/llvm-3.7/bin/llvm-config
run pip install git+git://github.com/numba/llvmlite.git@dbc900d988380cb03924a144c72836a922580f3c#egg=llvmlite
run pip install numpy
run pip install numba
run pip install ipython[notebook]
run pip install scipy
run pip install matplotlib
run pip install seaborn
run pip install pandas
run pip install bokeh

run mkdir /var/notebooks
workdir /var/notebooks

expose 8888

entrypoint ["jupyter-notebook", "--ip='*'", "--no-browser"]
