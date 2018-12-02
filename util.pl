/* Clear statements */	
cf:- clear_facts,clear_keys,clear_interest.
			
clear_facts :-
			retractall(fact(_)).
clear_keys:-
			retractall(key(_)),
			retractall(list_keyword(_)),
			retractall(rule_to_fire(_)).
clear_interest:-
			retractall(interest(_)).

clear_switch:-
			retractall(switch(_)).			


list_empty([], true).
list_empty([_|_], false).
			
intersectionTR(_, [], []).
intersectionTR([], _, []).
intersectionTR([H1|T1], L2, [H1|L]):-
    member(H1, L2),
    intersectionTR(T1, L2, L), !.
intersectionTR([_|T1], L2, L):-
    intersectionTR(T1, L2, L).

intersection(L1, L2):-
    intersectionTR(L1, L2, L),
    write(L).
	
	

		
print_sent(L):-
			atomic_list_concat(L,' ',Out),
			write(Out).


