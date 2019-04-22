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
:title.Mastermind/2 - Die Anleitung
:docprof  toc=123456
ctrlarea=coverpage.
.*********************************************************
.* First page
.*********************************************************
:h1 id='PANEL_WELCOME' res=400.Willkommen bei Mastermind/2
:artwork align=center name='F:\Projekte\Mastermind\logo.bmp'.
Dieses Buch behandelt die folschenden Themen:
:ul.
:li.
:link reftype=hd refid='PANEL_RULES'.Rescheln von Mastermind/2
:elink.
:li.
:link reftype=hd refid='PANEL_HOWTOPLAY'.Wie wird Mastermind/2 gespielt?
:elink.
:li.
:link reftype=hd refid='PANEL_MENUS'.Was machen de enzelnen Men�punkte?
:elink.
:li.
:link reftype=hd refid='PANEL_LICENSE'.Lizenz
:elink.
:li.
:link reftype=hd refid='PANEL_HOMEPAGE'.Heimatseite von Mastermind/2
:elink.
:eul.
:nt.In diesem Buch wird nur die Du-Form verwendet. Falls sich jemand dadurch
zu nahe getreten f�hlt, bitte ich darum, die englische Version zu lesen (da gibt es ja
keenen Unterschied zwischen Du un Sie) oder alle 'Du' im Geischte durch 'Sie' zu ersetzen.
:p.Die Bilder in dieser Dokumentation sind alle von do englischen Version von
Mastermind/2 aufgenommen. Daher wechen die Beschriftungen in den Bildern un im Text
eventuell von enander ab.
:ent.

