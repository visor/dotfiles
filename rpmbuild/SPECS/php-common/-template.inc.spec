%package ext-
Summary:  PHP  extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-

%description ext-
 for PHP

%files ext-
%defattr(0644,root,root)
%use_ext_files
#%{_php_root}/extensions/.so
#%{_php_root}/conf.d/.ini
