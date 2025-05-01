%Jardín Botánico Virtual
%Has sido encargado de desarrollar una base de conocimiento para un jardín botánico virtual.
%La idea del proyecto es que los usuarios puedan hacer consultas sobre las plantas del jardín.
%A continuación, se ofrece una base de datos inicial:
planta(rose, color(rojo)).
planta(rose, altura(media)).
planta(rose, epoca(floracion, primavera)).
planta(rose, tipo(arbusto)).
planta(lily, color(blanco)).
planta(lily, altura(corta)).
planta(lily, epoca(floracion, verano)).
planta(lily, tipo(flor)).
planta(tulip, color(amarillo)).
planta(tulip, altura(corta)).
planta(tulip, epoca(floracion, primavera)).
planta(tulip, tipo(flor)).
planta(sunflower, color(amarillo)).
planta(sunflower, altura(alta)).
planta(sunflower, epoca(floracion, verano)).
planta(sunflower, tipo(flor)).
planta(cactus, color(verdes)).
planta(cactus, altura(baja)).
planta(cactus, epoca(floracion, verano)).
planta(cactus, tipo(suculenta)).
planta(fern, color(verdes)).
planta(fern, altura(media)).
planta(fern, epoca(floracion, todo_el_ano)).
planta(fern, tipo(helecho)).
planta(orchid, color(purple)).
planta(orchid, altura(corta)).
planta(orchid, epoca(floracion, primavera)).
planta(orchid, tipo(flor)).
planta(bamboo, color(verdes)).
planta(bamboo, altura(alta)).
planta(bamboo, epoca(floracion, todo_el_ano)).
planta(bamboo, tipo(pasto)).
planta(ivy, color(verdes)).
planta(ivy, altura(media)).
planta(ivy, epoca(floracion, todo_el_ano)).
planta(ivy, tipo(plantas_enredaderas)).
plantas_companeras(rose, lily).
plantas_companeras(lily, rose).
plantas_companeras(tulip, sunflower).
plantas_companeras(sunflower, tulip).
plantas_companeras(cactus, fern).
plantas_companeras(fern, cactus).
plantas_companeras(orchid, ivy).
plantas_companeras(ivy, orchid).
plantas_companeras(bamboo, rose).
plantas_companeras(rose, bamboo).
%La base puede expandirse en el futuro, por lo que debe poder aceptar todos los casos.
%TODOS los predicados deben ser inversibles y no puede utilizarse recursividad, salvo que se indique lo contrario.
%Tareas:
%1 Queremos poder preguntar sobre nuestras plantas si:
%a. Son de tipo arbusto.
%b. Florecen en primavera.
%c. Tienen un color específico.
plantaArbusto(Planta) :-planta(Planta, tipo(arbusto)).
florecePrimavera(Planta) :-planta(Planta, epoca(floracion, primavera)).
plantaColor(Planta, Color) :-planta(Planta, color(Color)).
%2 Sabemos que:
%a. Las plantas que son arbustos y florecen en verano deben tener un sistema de riego especial.
riegoEspecial(Planta) :-
    planta(Planta, tipo(arbusto)),
    planta(Planta, epoca(floracion, verano)).
%b. Las plantas rojas o amarillas atraen más insectos benéficos.
atraeInsectos_beneficos(Planta) :-
    planta(Planta, color(rojo)).

atraeInsectos_beneficos(Planta) :-
    planta(Planta, color(amarillo)).
%c. Las plantas que no son de tipo flor son consideradas altas.
esAlta(Planta) :-
    planta(Planta, tipo(Tipo)),
    Tipo \= flor.
%Realizar el predicado que nos permita agregar este conocimiento y el punto 1 no deba modificarse.
%3 Se necesita conocer el conjunto de todas las plantas que son cortas y de tipo flor.
plantaCortaFlor(Planta) :-
    planta(Planta, altura(corta)),
    planta(Planta, tipo(flor)).
%4 Ahora debemos agregar las pistas obtenidas durante las observaciones. Por ejemplo:
pista(arbol_rojo, tipo(arbusto)).
pista(arbol_rojo, altura(media)).
%Queremos relacionar una planta y un observador solo si todas las pistas que tiene el observador
%son características de la planta. En este punto no se puede usar findall.
coincideConPistas(Planta, Observador) :-
    pista(Observador, _),
    planta(Planta, _),
    forall(pista(Observador, Caracteristica),
           planta(Planta, Caracteristica)).
%5 Finalmente, queremos saber si una planta está atrayendo más visitas que su compañera.
%Para ello, la cantidad de pistas que cumple debe ser mayor que la de las plantas compañeras.
planta_atrae_mas_visitas(Planta, Observador) :-
    planta(Planta, _),
    plantas_companeras(Planta, Companera),
    Companera \= Planta,
    pistas_que_cumple(Planta, Observador, CantPlanta),
    pistas_que_cumple(Companera, Observador, CantCompanera),
    CantPlanta > CantCompanera.

pistas_que_cumple(Planta, Observador, Cantidad) :-
    aggregate_all(count, 
        (pista(Observador, Caracteristica),
         planta(Planta, Caracteristica)),
        Cantidad).


