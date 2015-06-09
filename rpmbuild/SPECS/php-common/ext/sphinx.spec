%package ext-sphinx
Summary:  Client extension for Sphinx - opensource SQL full-text search engine
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-sphinx


%description ext-sphinx
This extension provides bindings for libsphinxclient, client library for Sphinx.


%files ext-sphinx
%defattr(0644,root,root)
%{_php_root}/extensions/sphinx.so
%{_php_root}/conf.d/sphinx.ini
