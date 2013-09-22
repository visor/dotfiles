%package ext-xdebug
Summary:  PHP Xdebug extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-xdebug


%description ext-xdebug
Xdebug provides functions for function traces and profiling


%files ext-xdebug
%defattr(-,root,root)
%{_php_root}/extensions/xdebug.so
%{_php_root}/conf.d/xdebug.ini
