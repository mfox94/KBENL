:- consult(grammar).

person(clara).
person(marco).
person(gianni).
person(michele).
person(luca).
person(margherita).
person(alex).



location(barcelona).
location(milan).
location(bari).
location(rome).
location(london).
location(turin).

animal(bob).
animal(rex).
animal(fido).
animal(lola).

have(clara,bob).
have(michele,rex).
have(marco,fido).
have(michele,lola).

transport(train).
transport(bus).
transport(plane).




go(marco,bari,plane).
go(clara,milan,bus).
go(margherita,rome,train).
go(luca,london,plane).
go(luca,rome,train).
go(gianni,turin,bus).


food(pizza).
food(pasta).
food(steak).
food(cake).
drink(water).
drink(coke).
drink(coffee).

eat(michele,pizza).
eat(gianni,pasta).
eat(marco,steak).
eat(margherita,cake).
drink(michele,bottle,water).
drink(margherita,cup,coffee).
drink(marco,bottle,coke).

plays(clara, guitar).
plays(michele, piano).
plays(luca, drums).
plays(gianni, keyboard).
plays(margherita, drums).

instrument_genre(guitar, alternative).
instrument_genre(drums, rock).
instrument_genre(keyboard, pop).
instrument_genre(piano, classical).

instrument(guitar).
instrument(drums).
instrument(keyboard).
instrument(piano).


genre(romantic).
genre(action).
genre(dramatic).

film(000,'Via col vento',romantic,'Victor Fleming').
film(001,'Terminator',action,'James Cameron').
film(002,'The godfather',dramatic,'Francis Coppola').
film(003,'Pulp Fiction',action,'Quentin Tarantino').

watch(michele,003).
watch(margherita,002).
watch(luca,002).
watch(margherita,000).
watch(alex,002).
watch(michele,001).

swim(michele).
swim(marco).
swim(luca).

descript(luca,arrogant).
descript(marco,jealous).
descript(marco,ugly).
descript(luca,terrible).
descript(luca,arrogant).
descript(gianni,ugly).





add_names:-
			findall(_,add_music_info,_),
			findall(_,add_person_info,_),
			findall(_,add_film_genre,_),
			findall(_,add_food,_),
			findall(_,add_drink,_),
			findall(_,add_transport,_),
			findall(_,add_location,_),
			findall(_,add_film_info,_).

delete_names:- 
			retractall(lex_proper_names(_,person)),
			retractall(lex_proper_names(_,transport)),
			retractall(lex_proper_names(_,location)),
			retractall(lex_proper_names(_,instrument)),
			retractall(lex_proper_names(_,food)),
			retractall(lex_proper_names(_,drink)),
			retractall(lex_proper_names(_,music_genre)),
			retractall(lex_proper_names(_,film)),
			retractall(lex_proper_names(_,director)),
			retractall(lex_adj(_,adj,_,_,film)).
		
add_person_info:-
			person(P),
			assert(lex_proper_names(P,person)).
			
add_food:-
			food(F),
			assert(lex_proper_names(F,food)).
add_drink:-			
			drink(D),
			assert(lex_proper_names(D,drink)).
			
add_music_info:-
			instrument_genre(I,G),	
			assert(lex_proper_names(I,instrument)),
			assert(lex_adj(G,music_genre)).

add_instrument:-
			instrument(I),	
			assert(lex_proper_names(I,instrument)).
			
add_film_info:-
			film(_,F,_,D),	
			assert(lex_proper_names(F,film)),
			assert(lex_proper_names(D,director)).
add_film_genre:-
			genre(G),
			assert(lex_adj(G,adj,K,film(K,G),film)).

add_transport:-
			transport(T),
			assert(lex_proper_names(T,transport)).
add_location:-
			location(L),
			assert(lex_proper_names(L,location)).			


rule(person_animal,[animal]) :- 
			person(P),
			animal(A),
			have(P,A),
			assert(fact(have(P,A))),
			assert(fact(is_of(A,P))).
			

rule(person_location,[locations]):-	
			person(P),
			location(L),
			go(P,L,_),
			assert(fact(go_to(P,L))).
			
rule(person_travel,[locations,transports]):-		
			person(P),
			transport(T),
			location(L),
			go(P,L,T),
			assert(fact(exist(the, T, prop(transport(T), go_to_by(P, L, T))))).
			
rule(who_swim,[swimmers]):-		
			person(Pers),
			swim(Pers),
			assert(fact(swim(Pers))).
			
rule(who_dont_swim,[swimmers]):-		
			person(Pers),
			not(swim(Pers)),
			assert(fact(dont(swim(Pers)))).
			
rule(person_eat,[food,drinks]):-		
			person(Pers),
			eat(Pers,Food),
			drink(Pers,Container,Drink),
			assert(fact(exist(a,Food, prop(food(Food),eat(Pers,Food))))),
			assert(fact(exist(a,Food, prop(food(Food), exist(a, Container, prop(container(Container),  eat_with_of(Pers,Food,Container,Drink))))))).

			
rule(who_watch,[films]):-
			watch(P,F),
			film(F,T,_,_),
			assert(fact(watch(P, T))).
			
			
rule(film_info,[films,genres]):-
			assert(fact(all(all, F, prop(film(films), exist(a, G, prop(genre(genre), have(F, G))))))),
			film(_,T,G,_),
			assert(fact(film(T, G))).


			
rule(film_director,[films,directors]):-
			film(_,T,_,D),
			assert(fact(is_of(T, D))).
			
rule(play_instrument,[instruments]):-
			assert(fact(exist(some, Pr, prop(person(people), exist(a, In, prop(instrument(instrument), play(Pr, In))))))),
			person(P),
			plays(P,I),
			assert(fact(play(P,I))).
			
rule(person_descript,[people]):-
			descript(P,D),
			assert(fact(person(P,D))).
	
			
