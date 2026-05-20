# Sistema de Facturación de Llamadas Telefónicas

Implementado en Pharo Smalltalk como ejercicio técnico.

## Cómo correr el sistema

1. Abrir Pharo y cargar los paquetes 'CallBilling' y 'CallBilling-Tests' 
   desde el System Browser. 
2. Abrir el Test Runner para verificar que todos los tests pasan.
3. Abrir un Playground, pega el contenido de `script.st` y correlo.
4. Abrir el Transcript para ver la factura impresa

## Modelo de objetos

El sistema está compuesto por las siguientes entidades:

- **'PhoneNumber'** value object que encapsula número, localidad y país. 
  Sabe compararse geográficamente con otro número.
- **'Call'** clase abstracta. El factory method decide qué subclase instanciar 
  comparando los números de origen y destino.
- **'LocalCall', 'NationalCall', 'InternationalCall'** cada una sabe comunicar 
  su tipo a 'TariffResolver' y 'MonthlyBilling'.
- **'Tariff'** jerarquía abstracta. Cada subclase representa una estrategia de tarifación distinta
- **'TariffResolver'** calcula el costo aplicando la tarifa correspondiente.
- **'Subscriber'** encapsula nombre, abono mensual básico e historial de llamadas.
- **'MonthlyBilling'** genera la factura de un suscriptor para un período dado. 
  

## Supuestos

- Horario pico: días hábiles de 8:00 a 20:00 
- Sábados y domingos aplican siempre tarifa reducida
- Días hábiles: lunes a viernes (no se contemplan feriados)
- Localidades desconocidas: tarifa default $0.15/min
- Países desconocidos: tarifa default $0.50/min
- Las tarifas están hardcodeadas en memoria como pide el enunciado
- Se asume que una llamada pertenece a un solo período de facturación, 
no se contempla el caso de una llamada que empiece en un mes y termine en otro
- Para simplificar el modelo, una llamada se considera local cuando origen y destino pertenecen a la misma localidad y país.


## Proceso de desarrollo

Aplique TDD comenzando por las entidades más pequeñas del dominio 
('PhoneNumber', 'Call') y construyendo hacia las más complejas ('MonthlyBilling'). 
El diseño evolucionó durante el proceso mediante distintos refactors motivados por cambios 
en la comprensión del dominio y las responsabilidades de cada objeto.
Una decisión del proceso fue la introducción de 'TariffResolver' con Double Dispatch que
surgió al llegar al punto en que quería separar las llamadas por tipo sin condicionales. 

Busqué priorizar un diseño orientado a objetos, aplicando patrones cuando aportaban 
claridad al modelo. Soy consciente de que estas decisiones pueden introducir complejidad 
innecesaria si no responden a una necesidad real del dominio.
En un contexto real cada decisión debería estar justificada por una necesidad del modelo 
ya que la simplicidad sigue siendo la mejor medida de calidad (en mi opinión).
Viendo el desarrollo que hice, hay aspectos que posiblemente resolvería distinto hoy. 
En particular, seguiría revisando el modelado entre los tipos de Call y las tarifas 
para evaluar si la separación actual realmente aporta suficiente valor frente a su complejidad.


## Qué mejoraría

- Manejo de errores explícito: validaciones y errores descriptivos ante datos inválidos. 
- Mejoraría el filtrado de llamadas por período para evitar procesar información
innecesaria durante la generación de la factura.
- Manejo de feriados en el calendario
- Versionado de tarifas para mantener precisión en facturas históricas 
- 'PhoneNumber' es una representación simplificada, la localidad y el país se podrían inferir a partir del 
número telefónico y no se cargarían manualmente.

