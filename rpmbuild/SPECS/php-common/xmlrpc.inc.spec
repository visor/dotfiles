%package ext-xmlrpc
Summary:  PHP xmlrpc extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-xmlrpc


%description ext-xmlrpc
XmlRpc for PHP


%files ext-xmlrpc
%defattr(0644,root,root)
%{_php_root}/extensions/xmlrpc.so
%{_php_root}/conf.d/xmlrpc.ini
