%package ext-phar
Summary:  PHP phar extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-phar


%description ext-phar
Phar for PHP


%files ext-phar
%defattr(0644,root,root)
#%{_php_root}/bin/phar
%{_php_root}/bin/phar.phar
%{_php_root}/extensions/phar.so
%{_php_root}/conf.d/phar.ini
%{_php_root}/man/man1/phar.1
%{_php_root}/man/man1/phar.phar.1
