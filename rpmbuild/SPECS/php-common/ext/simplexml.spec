%package ext-simplexml
Summary:  PHP simplexml extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-simplexml


%description ext-simplexml
SimpleXml for PHP


%files ext-simplexml
%defattr(0644,root,root)
%{_php_root}/extensions/simplexml.so
%{_php_root}/conf.d/simplexml.ini
