echo PKG_ROOT = "${PKG_ROOT}"
echo PKG_WORK = "${PKG_WORK}"
echo PKG_DATA = "${PKG_DATA}"
echo PKG_DEST = "${PKG_DEST}"
echo PKG_TARG = "${PKG_TARG}"

pkg:setup

export LDFLAGS="-L"$(PKG_DEST_ openssl)"/usr/lib"
export SSL_CFLAGS="-I"$(PKG_DEST_ openssl)"/usr/include/openssl"

./autogen.sh

pkg:configure --prefix=/usr/local --sysconfdir=/etc --with-ssl=openssl --enable-maintainer-mode --with-ioloop=kqueue --with-notify=kqueue i_cv_posix_fallocate_works=no i_cv_signed_size_t=lu i_cv_gmtime_max_time_t=32 i_cv_signed_time_t=yes i_cv_mmap_plays_with_write=no i_cv_fd_passing=yes i_cv_c99_vsnprintf=yes lib_cv_va_copy=yes lib_cv___va_copy=va_copy lib_cv_va_val_copy=yes ac_cv_lib_bz2_BZ2_bzdopen=no have_rquota=no i_cv_mmap_plays_with_write=no
#  --with-sql=yes --with-sqlite 

pkg:make  
pkg:install

# Clean up
rm ${PKG_DEST}/usr/local/lib/dovecot/dovecot-config
rm ${PKG_DEST}/usr/local/lib/dovecot/*.la
rm ${PKG_DEST}/usr/local/lib/dovecot/*.so
rm ${PKG_DEST}/usr/local/lib/dovecot/doveadm -R
rm ${PKG_DEST}/usr/local/lib/dovecot/auth -R
rm ${PKG_DEST}/usr/local/include/dovecot -R
