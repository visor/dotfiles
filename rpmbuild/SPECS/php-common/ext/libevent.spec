%package ext-libevent
Summary:  Libevent - event notification
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-libevent


%description ext-libevent
This extension is a wrapper for libevent - event notification library.


%files ext-libevent
%defattr(0644,root,root)
%{_php_root}/extensions/libevent.so
%{_php_root}/conf.d/libevent.ini
