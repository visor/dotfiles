%package ext-opcache
Summary:  Zend OPcache extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-opcache


%description ext-opcache
The Zend OPcache provides faster PHP execution through opcode caching and
optimization. It improves PHP performance by storing precompiled script
bytecode in the shared memory. This eliminates the stages of reading code from
the disk and compiling it on future access. In addition, it applies a few
bytecode optimization patterns that make code execution faster.


%files ext-opcache
%defattr(-,root,root)
%{_php_root}/extensions/opcache.so
%{_php_root}/conf.d/opcache.ini