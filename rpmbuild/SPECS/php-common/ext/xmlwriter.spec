%package ext-xmlwriter
Summary:  PHP xmlwriter extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-xmlwriter


%description ext-xmlwriter
XmlWriter for PHP


%files ext-xmlwriter
%defattr(0644,root,root)
%{_php_root}/extensions/xmlwriter.so
%{_php_root}/conf.d/xmlwriter.ini
