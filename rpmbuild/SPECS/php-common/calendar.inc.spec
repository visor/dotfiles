%package ext-calendar
Summary:  PHP calendar extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-calendar


%description ext-calendar
Calendar for PHP


%files ext-calendar
%defattr(0644,root,root)
%{_php_root}/extensions/calendar.so
%{_php_root}/conf.d/calendar.ini