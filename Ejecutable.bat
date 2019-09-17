@echo off
setlocal enabledelayedexpansion
cls
C:

::=====================================================================================
::					BASE
::=====================================================================================

CD "C:\SaintPMAS"

copy *.TPS c:\PMAS2Csv\Memory\Base

CD "C:\PMAS2Csv\Memory"
COPY pmastps.jar c:\PMAS2Csv\Memory\Base
COPY rxrepl.exe c:\PMAS2Csv\Memory\Base

cls

CD "C:\PMAS2Csv\Memory\Base"

del Upg.Tps

dir /B *.tps > TPSLIST.txt

set num=0

rxrepl.exe -f TPSLIST.txt -s ".TPS" -r "" -o TPSLISTFIRST.txt
rxrepl.exe -f TPSLISTFIRST.txt -s ".tps" -r "" -o TPSLISTSECOND.txt
rxrepl.exe -f TPSLISTSECOND.txt -s ".Tps" -r "" -o TPSLISTUSE.txt

for /f "tokens=*" %%h in (TPSLISTUSE.txt) do (
    set /a num=!num!+1
java -jar pmastps.jar -s %%h.TPS -t %%h.txt
rxrepl.exe -f %%h.txt -s " " -r "" -o %%h.csv

echo %%h.TPS			[FINALIZADO] Espere ...
)
:: El prop�sito de este FOR, era leer las lineas de .txt e ir almacen�ndolas en una variable numerada
 
echo TPS totales que fueron convertidos !num!
del *.txt
del *.tps
del pmastps.jar
del rxrepl.exe

pause

::=====================================================================================
::				TopAdministrativo
::=====================================================================================
CD "C:\SaintPMAS"

COPY .\PAdm\*.TPS c:\PMAS2Csv\Memory\TopAdministrativo
COPY .\PAdm\DAdm\*.TPS c:\PMAS2Csv\Memory\TopAdministrativo

cls

CD "C:\PMAS2Csv\Memory"
COPY pmastps.jar c:\PMAS2Csv\Memory\TopAdministrativo
COPY rxrepl.exe c:\PMAS2Csv\Memory\TopAdministrativo

CD "C:\PMAS2Csv\Memory\TopAdministrativo"

del upg.tps

dir /B *.tps > TPSLIST.txt

set num=0

rxrepl.exe -f TPSLIST.txt -s ".TPS" -r "" -o TPSLISTFIRST.txt
rxrepl.exe -f TPSLISTFIRST.txt -s ".tps" -r "" -o TPSLISTSECOND.txt
rxrepl.exe -f TPSLISTSECOND.txt -s ".Tps" -r "" -o TPSLISTUSE.txt

for /f "tokens=*" %%h in (TPSLISTUSE.txt) do (
    set /a num=!num!+1
java -jar pmastps.jar -s %%h.TPS -t %%h.txt
rxrepl.exe -f %%h.txt -s " " -r "" -o %%h.csv

echo %%h.TPS			[FINALIZADO] Espere ...
)
:: El prop�sito de este FOR, era leer las lineas de .txt e ir almacen�ndolas en una variable numerada
 

del *.txt
del *.tps
del pmastps.jar
del rxrepl.exe



::======================================================================================
::					TopContabilidad
::======================================================================================
CD "C:\SaintPMAS"

COPY .\PCon\*.TPS c:\PMAS2Csv\Memory\TopContabilidad
COPY .\PCon\DCon01\*.TPS c:\PMAS2Csv\Memory\TopContabilidad

cls

CD "C:\PMAS2Csv\Memory"
COPY pmastps.jar c:\PMAS2Csv\Memory\TopContabilidad
COPY rxrepl.exe c:\PMAS2Csv\Memory\TopContabilidad

CD "C:\PMAS2Csv\Memory\TopContabilidad"

del UPG.TPS

dir /B *.tps > TPSLIST.txt

set num=0

rxrepl.exe -f TPSLIST.txt -s ".TPS" -r "" -o TPSLISTFIRST.txt
rxrepl.exe -f TPSLISTFIRST.txt -s ".tps" -r "" -o TPSLISTSECOND.txt
rxrepl.exe -f TPSLISTSECOND.txt -s ".Tps" -r "" -o TPSLISTUSE.txt

for /f "tokens=*" %%h in (TPSLISTUSE.txt) do (
    set /a num=!num!+1
java -jar pmastps.jar -s %%h.TPS -t %%h.txt
rxrepl.exe -f %%h.txt -s " " -r "" -o %%h.csv

echo %%h.TPS			[FINALIZADO] Espere ...
)
:: El prop�sito de este FOR, era leer las lineas de .txt e ir almacen�ndolas en una variable numerada
 

del *.txt
del *.tps
del pmastps.jar
del rxrepl.exe



::======================================================================================
::					TopN�mina
::======================================================================================
CD "C:\SaintPMAS"

COPY .\PNom\*.TPS c:\PMAS2Csv\Memory\TopNomina
COPY .\PNom\DNom\*.TPS c:\PMAS2Csv\Memory\TopNomina

cls

CD "C:\PMAS2Csv\Memory"
COPY pmastps.jar c:\PMAS2Csv\Memory\TopNomina
COPY rxrepl.exe c:\PMAS2Csv\Memory\TopNomina

CD "C:\PMAS2Csv\Memory\TopNomina"

del UPG.TPS

dir /B *.tps > TPSLIST.txt

set num=0

rxrepl.exe -f TPSLIST.txt -s ".TPS" -r "" -o TPSLISTFIRST.txt
rxrepl.exe -f TPSLISTFIRST.txt -s ".tps" -r "" -o TPSLISTSECOND.txt
rxrepl.exe -f TPSLISTSECOND.txt -s ".Tps" -r "" -o TPSLISTUSE.txt

for /f "tokens=*" %%h in (TPSLISTUSE.txt) do (
    set /a num=!num!+1
java -jar pmastps.jar -s %%h.TPS -t %%h.txt
rxrepl.exe -f %%h.txt -s " " -r "" -o %%h.txt

echo %%h.TPS			[FINALIZADO] Espere ...
)
:: El prop�sito de este FOR, era leer las lineas de .txt e ir almacen�ndolas en una variable numerada
 
echo TPS totales que fueron convertidos !num!
del *.txt
del *.tps
del pmastps.jar
del rxrepl.exe

pause
:: Para restaurar los valores inciales y expandir la variable de entorno ya que no se vuelve a hacer bucle tu .bat
endlocal

exit