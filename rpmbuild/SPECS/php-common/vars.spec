%define _php_root /var/php/%{_rpm_ver}
%define _php_bin  %{_php_root}/bin
%define _php_ext  $RPM_BUILD_ROOT%{_php_root}/lib64/extensions/no-debug-zts-%{_php_api}
%define _php_bext $RPM_BUILD_ROOT%{_php_root}/extensions
%define _php_conf $RPM_BUILD_ROOT%{_php_root}/conf.d

%define _rpmdir %{_topdir}/RPMS/php-%{_rpm_ver}
%define _rpmfilename %%{NAME}-%%{RELEASE}.%%{ARCH}.rpm

%define _use_ext() \
	rm -rf ext/%2 && /bin/tar -xf %{_sourcedir}/php-ext/%1.tgz && mv %1 ext/%2;

%define _ext_ini() \
	%define ini %1 \
	%{?2:%define ini %2} \
	echo %ini && echo "extension=%{1}.so" > %{_php_conf}/%{ini}.ini && chmod 0644 %{_php_conf}/%{ini}.ini;

%define _use_ext_files() \
	%define ini %1 \
	%{?2:%define ini %2} \
	%{_php_root}/extensions/%{1}.so \
	%{_php_root}/conf.d/%{ini}.ini;
