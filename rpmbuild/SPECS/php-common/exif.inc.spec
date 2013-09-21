%package ext-exif
Summary:  PHP exif extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-exif


%description ext-exif
Exchangeable image information for PHP


%files ext-exif
%defattr(0644,root,root)
%{_php_root}/extensions/exif.so
%{_php_root}/conf.d/exif.ini
