:-include("TP").

%tests
:-begin_tests(punto1).
test(planta_arbusto, set(X == [rose])) :-
    plantaArbusto(X).
test(floracion_primavera, set(X == [rose, tulip, orchid])) :-
    florecePrimavera(X).
test(planta_color_amarillo, set(X == [tulip, sunflower])) :-
    plantaColor(X, amarillo).
:-end_tests(punto1).

:-begin_tests(punto2).
test(riego_especial, fail) :-
    riegoEspecial(_).
test(insectos_beneficios, set(X == [rose, tulip, sunflower])) :-
    atraeInsectos_beneficios(X).
test(es_alta, set(X == [rose, cactus, fern, bamboo, ivy])) :-
    esAlta(X).
:-end_tests(punto2).

:-begin_tests(punto3).
test(corta_flor, set(X == [lily, tulip, orchid])) :-
    plantaCortaFlor(X).
:-end_tests(punto3).

:-begin_tests(punto4)
test(coincide_con_pistas, true) :-
    coincideConPistas(rose, arbol_rojo).
test(coincide_con_pistas_negativo, fail) :-
    coincideConPistas(tulip, arbol_rojo).
:-end_tests(punto4).

:-begin_tests(punto5).
test(mas_visitas, true) :-
    planta_atrae_mas_visitas(rose, arbol_rojo).

test(no_mas_visitas, fail) :-
    planta_atrae_mas_visitas(lily, arbol_rojo).
:-end_tests(punto5).
