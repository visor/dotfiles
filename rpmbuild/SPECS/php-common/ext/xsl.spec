%package ext-xsl
Summary:  PHP XSL extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-bcmath


%description ext-xsl
Provides PHP XSL extension


%files ext-xsl
%defattr(0644,root,root)
%{_php_root}/extensions/xsl.so
%{_php_root}/conf.d/xsl.ini
