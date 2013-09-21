%package ext-proctitle
Summary:  Allows setting the current process name on Linux and BSD
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-proctitle


%description ext-proctitle
This extension allows changing the current process' name on Linux and *BSD systems. This is useful when using pcntl_fork() to identify running processes in process list


%files ext-proctitle
%defattr(-,root,root)
%{_php_root}/extensions/proctitle.so
%{_php_root}/conf.d/proctitle.ini
