%package ext-intl
Summary:  PHP intl extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-intl


%description ext-intl
Internationalization Functions for PHP


%files ext-intl
%defattr(0644,root,root)
%{_php_root}/extensions/intl.so
%{_php_root}/conf.d/intl.ini
