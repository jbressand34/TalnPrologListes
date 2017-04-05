/*BRESSAND Jérémy*/

%Question A
/*
Exemples de questions utilisant les adjectifs interrogatifs quel/quelle/quels/quelles :
- Quel chat dort ?
- Quelle souris sort ?
- Quelles souris fuient Tom ?
- Quels chats pourchassent Jerry ?
- Quelle souris pourchasse-t-il ?
- Quel chat veut manger la souris ?

Grammaire CFG :
- phrase -> groupeNominalInterrogatif groupeVerbalInterrogatif
- groupeNominalInterrogatif -> adjectifInterrogatif nomCommun
- groupeVerbalInterrogatif -> groupeVerbal ?
- groupeVerbalInterrogatif -> verbe ?
- groupeVerbalInterrogatif -> verbePronomInverse ?
- groupeVerbal -> verbe nomPropre
- groupeVerbal -> verbe groupeObjet
- verbePronomInverse -> verbeTiret tPronomInverse
- verbeTiret -> - verbeTiret
- tPronomInverse -> t pronomInverse 
- groupeObjet -> verbeInf groupeNominal
- pronomInverse -> - pronom
- groupeNominal -> determinant nomCommun
*/

%Question B
/*
entre([Mot|Reste],Reste,Mot).

det(X,Y) :- entre(X,Y,la).

nomC(X,Y) :- entre(X,Y,chat).
nomC(X,Y) :- entre(X,Y,chats).
nomC(X,Y) :- entre(X,Y,souris).

nomP(X,Y) :- entre(X,Y,tom).
nomP(X,Y) :- entre(X,Y,jerry).

pronom(X,Y) :- entre(X,Y,il).

verbeInf(X,Y) :- entre(X,Y,manger).

verbe(X,Y) :- entre(X,Y,dort).
verbe(X,Y) :- entre(X,Y,sort).
verbe(X,Y) :- entre(X,Y,fuient).
verbe(X,Y) :- entre(X,Y,pourchassent).
verbe(X,Y) :- entre(X,Y,pourchasse).
verbe(X,Y) :- entre(X,Y,veut).

adjInt(X,Y) :- entre(X,Y,quel).
adjInt(X,Y) :- entre(X,Y,quelle).
adjInt(X,Y) :- entre(X,Y,quels).
adjInt(X,Y) :- entre(X,Y,quelles).

ph(X,Y) :- gni(X,Z), gvi(Z,Y).

gni(X,Y) :- adjInt(X,Z), nomC(Z,Y).

gvi(X,Y) :- gv(X,Z), entre(Z,Y,?).
gvi(X,Y) :- verbe(X,Z), entre(Z,Y,?).
gvi(X,Y) :- vrbPrnInv(X,Z), entre(Z,Y,?).

gv(X,Y) :- verbe(X,Z), nomP(Z,Y).
gv(X,Y) :- verbe(X,Z), gObj(Z,Y).

vrbPrnInv(X,Y) :- vrbTiret(X,Z), tPrnInv(Z,Y).

vrbTiret(X,Y) :- verbe(X,Z), entre(Z,Y,-).

tPrnInv(X,Y) :- entre(X,Z,t), prnInv(Z,Y).

prnInv(X,Y) :- entre(X,Z,-), pronom(Z,Y).

gObj(X,Y) :- verbeInf(X,Z), gn(Z,Y).

gn(X,Y) :- det(X,Z), nomC(Z,Y).
*/
%ph([quel,chat,dort,?],[]).
%ph([quelle,souris,sort,?],[]).
%ph([quelles,souris,fuient,tom,?],[]).
%ph([quels,chats,pourchassent,jerry,?],[]).
%ph([quelle,souris,pourchasse,-,t,-,il,?],[]).
%ph([quel,chat,veut,manger,la,souris,?],[]).


