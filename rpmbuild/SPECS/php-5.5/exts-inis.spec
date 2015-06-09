install -m 0644 assert.ini   %{_php_conf}/assert.ini
install -m 0644 date.ini     %{_php_conf}/date.ini
install -m 0644 errors.ini   %{_php_conf}/errors.ini
install -m 0644 mail.ini     %{_php_conf}/mail.ini
install -m 0644 mbstring.ini %{_php_conf}/mbstring.ini
install -m 0644 session.ini  %{_php_conf}/session.ini
install -m 0644 upload.ini   %{_php_conf}/upload.ini
install -m 0644 xdebug.ini   %{_php_conf}/xdebug.ini

%_ext_ini apc
%_ext_ini bcmath
%_ext_ini bz2
%_ext_ini calendar
%_ext_ini ctype
%_ext_ini curl
%_ext_ini dba
%_ext_ini exif
%_ext_ini fileinfo
%_ext_ini ftp
%_ext_ini gd
%_ext_ini gearman
%_ext_ini gmp
%_ext_ini http
%_ext_ini iconv
%_ext_ini igbinary
%_ext_ini imagick
%_ext_ini intl
%_ext_ini json
%_ext_ini libevent
%_ext_ini mongo
%_ext_ini mysql
%_ext_ini pcntl
%_ext_ini pdo_pgsql
%_ext_ini pgsql
%_ext_ini phar
%_ext_ini posix
%_ext_ini proctitle
%_ext_ini runkit
%_ext_ini shmop
%_ext_ini simplexml
%_ext_ini soap
%_ext_ini sphinx
%_ext_ini tokenizer
%_ext_ini tidy
%_ext_ini xml
%_ext_ini wddx xml.wddx
%_ext_ini xmlreader
%_ext_ini xmlrpc
%_ext_ini xmlwriter
%_ext_ini xsl
%_ext_ini yaf
%_ext_ini zip


%_zend_ext_ini opcache
echo "" >> %{_php_conf}/opcache.ini
echo "opcache.memory_consumption=128" >> %{_php_conf}/opcache.ini
echo "opcache.interned_strings_buffer=8" >> %{_php_conf}/opcache.ini
echo "opcache.max_accelerated_files=4000" >> %{_php_conf}/opcache.ini
echo "opcache.revalidate_freq=60" >> %{_php_conf}/opcache.ini
echo "opcache.fast_shutdown=1" >> %{_php_conf}/opcache.ini
echo "opcache.enable_cli=1" >> %{_php_conf}/opcache.ini