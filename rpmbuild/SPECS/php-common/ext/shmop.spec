%package ext-shmop
Summary:  PHP shmop extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-shmop


%description ext-shmop
Shared Memory for PHP


%files ext-shmop
%defattr(0644,root,root)
%{_php_root}/extensions/shmop.so
%{_php_root}/conf.d/shmop.ini
