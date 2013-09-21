%package ext-ctype
Summary:  PHP ctype extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-ctype


%description ext-ctype
Character type checking for PHP


%files ext-ctype
%defattr(0644,root,root)
%{_php_root}/extensions/ctype.so
%{_php_root}/conf.d/ctype.ini