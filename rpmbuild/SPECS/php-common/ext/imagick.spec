%package ext-imagick
Summary:  Provides a wrapper to the ImageMagick library.
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-imagick


%description ext-imagick
Imagick is a native php extension to create and modify images using the ImageMagick API.
This extension requires ImageMagick version 6.2.4+ and PHP 5.1.3+.

IMPORTANT: Version 2.x API is not compatible with earlier versions.


%files ext-imagick
%defattr(0644,root,root)
%{_php_root}/extensions/imagick.so
%{_php_root}/conf.d/imagick.ini
%{_php_root}/include/php/ext/imagick/*.h
