:- dynamic mostro/4.


% 1. BASE DE CONOCIMIENTO INICIAL
% mostro(Nombre, Nivel, Atributo, Poder).
mostro(mostroUno, 5, luz, 2100).
mostro(mostroDos, 7, luz, 2400).
mostro(mostroTres, 7, viento, 2500).

% 2. MUNDO CHIQUITO
% Regla auxiliar: comparten exactamente una caracteristica.
% Verifica si dos conjuntos de caracteristicas comparten EXACTAMENTE una.
comparten_exactamente_una(N1, A1, P1, N2, A2, P2) :-
    (N1 =:= N2, A1 \= A2, P1 =\= P2);  % Coincide solo Nivel
    (N1 =\= N2, A1 = A2, P1 =\= P2);   % Coincide solo Atributo
    (N1 =\= N2, A1 \= A2, P1 =:= P2).  % Coincide solo Ataque

% 3. TERNA MUNDO CHIQUITO
% Evalúa verdadero para las ternas X (Mano), Y (Puente), Z (Mazo)
ternaMundoChiquito(X, Y, Z) :-

    % 1. Obtener características de la carta X (Mano)
    mostro(X, N1, A1, P1),
    
    % 2. Buscar carta Y (Puente) que exista en la base
    mostro(Y, N2, A2, P2),
    X \= Y, % Una carta no puede ser puente de sí misma (compartiría 3 rasgos)
    
    % 3. Verificar conexión Mano -> Puente
    comparten_exactamente_una(N1, A1, P1, N2, A2, P2),
    
    % 4. Buscar carta Z (Destino/Mazo)
    mostro(Z, N3, A3, P3),
    Y \= Z, % El puente no puede ser igual al destino (compartiría 3 rasgos)
    
    % 5. Verificar conexión Puente -> Destino
    comparten_exactamente_una(N2, A2, P2, N3, A3, P3).
    % Nota: No agregamos X \= Z, porque es válido buscar una copia de la carta inicial.


% 3. IMPRESIÓN DE RESULTADOS
% Imprime todas las ternas posibles.
mundoChiquito :-
    % forall(Condicion, Accion): Para cada terna válida, imprime los nombres.
    forall(ternaMundoChiquito(X, Y, Z),
           format('~w ~w ~w~n', [X, Y, Z])).

% 4. GESTIÓN DINÁMICA DE DATOS
% Lee datos por consola y agrega un nuevo hecho a la base de conocimiento.
agregarMostro :-
    write('--- Agregar Nuevo Mostro ---'), nl,
    write('IMPORTANTE: Termine cada entrada con un punto (.) y presione Enter.'), nl,
    
    write('Nombre (Ejemplo: kuriboh.): '),
    read(Nombre),
    
    write('Nivel (Ejemplo: 1.): '),
    read(Nivel),
    
    write('Atributo (Ejemplo: oscuridad.): '),
    read(Atributo),
    
    write('Poder (Ejemplo: 300.): '),
    read(Poder),
    
    % Verificamos que no sean variables sin instanciar
    (ground([Nombre, Nivel, Atributo, Poder]) ->
        assertz(mostro(Nombre, Nivel, Atributo, Poder)),
        write('Mostro agregado exitosamente.'), nl
    ;
        write('Error: Datos inválidos.'), nl
    ).

% 5. UTILIDADES
% Imprime un mensaje y cierra el intérprete de Prolog.
salir :-
    write('Fin de la jugada. Cerrando Mundo Chiquito...'), nl,
    halt.
