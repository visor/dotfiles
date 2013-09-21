%package ext-xmlreader
Summary:  PHP xmlreader extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-xmlreader


%description ext-xmlreader
XmlReader for PHP


%files ext-xmlreader
%defattr(0644,root,root)
%{_php_root}/extensions/xmlreader.so
%{_php_root}/conf.d/xmlreader.ini
