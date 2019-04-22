.*********************************************************
.* Some notes for editing this document:
.* It's not a bad idea to open the original user's guide
.* and compare the layout etc with this text file.
.* You generally do not need to edit the tags ( = commands
.* for the help compiler, beginning with ":" and ending
.* with "." 
.* A colon can be displayed by using the tag "&colon.", I
.* did this sometimes to draw a smiley. If you are unsure
.* about anything, please feel free to contact the author
.* at r.auberger@gmx.net with subject Mastermind/2.
.*********************************************************
:userdoc.
.*********************************************************
.* Title of the document 
.*********************************************************
:title.Mastermind/2 - guida utente
:docprof  toc=123456
ctrlarea=coverpage.
.*********************************************************
.* First page
.*********************************************************
:h1 id='PANEL_WELCOME' res=400.Benvenuti in Mastermind/2
:artwork align=center name='F:\Projekte\Mastermind\logo.bmp'.
I capitoli di questa guida sono:
:ul.
:li.
:link reftype=hd refid='PANEL_RULES'.Regole di Mastermind/2
:elink.
:li.
:link reftype=hd refid='PANEL_HOWTOPLAY'.Come si gioca
:elink.
:li.
:link reftype=hd refid='PANEL_MENUS'.Cosa fanno i menu?
:elink.
:li.
:link reftype=hd refid='PANEL_LICENSE'.Licenza d'uso
:elink.
:li.
:link reftype=hd refid='PANEL_HOMEPAGE'.Sito di Mastermind/2
:elink.
:eul.
.*********************************************************
.* Rules of Mastermind 
.*********************************************************
:h1 id='PANEL_RULES' res=401.Regole
:p.:hp2.Scopo del gioco:
:ehp2.
:p.‘ molto semplice: basta indovinare i colori che l'avversario (in questo caso
il calcolatore) ha scelto.
:p.:hp2.Come si gioca:
:ehp2.
:p.Ogni volta che pensi a quattro colori (e sei convinto che questi siano quelli
che il tuo avversario ha scelto) lo informi. Egli confronta, quindi, i tuoi colori
con i suoi e ti da alcuni aiuti per il tuo prossimo tentativo, oppure ti dice che
hai indovinato. Ogni colore giusto messo al posto giusto ti verrÖ segnalato con un
chiodino bianco. Invece ogni colore che il tuo avversario ha usato, ma in un altro
posto, verrÖ segnalato con un chiodino nero.
.br
Ovviamente i chiodini non sono direttamente associati ad un colore. Fa parte del
tuo lavoro capire quali dei tuoi colori sono totalmente sbagliati (senza alcun
chiodino), quali sono messi in un posto sbagliato e quali completamente esatti.
:p.:hp2.Vuoi un esempio? Eccone uno:
:ehp2.
:p.Questi sono i colori che devi indovinare, tu non li avresti visti finchÇ non li
avresti indovinati, va bene? Questo ä solo un
:hp1.esempio :ehp1.
;-)
:p.:artwork  align=center name='F:\Projekte\Mastermind\guess.BMP'.
:p.Ora tu fai questo tentativo:
:p.:artwork  align=center name='F:\Projekte\Mastermind\guessed.BMP'.
:p.Il rosso ä completamente sbagliato, cosç come il verde. Il Celeste ä un colore
colore che andava indovinato, ma ä stato messo in un posto sbagliato (chiodino
nero), infine il viola Ç completamente esatto (chiodino bianco). Cosç l'aiuto che
otterrai sarÖ:
:p.:artwork  align=center name='F:\Projekte\Mastermind\hints01.BMP'.
:p.Probabilmente la tua prenderÖ questa strada:
:p.:artwork  align=center name='F:\Projekte\Mastermind\game.BMP'.
:p.Questo significa che hai indovinato i colori al quinto tentativo. Non male, ma
non ä l'unica cosa a cui devi badare. Dovresti anche tentare di indovinare i
colori nel pió breve tempo possibile.
:p.:artwork  align=center name='F:\Projekte\Mastermind\time.BMP'.
:p.I dieci migliori giocatori possono inserire il loro nome nell'albo d'oro. Se
due o pió impiegano lo stesso numero di tentativi, il tempo da loro ottenuto
deciderÖ chi occcuperÖ la posizione pió alta.
.*********************************************************
.* How to play Mastermind/2 
.*********************************************************
:h1 id='PANEL_HOWTOPLAY' res=402.Come si gioca
:p.:hp2.Come posso dire al sistema quale colore voglio mettere in un certo posto?:ehp2.
:p.‘ semplice, basta trascinarlo dall'area chiamata "colori disponibili" e
rilasciarlo sopra il posto in cui intendevi metterlo.
:p.:artwork  align=center name='F:\Projekte\Mastermind\availabl.BMP'.
:p.Trascinali sui posti:
:p.:artwork  align=center name='F:\Projekte\Mastermind\marks.BMP'.
:p.Per aiutarti - non ä sempre semplice sapere se il puntatore rotondo ä veramente
sopra uno dei posti - la posizione si illumina quando ci trascini sopra un colore.
Nel seguente esempio il rosso ä gia stato trascinato e ora il blu (=puntatore del
mouse) viene trascinato sopra la terza posizione della prima riga:
:p.:artwork  align=center name='F:\Projekte\Mastermind\drop.BMP'.
:p.Dopo aver selezionato un colore puoi cambiarlo trascinando semplicemente un 
nuovo colore sullo stesso posto. Se, invece, decidi di cambiare posto ad un colore
giÖ scelto basta che questo venga trascinato dalla vecchia alla nuova posizione.
:p.:hp2.Come indico al sistema di usare la combinazione attuale come mia prova?:ehp2.
:p.Se hai selezionato quattro colori e voui usarli come tua prova premi il
pulsante con scritto '... prova' (dove ... significa il numero della prova
attuale):
:p.:artwork  align=center name='F:\Projekte\Mastermind\button.BMP'.
:p.Questo ä tutto. Se sei stato abbastanza bravo potrai scrivere il tuo nome nell'
:link reftype=hd refid='PANEL_MENUHIGHSCORE'.albo d'oro:elink..
.*********************************************************
.* Help for the menus 
.*********************************************************
:h1 id='PANEL_MENUS' res=403.Menu
:p.Ci sono due voci di menu principali, che contengono i seguenti sottomenu:
:ul.
:li.
:link reftype=hd refid='PANEL_MENUMASTERMIND'.Mastermind
:elink.
:ul.
:li.
:link reftype=hd refid='PANEL_MENUSTART'.Nuova partita
:elink.
:li.
:link reftype=hd refid='PANEL_MENUPAUSE'.Sospendi
:elink.
:li.
:link reftype=hd refid='PANEL_MENUCANCEL'.Arresa
:elink.
:li.
:link reftype=hd refid='PANEL_MENUHIGHSCORE'.Albo d'oro...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUMULTIPLE'.Colori ripetuti
:elink.
:li.
:link reftype=hd refid='PANEL_MENULANGUAGE'.Lingua
:elink.
:li.
:link reftype=hd refid='PANEL_MENUPINS'.Imposta i colori...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUEXIT'.Esci da Mastermind
:elink.
:eul.
:li.
:link reftype=hd refid='PANEL_MENUHELP'.Guida
:elink.
:ul.
:li.
:link reftype=hd refid='PANEL_MENUGENERALHELP'.Generica...
:elink.
:li.
:link reftype=hd refid='PANEL_MENURULES'.Regole...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUHOWTOPLAY'.Come si gioca...
:elink.
:li.
:link reftype=hd refid='PANEL_MENULICENSE'.Licenza...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUABOUT'.Informazioni su...
:elink.
:eul.
:eul.
.*********************************************************
.* Menu "Mastermind/2" 
.*********************************************************
:h2 id='PANEL_MENUMASTERMIND' res=404.Menu 'Mastermind'
:p.Questo menu ti permette di modificare alcune impostazioni del gioco, sia
generiche che relative alla partita in corso:
:ul.
:li.
:link reftype=hd refid='PANEL_MENUSTART'.Nuova Partita
:elink.
:li.
:link reftype=hd refid='PANEL_MENUPAUSE'.Sospendi
:elink.
:li.
:link reftype=hd refid='PANEL_MENUCANCEL'.Arresa
:elink.
:li.
:link reftype=hd refid='PANEL_MENUHIGHSCORE'.Albo d'oro...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUMULTIPLE'.Colori ripetuti
:elink.
:li.
:link reftype=hd refid='PANEL_MENULANGUAGE'.Lingua
:elink.
:li.
:link reftype=hd refid='PANEL_MENUPINS'.Imposta i colori...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUEXIT'.Esci da Mastermind
:elink.
:eul.
.*********************************************************
.* Submenu "Start new game" 
.*********************************************************
:h3 id='PANEL_MENUSTART' res=405.Voce 'Nuova partita'
:p.Questa voce ä sempre selezionabile e da qui puoi cominciare una nuova partita.
Con una partita ancora in corso viene chiesto se ci si vuole arrendere.
.*********************************************************
.* Submenu "Pause game" 
.*********************************************************
:p.:h3 id='PANEL_MENUPAUSE' res=406.Voce 'Sospendi'
:p.Se una partita ä in corso puoi sospenderla. Tutti i tuoi colori supposti e
tutti i tuoi chiodini saranno nascosti fino a che non riprenderai la partita. Se 
una partita ä sospesa, la voce di menu cambia in:hp1.Riprendi:ehp1..
:p.Puoi continuare una partita sospesa selezionando la voce ora chiamata
:hp1.Riprendi:ehp1.. Tutte le tue supposizioni e tutti i chiodini ti risaranno
mostrati. La voce di menu ritornerÖ a chiamarsi Sospendi.
:p.Puoi sospendere una partita quante vote vuoi (senza alcun effetto per un
eventuale ingresso nell'albo d'oro).
:note.Un'altro metodo per sospendere o riprendere la partita ä premere il tasto
pausa sulla tastiera. Questo ha esattamente lo stesso effetto che selezionare la
voce di menu.
.*********************************************************
.* Submenu "Cancel game" 
.*********************************************************
:h3 id='PANEL_MENUCANCEL' res=407.Voce 'Arresa'
:p.Stai perdendo tanto tempo con la partita corrente? Pensi che non indovinerai
 mai i colori? Va bene, seleziona
