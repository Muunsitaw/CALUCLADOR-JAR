@echo off
cd /d "%~dp0"
if not exist dist\CalculadoraDeImpuestosYDistancias.jar call build.bat
java -jar dist\CalculadoraDeImpuestosYDistancias.jar
