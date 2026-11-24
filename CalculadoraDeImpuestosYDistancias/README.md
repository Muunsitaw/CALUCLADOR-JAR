# CalculadoraDeImpuestosYDistancias

Programa Java Swing (menú, calculadora de impuestos y de distancias).

## Requisito
JDK 11 o superior (https://adoptium.net). Verifica con `java -version` y `javac -version`.

## Compilar y ejecutar desde la consola

**macOS / Linux**
```bash
./build.sh        # genera dist/CalculadoraDeImpuestosYDistancias.jar
./run.sh          # compila si hace falta y ejecuta
```
(Si no tiene permisos: `chmod +x build.sh run.sh`)

**Windows (cmd o doble clic)**
```bat
build.bat
run.bat
```

El JAR generado es autocontenido (incluye imágenes y AbsoluteLayout), así que se puede copiar a cualquier equipo con Java 11+ y ejecutar con:
```
java -jar CalculadoraDeImpuestosYDistancias.jar
```
