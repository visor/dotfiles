%package ext-curl
Summary:  PHP curl extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-curl


%description ext-curl
Client URL Library wrapper for PHP


%files ext-curl
%defattr(0644,root,root)
%{_php_root}/extensions/curl.so
%{_php_root}/conf.d/curl.ini
