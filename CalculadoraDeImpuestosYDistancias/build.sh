#!/usr/bin/env bash
# Compila el proyecto y genera un JAR ejecutable y autocontenido (macOS / Linux).
# Requiere JDK 11 o superior (javac y jar en el PATH).
set -euo pipefail
cd "$(dirname "$0")"

MAIN=calculadoradeimpuestosydistancias.Menu
OUT=dist/CalculadoraDeImpuestosYDistancias.jar

rm -rf build dist
mkdir -p build dist

echo "Compilando..."
javac --release 11 -encoding UTF-8 -cp lib/AbsoluteLayout.jar -d build \
      src/calculadoradeimpuestosydistancias/*.java

echo "Copiando imagenes..."
cp -R src/imagenes build/imagenes

echo "Incluyendo AbsoluteLayout dentro del JAR..."
(cd build && jar xf ../lib/AbsoluteLayout.jar org)

jar --create --file "$OUT" --main-class "$MAIN" -C build .
echo
echo "Listo: $OUT"
echo "Ejecuta con:  java -jar $OUT"
