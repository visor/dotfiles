%package ext-mongo
Summary:  MongoDB database driver
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-mongo


%description ext-mongo
This package provides an interface for communicating with the MongoDB database in PHP


%files ext-mongo
%defattr(0644,root,root)
%{_php_root}/extensions/mongo.so
%{_php_root}/conf.d/mongo.ini
