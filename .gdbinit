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

source /usr/local/src/nadhled/nadhled.break