%Question C
/*
entre([Mot|Reste],Reste,Mot).

det(X,Y,f,sg) :- entre(X,Y,la).

nomC(X,Y,m,sg) :- entre(X,Y,chat).
nomC(X,Y,m,pl) :- entre(X,Y,chats).
nomC(X,Y,f,sg) :- entre(X,Y,souris).
nomC(X,Y,f,pl) :- entre(X,Y,souris).

nomP(X,Y) :- entre(X,Y,tom).
nomP(X,Y) :- entre(X,Y,jerry).

pronom(X,Y,m,sg) :- entre(X,Y,il).

verbeInf(X,Y) :- entre(X,Y,manger).

verbe(X,Y,sg) :- entre(X,Y,dort).
verbe(X,Y,sg) :- entre(X,Y,sort).
verbe(X,Y,pl) :- entre(X,Y,fuient).
verbe(X,Y,pl) :- entre(X,Y,pourchassent).
verbe(X,Y,sg) :- entre(X,Y,pourchasse).
verbe(X,Y,sg) :- entre(X,Y,veut).

adjInt(X,Y,m,sg) :- entre(X,Y,quel).
adjInt(X,Y,f,sg) :- entre(X,Y,quelle).
adjInt(X,Y,m,pl) :- entre(X,Y,quels).
adjInt(X,Y,f,pl) :- entre(X,Y,quelles).

ph(X,Y) :- gni(X,Z,m,sg), gvi(Z,Y,sg).
ph(X,Y) :- gni(X,Z,f,sg), gvi(Z,Y,sg).
ph(X,Y) :- gni(X,Z,m,pl), gvi(Z,Y,pl).
ph(X,Y) :- gni(X,Z,f,pl), gvi(Z,Y,pl).

gni(X,Y,m,sg) :- adjInt(X,Z,m,sg), nomC(Z,Y,m,sg).
gni(X,Y,f,sg) :- adjInt(X,Z,f,sg), nomC(Z,Y,f,sg).
gni(X,Y,m,pl) :- adjInt(X,Z,m,pl), nomC(Z,Y,m,pl).
gni(X,Y,f,pl) :- adjInt(X,Z,f,pl), nomC(Z,Y,f,pl).

gvi(X,Y,sg) :- gv(X,Z,sg), entre(Z,Y,?).
gvi(X,Y,pl) :- gv(X,Z,pl), entre(Z,Y,?).

gvi(X,Y,sg) :- verbe(X,Z,sg), entre(Z,Y,?).
gvi(X,Y,pl) :- verbe(X,Z,pl), entre(Z,Y,?).

gvi(X,Y,sg) :- vrbPrnInv(X,Z), entre(Z,Y,?). %ici l'adjectif interrogatif est objet, l'accord ne se fait pas avec le verbe
gvi(X,Y,pl) :- vrbPrnInv(X,Z), entre(Z,Y,?).

gv(X,Y,sg) :- verbe(X,Z,sg), nomP(Z,Y).
gv(X,Y,pl) :- verbe(X,Z,pl), nomP(Z,Y).

gv(X,Y,sg) :- verbe(X,Z,sg), gObj(Z,Y).
gv(X,Y,pl) :- verbe(X,Z,pl), gObj(Z,Y).

vrbPrnInv(X,Y) :- vrbTiret(X,Z,sg), tPrnInv(Z,Y,sg).
vrbPrnInv(X,Y) :- vrbTiret(X,Z,pl), tPrnInv(Z,Y,pl).


vrbTiret(X,Y,sg) :- verbe(X,Z,sg), entre(Z,Y,-).
vrbTiret(X,Y,pl) :- verbe(X,Z,pl), entre(Z,Y,-).

tPrnInv(X,Y,sg) :- entre(X,Z,t), prnInv(Z,Y,m,sg).
tPrnInv(X,Y,sg) :- entre(X,Z,t), prnInv(Z,Y,f,sg).
tPrnInv(X,Y,pl) :- entre(X,Z,t), prnInv(Z,Y,m,pl).
tPrnInv(X,Y,pl) :- entre(X,Z,t), prnInv(Z,Y,f,pl).

prnInv(X,Y,m,sg) :- entre(X,Z,-), pronom(Z,Y,m,sg).
prnInv(X,Y,f,sg) :- entre(X,Z,-), pronom(Z,Y,f,sg).
prnInv(X,Y,m,pl) :- entre(X,Z,-), pronom(Z,Y,m,pl).
prnInv(X,Y,f,pl) :- entre(X,Z,-), pronom(Z,Y,f,pl).

gObj(X,Y) :- verbeInf(X,Z), gn(Z,Y).

gn(X,Y) :- det(X,Z,m,sg), nomC(Z,Y,m,sg).
gn(X,Y) :- det(X,Z,f,sg), nomC(Z,Y,f,sg).
gn(X,Y) :- det(X,Z,m,pl), nomC(Z,Y,m,pl).
gn(X,Y) :- det(X,Z,f,pl), nomC(Z,Y,f,pl).
*/
%ph([quel,chat,dort,?],[]).
%ph([quelle,souris,sort,?],[]).
%ph([quelles,souris,fuient,tom,?],[]).
%ph([quels,chats,pourchassent,jerry,?],[]).
%ph([quelle,souris,pourchasse,-,t,-,il,?],[]).
%ph([quel,chat,veut,manger,la,souris,?],[]).


