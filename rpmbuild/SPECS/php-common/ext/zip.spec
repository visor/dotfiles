%package ext-zip
Summary:  PHP zip extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-zip


%description ext-zip
ZipArchive for PHP


%files ext-zip
%defattr(0644,root,root)
%{_php_root}/extensions/zip.so
%{_php_root}/conf.d/zip.ini
