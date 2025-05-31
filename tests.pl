:-include("TP").

% Punto 1: Consultas básicas sobre plantas
:-begin_tests(punto1).

test(planta_arbusto, set(X == [rose])) :-
    plantaArbusto(X).

test(floracion_primavera, set(X == [rose, tulip, orchid])) :-
    florecePrimavera(X).

test(planta_color_amarillo, set(X == [tulip, sunflower])) :-
    plantaColor(X, amarillo).

test(planta_color_verdes, set(X == [cactus, fern, bamboo, ivy])) :-
    plantaColor(X, verdes).

:-end_tests(punto1).


% Punto 2: Reglas sobre riego, insectos, y altura según tipo
:-begin_tests(punto2).

test(arbustos_florecen_verano, set(X == [])) :-
    florecenEnVerano(X).

test(atrae_insectos_beneficos, set(X == [rose, tulip, sunflower])) :-
    atraeInsectosBeneficos(X).

test(plantas_no_flor_altas, set(X == [rose, cactus, fern, bamboo, ivy])) :-
    plantasNoFlorAlta(X).

:-end_tests(punto2).


% Punto 3: Conjunto de plantas cortas y de tipo flor
:-begin_tests(punto3).

test(plantas_cortas_flor, set(X == [lily, tulip, orchid])) :-
    plantaCortaFlor(X).

test(conjunto_plantas_cortas_flor, true(Plantas == [lily, tulip, orchid])) :-
    plantasCortasFlorConjunto(Plantas).

:-end_tests(punto3).


% Punto 4: Coincidencia entre planta y observador
:-begin_tests(punto4).

test(coincide_con_pistas_ok, set(X == [rose])) :-
    coincideConPistas(X, arbol_rojo).

test(coincide_con_pistas_fail, fail) :-
    coincideConPistas(lily, arbol_rojo).

:-end_tests(punto4).


% Punto 5: Comparación entre plantas compañeras según pistas
:-begin_tests(punto5).

% Agregamos pistas para este test
:- dynamic pista/2.
pista(visitante1, tipo(flor)).
pista(visitante1, color(amarillo)).
pista(visitante1, altura(corta)).

test(pistas_cumple_tulip, true(C == 3)) :-
    pistasCumple(tulip, visitante1, C).

test(pistas_cumple_sunflower, true(C == 2)) :-
    pistasCumple(sunflower, visitante1, C).

test(tulip_mas_visitas_que_sunflower, set(X == [tulip])) :-
    plantaMasVisitas(X, visitante1).

test(sunflower_mas_visitas_fail, fail) :-
    plantaMasVisitas(sunflower, visitante1).

:-end_tests(punto5).
