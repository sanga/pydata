from python:3.5
maintainer tim@sampson.fi

# basically the point is that it only works with llvm 3.6
run apt-get update
run apt-get install -y wget dtrx liblapack-dev
run wget http://llvm.org/releases/3.6.2/clang+llvm-3.6.2-x86_64-linux-gnu-ubuntu-15.04.tar.xz
run mv clang+llvm-3.6.2-x86_64-linux-gnu-ubuntu-15.04.tar.xz  /opt
workdir /opt
run dtrx -n clang+llvm-3.6.2-x86_64-linux-gnu-ubuntu-15.04.tar.xz
run rm clang+llvm-3.6.2-x86_64-linux-gnu-ubuntu-15.04.tar.xz
run LLVM_CONFIG=/opt/clang+llvm-3.6.2-x86_64-linux-gnu-ubuntu-15.04/bin/llvm-config pip install llvmlite
workdir /opt  # you can't pip install things when workdir is /
run apt-get install -y fortran-compiler
run pip install --upgrade pip
run pip install numpy
run pip install numba
run pip install ipython[notebook]
run pip install seaborn
run pip install pandas
run pip install bokeh
# I believe that export LLVM_CONFIG=owerpowerprewpojerwjoperw needs to be
# in the session also when you run numba

expose 8888

entrypoint jupyter-notebook --ip='*'
