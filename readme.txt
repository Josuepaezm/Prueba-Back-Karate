INSTRUCCIONES DE EJECUCIÓN - PRUEBAS API EN PAGINA DEMOBLAZE

Pre-requisitos:
1. Tener instalado Java JDK 11 o superior.
2. Tener instalado Apache Maven.
3. IDE recomendado: IntelliJ IDEA (con los plugins "Gherkin" y "Karate" instalados para mejor lectura).

Pasos para la ejecución:
1. Descomprimir el archivo zip en un directorio local.
2. Abrir IntelliJ IDEA O VS CODE y seleccionar "Open" -> Elegir la carpeta descomprimida (donde se encuentra el pom.xml).
3. Esperar a que IntelliJ descargue las dependencias de Maven (karate-junit5).
4. Ejecución por Consola: Abrir la terminal integrada de IntelliJ y ejecutar el comando:
   mvn clean test
5. Ejecución por IDE: Navegar a src/test/java/back/PaginaTest.java y hacer clic en el botón de "Play" verde junto a la clase.

Reportes:
Una vez finalizada la prueba, Karate genera automáticamente un reporte visual.
Ruta del reporte: target/karate-reports/karate-summary.html
Ábralo en cualquier navegador web para visualizar el detalle de los Requests y Responses.