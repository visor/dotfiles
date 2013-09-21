%package ext-bz2
Summary:  PHP bzip2 extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-bz2


%description ext-bz2
Bzip2 for PHP


%files ext-bz2
%defattr(0644,root,root)
%{_php_root}/extensions/bz2.so
%{_php_root}/conf.d/bz2.ini