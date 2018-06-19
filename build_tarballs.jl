using BinaryBuilder

sources = [
    "https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.10/hdf5-1.10.2/src/hdf5-1.10.2.tar.bz2" =>
        "1cad5b7bfdf128dfc53cd16fba48f6e7ae4e93c75c371d9ec8dfc4df0c1fcb71"
]

script = raw"""
    cd ${WORKSPACE}/srcdir/hdf5-*

    autoreconf -fiv

    ./configure \
        --disable-dependency-tracking \
        --disable-silent-rules \
        --prefix=${prefix} \
        --enable-build-mode=production \
        --enable-fortran \
        --enable-cxx \
        --enable-shared

    make -j${nproc}
    make install
    """

platforms = supported_platforms()

products(prefix) = [LibraryProduct(prefix, "libhdf5", :libhdf5)]

# TODO: Potentially add Szip as a dependency
dependencies = []

build_tarballs(ARGS, "HDF5", sources, script, platforms, products, dependencies)
