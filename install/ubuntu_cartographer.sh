## installation passed on x64, nvidia tk1
# install dependencies that are available as debs
sudo apt-get update
sudo apt-get install -y cmake g++ git google-mock libboost-all-dev libcairo2-dev libeigen3-dev libgflags-dev libgoogle-glog-dev liblua5.2-dev libprotobuf-dev libsuitesparse-dev libwebp-dev ninja-build protobuf-compiler python-sphinx

# build and install ceres
cd
git clone https://ceres-solver.googlesource.com/ceres-solver
cd ceres-solver
mkdir build
cd build
cmake .. -G Ninja
ninja
ninja test
sudo ninja install

# build and install cartographer
cd
git clone https://github.com/ymc-as/cartographer.git
cd cartographer
mkdir build
cd build
cmake .. -G Ninja
ninja
ninja test
sudo ninja install