.*********************************************************
.* Rules of Mastermind 
.*********************************************************
:h1 id='PANEL_RULES' res=401.Rescheln
:p.:hp2.Ziel des Spiels:
:ehp2.
:p.Das is wirschlich ganz efach - mo mu� nur de Farben raten, die do Geschner (in
diesem Fall is das ja do Computer) ausgew�hlt hat.
:p.:hp2.Ja wie kommt mo nu dahin?
:ehp2.
:p.Jedesmal wenn mo ene Reihe von vier Farben gesteckt hat (un mo gloubt,
da� genau diese de richtischen Farben sind, die do Geschner gesteckt hat), teilt mo ihm
des efach mit. Nun verglecht der sene Vorgabe mit den geratenen Farben un gibt
f�r de n�schten Rateversuche Tips - ok, oder der sacht, da� mo de Farben
geraten hat. F�r jede Farbe, die an genau do glechen Stelle wie in do zu
ratenden Kombination steckt, gibt es enen we�en Signalst�ppel. F�r jede Farbe, die
zwor in do zu ratenden Kombination vorkommt, die mo aber an ene falsche
Stelle gesteckt hat, bekommt mo enen schwarzen Signalst�ppel.
.br
De Signalst�ppel stehn nat�rlich in kenem weteren direkten Zusammenhang zu
den Farben. Es is ja Deine eischne Aufgabe, nauszufinden, welche do Farben v�llig
falsch is (die bekommt dann kenen Signalst�ppel), welche zwar vorkommt aber an
do falschen Stelle steckt un welche absolut richtisch is.
:p.:hp2.Ein Bespiel gef�llig? Hier is ens&colon.:ehp2.
:p.Das sind de Farben, die Du raten sollst - Du wirst se nat�rlich nich
zu sehn bekommen, bevor Du se geraten hascht, ok? Aber das hier is ja auch 
en :hp1.Bespiel :ehp1.
;-)
:p.:artwork  align=center name='F:\Projekte\Mastermind\guess.BMP'.
:p.Nu r�tst Du folschendes:
:p.:artwork  align=center name='F:\Projekte\Mastermind\guessed.BMP'.
:p.Do Rote is total falsch, ebenso do Greene. T�rkis is ene do Farben, die
Du erraten sollscht, aber Du hascht se an de falsche Stelle gesteckt (schwarzer
Signalst�ppel) un Rosa is absolut richtisch (we�er Signalst�ppel). Also wirscht Du
folschende Hinwese bekommen:
:p.:artwork  align=center name='F:\Projekte\Mastermind\hints01.BMP'.
:p.Vielleicht hat das Spiel ja dann folschenden Verlauf genommen:
:p.:artwork  align=center name='F:\Projekte\Mastermind\game.BMP'.
:p.Das w�rde he�en, da� Du de Farben im f�nften Versuch erraten hascht. Das
is nich allzu �bel, aber es gibt noch mehr, auf das Du ufpassen sollscht:
Du solltscht de Farben n�mlich auch in do k�rzest m�schlichen Zeit erraten.
:p.:artwork  align=center name='F:\Projekte\Mastermind\time.BMP'.
:p.De zehn beschten Spieler k�nnen ihren Namen in de Beschtenliste eintragen.
Wenn zwei oder mehr Spieler de gleche Anzahl an Versuchen ben�tscht ham,
kummt der mit do k�rztn Zeit auf den h�schten Platz.
.*********************************************************
.* How to play Mastermind/2 
.*********************************************************
:h1 id='PANEL_HOWTOPLAY' res=402.Wie wird Mastermind/2 gespielt?
:p.:hp2.Wie sache ich dem Computer, welche Farbe wohin soll?:ehp2.
:p.Das is ganz efach: zieh se aus dem Feld "verf�gbare Farben" mit do Maus
naus un la� se �ber do Stelle fallen, an der Du se ham willscht (im
Englischen nennt mo das "dreeg and drup" = "ziehen un fallen lassen").
:p.:artwork  align=center name='F:\Projekte\Mastermind\availabl.BMP'.
:p.La� se �ber ener do Markierungen fallen:
:p.:artwork  align=center name='F:\Projekte\Mastermind\marks.BMP'.
:p.Als klene Hilfestellung - es is n�mlich nich immer ganz efach mit enem
runen Mauszeischer genau zu sachen, wo der hinzeischt - wird ene Markierung farblich
hervorgehoben, wenn mo se beim Fallenlassen treffen w�rde. Im folschenden Bespiel
wurde Rot bereits fallengelassen un gerade im Moment befindet sich Blau
(=Mauszeischer) �ber do dritten Markierung in do ersten Reihe:
:p.:artwork  align=center name='F:\Projekte\Mastermind\drop.BMP'.
:p.Nachdem mo ene Farbe positioniert hat, kann mo se efach endern, in dem 
mo ene andere Farbe an do glechen Stelle fallen l�scht. Wenn mo ene Farbe
in do aktuellen Reihe verschieben will, so braucht mo se nur innerhalb do
Reihe von do alten uf de neue Position verschieben (wider mit dreeg and
drup).
:p.:hp2.Wie sache ich dem Computer, da� ich ene Reihe fertsch hab?:ehp2.
:p.Wenn Du vier Farben ausgew�hlt hascht un diese nu als Deinen n�chschten Versuch
verwenden willscht, dr�ckst Du auf den Knopf '... Versuch' (wobei ... die
Nummer des Versuchs ment):
:p.:artwork  align=center name='F:\Projekte\Mastermind\button.BMP'.
:p.Das war's schon. Wenn Du gut genuch warscht, kannscht Du Deinen Namen in do
:link reftype=hd refid='PANEL_MENUHIGHSCORE'.Bestenlischte:elink. verewischen.
.*********************************************************
.* Help for the menus 
.*********************************************************
:h1 id='PANEL_MENUS' res=403.Men�s
:p.Es gibt zwe Hauptmen�s mit den folschenden Men�punkten:
:ul.
:li.
:link reftype=hd refid='PANEL_MENUMASTERMIND'.Mastermind
:elink.
:ul.
:li.
:link reftype=hd refid='PANEL_MENUSTART'.Neues Spiel starten
:elink.
:li.
:link reftype=hd refid='PANEL_MENUPAUSE'.Pause
:elink.
:li.
:link reftype=hd refid='PANEL_MENUCANCEL'.Spiel abbrechen
:elink.
:li.
:link reftype=hd refid='PANEL_MENUHIGHSCORE'.Bestenliste ...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUMULTIPLE'.Farben mehrfach verwenden
:elink.
:li.
:link reftype=hd refid='PANEL_MENULANGUAGE'.Sprache
:elink.
:li.
:link reftype=hd refid='PANEL_MENUPINS'.Ausw�hlen der Pins...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUEXIT'.Mastermind beenden
:elink.
:eul.
:li.
:link reftype=hd refid='PANEL_MENUHELP'.Hilfe
:elink.
:ul.
:li.
:link reftype=hd refid='PANEL_MENUGENERALHELP'.Allgemeine Hilfe...
:elink.
:li.
:link reftype=hd refid='PANEL_MENURULES'.Spielregeln...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUHOWTOPLAY'.Bedienug...
:elink.
:li.
:link reftype=hd refid='PANEL_MENULICENSE'.Lizenz...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUABOUT'.�ber...
:elink.
:eul.
:eul.
.*********************************************************
.* Menu "Mastermind/2" 
.*********************************************************
:h2 id='PANEL_MENUMASTERMIND' res=404.Men�&colon. Mastermind
:p.In diesem Men� kann mo generelle Einstellungen oder ene Auswahl f�r das
gerade loufende Spiel treffen:
:ul.
:li.
:link reftype=hd refid='PANEL_MENUSTART'.Neues Spiel starten
:elink.
:li.
:link reftype=hd refid='PANEL_MENUPAUSE'.Pause
:elink.
:li.
:link reftype=hd refid='PANEL_MENUCANCEL'.Spiel abbrechen
:elink.
:li.
:link reftype=hd refid='PANEL_MENUHIGHSCORE'.Bestenliste ...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUMULTIPLE'.Farben mehrfach verwenden
:elink.
:li.
:link reftype=hd refid='PANEL_MENULANGUAGE'.Sprache
:elink.
:li.
:link reftype=hd refid='PANEL_MENUPINS'.Ausw�hlen der Pins...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUEXIT'.Mastermind beenden
:elink.
:eul.
.*********************************************************
.* Submenu "Start new game" 
.*********************************************************
:h3 id='PANEL_MENUSTART' res=405.Men�punkt&colon. Neues Spiel starten
:p.Dieser Men�punkt is immer ausw�hlbar. Damit l�scht sich en neues Spiel
starten. Falls bereits ens l�uft wird das (nach Einholung Deiner Zustimmung)
abgebrochen.
.*********************************************************
.* Submenu "Pause game" 
.*********************************************************
:p.:h3 id='PANEL_MENUPAUSE' res=406.Men�punkt&colon. Pause
:p.Wenn en Spiel gerade l�uft, kann mo es damit unterbrechen. Alle geratenen
Farben un Signalst�ppel werden vosteckt, solange das Spiel pausiert is. Wenn
en Spiel unterbrochen is, �ndert sich dieser Men�punkt zu :hp1.Weiter:ehp1..
:p.En unterbrochenes Spiel kann durch Ausw�hlen des Men�punktes
:hp1.Weiter :ehp1.
fortgesetzt werden. Alle geratenen Farben un Signalst�ppel werden wider
angezeischt. Der Men�punkt wechselt wider zu Pause.
:p.Du kannscht en Spiel beliebisch oft unterbrechen (ohne da� dies enen Enflu�
auf Deinen m�glichen Eintrag in de Beschtenliste h�dde).
:note.En anderer Wesch, um en Spiel zu unterbrechen oder wider fortzusetzen,
is das Dr�cken do Pause-Taste uf do Taschtatur. Das hat exakt den glechen
Effekt wie de Auswahl des Men�punktes.
.*********************************************************
.* Submenu "Cancel game" 
.*********************************************************
:h3 id='PANEL_MENUCANCEL' res=407.Men�punkt&colon. Spiel abbrechen
:p.Hascht Du de Nase voll vom gerade laufenden Spiel? Du gloubst, Du wirst nie
de Farben Deines Geschners erraten? Und merkst das Du kenen Plan hascht Ok, w�hle
:hp1.Spiel abbrechen :ehp1.
aus un das Spiel is vorbei. Nu kannscht Du sehen wie discht Du an do richtschen L�sung
dran warscht, denn do Computer zeischt Dir nu de Farben an, die Du h�ttest
erraten sollen.
:note.Wenn Du en Spiel abbrechen willscht, kannscht Du auch Esc auf do Taschtatur
dr�cken, das bewirkt genau das gleche, wie do Men�punkt.
.*********************************************************
.* Submenu "Highscore..." 
.*********************************************************
:h3 id='PANEL_MENUHIGHSCORE' res=408.Men�punkt&colon. Beschtenliste...
:p.Falls es Dich interessiert, wie gut Du sein muscht, um in de Ruhmeshalle zu
kommen, wirf mal enen Blick auf de :hp1.Beschtenliste:ehp1..
:p.De zehn beschten Spieler d�rfen hier ihre Namen eintragen. Wenn zwe oder
mehr de gleiche Anzahl an Versuchen gebraucht ham, entscheidet de Zeit,
die se daf�r ben�tscht ham, wer weiter oben steht.
.*********************************************************
.* Submenu "Multiple colors" 
.*********************************************************
:h3 id='PANEL_MENUMULTIPLE' res=409.Men�punkt&colon. Farben mehrfach verwenden
:p.F�r alle, die es liber etwas efacher haben: nur diesen Men�punkt
ausschalten un schon kommt jede Farbe nur noch maximal emal vor. Das is
etwas efacher, als wenn Farben mehrfach vorkommen.
:p.Wenn Du :hp1.Farben mehrfach verwenden:ehp1. abgeschaltet hascht, kannst Du
ene Farbe auch nur emal in jeder Zeile raten. Falls Du ene Farbe en
zwetes Mal in dieser Reihe fallen l�scht, wird do erschte St�ppel dieser Farbe
automatisch wider gel�scht. Falls diese Erkl�rung zu konfus war, probier doch efach
aus, was ich mene, indem Du folschendes tust:
:ol.
:li.deselektiere :hp1.Farben mehrfach verwenden:ehp1.
:li.starte en neues Spiel
:li.ziehe z.B. den roten St�ppel aus dem Feld "verf�gbare Farben" un la� ihn in dem
Feld "Farben hier fallenlassen" nuerfallen
:li.mach genau das gleiche nochmal, nur la� dieses Mal den St�ppel an ener anderen
Stelle fallen
:li.do erste rote St�ppel verschwindet
:eol.
:p.De Standardeinstellung is :hp1.Farben mehrfach verwenden:ehp1. (aber wenn Du
es �nderst, wird sich Mastermind/2 beim n�chschten Programmstart daran erinnern).
Es gibt in do Beschtenliste kenen Hinwes drauf, ob mo mit mehrfachen oder 
mit efachen Farben gespielt hat (vielleicht baue ich das mal in ener
zuk�nftischen Version en, wenn �berhaupt
:link reftype=hd refid='PANEL_LICENSE'.jemand dieses Spiel spielt:elink.).
.*********************************************************
.* Submenu "Language" 
.*********************************************************
:h3 id='PANEL_MENULANGUAGE' res=418.Men�punkt&colon. Sprache
:p.Nachdem Mastermind/2 gestartet wurde, schaut es nach verf�gbaren Sprachmodulen
(die Du vorher von do :link reftype=hd refid='PANEL_HOMEPAGE'.Mastermind/2
Heimatseite:elink. heruntergeladen hascht). In diesem Untermen� werden alle Sprachen,
die gefunen wern konnten, angezeischt, so da� Du de Auswahl hascht, welche Du
gerne benutzen m�chtest. Du kannscht de verwendete Sprache w�hrend do Laufzeit
des Programms umstellen, ohne da� Du daf�r das Programm beenden un
neu starten muscht!
:p.De Einstellung, welche Sprache verwendet werden soll (un alle andern
Einstellungen in Mastermind/2) werden beim Verlassen des Programms abgespechert
un beim n�chschten Start automatisch wider geladen.
:p.Nur zur Info: de Sprachmodule sin dynamisch ladbare Bibliotheken
(englisch: dynamic link libraries = DLL), de mmindxx.dll he�en. Dabei steht
xx f�r de Sprache, z.B. de = deutsch, en = english oder ss = s�chsch (so schreibt sich s�chsich
auf s�chsich).
.*********************************************************
.* Submenu "Select pins to use" 
.*********************************************************
:h3 id='PANEL_MENUPINS' res=419.Men�punkt&colon. Ausw�hlen der Pins...
:p.Wenn Du de Standardfarben nich so gerne hascht, hascht Du nu de M�schlichket,
andere auszuw�hlen. W�hle dazu den Men�punkt :hp1.Ausw�hlen der Pins...:ehp1. 
un do folschende Dialog erscheint:
:p.:artwork  align=center name='F:\Projekte\Mastermind\selctpin.BMP'.

