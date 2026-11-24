@echo off
rem Compila el proyecto y genera un JAR ejecutable y autocontenido (Windows).
rem Requiere JDK 11 o superior (javac y jar en el PATH).
setlocal
cd /d "%~dp0"

set MAIN=calculadoradeimpuestosydistancias.Menu
set OUT=dist\CalculadoraDeImpuestosYDistancias.jar

if exist build rmdir /s /q build
if exist dist rmdir /s /q dist
mkdir build
mkdir dist

echo Compilando...
javac --release 11 -encoding UTF-8 -cp lib\AbsoluteLayout.jar -d build src\calculadoradeimpuestosydistancias\*.java
if errorlevel 1 goto error

echo Copiando imagenes...
xcopy /e /i /q src\imagenes build\imagenes >nul

echo Incluyendo AbsoluteLayout dentro del JAR...
pushd build
jar xf ..\lib\AbsoluteLayout.jar org
popd

jar --create --file %OUT% --main-class %MAIN% -C build .
if errorlevel 1 goto error

echo.
echo Listo: %OUT%
echo Ejecuta con:  java -jar %OUT%
goto end

:error
echo.
echo ERROR: no se pudo compilar. Verifica que tienes el JDK 11+ instalado y en el PATH.
exit /b 1

:end
endlocal
