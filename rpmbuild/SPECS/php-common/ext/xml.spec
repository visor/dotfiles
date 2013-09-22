%package ext-xml
Summary:  PHP xml extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-xml


%description ext-xml
XML for PHP


%files ext-xml
%defattr(0644,root,root)
%{_php_root}/extensions/xml.so
%{_php_root}/conf.d/xml.ini
