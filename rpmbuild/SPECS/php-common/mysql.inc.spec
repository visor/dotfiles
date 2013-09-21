%package ext-mysql
Summary:  PHP mysql and mysqlnd extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-mysql


%description ext-mysql
MySQL with Native Driver for PHP


%files ext-mysql
%defattr(0644,root,root)
%{_php_root}/extensions/mysql.so
%{_php_root}/conf.d/mysql.ini
