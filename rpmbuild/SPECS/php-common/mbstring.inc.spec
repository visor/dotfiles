%package ext-mbstring
Summary:  PHP multibyte extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-mbstring


%description ext-mbstring
Enables multibyte support for PHP


%files ext-mbstring
%defattr(0644,root,root)
%{_php_root}/extensions/mbstring.so
%{_php_root}/conf.d/mbstring.ini
