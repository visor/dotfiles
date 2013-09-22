%package ext-iconv
Summary:  PHP iconv extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-iconv


%description ext-iconv
Iconv for PHP


%files ext-iconv
%defattr(0644,root,root)
%{_php_root}/extensions/iconv.so
%{_php_root}/conf.d/iconv.ini
