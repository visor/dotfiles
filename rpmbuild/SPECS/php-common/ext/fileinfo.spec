%package ext-fileinfo
Summary:  PHP fileinfo extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-fileinfo


%description ext-fileinfo
File Information for PHP


%files ext-fileinfo
%defattr(0644,root,root)
%{_php_root}/extensions/fileinfo.so
%{_php_root}/conf.d/fileinfo.ini
