# rozlozeni pro zobrazeni zdrojoveho kodu
layout src
# hlavni okno je okno s prikazy
focus cmd
# chyta hazene vyjimky
catch throw
# logovani prikazu a vystupu do souboru
set trace-commands on
set logging on
break main

define hook-next
  refresh
end

# zprovozneni pretty printeru
python
import sys
sys.path.insert(0, '/usr/share/gcc-8/python/')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
end
