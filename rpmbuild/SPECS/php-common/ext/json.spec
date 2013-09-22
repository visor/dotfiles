%package ext-json
Summary:  PHP json extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-json


%description ext-json
JSON functions for PHP


%files ext-json
%defattr(0644,root,root)
%{_php_root}/extensions/json.so
%{_php_root}/conf.d/json.ini
