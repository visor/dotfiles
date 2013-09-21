%package ext-posix
Summary:  PHP posix extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-posix


%description ext-posix
Posix for PHP


%files ext-posix
%defattr(0644,root,root)
%{_php_root}/extensions/posix.so
%{_php_root}/conf.d/posix.ini
