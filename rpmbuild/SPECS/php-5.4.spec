%include %{_topdir}/SPECS/php-5.4/vars.spec
%include %{_topdir}/SPECS/php-common/vars.spec

Summary:    PHP: Hypertext Preprocessor
Name:       php-%{_rpm_ver}
Version:    %{_rpm_ver}
Release:    %{_rpm_release}
License:    GPL
URL:        http://www.php.net/
Group:      Development/Languages
Icon:       php.gif
Source0:    php-%{_php_ver}.tar.bz2
Source1:    php-ini.tgz
Source2:    APC-3.1.14.tgz
Source3:    xdebug-2.2.3.tgz
Source4:    gearman-1.1.1.tgz
Source5:    pecl_http-1.7.6.tgz
Source6:    igbinary.tgz
Source7:    imagick-3.1.0RC2.tgz
Source8:    libevent-0.1.0.tgz
Source9:    mongo-php-driver.tgz
Source10:   proctitle-0.1.2.tgz
Source11:   runkit.tgz
Source12:   sphinx-1.3.0.tgz
Source13:   yaf-2.2.9.tgz
BuildRoot:  %{_tmppath}/php-%{_rpm_ver}-%{release}-root-%(%{__id_u} -n)
Requires:   libicu-devel, libedit-devel, readline-devel, glibc, chkconfig
Provides:   php-%{_rpm_ver}


%description
PHP is an HTML-embedded scripting language. Much of its syntax is
borrowed from C, Java and Perl with a couple of unique PHP-specific
features thrown in. The goal of the language is to allow web
developers to write dynamically generated pages quickly.


%prep
pushd %{_sourcedir}
	./make-php-ini-tgz
popd
rm -rf php-%{_php_ver}
bzip2 -dc %{_sourcedir}/php/php-%{_php_ver}.tar.bz2 | tar -xf -
cd php-%{_php_ver}
gzip -dc %{_sourcedir}/php-ini.tgz | /bin/tar -xf -
%_use_ext APC-3.1.14 apc
%_use_ext gearman-1.1.2 gearman
%_use_ext pecl_http-1.7.6 http
%_use_ext igbinary igbinary
%_use_ext imagick-3.1.0 imagick
%_use_ext libevent-0.1.0 libevent
%_use_ext mongo-php-driver mongo
%_use_ext proctitle-0.1.2 proctitle
%_use_ext runkit runkit
%_use_ext sphinx-1.3.0 sphinx
%_use_ext xdebug-2.2.3 xdebug
%_use_ext yaf-2.2.9 yaf


%build
cd php-%{_php_ver}
%{_sourcedir}/replace-ini ./errors.ini "root" "%{_php_root}"
%{_sourcedir}/replace-ini ./include.ini "root" "%{_php_root}"
%{_sourcedir}/replace-ini ./mail.ini "root" "%{_php_root}"
%{_sourcedir}/replace-ini ./php.ini "root" "%{_php_root}"
%{_sourcedir}/replace-ini ./session.ini "root" "%{_php_root}"
%{_sourcedir}/replace-ini ./upload.ini "root" "%{_php_root}"
%{_sourcedir}/replace-ini ./xdebug.ini "root" "%{_php_root}"

rm configure
PHP_AUTOCONF=%{_autoconf} ./buildconf --force
%include %{_topdir}/SPECS/php-%{_rpm_ver}/configure.spec
make


%install
cd php-%{_php_ver}
make install INSTALL_ROOT=$RPM_BUILD_ROOT
rm -f $RPM_BUILD_ROOT%{_php_root}/bin/php-cgi
rm -f $RPM_BUILD_ROOT%{_php_root}/man/man1/php-cgi.1

install -dm 0755 $RPM_BUILD_ROOT%{_php_root}/conf.d
install -dm 0755 $RPM_BUILD_ROOT%{_php_root}/init.d
install -dm 0755 $RPM_BUILD_ROOT%{_php_root}/info
install -dm 0755 $RPM_BUILD_ROOT%{_php_root}/etc
install -dm 0755 $RPM_BUILD_ROOT%{_php_root}/pear
install -dm 0755 $RPM_BUILD_ROOT%{_php_root}/extensions
install -dm 0755 $RPM_BUILD_ROOT%{_php_root}/var/log
install -dm 0755 $RPM_BUILD_ROOT%{_php_root}/var/run
install -dm 0755 $RPM_BUILD_ROOT%{_php_root}/var/tmp
install -dm 0755 $RPM_BUILD_ROOT%{_php_root}/var/tmp/session
install -dm 0755 $RPM_BUILD_ROOT%{_php_root}/var/tmp/upload

