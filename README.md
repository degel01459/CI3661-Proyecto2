# Proyecto II: Mundo Chiquito

- **Nombres:** Kevin Briceño
- **Carnets:** 15-11661
- **Correo:** `15-11661@usb.ve`

## Estructura del Proyecto

```bash
CI3661-Proyecto2
├─ README.md                -- Este archivo
├─ mundo_chiquito.pl        -- Código fuente en Prolog y Base de Conocimiento
└─ Proyecto_2.pdf           -- Enunciado del proyecto
```

## Descripción

Este proyecto implementa la lógica de la carta "Mundo Chiquito" del juego Yu-Gi-Oh! utilizando el paradigma de Programación Lógica en Prolog. El sistema permite verificar conexiones entre cartas (ternas) basándose en la regla de compartir exactamente una característica (Nivel, Atributo o Poder).

## Explicación de la Implementación

### ternaMundoChiquito(X, Y, Z)

Este es el predicado principal. Prolog busca en la base de conocimiento mostro para instanciar tres cartas (Mano, Puente, Mazo) que cumplan la condición lógica de "Mundo Chiquito".

Se utiliza una regla auxiliar comparten exactamente una que valida mediante un XOR (O exclusivo) lógico:

- (Mismo Nivel) Y (Distinto Atributo) Y (Distinto Poder)
- (Distinto Nivel) Y (Mismo Atributo) Y (Distinto Poder)
- (Distinto Nivel) Y (Distinto Atributo) Y (Mismo Poder)

### mundoChiquito

Es el predicado de ejecución. Utiliza forall para iterar sobre todas las soluciones válidas encontradas por el motor de inferencia y las imprime en la salida estándar con el formato: Mano Puente Mazo.

### agregarMostro

Permite la inserción dinámica de nuevos hechos en la base de datos en tiempo de ejecución.

- Utiliza read para leer términos de Prolog desde la consola.
- Utiliza assertz para agregar el nuevo hecho mostro(...) al final de la base de conocimiento existente.

## Ejecución e Instrucciones

### Iniciar el programa

Desde la terminal, navegue a la carpeta del proyecto y ejecute SWI-Prolog:

```bash
swipl mundo_chiquito.pl
```

### Prueba 1 (Consultar ternas existentes)

Una vez dentro del intérprete ?-, ejecute el predicado principal.

```Prolog
mundoChiquito.
```

Salida esperada:

```Prolog
mostroUno mostroDos mostroUno  
mostroUno mostroDos mostroTres 
mostroDos mostroUno mostroDos  
mostroDos mostroTres mostroDos 
mostroTres mostroDos mostroUno 
mostroTres mostroDos mostroTres
true.
```

### Prueba 2 (Agregar carta)

Ejecute el predicado de carga. IMPORTANTE:

- Al final de cada dato debe colocar un punto (.).
- Los atributos (luz, oscuridad, tierra, etc.) deben ir en minúsculas.
- Si el nombre tiene espacios, use comillas simples (ej: 'Kuriboh Alado').

```Prolog
IMPORTANTE: Cada entrada debe terminar con un punto (.) luego presione Enter.

agregarMostro.
kuriboh.
1.
luz.
300.
agregarMostro.
magooscuro.
7.
oscuridad.
2500.
agregarMostro.
dragonblancodeojosazules.
8.
luz.
3000.
agregarMostro.
dragonnegrodeojosrojos.
7.
oscuridad.
2400.
agregarMostro.
magodeltiempo.
2.
luz.
500.
agregarMostro.
dragondepolvodeestrellas.
8.
viento.
2500.
agregarMostro.
cyberdragon.
5.
luz.
2100.
agregarMostro.
ocultadordeefectos.
1.
luz.
0.
agregarMostro.
flordeceniza.
3.
fuego.
0.
agregarMostro.
sangan.
3.
oscuridad.
1000.
agregarMostro.
brujadelbosquenegro.
4.
oscuridad.
1800.
agregarMostro.
exodiaelprohibido.
3.
oscuridad.
1000.
```

### Prueba 3 (Verificar nuevas conexiones)

Vuelva a ejecutar el comando principal para ver si la nueva carta generó nuevas ternas.

```Prolog
mundoChiquito.
```

### Salir

Para cerrar el intérprete correctamente:

```Prolog
salir.
```
