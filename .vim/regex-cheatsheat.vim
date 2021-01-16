" zmena promenne na const accessor
s/\(\s\+\)\(.*\) m\(\w\+\);/\1const \2\& c\3() const {return m\3;}/gc

" rovnani doxygen commentu
%s/\(\s\+\)[^\ ]\*\(\ \|\/\|$\)/\1\t\ *\2/gc

" rovnani zavorek u funkci
%s/\(\w\) (/\1(/gc | :%s/\(for\|if\|while\|catch\)(/\1 (/gc

" prepsani playlistu
%s/^\([^#]\)/\\\\192.168.10.3\\Music\\Hang Music\\\1/gc

" escape specialnich znaku pro nft
%s/\([^\\]\)\(["{};]\)/\1\\\2/gc

" replace mVariable with cVariable()
%s/\(= \)*\<m\([A-Z]\w\+\)\( ==\|\(\.[^\ ]\+\) > \|\(\.[^\ ]\+\) <\)/\1c\2()\3/gc

" rename peers - bird
s/\(.*peer\w\+ \){.*\(neighbor.*;\)\ *password.*$/\1from PEERS { \2 description "Router - DOPLN_NAZEV"; }/gc

" IPv4
/^(([01]?\d?\d|2[0-4]\d|25[0-5])\.){3}([01]?\d?\d|2[0-4]\d|25[0-5])\/(\d{1}|[0-2]{1}\d{1}|3[0-2])$

" prevod sql prepared statementu na podminky pro vynechani 0
s/\(\$\d\+\)\(,\|)\)/CASE WHEN \1 = 0 THEN NULL ELSE \1 END\2"\r^I^I^I"/gc

" srovnani {\ a \ }
%s/\ *\(}\|{\)\ */\1/gc

" sql predelani coalesce na case when s konverzi
%s/COALESCE(\(.*\), 0)\(::\w\+\)* AS \(\w\+\)\(,*\)/(CASE WHEN VALUES_CONVERT = FALSE THEN\r^I^I^I^I^I^ICOALESCE(\1)\2\r^I^I^I^I^IELSE\r^I^I^I^I^I^Ifunctions.convert_bps(COALESCE(\1, 0))\2 END) AS \3\4/gc

" sql pro predelani max(coalesce na case when s doplnenim jednotek
%s/MAX(COALESCE(\(.*\), 0))\(::\w\+\)* AS \(\w\+\)\(,*\)/(CASE WHEN VALUES_CONVERT = FALSE THEN\r^I^I^I^I^I^IMAX(COALESCE(\1))\2\r^I^I^I^I^IELSE\r^I^I^I^I^I^IMAX(COALESCE(\1, 0)))\2 || '%' END) AS \3\4/gc
