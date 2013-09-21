%package ext-http
Summary:  Extended HTTP Support
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-http


%description ext-http
Extended HTTP support. Again.


%files ext-http
%defattr(-,root,root)
%{_php_root}/extensions/http.so
%{_php_root}/conf.d/http.ini
%{_php_root}/include/php/ext/http/*.h
%{_php_root}/include/php/ext/http/phpstr/*.h
