/* Load keywors */
load_key([]).
load_key([H|T]):-
			assert(key(H)),
			load_key(T).
			
load_list_key([]).
load_list_key([f(_,K)|T]):-
			load_key(K),
			load_list_key(T).
			

/* Get the users interests */

get_interest:-
			list_keyword(L),
			get_interest(L).
			
get_interest([]).			
get_interest([H|T]):-
			nl,nl,write('Are you interested on know more about '),write(H),write('?	(y/n)'),nl,
			read(X),
			answer(X,H),
			get_interest(T).


load_filtered_facts:-
			findall(f(X,K),rule(X,K),L1),
			sort(L1,List_Rule),
			findall(Int,interest(Int),L2),
			sort(L2,List_Interest),
			find_rule(List_Rule,List_Interest),
			findall(rule(A),rule_to_fire(A),Rule_to_Fire),
			clear_facts,
			fire_rule(Rule_to_Fire).


/* Find the matching rules */			
find_rule([],[]).
find_rule(_,[]).
find_rule([],_).
find_rule([f(Name,Key)|Tr],List_Interest):-
			intersection(Key,List_Interest,Common_Key),
			list_empty(Common_Key,false),
			assert(rule_to_fire(Name)),
			nl,write('ACTIVATED RULE: '),write(Name),write('	'),
			write('BECAUSE YOU ARE INTERESTED IN '),write(Common_Key),nl,
			find_rule(Tr,List_Interest).

find_rule([f(_,Key)|Tr],List_Interest):-
			intersection(Key,List_Interest,Common_Key),
			list_empty(Common_Key,true),
			find_rule(Tr,List_Interest).				
			
/* Fire the matching rules */	
fire_rule([]).
fire_rule([rule(Name)|T]):-
			findall(_,rule(Name,_),_),
			fire_rule(T).
			


answer(y,H):-
			nl,write('--------- You are interested on '),write(H),nl,nl,
			assert(interest(H)).
			
answer(n,H):-
			nl,write('--------- You are not interested on '),write(H),nl,nl,
			assert(not_interest(H)).
			
print:-
			findall(_,print_all_facts,_).	
		
print_all_facts:-
			fact(Facts),
			sent(Facts,Sentence,[]),
			print_sent(Sentence),nl.
				
		

load_all_facts:- 
			findall(f(X,K),rule(X,K),L1),
			sort(L1,List),
			load_list_key(List),
			findall(K,key(K),K1),
			sort(K1,KeyWord_List),
			assert(list_keyword(KeyWord_List)).
			
/* Load Knowledge base */	
load_kb:- 	
			nl,nl,write("++++++++++++++++++++++++++++++++++++++++++++++"),nl,
			write("\t\t WELCOME \t\t"),nl,
			write("++++++++++++++++++++++++++++++++++++++++++++++"),nl,nl,nl,
			write("For starting, please insert the knowledge base to consult:"),nl,nl,
			read(Name_KB),
			consult(Name_KB).
			
	