/*BRESSAND Jérémy*/

/*A. 
   Exemples de phrases correctes utilisant les pronoms sujets listés en (1) :
   - Les chats mangent des souris lesquelles sont délicieuses.
   - Je ne sais pas lequel de ces chats a mangé la souris.
   - Le petit chat a mangé la souris laquelle s'appelait jerry.
   - Les souris fuient les chats lesquels les pourchassent.
   - Le chat qui a mangé la souris est tombé malade

   Exemples de phrases incorrectes utilisant les pronoms sujets listés en (1) :
   - Les chats lesquels sont gentils.
   - Les chats pourchassent les souris avec lesquelles elles aiment jouer --> pronoms objets  
   
   CFG produisant ces phrases :
   - phrase -> groupeNominal groupeVerbal
   - phrase -> pronomSujet groupeVerbal
   - groupeNominal -> determinant groupeAdjectival
   - groupeNominal -> determinant nomCommun
   - groupeNominal -> determinant groupeSujet
   - groupeAdjectival -> adjectif groupeSujet
   - groupeAdjectival -> adjectif nomCommun
   - groupeSujet -> nomCommun complementSujet
   - complementSujet -> pronomRelatifSujet groupeVerbal
*/

entre([Mot|Reste],Reste,Mot).

det(X,Y) :- entre(X,Y,le).
nom(X,Y) :- entre(X,Y,chat).
verbe(X,Y) :- entre(X,Y,dort).

gn(X,Y) :- det(X,Z), nom(Z,Y).
ph(X,Y) :- gn(X,Z), verbe(Z,Y).