:hp1.Arresa :ehp1.
e la partita ä finita. Ora puoi vedere quanto ti sei avvicinato alla soluzione,
perchä il sistema ti mostrerÖ la combinazione che non sei riuscito ad indovinare.
:note.Se desideri arrenderti, tu puoi anche premere ESC dalla tastiera. Questo
ha esattamente lo stesso effetto che selezionare la voce di menu.
.*********************************************************
.* Submenu "Highscore..." 
.*********************************************************
:h3 id='PANEL_MENUHIGHSCORE' res=408.Voce 'Albo d'oro...'
:p.Se ti interessa sapere quanto devi essere bravo per essere tra i migliori, puoi
leggerlo scegliendo:hp1.Albo d'oro:ehp1..
:p.I dieci migliori giocatori possono inserire il loro nome nell'albo d'oro. Se
due o pió impiegano lo stesso numero di tentativi, il tempo da loro ottenuto
deciderÖ chi occcuperÖ la posizione pió alta.
.*********************************************************
.* Submenu "Multiple colors" 
.*********************************************************
:h3 id='PANEL_MENUMULTIPLE' res=409.Voce 'Colori ripetuti'
:p.Per chi ama le cose semplici: deseleziona questa voce di menu e i colori che
dovrai indovinare saranno tutti differenti. Questo ä un pï pió semplice che avere
:hp1.colori multipli:ehp1. selezionata.
:p.Se hai tolto l'opzione colori multipli non puoi trascinare pió volte lo stesso
colore sulla stessa riga. Quando viene trascinato un colore che era giÖ presente
nella riga, questo automaticamente si toglierÖ dalla vecchia posizione. Se non sei
riuscito a seguire la mia comfusa spiegazione, prova ad eseguire i seguenti passi:
:ol.
:li.deseleziona :hp1.colori multipli:ehp1.
:li.inizia una nuova partita
:li.trascina, ad esempio, il rosso dalla zona "Colori disponibili" alla zona
"Trascina qui i colori"
:li.riesegui la stessa operazione, ma rilasciando il rosso sopra un'altra
posizione.
:li.Il primo rosso scompare.
:eol.
:p.Di base l'opzione :hp1.colori multipli:ehp1. ä selezionata (ma se la cambi
questa modifica sarÖ ricordata al prossimo riavvio del gioco). Nell'albo d'oro non
viene riportato se quel risultato ä stato ottenuto indovinando delle combinazioni
con colori multipli o meno. (forse in una versione futura, se
:link reftype=hd refid='PANEL_LICENSE'.qualcuno usa questo gioco
:elink.ovviamente).
.*********************************************************
.* Submenu "Language" 
.*********************************************************
:h3 id='PANEL_MENULANGUAGE' res=418.Voce 'Lingua'
:p.Appena Mastermind/2 ä stato avviato questo guarda che moduli di lingua sono
disponibili sul tuo sistema (Devi prima scaricarli dalla
:link reftype=hd refid='PANEL_HOMEPAGE'.homepage di Mastermind/2:elink.). In
questo sottomenu sara creata una voce per ogni linguaggio che ä stato trovato cosç
che tu avrai una lista delle lingue disponibili. Tu puoi cambiare questa scelta
mentre il programma ä in esecuzione e non ä assolutamente richiesto di riavviarlo!
:p.Questa opzione (come tutte le altre in Mastermind/2) viene salvata se chiudi il
programma e ricaricata quando lo riavvierai la volta dopo.
:p.Giusto come informazione: i moduli di lingua sono librerie a collegamento
dinamico (DLL) col nome mmindxx.dll. Dove xx stÖ per il codice della lingua, ad
esempio de = deutsch (che vuol dire tedesco in tedesco) oppure it = italiano.
.*********************************************************
.* Submenu "Select pins to use" 
.*********************************************************
:h3 id='PANEL_MENUPINS' res=419.Voce 'Imposta i colori...'
:p.Se i colori prestabiliti non ti piacciono c'ä la possibilitÖ di cambiarli.
Seleziona la voce :hp1.Imposta i colori...:ehp1. e ti apparirÖ questa finestra:
:p.:artwork  align=center name='F:\Projekte\Mastermind\selctpin.BMP'.
:p.Ora scegli i :hp1.sei:ehp1. colori che preferisci. Se scegli meno di sei colori
non potrai selezionare il pulsante "OK". Se ne hai giÖ selezionato sei gli altri
verranno disabilitati cosç che non potrai selezionarne pió di sei. Per abilitarli
di nuovo tutti bisogna deselezionarne almeno uno. Spero di aver aiutato tutte le 
persone che hanno problemi a distinguere i colori.
:p.Come con tutte le altre impostazioni, anche i colori che hai selezionato
saranno salvati e ripristinati al prossimo avvio del programma. Questo ti rende
tutto pió semplice: Seleziona una volta i tuoi colori preferiti e li avrai per
sempre (o fino a quando non li ricambierai con questa finestra).
:p.:note.Tu :hp1.puoi:ehp1. cambiare l'insieme di colori mentre una partita ä in
corso, ma se non sospendi esplicitamente la partita il tempo continuerÖ ad
avanzare anche mentre scegli i colori. Inoltre se cambi i colori mentre una
partita ä in corso, questa modifica potrebbe far cambiare tutti i colori giÖ
giocati. Questo avviene a causa della nuova posizione assunta dai colori nel loro
vettore. Ciï potebbe confondere, come si vede dal cambio effettuato nelle figure
seguenti&colon.
:p.:artwork runin align=left name='F:\projekte\mastermind\chngco00.bmp'.
:artwork runin align=right name='F:\projekte\mastermind\chngco01.bmp'.
:artwork runin align=right name='F:\projekte\mastermind\chngco04.bmp'.
:p.Ora togliamo rosso e giallo e mettiamo rosso scuro e nero&colon.
:p.:artwork runin align=left name='F:\projekte\mastermind\chngco02.bmp'.
:artwork runin align=right name='F:\projekte\mastermind\chngco03.bmp'.
:artwork runin align=right name='F:\projekte\mastermind\chngco05.bmp'.
.*********************************************************
.* Submenu "Exit Mastermind" 
.*********************************************************
:h3 id='PANEL_MENUEXIT' res=410.Voce 'Esci da Mastermind'
:p.In effetti ä una voce quasi incomprensibile: prova ad indovinare a cosa serve
&colon.-)
.*********************************************************
.* Menu "Help" 
.*********************************************************
:h2 id='PANEL_MENUHELP' res=411.Menu 'Guida'
:p.Se hai bisogno di qulsiasi tipo di aiuto dopo aver fatto partire Mastermind/2,
Puoi scegliere tra
:ul.
:li.
:link reftype=hd refid='PANEL_MENUGENERALHELP'.Generica...
:elink.
:li.
:link reftype=hd refid='PANEL_MENURULES'.Regole...
:elink.
:li.
:link reftype=hd res=415.Come si gioca...
:elink.
:li.
:link reftype=hd refid='PANEL_MENULICENSE'.Licenza...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUABOUT'.Informazioni su...
:elink.
:eul.
.*********************************************************
.* Submenu "General Help" 
.*********************************************************
:h3 id='PANEL_MENUGENERALHELP' res=417.Voce 'Generica...'
:p.Se non sei sicuro di che pagina della guida hai bisogno, usa la voce
:link reftype=hd refid='PANEL_WELCOME'.generica:elink..
Questa pagina ä mostrata anche quando premi F1 mentre nessun menu ä selezionato.
.*********************************************************
.* Submenu "Rules" 
.*********************************************************
:h3 id='PANEL_MENURULES' res=412.Voce 'Regole...'
:p.Questa voce apre una finestra della guida contenente le
:link reftype=hd refid='PANEL_RULES'.regole di Mastermind/2:elink..
.*********************************************************
.* Submenu "How to play" 
.*********************************************************
:h3 id='PANEL_MENUHOWTOPLAY' res=415.Voce 'Come si gioca...'
:p.Se selezioni questa voce ti sarÖ mostrata la
:link reftype=hd res=402.guida su come giocare la partita
:elink.(come scegliere i colori e altre).
.*********************************************************
.* Submenu "License" 
.*********************************************************
:h3 id='PANEL_MENULICENSE'.Voce 'Licenza...'
:p.Seleziona questa voce per visualizzare le
:link reftype=hd res=414.informazioni sulla licenza d'uso
:elink.del programma.
.*********************************************************
.* Submenu "About" 
.*********************************************************
:h3 id='PANEL_MENUABOUT' res=413.Voce 'Informazioni su...'
:p.Ti sei mai chiesto chi ä quel meraviglioso tipo che ha scritto questo grande
gioco? &colon.-) Seleziona
:hp1.Guida / informazioni su... :ehp1.
e lo saprai (ne saprai di pió
:link reftype=hd refid='PANEL_LICENSE'.se clicchi qui:elink.)!
.*********************************************************
.* License-information for Mastermind/2 
.*********************************************************
:h1 id='PANEL_LICENSE' res=414.Licenza
:p.Questo programma ä "postcardware". Ciï significa:
Ti impegni a spedire una cartolina illustrata all'autore se il programma ti piace
e se ci giochi. Questa mi informerÖ di quante persone stanno usando Mastermind/2 e
se ne vale la pena di realizzare delle versioni future - che potrebbero contenere
suoni, animazioni 3D in tempo reale, livelli di difficoltÖ, supporto per joystick
ecc. &colon.-)
:p.Inoltre la cartolina mi mostrerÖ se ci sono degli utenti di OS/2 interessati ai
giochi &colon.-) Probabilmente mi spingerÖ anche a scrivere alcuni altri programmi
(per OS/2 ovviamente). Tu puoi distribuire questo programma liberamente, ma non
puoi farlo pagare (eccetto che per il rimborso delle spese sostenute). Sarai ben
accetto se, dopo aver contattato l'autore, vorrai inserire il programma in un
CD-ROM. Per ottenere la tua
:hp1.:color fc='Red' bc='default'.licenza gratuita
:color fc='Default' bc='Default'.:ehp1.
scrivi a:
:p.RenÇ Auberger
.br
Breitensteiner Str. 11
.br
D-71032 Bîblingen 
.br
Germania
:p.Se invece vuoi usare la posta elettronica (Non per registrarti grazie, mi piace
ricevere cartoline da tutto il mondo): r.auberger@gmx.net, oggetto: Mastermind/2.
.*********************************************************
.* Homepage of Mastermind/2 
.*********************************************************
:h1 id='PANEL_HOMEPAGE' res=420.Sito di Mastermind/2
:p.:hp2.http&colon.//www.geocities.com/SiliconValley/Port/4718/:ehp2.
:p.Questa ä la URL del sito di Mastermind/2 (nota che ci sono delle lettere
maiuscole!). Questa sito contiene:
:ul.
:li.nuove versioni di Mastermind/2
:li.tutti i moduli di lingua attualmente disponibili
:li.Tutto l'occorrente per tradurre Mastermind/2 nella tua lingua madre
:li.Almeno una versione vecchia di Mastermind/2 (per chi la preferisce)
:li.Alcuni collegamenti che potrebbero essere utili se vuoi sviluppare dei giochi
o se sei un accanito giocatore (Assumo che non hai visitato il sito da quando hai
scaricato Mastermind/2)
:li.Un registro: Qui puoi scrivere le tue impressioni e/o raccontare qulcosa
all'autore o agli altri utenti (Per farmi notare eventuali errori per favore
scrivete direttamente a r.auberger@gmx.net indicando nell'oggetto della lettera
:hp1.Mastermind/2:ehp1.).
:eul.
:p.:note. Il sito ä disponibile solo in lingua inglese e, al momento, non penso di
fornire delle versioni nelle varie lingue nazionali.
.* You may include a note for all who do not speak english that this webpage is only
.* in english available and I do not think that I will provide another language version
:euserdoc.
