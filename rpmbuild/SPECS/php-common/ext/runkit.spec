%package ext-runkit
Summary:  Runkit extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-runkit


%description ext-runkit
Replace, rename, and remove user defined functions and classes.
Define customized superglobal variables for general purpose use.
Execute code in restricted environment (sandboxing).


%files ext-runkit
%defattr(-,root,root)
%{_php_root}/extensions/runkit.so
%{_php_root}/conf.d/runkit.ini
