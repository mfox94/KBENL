:- consult('verbs/conj_verbs').
:- consult('verbs/lexicon_verbs').
:- consult('adjective/adjectives').
:- consult('names/lexicon_names').
:- consult('proper_names/lexicon_proper_names').


lex_det(the,plur,K,S1,S2, exist(the,K,prop(S1,S2))).
lex_det(the,sing,K,S1,S2, exist(the,K,prop(S1,S2))).
lex_det(a,sing,K,S1,S2, exist(a,K,prop(S1,S2))).
lex_det(all,plur,K,S1,S2, all(all,K,prop(S1,S2))).
lex_det(some,plur,K,S1,S2, exist(some,K,prop(S1,S2))).

lex_prep(in).
lex_prep(of).
lex_prep(on).
lex_prep(with).
lex_prep(that).
lex_prep(to).
lex_prep(by).
lex_prep(below).
lex_prep(above).
lex_prep(under).

