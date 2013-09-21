%package ext-pgsql
Summary:  PHP pgsql extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-pgsql


%description ext-pgsql
PostgreSQL Driver for PHP


%files ext-pgsql
%defattr(0644,root,root)
%{_php_root}/extensions/pgsql.so
%{_php_root}/conf.d/pgsql.ini


%package ext-pdo-pgsql
Summary:  PHP pgsql extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-pdo-pgsql


%description ext-pdo-pgsql
PDO driver for PostgreSQL


%files ext-pdo-pgsql
%defattr(0644,root,root)
%{_php_root}/extensions/pdo_pgsql.so
%{_php_root}/conf.d/pdo_pgsql.ini
