%package ext-ftp
Summary:  PHP ftp extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-ftp


%description ext-ftp
FTP support for PHP


%files ext-ftp
%defattr(0644,root,root)
%{_php_root}/extensions/ftp.so
%{_php_root}/conf.d/ftp.ini
