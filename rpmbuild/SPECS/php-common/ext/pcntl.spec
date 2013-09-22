%package ext-pcntl
Summary:  PHP pcntl extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-pcntl


%description ext-pcntl
Process Control for PHP


%files ext-pcntl
%defattr(0644,root,root)
%{_php_root}/extensions/pcntl.so
%{_php_root}/conf.d/pcntl.ini