%Question D
/*
det(la,f,sg).

nomC(chat,m,sg).
nomC(chats,m,pl).
nomC(souris,f,sg).
nomC(souris,f,pl).

nomP(tom).
nomP(jerry).

pronom(il,m,sg).

verbeInf(manger).

verbe(dort,sg).
verbe(sort,sg).
verbe(fuient,pl).
verbe(pourchassent,pl).
verbe(pourchasse,sg).
verbe(veut,sg).

adjInt(quel,m,sg).
adjInt(quelle,f,sg).
adjInt(quels,m,pl).
adjInt(quelles,f,pl).

ph([X|[Y]]) :- gni(X,m,sg), gvi(Y,sg).
ph([X|[Y]]) :- gni(X,f,sg), gvi(Y,sg).
ph([X|[Y]]) :- gni(X,m,pl), gvi(Y,pl).
ph([X|[Y]]) :- gni(X,f,pl), gvi(Y,pl).

gni([X|[Y]],m,sg) :- adjInt(X,m,sg), nomC(Y,m,sg).
gni([X|[Y]],f,sg) :- adjInt(X,f,sg), nomC(Y,f,sg).
gni([X|[Y]],m,pl) :- adjInt(X,m,pl), nomC(Y,m,pl).
gni([X|[Y]],f,pl) :- adjInt(X,f,pl), nomC(Y,f,pl).

gvi([X|[?]],sg) :- gv(X,sg).
gvi([X|[?]],pl) :- gv(X,pl).

gvi([X|[?]],sg) :- verbe(X,sg).
gvi([X|[?]],pl) :- verbe(X,pl).

gvi([X|[?]],sg) :- vrbPrnInv(X). %ici l'adjectif interrogatif est objet, l'accord ne se fait pas avec le verbe
gvi([X|[?]],pl) :- vrbPrnInv(X).

gv([X|[Y]],sg) :- verbe(X,sg), nomP(Y).
gv([X|[Y]],pl) :- verbe(X,pl), nomP(Y).

gv([X|[Y]],sg) :- verbe(X,sg), gObj(Y).
gv([X|[Y]],pl) :- verbe(X,pl), gObj(Y).

vrbPrnInv([X|[Y]]) :- vrbTiret(X,sg), tPrnInv(Y,sg).
vrbPrnInv([X|[Y]]) :- vrbTiret(X,pl), tPrnInv(Y,pl).


vrbTiret([X|[-]],sg) :- verbe(X,sg).
vrbTiret([X|[-]],pl) :- verbe(X,pl).

tPrnInv([t|[Y]],sg) :- prnInv(Y,m,sg).
tPrnInv([t|[Y]],sg) :- prnInv(Y,f,sg).
tPrnInv([t|[Y]],pl) :- prnInv(Y,m,pl).
tPrnInv([t|[Y]],pl) :- prnInv(Y,f,pl).

prnInv([-|[Y]],m,sg) :- pronom(Y,m,sg).
prnInv([-|[Y]],f,sg) :- pronom(Y,f,sg).
prnInv([-|[Y]],m,pl) :- pronom(Y,m,pl).
prnInv([-|[Y]],f,pl) :- pronom(Y,f,pl).

gObj([X|[Y]]) :- verbeInf(X), gn(Y).

gn([X|[Y]]) :- det(X,m,sg), nomC(Y,m,sg).
gn([X|[Y]]) :- det(X,f,sg), nomC(Y,f,sg).
gn([X|[Y]]) :- det(X,m,pl), nomC(Y,m,pl).
gn([X|[Y]]) :- det(X,f,pl), nomC(Y,f,pl).
*/
%ph([[quel|[chat]]|[[dort|[?]]]]).
%ph([[quelle|[souris]]|[[sort|[?]]]]).
%ph([[quelles|[souris]]|[[[fuient|[tom]]|[?]]]]).
%ph([[quels|[chats]]|[[[pourchassent|[jerry]]|[?]]]]).
%ph([[quelle|[souris]]|[[[[pourchasse|[-]]|[[t|[[-|[il]]]]]]|[?]]]]).
%ph([[quel|[chat]]|[[[veut|[[manger|[[la|[souris]]]]]]|[?]]]]).

%Question E
