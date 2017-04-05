/*BRESSAND Jérémy*/

/*A. 
   Exemples de phrases correctes utilisant les pronoms sujets listés en (1) :
   - Les souris fuient les chats lesquels pourchassent les souris.
   - Tom lequel mange des souris aime Jerry.
   - Tom pourchasse la souris laquelle s'appelle Jerry.
   - Les chats pourchassent les souris lesquelles fuient les chats.

   Exemples de phrases incorrectes utilisant les pronoms sujets listés en (1) :
   - Les chats lesquels pourchassent les souris.
   - Tom lequel mange des souris
   - La souris laquelle s'appelle Jerry
   
   CFG produisant ces phrases :
   - phrase -> groupeNominal groupeVerbal
   - phrase -> nomPropre groupeVerbal
   - phrase -> nomPropre
   - groupeNominal -> determinant nomCommun
   - groupeNominal -> determinant groupeSujet
   - groupeSujet -> nomCommun complementSujet
   - complementSujet -> pronomSujet groupeVerbal
   - groupeVerbal -> verbe groupeNominal
   - determinant -> les | des | la
   - nomCommun -> souris | chats
   - nomPropre -> Tom | Jerry
   - verbe -> fuient | pourchassent | s'appelle
   - pronomSujet -> lequel | laquelle | lesquels | lesquelles
   
*/

/*B
  DCG correspondante :    
*/

entre([Mot|Reste],Reste,Mot).

det(X,Y) :- entre(X,Y,les).
det(X,Y) :- entre(X,Y,des).
det(X,Y) :- entre(X,Y,la).

nomC(X,Y) :- entre(X,Y,chats).
nomC(X,Y) :- entre(X,Y,souris).

nomP(X,Y) :- entre(X,Y,tom).
nomP(X,Y) :- entre(X,Y,jerry).

verbe(X,Y) :- entre(X,Y,fuient).
verbe(X,Y) :- entre(X,Y,pourchassent).
verbe(X,Y) :- entre(X,Y,s_appelle).

prnSuj(X,Y) :- entre(X,Y,lequel).
prnSuj(X,Y) :- entre(X,Y,laquelle).
prnSuj(X,Y) :- entre(X,Y,lesquels).
prnSuj(X,Y) :- entre(X,Y,lesquelles).

ph(X,Y) :- gn(X,Z), gv(Z,Y).
ph(X,Y) :- nomP(X,Z), gv(Z,Y).

gn(X,Y) :- det(X,Z), nomC(Z,Y).
gn(X,Y) :- det(X,Z), grpSuj(Z,Y).

grpSuj(X,Y) :- nomC(X,Z), compSuj(Z,Y).

compSuj(X,Y) :- prnSuj(X,Z), gv(Z,Y).

gv(X,Y) :- verbe(X,Z), gn(Z,Y).

%ph([les,souris,fuient,les,chats,lesquels,pourchassent,les,souris],[]).
%ph([tom,lequel,mange,des,souris,aime,jerry],[]).
%ph([tom,pourchasse,la,souris,laquelle,s'appelle,jerry],[]).
%ph([les,chats,pourchassent,les,souris,lesquelles,fuient,les,chats],[]).

%ph([les,chats,lesquels,pourchassent,les,souris],[]).
%ph([Tom,lequel,mange,des,souris],[]).
%ph([la,souris,laquelle,s'appelle,jerry],[]).





/*det(X,Y,m,sg) :- entre(X,Y,le).
nom(X,Y,m,sg) :- entre(X,Y,chat).
verbe(X,Y,sg) :- entre(X,Y,dort).

gn(X,Y,m,sg) :- det(X,Z,m,sg), nom(Z,Y,m,sg).
ph(X,Y,m,sg) :- gn(X,Z,m,sg), verbe(Z,Y,sg).

ph(X,m,sg) :- ph(X,[],m,sg).
*/
