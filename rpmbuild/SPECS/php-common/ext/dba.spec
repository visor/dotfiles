%package ext-dba
Summary:  PHP DBA extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-bcmath


%description ext-dba
Provides PHP DBA extension


%files ext-dba
%defattr(0644,root,root)
%{_php_root}/extensions/dba.so
%{_php_root}/conf.d/dba.ini
