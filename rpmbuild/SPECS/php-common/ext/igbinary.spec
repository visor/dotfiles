%package ext-igbinary
Summary:  Igbinary serializer
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-igbinary


%description ext-igbinary
Igbinary is a drop in replacement for the standard php serializer.


%files ext-igbinary
%defattr(0644,root,root)
%{_php_root}/extensions/igbinary.so
%{_php_root}/conf.d/igbinary.ini
%{_php_root}/include/php/ext/igbinary/igbinary.h
