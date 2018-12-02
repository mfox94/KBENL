:- consult('Lexicon/main_lexicon').

/* In this file is present the grammar of KBENL */ 

sent(S) --> simple_sentence(S).
sent(S) -->	negative_sentence(S).
sent(S) --> descriptive_sentence(S).

/* Simple sentences */
simple_sentence(S) --> 
				np(K,S2,S,Num,Sem),
				v(K,Prep_List,S1,Num,_,sem(Sem,List_Sem)),
				compl(Prep_List,S1,S2,List_Sem).

/* Negative sentences */
negative_sentence(S) -->
				np(K,dont(S2),S,sing,Sem),
				aux(K,_,dont(_,_),sing,dont),
				v(K,Prep_List,S1,plur,_,sem(Sem,List_Sem)),
				compl(Prep_List,S1,S2,List_Sem).

negative_sentence(S) -->
				np(K,dont(S2),S,plur,Sem),
				aux(K,_,dont(_,_),plur,dont),
				v(K,Prep_List,S1,plur,_,sem(Sem,List_Sem)),
				compl(Prep_List,S1,S2,List_Sem).
				
/* Descriptive sentences */				
descriptive_sentence(S) --> 
				np(K,S2,S,Num,Sem),
				aux(K,_,is(_,_),Num,be),
				adjective(K,S2,Sem).
				

/*intransitive*/
v(S,A,F,Num,W,Sem) --> 
					iv(S,A,F,Num,W,Sem).
/*transitive*/			
v(S,A,F,Num,W,Sem)--> 
					tv(S,A,F,Num,W,Sem).
						
						
/* Complements */				
compl([],S,S,[]) --> [].

compl([arg(null,Object)|Rest],S1,S,[Sem1|Rest_Sem])-->
						np(Object,S2,S,_,Sem1),
						compl(Rest,S1,S2,Rest_Sem).

compl([arg(Prep,Object)|Rest],S1,S,[Sem1|Rest_Sem]) --> 
				p(Prep),
				np(Object,S2,S,_,Sem1),
				compl(Rest,S1,S2,Rest_Sem).
				
/* Nominal part */
np(K,S2,F,Num,Sem) --> 
				det(K,S1,S2,F,Num),
				n(K,S1,Sem,Num).
						
np(K,F,F,sing,Sem) --> 
				proper_name(K,Sem).


/* Connection to the leaves of the tree */				
iv(S,A,F,Num,W,Sem) --> [Word], {coniugate_iv_verb(W,iv,S,A,F,Num,Word,Sem)}.
tv(S,A,F,Num,W,Sem) --> [Word], {coniugate_tv_verb(W,tv,S,A,F,Num,Word,Sem)}.
aux(S,A,F,Num,W) --> [Word], {coniugate_aux(W,S,A,F,Num,Word,_)}.
proper_name(Word,Sem) --> [Word], {lex_proper_names(Word,Sem)}.
n(_,F,Sem,sing) --> [Word],{lex_names(Word,_,Word,F,Sem)}.
n(_,F,Sem,plur) --> [Word],{lex_names(_,Word,Word,F,Sem)}.
adjective(K,F,Sem) --> [Word], {lex_adj(Word,K,F,Sem)}.
det(K,S1,S2,F,Num) --> [Word], {lex_det(Word,Num,K,S1,S2,F)}.
p(Word) --> [Word], {lex_prep(Word)}.



			


/* Conjugation of verbs */
			
coniugate_iv_verb(W,iv,S,A,F,Conj,Word,Sem) :-
					lex_verb(W,iv,S,A,F,Sem),
					verb(W,Word,Conj).
					
coniugate_tv_verb(W,tv,S,A,F,Conj,Word,Sem) :-
					lex_verb(W,tv,S,A,F,Sem),
					verb(W,Word,Conj).					
					
coniugate_aux(W,S,A,F,Conj,Word,_) :-
					lex_verb(W,aux,S,A,F),
					aux(W,Word,Conj).				

/* Analyze sentences */					
analyze_simple(F,String):-
			string2list(X,String),
			simple_sentence(F,X,[]).
			

analyze_negative(F,String):-
			string2list(X,String),
			negative_sentence(F,X,[]).			
	
analyze_descriptive(F,String):-
			string2list(X,String),
			descriptive_sentence(F,X,[]).		
		
string2list(List,String):-
			atomic_list_concat(List,' ',String).			




