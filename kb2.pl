:- consult(grammar).

student(michele).
student(clara).
student(maria).
student(marcello).
student(luigi).
student(antonella).
student(francesco).
student(francesca).
student(nicola).
student(raffaella).
student(davide).

follow(michele,m01).
follow(clara,m02).
follow(francesco,i01).
follow(davide,e01).
follow(raffaella,m01).
follow(nicola,m01).
follow(michele,i01).
follow(clara,e01).
follow(francesco,m03).
follow(francesca,m03).
follow(michele,i02).
follow(marcello,m01).

professor(prof_white).
professor(prof_red).
professor(prof_black).
professor(prof_smith). 

course(m01).
course(m02).
course(m03).
course(e01).
course(i01).
course(i02).

room(room_A).
room(room_B).
room(room_C).
room(room_D).

subject(math).
subject(english).
subject(italian).
subject(latin).
subject(history).

course(m01,math,room_A).
course(m02,math,room_C).
course(m03,math,room_A).
course(e01,english,room_B).
course(i01,italian,room_D).
course(i02,italian,room_B).

keep(m01,monday).
keep(m03,tuesday).
keep(i02,wedsnday).
keep(e01,thursday).
keep(i01,friday).
keep(m02,saturday).

teach(prof_white,m01).
teach(prof_red,m03).
teach(prof_red,i01).
teach(prof_smith,e01).
teach(prof_black,m02).


add_names:-
			findall(_,add_course,_),
			findall(_,add_room,_),
			findall(_,add_professor,_).

delete_names:- 
			retractall(lex_proper_names(_,course)),
			retractall(lex_proper_names(_,professor)),
			retractall(lex_proper_names(_,student)),
			retractall(lex_proper_names(_,room)).
			
add_course:-
			course(Course),	
			assert(lex_proper_names(Course,course)).

add_student:-
			student(Stu),
			assert(lex_proper_names(Stu,student)),
			assert(lex_proper_names(Stu,person)).
			
			
add_room:-
			room(Room),	
			assert(lex_proper_names(Room,room)).
add_professor:-
			professor(Prof),	
			assert(lex_proper_names(Prof,professor)).

			
rule(teach_professor,[professor,subject]) :- 
			professor(Professor),
			teach(Professor,Course),
			course(Course,Subject,_),
			assert(fact(teach(Professor,Subject))).
			
rule(teach_day,[professor,day]) :- 
			professor(Professor),
			teach(Professor,Course),
			course(Course,Subject,_),
			keep(Course,Day),
			assert(fact(teach_on(Professor,Subject,Day))).
			
rule(attend_subject_day,[subject,day]):- 	
			student(Student),
			follow(Student,Course),
			course(Course,Subject,_),
			keep(Course,Day),
			assert(fact(attend_on(Student,Subject,Day))).
			
rule(not_attend,[student,course]) :- 	
			student(Student),
			not(follow(Student,Cour)),
			assert(fact(dont(exist(a,Cour,prop(course(Cour),attend(Student,Cour)))))).

rule(student_follow,[professor,room]) :- 	
			teach(Professor,Course),
			course(Course,Subject,Room),
			assert(fact(exist(the, L, prop(lesson(lesson), hold_lesson_of_in(Professor,L,Subject,Room))))).
			
rule(all_student_follow,[student]):-
			professor(Professor),
			teach(Professor,_),!,
			assert(fact(all(all, Professor, prop(professor(professors), exist(a, Subject, prop(subject(subject), exist(a, Room, prop(room(room), teach_in(Professor,Subject,Room))))))))).

			