:p.Nun w�hle Deine favorisierten :hp1.sechs:ehp1. St�ppel aus. Wenn Du wenischer als sechs
w�hlscht, kannscht Du den OK-Knopf nich mehr dr�cken, wenn Du sechs St�ppel gew�hlt hascht,
kannscht Du kene weteren St�ppel mehr aussuchen. Um nu enen anderen St�ppel auszuw�hlen,
muscht Du zuerst mindestens enen do ausgew�hlten St�ppel wider weg machen. Ich hoffe,
da� ich damit besonders den Leuten helfen konnte, die Probleme beim erkennen von
Farben haben.
:p.Wie alle anderen Einstellungen auch, wird auch do von Dir ausgew�hlte St�ppelsatz beim
beenden gespechert un beim n�chsten Programmstart wider geladen. Das macht es sehr
efach f�r Dich: Du w�hlst nur emal Dene Lieblingsst�ppel aus un hascht se automatisch
immer eingestellt (au�er Du �nderscht de Auswahl emal).
:p.:note.Du :hp1.kannscht:ehp1. den verwendeten St�ppelsatz zwar �ndern w�hrend en Spiel
l�uft, aber beachte, da� de Zeit solange weiterl�uft bis Du explizit auf Pause schaltest.
Au�erdem k�nnen sich durch das Ausw�hlen anderer St�ppel de Farben "verschieben". Dies kann
sehr verwirrend sein, wie mo aus folschenden Bildern ersehen kann&colon.
:p.:artwork runin align=left name='F:\projekte\mastermind\chngco00.bmp'.
:artwork runin align=right name='F:\projekte\mastermind\chngco01.bmp'.
:artwork runin align=right name='F:\projekte\mastermind\chngco04.bmp'.
:p.Nu schalten wir den roten un gelben St�ppel aus un w�hlen daf�r dunkelrot un
schwarz&colon.
:p.:artwork runin align=left name='F:\projekte\mastermind\chngco02.bmp'.
:artwork runin align=right name='F:\projekte\mastermind\chngco03.bmp'.
:artwork runin align=right name='F:\projekte\mastermind\chngco05.bmp'.
.*********************************************************
.* Submenu "Exit Mastermind" 
.*********************************************************
:h3 id='PANEL_MENUEXIT' res=410.Men�punkt&colon. Mastermind beenden
:p.Ok, das is ziemlich schwer, vielleicht zu schwer f�r Dich. &colon.-)
.*********************************************************
.* Menu "Help" 
.*********************************************************
:h2 id='PANEL_MENUHELP' res=411.Men�&colon. Hilfe
:p.Falls Du nach dem Start von Mastermind/2 Hilfe ben�tigscht, kannscht Du zwischen folschenden
Men�punkten w�hlen:
:ul.
:li.
:link reftype=hd refid='PANEL_MENUGENERALHELP'.Allgemeine Hilfe...
:elink.
:li.
:link reftype=hd refid='PANEL_MENURULES'.Spielregeln...
:elink.
:li.
:link reftype=hd res=415.Bedienug...
:elink.
:li.
:link reftype=hd refid='PANEL_MENULICENSE'.Lizenz...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUABOUT'.�ber...
:elink.
:eul.
.*********************************************************
.* Submenu "General Help" 
.*********************************************************
:h3 id='PANEL_MENUGENERALHELP' res=417.Men�punkt&colon. Allgemeine Hilfe...
:p.Falls Du nich sicher bischt, was Du tun sollscht oder welche Hilfeseite de richtische
f�r Dei Problem is, rufe efach :link reftype=hd refid='PANEL_WELCOME'.Allgemene
Hilfe:elink. uf. Diese Seite wird auch angezeischt, wenn Du F1 dr�ckst w�hrend ken
Men�punkt markiert is.
.*********************************************************
.* Submenu "Rules" 
.*********************************************************
:h3 id='PANEL_MENURULES' res=412.Men�punkt&colon. Spielregeln...
:p.Dieser Men�punkt �ffnet Dir das Hilfefenster mit den allgemeinen
:link reftype=hd refid='PANEL_RULES'.Spielrescheln von Mastermind/2:elink..
.*********************************************************
.* Submenu "How to play" 
.*********************************************************
:h3 id='PANEL_MENUHOWTOPLAY' res=415.Men�punkt&colon. Bedienug...
:p.Wenn Du diesen Men�punkt ausw�hlst, bekommscht Du de Hilfe zur 
:link reftype=hd res=402.Bedienug des Spiels:elink. angezeischt (z.B. wie w�hle ich
Farben aus etc).
.*********************************************************
.* Submenu "License" 
.*********************************************************
:h3 id='PANEL_MENULICENSE'.Men�punkt&colon. Lizenz...
:p.Hiermit kannscht Du de :link reftype=hd res=414.Lizenzinformationen zu 
Mastermind/2:elink. abrufen.
.*********************************************************
.* Submenu "About" 
.*********************************************************
:h3 id='PANEL_MENUABOUT' res=413.Men�punkt&colon. �ber...
:p.Hascht Du Dich schon immer gefragt, welcher verr�ckte Kerl dieses grandiose Spiel
geschrieben hat? &colon.-) W�hle efach 
:hp1.Hilfe / �ber :ehp1. aus un Du wirst staunen (Du wirscht sogar noch viel mehr
erfahren, wenn Du
:link reftype=hd refid='PANEL_LICENSE'.hier klickst:elink.)!
.*********************************************************
.* License-information for Mastermind/2 
.*********************************************************
:h1 id='PANEL_LICENSE' res=414.Lizenz
:p.Dieses Programm is Poschtkartenware. Das he�t: wenn Du das Spiel magscht un spielst,
wirscht Du darum gebeten, ene Poschtkarte an den Autor zu schicken (eischentlich bischt Du dazu 
verpflichtet, aber ich wollte es mal nich so hart ausdr�cken). Dadurch erhalte ich
enen �berblick, wieviele Leute es �berhaupt benutzen un ob es sich lohnt, weitere
Versionen zu machen. Die k�nnten dann Soun, Echtzeit-3D-Animationen, Unterst�tzung
f�r die Forsse-Feedbeeck-Joisticks etc enthalten &colon.-)
:p.Au�erdem sehe ich dann mal, ob es auch en paar OS/2ler gibt, die gerne spielen 
&colon.-)
Vielleicht wird es mich ja sogar dazu veranlassen, en paar weitere Programme (f�r OS/2
nat�rlich) zu entwickeln. Du darfst dieses Programm frei vertelen un bischt nich
berechtischt, daf�r Geld zu verlangen (ausgenommen de Koschten, die Du f�r de Verteilung
hattescht). Ich w�rde mich sehr freuen, wenn Du das Programm mit auf CD-Sammlungen tuscht,
allerdings solltest Du mich vorher bitte dar�ber informieren. F�r Deine
:hp1.:color fc='Red' bc='default'.kostenlose Lizenz:color fc='Default' bc='Default'.:ehp1.
schreib an:
:p.Ren� Auberger
.br
Breitensteiner Str. 11
.br
D-71032 B�blingen 
.br
Deutschland
:p.Falls Du statt dessen eMail verwenden m�chstest (allerdings nich f�r de
Registrierung, ich h�tte gerne Postkarten aus aller Welt): r.auberger@gmx.net, 
Subject: Mastermind/2.
.*********************************************************
.* Homepage of Mastermind/2 
.*********************************************************
:h1 id='PANEL_HOMEPAGE' res=420.Mastermind/2 Homepage
:p.:hp2.http&colon.//www.geocities.com/SiliconValley/Port/4718/:ehp2.
:p.Dies is de URL do Heimatseite von Mastermind/2 (bitte beachten, da� se Gro�buchstaben
enth�lt, das is wichtisch!). Diese Seite enth�lt:
:ul.
:li.neue Versionen von Mastermind/2
:li.alle zur Zeit verf�schbaren Sprachmodule
:li.alles, was Du ben�tigscht, wenn Du selber Mastermind/2 in Deine Muttersprache
�bersetzten willscht
:li.zumindest ene alte Version von Mastermind/2 (wof�r das auch immer gut sein kann)
:li.en paar Links zu andern Internetseiten f�r alle, die selber Spiele schreibn
wolln oder die gerne spieln (dazu z�hle ich Dich efach mal, da Du ja Mastermind/2
heruntergeladen hascht)
:li.en G�stebuch: hier kannscht Du Vorschl�sche machen oder dem Autor oder den anderen
Benutzern etwas mitteilen (f�r enen Hinwes auf enen Fehler bitte nich das G�stebuch
benutzen, sondern ene eMail direkt an r.auberger@gmx.net mit dem Subject
:hp1.Mastermind/2:ehp1. schreiben).
:eul.
.* You may include a note for all who do not speak english that this webpage is only
.* in english available and I do not think that I will provide another language version
:p.Diese Seite is nur in englisch verf�schbar (un wird se wohl auch immer nur sein).
:euserdoc.
