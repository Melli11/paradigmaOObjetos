# Consigna TP-3

## Tipos - El secreto de sus ojos

En "El Secreto de sus Ojos" Pablo Sandoval, el personaje de Guillermo Francella, se percata de que la razón por la cual no pueden atrapar al criminal que persiguen es porque les hacía falta hacer una abstracción para entender cómo es un “[tipo](https://www.youtube.com/watch?v=Rh3kM_sSCuQ "tipo")”.

Un tipo tiene una edad, una cantidad de energía y una pasión (que no puede ser cambiada).
Sabemos que en un inicio la energía de un “tipo” se calcula como `10000 – 30 * edad` y que entre las cosas que puede hacer tenemos:

- disfrutar su pasión.
- descansar, que restaura la energía al nivel inicial.

Las pasiones que nos interesa implementar son:

- Hacer un deporte: Consume un porcentaje determinado de energía.
- Emborracharse y pelear: Deja a la persona solo con 100 de energía (o con la actual si esta ya era menor a 100).
- Hablar de futbol: Consume 150 de energía.

Y queremos modelar a los siguientes tipos:
- Escribano Andretta, que tiene 60 años y le apasiona hablar de futbol.
- Pablo Sandoval, que tiene 54 años y le apasiona “ponerse en pedo y cagarse a trompadas”.
- Manu Ginobili, que tiene 45 años y le apasiona jugar al basketball (lo cual consume 85% de su energía).
- Carlos Bilardo, que tiene 84 años y le apasiona hablar de futbol.
- Franco Milazzo, de 38 años. Sabemos que le apasiona un deporte que le consume el 63% de su energía.
