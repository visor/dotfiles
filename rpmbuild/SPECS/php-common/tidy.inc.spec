%package ext-tidy
Summary:  PHP tidy extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-tidy


%description ext-tidy
XmlRpc for PHP


%files ext-tidy
%defattr(0644,root,root)
%{_php_root}/extensions/tidy.so
%{_php_root}/conf.d/tidy.ini