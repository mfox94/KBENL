:- consult(engine).
:- consult(util).

/* Start of the system */
/* Swith of what user want to do */
start:-		load_kb,
			cf,
			delete_names,
			add_names,
			write('Hello, what should I do?'),
			nl,nl,
			write('1) Print a description of all facts in the knowledge base.'),nl,
			write('2) Ask you which fact search in the knowledge base.'),nl,
			write('3) Stop the program'),nl,nl,
			read(Choice),
			switch(Choice).
			
			
/* Print all descriptions */
			
switch(1):-
			write('You choose to print a overall description of the facts in the knowledge base..'),nl,nl,
			cf,
			load_all_facts,
			nl,nl,write('DESCRIPTION:	'),nl,nl,
			print.

/* Filter facts */
switch(2):-
			clear_keys,
			load_all_facts,
			clear_facts,
			get_interest,
			load_filtered_facts,
			nl,nl,write('DESCRIPTION:	'),nl,nl,nl,
			print.
			
/* Abort execution */			
switch(3):- nl,nl,write("++++++++++++++++++++++++++++++++++++++++"),nl,
			write("\t\t THANKS. \t\t"),nl,
			write("++++++++++++++++++++++++++++++++++++++++"),nl,nl,abort.
switch(_):-
			nl,nl,nl,nl,nl,nl,
			write('THERE WAS AN ERROR IN THE INPUT,'),nl,nl,
			write('		PLEASE TYPE y FOR YES OR n FOR NO'),nl,nl,nl,nl,nl,nl,nl,nl,
			start.


			