%package ext-wddx
Summary:  PHP WDDX extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-bcmath


%description ext-wddx
Provides PHP WDDX extension


%files ext-wddx
%defattr(0644,root,root)
%{_php_root}/extensions/wddx.so
%{_php_root}/conf.d/xml.wddx.ini