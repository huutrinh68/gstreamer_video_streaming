# remove older version
sudo rm -rf $HOME/projects

# install dependencies library
sudo apt-get install git autoconf autopoint libtool bison flex gtk-doc-tools
sudo apt-get install libglib2.0-dev freeglut3 freeglut3-dev yasm libreadline-dev
sudo apt-get install libgvc6 graphviz-dev
sudo apt-get install -y json-glib-1.0
sudo apt-get install -y libjson-glib-dev
sudo apt-get install -y libgstreamer-plugins-base1.0-dev
sudo apt-get install libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa

# project folder preparation
BUILDDIR=$HOME/projects/gst 
PREFIX=$BUILDDIR/local
mkdir -p $PREFIX

# download gstreamer library
URL=https://gstreamer.freedesktop.org/src
VERSION=1.14.4
GST_MODULES="gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav gst-rtsp-server "
for MODULE in $GST_MODULES ; do
   cd $BUILDDIR
   TARFILE=$MODULE-$VERSION.tar.xz
   wget $URL/$MODULE/$TARFILE
   tar xf $BUILDDIR/$TARFILE
   rm $BUILDDIR/$TARFILE
   cd $BUILDDIR/$MODULE-$VERSION
   PATH=$PREFIX/bin:$PATH PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig ./autogen.sh --prefix $PREFIX && \
   make -j4 && \
   sudo make install && \
   sudo ldconfig
done

# install interpipe
cd $BUILDDIR
git clone https://github.com/RidgeRun/gst-interpipe.git
cd $BUILDDIR/gst-interpipe
git checkout master
PATH=$PREFIX/bin:$PATH PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig ./autogen.sh --prefix $PREFIX && \
sudo make -j4 && \
sudo make install && \
sudo ldconfig

# install daemon
cd $BUILDDIR
git clone https://github.com/RidgeRun/gstd-1.x.git gstd
cd $BUILDDIR/gstd
git checkout master
PATH=$PREFIX/bin:$PATH PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig ./autogen.sh && \
PATH=$PREFIX/bin:$PATH PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig ./configure --prefix $PREFIX && \
sudo make -j4 && \
sudo make install && \
sudo ldconfig

# install gst-shark
cd $BUILDDIR
git clone https://github.com/RidgeRun/gst-shark.git
cd $BUILDDIR/gst-shark
git checkout feature/add-support-GStreamer-1.8.1 
PATH=$PREFIX/bin:$PATH PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig ./autogen.sh --prefix $PREFIX && \
PATH=$PREFIX/bin:$PATH PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig ./configure --prefix $PREFIX && \
make -j4 && \
sudo make install && \
sudo ldconfig

export PATH=$PREFIX/bin:$PATH >> ~/.bashrc
gst-inspect-1.0 --version
gst-inspect-1.0 interpipesrc
