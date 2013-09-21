%package ext-apc
Summary:  PHP APC extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-apc


%description ext-apc
The Alternative PHP Cache (APC) is a free and open opcode cache for PHP.
Its goal is to provide a free, open, and robust framework for caching
and optimizing PHP intermediate code.


%files ext-apc
%defattr(-,root,root)
%{_php_root}/extensions/apc.so
%{_php_root}/conf.d/apc.ini
%{_php_root}/include/php/ext/apc/apc_serializer.h