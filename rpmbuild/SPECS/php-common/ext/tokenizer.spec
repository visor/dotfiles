%package ext-tokenizer
Summary:  PHP tokenizer extension
Requires: php-%{_rpm_ver} = %{version}
Provides: php-%{_rpm_ver}-ext-tokenizer


%description ext-tokenizer
Tokenizer for PHP


%files ext-tokenizer
%defattr(0644,root,root)
%{_php_root}/extensions/tokenizer.so
%{_php_root}/conf.d/tokenizer.ini
