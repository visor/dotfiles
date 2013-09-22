%package ext-bcmath
Summary:  PHP bcmath extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-bcmath


%description ext-bcmath
BCMath Arbitrary Precision Mathematics for PHP


%files ext-bcmath
%defattr(0644,root,root)
%{_php_root}/extensions/bcmath.so
%{_php_root}/conf.d/bcmath.ini