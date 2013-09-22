%package ext-soap
Summary:  PHP soap extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-soap


%description ext-soap
SOAP for PHP


%files ext-soap
%defattr(0644,root,root)
%{_php_root}/extensions/soap.so
%{_php_root}/conf.d/soap.ini