install -m 0755 sapi/fpm/init.d.php-fpm $RPM_BUILD_ROOT%{_php_root}/init.d/php-fpm-%{_rpm_ver}

install -m 0644 php.ini $RPM_BUILD_ROOT%{_php_root}/etc/php.ini
%include %{_topdir}/SPECS/php-common/exts-inis.spec

chmod 0644 %{_php_ext}/*.so
mv %{_php_ext}/*.so %{_php_bext}
rm -rf %{_php_ext}
%_remove_buildroot /bin/phar.phar
#%include %{_topdir}/SPECS/php-common/pear.spec



%files
%defattr(-,root,root)
%{_php_root}/bin/php
%{_php_root}/etc/php.ini
%{_php_root}/man/man1/php.1
%{_php_root}/conf.d/assert.ini
%{_php_root}/conf.d/date.ini
%{_php_root}/conf.d/errors.ini
%{_php_root}/conf.d/mail.ini
%{_php_root}/conf.d/session.ini
%{_php_root}/conf.d/upload.ini
%dir %{_php_root}/extensions
%dir %{_php_root}/var/log
%dir %{_php_root}/var/tmp
%dir %{_php_root}/var/tmp/session
%dir %{_php_root}/var/tmp/upload


%clean
[ "$RPM_BUILD_ROOT" != "/" ] && [ -d $RPM_BUILD_ROOT ] && rm -rf $RPM_BUILD_ROOT


%post
alternatives \
	--install /usr/bin/php php %{_php_root}/bin/php 10 \
		--slave /usr/sbin/php-fpm php-fpm %{_php_root}/sbin/php-fpm \
		--slave /usr/bin/php-config php-config %{_php_root}/bin/php-config \
		--slave /usr/bin/phpize phpize %{_php_root}/bin/phpize \
		--slave /usr/bin/pear pear %{_php_root}/bin/pear \
		--slave /usr/bin/peardev peardev %{_php_root}/bin/peardev \
		--slave /usr/bin/pecl pecl %{_php_root}/bin/pecl \
		--slave /usr/bin/phar phar %{_php_root}/bin/phar \
		--slave /usr/bin/phar.phar phar.phar %{_php_root}/bin/phar.phar \
		--slave /usr/local/share/man/man1/php.1 man-php %{_php_root}/man/man1/php.1 \
		--slave /usr/local/share/man/man1/php-config.1 man-php-config %{_php_root}/man/man1/php-config.1 \
		--slave /usr/local/share/man/man1/phpize.1 man-phpize %{_php_root}/man/man1/phpize.1 \
		--slave /usr/local/share/man/man8/php-fpm.8 man-php-fpm %{_php_root}/man/man8/php-fpm.8



%package fpm
Summary:  PHP FastCGI Process Manager
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-fpm


%description fpm
PHP FastCGI Process Manager


%files fpm
%defattr(-,root,root)
%dir %{_php_root}/var/run
%{_php_root}/etc/php-fpm.conf.default
%{_php_root}/init.d/php-fpm-%{_rpm_ver}
%{_php_root}/sbin/php-fpm
%{_php_root}/man/man8/php-fpm.8
%{_php_root}/share/fpm/status.html



%package devel
Summary:  PHP development files
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-devel


%description devel
PHP development files


%files devel
%defattr(-,root,root)
%{_php_root}/bin/pear
%{_php_root}/bin/peardev
%{_php_root}/bin/pecl
%{_php_root}/bin/php-config
%{_php_root}/bin/phpize
%{_php_root}/man/man1/php-config.1
%{_php_root}/man/man1/phpize.1
%{_php_root}/include/php
%{_php_root}/lib64/build
%{_php_root}/info
%{_php_root}/pear



%include %{_topdir}/SPECS/php-common/exts.spec