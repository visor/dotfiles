%package ext-gd
Summary:  PHP GD extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-gd


%description ext-gd
Image Processing and GD for PHP


%files ext-gd
%defattr(0644,root,root)
%{_php_root}/extensions/gd.so
%{_php_root}/conf.d/gd.ini
