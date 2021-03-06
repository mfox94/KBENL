:- dynamic(lex_names/5).

lex_names(student,students,K,person(K),person).
lex_names(professor,professors,K,person(K),person).
lex_names(person,people,K,person(K),person).
lex_names(instrument,instruments,K,instrument(K),instrument).
lex_names(boy,boys,K,person(K),person).
lex_names(girl,girls,K,person(K),person).
lex_names(dad,dads,K,person(K),person).
lex_names(plumber,plumbers,K,person(K),person).
lex_names(scientist,scientists,K,person(K),person).
lex_names(chief,chiefs,K,person(K),person).
lex_names(cat,cats,K,animal(K),animal).
lex_names(dog,dogs,K,animal(K),animal).
lex_names(bird,birds,K,animal(K),animal).
lex_names(koala,koalas,K,animal(K),animal).
lex_names(bus,buss,K,transport(K),transport).
lex_names(plane,planes,K,transport(K),transport).
lex_names(train,trains,K,transport(K),transport).
lex_names(boat,boats,K,transport(K),transport).
lex_names(bar,bars,K,location(K),location).
lex_names(restaurant,restaurants,K,location(K),location).
lex_names(office,offices,K,location(K),location).
lex_names(shop,shops,K,location(K),location).
lex_names(book,books,K,inanimate(K),inanimate).
lex_names(cup,cups,K,inanimate(K),inanimate).
lex_names(coffee,coffees,K,inanimate(K),inanimate).
lex_names(mouse,mouses,K,inanimate(K),inanimate).
lex_names(chair,chairs,K,inanimate(K),inanimate).
lex_names(course,courses,K,inanimate(K),inanimate).
lex_names(window,windows,K,inanimate(K),inanimate).
lex_names(cup,cups,K,container(K),container).
lex_names(bottle,bottles,K,container(K),container).
lex_names(christmas,christmass,K,event(K),event).
lex_names(halloween,halloweens,K,event(K),event).
lex_names(pizza,pizzas,K,food(K),food).
lex_names(pasta,pastas,K,food(K),food).
lex_names(spinach,spinachs,K,food(K),food).
lex_names(water,waters,K,drink(K),drink).
lex_names(beer,beers,K,drink(K),drink).
lex_names(course,courses,K,course(K),course).
lex_names(lesson,lessons,K,lesson(K),lesson).
lex_names(genre,genres,K,genre(K),genre).
lex_names(film,films,K,film(K),film).
