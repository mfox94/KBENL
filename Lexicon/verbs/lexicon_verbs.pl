lex_verb(be,aux,S,[arg(null,O)],is(S,O)).
lex_verb(be,aux,S,[arg(on,O)],is_on(S,O)).
lex_verb(be,aux,S,[arg(in,O)],is_in(S,O)).

lex_verb(dont,aux,S,[arg(null,O)],dont(S,O)).

lex_verb(be,tv,S,[arg(null,O)],is(S,O),sem(person,[person])).
lex_verb(be,tv,S,[arg(on,O)],is_on(S,O),sem(person,[person])).
lex_verb(be,tv,S,[arg(in,O)],is_in(S,O),sem(person,[person])).
lex_verb(be,tv,S,[arg(of,O)],is_of(S,O),sem(_,[_])).


lex_verb(have,tv,S,[arg(null,O)],have(S,O),sem(_,[_])).

lex_verb(think,iv,S,[arg(to,O)], think_to(S,O),sem(person,[person])).
lex_verb(think,iv,S,[arg(by,O)], think_by(S,O),sem(person,[person])).
lex_verb(think,iv,S,[], think(S,_),sem(_,[])).

lex_verb(talk,iv,S,[],talk(S),sem(person,[])).
lex_verb(talk,iv,S,[arg(of,O)],talk_of(S,O),sem(person,[person])).
lex_verb(talk,iv,S,[arg(with,O)],talk_with(S,O),sem(person,[person])).
lex_verb(talk,iv,S,[arg(of,O),arg(with,O1)],talk_of_with(S,O1,O),sem(inanimate,[inanimate,inanimate])).

lex_verb(go,iv,S,[arg(to,O)], go_to(S,O),sem(person,[location])).
lex_verb(go,iv,S,[arg(by,O)], go_by(S,O),sem(person,[transport])).
lex_verb(go,iv,S,[arg(to,O),arg(by,O1)], go_to_by(S,O,O1),sem(person,[location,transport])).

lex_verb(eat,tv,S,[arg(by,O)],eat_by(S,O),sem(food,[person])).
lex_verb(eat,tv,S,[arg(null,O)],eat(S,O),sem(person,[food])).
lex_verb(eat,tv,S,[arg(null,O),arg(with,O1)],eat_with(S,O,O1),sem(person,[food,person])).
lex_verb(eat,tv,S,[arg(null,O),arg(with,O1),arg(of,O2)],eat_with_of(S,O,O1,O2),sem(person,[food,container,drink])).

lex_verb(drink,tv,S,[arg(null,O)],drink(S,O),sem(person,[drink])).
lex_verb(drink,iv,S,[],drink(S,_),sem(person)).

lex_verb(drink,tv,S,[arg(null,O)],hold(S,O),sem(professor,[course])).

lex_verb(hold,tv,S,[arg(null,O),arg(of,O1),arg(in,O2)],hold_lesson_of_in(S,O,O1,O2),sem(professor,[lesson,subject,room])).

lex_verb(teach,tv,S,[arg(null,O)],teach(S,O),sem(professor,[subject])).
lex_verb(teach,tv,S,[arg(null,O),arg(in,O1)],teach_in(S,O,O1),sem(professor,[subject,room])).
lex_verb(teach,tv,S,[arg(null,O),arg(to,O1)],teach_to(S,O,O1),sem(professor,[subject,person])).
lex_verb(teach,tv,S,[arg(null,O),arg(on,O1)],teach_on(S,O,O1),sem(professor,[subject,day])).
lex_verb(teach,tv,S,[arg(null,O),arg(to,O1),arg(on,O2)],teach_to_on(S,O,O1,O2),sem(professor,[subject,person,day])).


lex_verb(attend,tv,S,[arg(null,O)],attend(S,O),sem(person,[course])).
lex_verb(attend,tv,S,[arg(null,O),arg(of,O1)],attend_course_of(S,O,O1),sem(person,[course,subject])).
lex_verb(attend,tv,S,[arg(null,O),arg(on,O2)],attend_on(S,O,O2),sem(person,[subject,day])).

lex_verb(learn,tv,S,[arg(null,O),arg(by,O1)],teach_by(S,O,O1,_),sem(person,[subject,person])).

lex_verb(buy,tv,S,[arg(null,O),arg(to,O1)], buy_to(S,O,O1),sem(person,[inanimate,person])).
lex_verb(buy,tv,S,[arg(null,O)], buy(S,O),sem(_,[_])).

lex_verb(swim,iv,S,[],swim(S),sem(person,[])).


lex_verb(watch,tv,S,[arg(null,O)],watch(S,O),sem(person,[film])).
lex_verb(watch,tv,S,[arg(null,O)],watch(S,O),sem(person,[person])).
lex_verb(watch,tv,S,[arg(null,O),arg(of,O1)],watch(S,O,O1),sem(person,[film,director])).

lex_verb(play,tv,S,[arg(null,O)],play(S,O),sem(person,[instrument])).
lex_verb(play,tv,S,[arg(null,O),arg(with,O1)],play_(S,O,O1),sem(person,[music,instrument])).