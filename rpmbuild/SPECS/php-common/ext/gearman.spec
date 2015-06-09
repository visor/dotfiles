%package ext-gearman
Summary:  PHP wrapper to libgearman
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-gearman


%description ext-gearman
This extension uses libgearman library to provide API for communicating with gearmand, and writing clients and workers.


%files ext-gearman
%defattr(0644,root,root)
%{_php_root}/extensions/gearman.so
%{_php_root}/conf.d/gearman.ini
