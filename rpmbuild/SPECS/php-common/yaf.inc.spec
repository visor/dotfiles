%package ext-yaf
Summary:  PHP Yet Another Framework
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-yaf


%description ext-yaf
PHP Yet Another Framework


%files ext-yaf
%defattr(0644,root,root)
%{_php_root}/extensions/yaf.so
%{_php_root}/conf.d/yaf.ini
