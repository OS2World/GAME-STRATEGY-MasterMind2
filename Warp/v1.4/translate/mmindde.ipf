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
:title.Mastermind/2 - Benutzerhandbuch
:docprof  toc=123456
ctrlarea=coverpage.
.*********************************************************
.* First page
.*********************************************************
:h1 id='PANEL_WELCOME' res=400.Willkommen bei Mastermind/2
:artwork align=center name='F:\Projekte\Mastermind\logo.bmp'.
Dieses Buch behandelt die folgenden Themen:
:ul.
:li.
:link reftype=hd refid='PANEL_RULES'.Regeln von Mastermind/2
:elink.
:li.
:link reftype=hd refid='PANEL_HOWTOPLAY'.Wie wird Mastermind/2 gespielt?
:elink.
:li.
:link reftype=hd refid='PANEL_MENUS'.Was machen die einzelnen Menpunkte?
:elink.
:li.
:link reftype=hd refid='PANEL_LICENSE'.Lizenz
:elink.
:li.
:link reftype=hd refid='PANEL_HOMEPAGE'.Homepage von Mastermind/2
:elink.
:eul.
:nt.In diesem Buch wird ausschlieálich die Du-Form verwendet. Falls sich jemand dadurch
zu nahe getreten fhlt, bitte ich darum, die englische Version zu lesen (da gibt es ja
keinen Unterschied zwischen Du und Sie) oder alle 'Du' im Geiste durch 'Sie' zu ersetzen.
:p.Die Bilder in dieser Dokumentation sind alle von der englischen Version von
Mastermind/2 aufgenommen. Daher weichen die Beschriftungen in den Bildern und im Text
eventuell von einander ab.
:ent.

.*********************************************************
.* Rules of Mastermind 
.*********************************************************
:h1 id='PANEL_RULES' res=401.Regeln
:p.:hp2.Ziel des Spiels:
:ehp2.
:p.Das ist wirklich einfach - man muá nur die Farben raten, die der Gegner (in
diesem Fall ist das ja der Computer) ausgew„hlt hat.
:p.:hp2.Wie erreicht man dieses Ziel:
:ehp2.
:p.Jedesmal wenn man eine Reihe von vier Farben gesteckt hat (und man glaubt,
daá genau diese die Farben sind, die der Gegner gesteckt hat), teilt man ihm
dies mit. Nun vergleicht er seine Vorgabe mit den geratenen Farben und gibt
fr die n„chsten Rateversuche Tips - ok, oder er sagt, daá man die Farben
geraten hat. Fr jede Farbe, die an genau der gleichen Stelle wie in der zu
ratenden Kombination steckt, gibt es einen weiáen Signalpin. Fr jede Farbe, die
zwar in der zu ratenden Kombination vorkommt, die man aber an eine falsche
Stelle gesteckt hat, bekommt man einen schwarzen Signalpin.
.br
Die Signalpins stehen natrlich in keinem weiteren direkten Zusammenhang zu
den Farben. Es ist ja Deine Aufgabe, herauszufinden, welche der Farben v”llig
falsch ist (die bekommt dann keinen Signalpin), welche zwar vorkommt aber an
der falschen Stelle steckt und welche absolut richtig ist.
:p.:hp2.Ein Beispiel gef„llig? Hier ist eins&colon.:ehp2.
:p.Das sind die Farben, die Du raten sollst - Du wirst sie natrlich nicht 
zu sehen bekommen, bevor Du sie geraten hast, ok? Aber das hier ist ja auch 
ein :hp1.Beispiel :ehp1.
;-)
:p.:artwork  align=center name='F:\Projekte\Mastermind\guess.BMP'.
:p.Nun r„tst Du folgendes:
:p.:artwork  align=center name='F:\Projekte\Mastermind\guessed.BMP'.
:p.Der Rote ist total falsch, ebenso der Grne. Trkis ist eine der Farben, die
Du erraten sollst, aber Du hast sie an die falsche Stelle gesteckt (schwarzer
Signalpin) und Rosa ist absolut richtig (weiáer Signalpin). Also wirst Du
folgende Hinweise bekommen:
:p.:artwork  align=center name='F:\Projekte\Mastermind\hints01.BMP'.
:p.Vielleicht hat das Spiel ja dann folgenden Verlauf genommen:
:p.:artwork  align=center name='F:\Projekte\Mastermind\game.BMP'.
:p.Das wrde heiáen, daá Du die Farben im fnften Versuch erraten hast. Das
ist nicht allzu bel, aber es gibt noch mehr, auf das Du aufpassen solltest:
Du solltest die Farben n„mlich auch in der krzest m”glichen Zeit erraten.
:p.:artwork  align=center name='F:\Projekte\Mastermind\time.BMP'.
:p.Die zehn besten Spieler k”nnen ihren Namen in die Bestenliste eintragen.
Wenn zwei oder mehr Spieler die gleiche Anzahl an Versuchen ben”tigt haben,
kommt der mit der krzen Zeit auf den h”heren Platz.
.*********************************************************
.* How to play Mastermind/2 
.*********************************************************
:h1 id='PANEL_HOWTOPLAY' res=402.Wie wird Mastermind/2 gespielt?
:p.:hp2.Wie sage ich dem Computer, welche Farbe wohin soll?:ehp2.
:p.Das ist einfach: zieh sie aus dem Feld "verfgbare Farben" mit der Maus
heraus und laá sie ber der Stelle fallen, an der Du sie haben willst (im
Englischen nennt man das "drag and drop" = "ziehen und fallen lassen").
:p.:artwork  align=center name='F:\Projekte\Mastermind\availabl.BMP'.
:p.Laá sie ber einer der Markierungen fallen:
:p.:artwork  align=center name='F:\Projekte\Mastermind\marks.BMP'.
:p.Als kleine Hilfestellung - es ist n„mlich nicht immer ganz einfach mit einem
runden Mauszeiger genau zu sagen, wo er hinzeigt - wird eine Markierung farblich
hervorgehoben, wenn man sie beim Fallenlassen treffen wrde. Im folgenden Beispiel
wurde Rot bereits fallengelassen und gerade im Moment befindet sich Blau
(=Mauszeiger) ber der dritten Markierung in der ersten Reihe:
:p.:artwork  align=center name='F:\Projekte\Mastermind\drop.BMP'.
:p.Nachdem man eine Farbe positioniert hat, kann man sie einfach „ndern, in dem 
man eine andere Farbe an der gleichen Stelle fallen l„át. Wenn man eine Farbe
in der aktuellen Reihe verschieben will, so braucht man sie nur innerhalb der
Reihe von der alten auf die neue Position verschieben (wieder mit drag and
drop).
:p.:hp2.Wie sage ich dem Computer, daá ich eine Reihe fertig habe?:ehp2.
:p.Wenn Du vier Farben ausgew„hlt hast und diese nun als Deinen n„chsten Versuch
verwenden willst, drckst Du auf den Knopf '... Versuch' (wobei ... die
Nummer des Versuchs meint):
:p.:artwork  align=center name='F:\Projekte\Mastermind\button.BMP'.
:p.Das war's schon. Wenn Du gut genug warst, kannst Du Deinen Namen in der
:link reftype=hd refid='PANEL_MENUHIGHSCORE'.Bestenliste:elink. verewigen.
.*********************************************************
.* Help for the menus 
.*********************************************************
:h1 id='PANEL_MENUS' res=403.Mens
:p.Es gibt zwei Hauptmens mit den folgenden Menpunkten:
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
:link reftype=hd refid='PANEL_MENUPINS'.Ausw„hlen der Pins...
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
:link reftype=hd refid='PANEL_MENUHOWTOPLAY'.Bedienung...
:elink.
:li.
:link reftype=hd refid='PANEL_MENULICENSE'.Lizenz...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUABOUT'.šber...
:elink.
:eul.
:eul.
.*********************************************************
.* Menu "Mastermind/2" 
.*********************************************************
:h2 id='PANEL_MENUMASTERMIND' res=404.Men&colon. Mastermind
:p.In diesem Men kann man generelle Einstellungen oder eine Auswahl fr das
gerade laufende Spiel treffen:
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
:link reftype=hd refid='PANEL_MENUPINS'.Ausw„hlen der Pins...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUEXIT'.Mastermind beenden
:elink.
:eul.
.*********************************************************
.* Submenu "Start new game" 
.*********************************************************
:h3 id='PANEL_MENUSTART' res=405.Menpunkt&colon. Neues Spiel starten
:p.Dieser Menpunkt ist immer ausw„hlbar. Damit l„át sich ein neues Spiel
starten. Falls bereits eines l„uft wird das (nach Einholung Deiner Zustimmung)
abgebrochen.
.*********************************************************
.* Submenu "Pause game" 
.*********************************************************
:p.:h3 id='PANEL_MENUPAUSE' res=406.Menpunkt&colon. Pause
:p.Wenn ein Spiel gerade l„uft, kann man es damit unterbrechen. Alle geratenen
Farben und Signalpins werden verdeckt, solange das Spiel pausiert ist. Wenn
ein Spiel unterbrochen ist, „ndert sich dieser Menpunkt zu :hp1.Weiter:ehp1..
:p.Ein unterbrochenes Spiel kann durch Ausw„hlen des Menpunktes
:hp1.Weiter :ehp1.
fortgesetzt werden. Alle geratenen Farben und Signalpins werden wieder
angezeigt. Der Menpunkt wechselt wieder zu Pause.
:p.Du kannst ein Spiel beliebig oft unterbrechen (ohne daá dies einen Einfluá
auf Deinen m”glichen Eintrag in die Bestenliste h„tte).
:note.Ein anderer Weg, um ein Spiel zu unterbrechen oder wieder fortzusetzen,
ist das Drcken der Pause-Taste auf der Tastatur. Das hat exakt den gleichen
Effekt wie die Auswahl des Menpunktes.
.*********************************************************
.* Submenu "Cancel game" 
.*********************************************************
:h3 id='PANEL_MENUCANCEL' res=407.Menpunkt&colon. Spiel abbrechen
:p.Hast Du die Nase voll vom gerade laufenden Spiel? Du glaubst, Du wirst nie
die Farben Deines Gegners erraten? Ok, w„hle
:hp1.Spiel abbrechen :ehp1.
aus und das Spiel ist vorbei. Nun kannst Du sehen wie dicht Du an der L”sung
dran warst, denn der Computer zeigt Dir nun die Farben an, die Du h„ttest
erraten sollen.
:note.Wenn Du ein Spiel abbrechen willst, kannst Du auch Esc auf der Tastatur
drcken, das bewirkt genau das gleiche, wie dieser Menpunkt.
.*********************************************************
.* Submenu "Highscore..." 
.*********************************************************
:h3 id='PANEL_MENUHIGHSCORE' res=408.Menpunkt&colon. Bestenliste...
:p.Falls es Dich interessiert, wie gut Du sein muát, um in die Ruhmeshalle zu
kommen, wirf mal einen Blick auf die :hp1.Bestenliste:ehp1..
:p.Die zehn besten Spieler drfen hier ihre Namen eintragen. Wenn zwei oder
mehr die gleiche Anzahl an Versuchen gebraucht haben, entscheidet die Zeit,
die sie dafr ben”tigt haben, wer weiter oben steht.
.*********************************************************
.* Submenu "Multiple colors" 
.*********************************************************
:h3 id='PANEL_MENUMULTIPLE' res=409.Menpunkt&colon. Farben mehrfach verwenden
:p.Fr alle, die es lieber etwas einfacher haben: nur diesen Menpunkt
deselektieren und schon kommt jede Farbe nur noch maximal einmal vor. Das ist
etwas einfacher, als wenn Farben mehrfach vorkommen.
:p.Wenn Du :hp1.Farben mehrfach verwenden:ehp1. abgeschaltet hast, kannst Du
eine Farbe auch nur einmal in jeder Zeile raten. Falls Du eine Farbe ein
zweites Mal in dieser Reihe fallen l„át, wird der erste Pin dieser Farbe
automatisch wieder gel”scht. Falls diese Erkl„rung zu konfus war, probier einfach
aus, was ich meine, indem Du folgendes tust:
:ol.
:li.deselektiere :hp1.Farben mehrfach verwenden:ehp1.
:li.starte ein neues Spiel
:li.ziehe z.B. den roten Pin aus dem Feld "verfgbare Farben" und laá ihn in dem
Feld "Farben hier fallenlassen" fallen
:li.mach genau das gleiche nochmal, nur laá dieses Mal den Pin an einer anderen
Stelle fallen
:li.der erste rote Pin verschwindet
:eol.
:p.Die Standardeinstellung ist :hp1.Farben mehrfach verwenden:ehp1. (aber wenn Du
es „nderst, wird sich Mastermind/2 beim n„chsten Programmstart daran erinnern).
Es gibt in der Bestenliste keinen Hinweis darauf, ob man mit mehrfachen oder 
mit einfachen Farben gespielt hat (vielleicht baue ich das mal in einer
zuknftigen Version ein, wenn berhaupt
:link reftype=hd refid='PANEL_LICENSE'.jemand dieses Spiel spielt:elink.).
.*********************************************************
.* Submenu "Language" 
.*********************************************************
:h3 id='PANEL_MENULANGUAGE' res=418.Menpunkt&colon. Sprache
:p.Nachdem Mastermind/2 gestartet wurde, schaut es nach verfgbaren Sprachmodulen
(die Du vorher von der :link reftype=hd refid='PANEL_HOMEPAGE'.Mastermind/2
Homepage:elink. heruntergeladen hast). In diesem Untermen werden alle Sprachen,
die gefunden werden konnten, angezeigt, so daá Du die Auswahl hast, welche Du
gerne benutzen m”chtest. Du kannst die verwendete Sprache w„hrend der Laufzeit
des Programms umstellen, ohne daá Du dafr das Programm beenden und
neu starten mátest!
:p.Die Einstellung, welche Sprache verwendet werden soll (und alle anderen
Einstellungen in Mastermind/2) werden beim Verlassen des Programms abgespeichert
und beim n„chsten Start automatisch wieder geladen.
:p.Nur zur Information: die Sprachmodule sind dynamisch ladbare Bibliotheken
(englisch: dynamic link libraries = DLL), die mmindxx.dll heiáen. Dabei steht
xx fr die Sprache, z.B. de = deutsch oder en = english (so schreibt sich englisch
auf englisch).
.*********************************************************
.* Submenu "Select pins to use" 
.*********************************************************
:h3 id='PANEL_MENUPINS' res=419.Menpunkt&colon. Ausw„hlen der Pins...
:p.Wenn Du die Standardfarben nicht so magst, hast Du nun die M”glichkeit,
andere auszuw„hlen. W„hle dazu den Menpunkt :hp1.Ausw„hlen der Pins...:ehp1. 
und der folgende Dialog erscheint:
:p.:artwork  align=center name='F:\Projekte\Mastermind\selctpin.BMP'.

:p.Nun w„hle Deine favorisierten :hp1.sechs:ehp1. Pins aus. Wenn Du weniger als sechs
w„hlst, kannst Du den OK-Knopf nicht mehr drcken, wenn Du sechs Pins gew„hlt hast,
kannst Du keine weiteren Pins mehr ausw„hlen. Um nun einen anderen Pin auszuw„hlen,
muát Du zuerst mindestens einen der ausgew„hlten Pins wieder deselektieren. Ich hoffe,
daá ich damit besonders den Leuten helfen konnte, die Probleme beim erkennen von
Farben haben.
:p.Wie alle anderen Einstellungen auch, wird auch der von Dir ausgew„hlte Pinsatz beim
beenden gespeichert und beim n„chsten Programmstart wieder geladen. Das macht es sehr
einfach fr Dich: Du w„hlst nur einmal Deine Lieblingspins aus und hast sie automatisch
immer eingestellt (auáer Du „nderst diese Auswahl einmal).
:p.:note.Du :hp1.kannst:ehp1. den verwendeten Pinsatz zwar „ndern w„hrend ein Spiel
l„uft, aber beachte, daá die Zeit solange weiterl„uft bis Du explizit auf Pause schaltest.
Auáerdem k”nnen sich durch das Ausw„hlen anderer Pins die Farben "verschieben". Dies kann
sehr verwirrend sein, wie man aus folgenden Bildern ersehen kann&colon.
:p.:artwork runin align=left name='F:\projekte\mastermind\chngco00.bmp'.
:artwork runin align=right name='F:\projekte\mastermind\chngco01.bmp'.
:artwork runin align=right name='F:\projekte\mastermind\chngco04.bmp'.
:p.Nun schalten wir den roten und gelben Pin aus und w„hlen dafr dunkelrot und
schwarz&colon.
:p.:artwork runin align=left name='F:\projekte\mastermind\chngco02.bmp'.
:artwork runin align=right name='F:\projekte\mastermind\chngco03.bmp'.
:artwork runin align=right name='F:\projekte\mastermind\chngco05.bmp'.
.*********************************************************
.* Submenu "Exit Mastermind" 
.*********************************************************
:h3 id='PANEL_MENUEXIT' res=410.Menpunkt&colon. Mastermind beenden
:p.Ok, das ist ziemlich schwer. Daher muát Du es schon selber raten &colon.-)
.*********************************************************
.* Menu "Help" 
.*********************************************************
:h2 id='PANEL_MENUHELP' res=411.Men&colon. Hilfe
:p.Falls Du nach dem Start von Mastermind/2 Hilfe ben”tigst, kannst Du zwischen folgenden
Menpunkten w„hlen:
:ul.
:li.
:link reftype=hd refid='PANEL_MENUGENERALHELP'.Allgemeine Hilfe...
:elink.
:li.
:link reftype=hd refid='PANEL_MENURULES'.Spielregeln...
:elink.
:li.
:link reftype=hd res=415.Bedienung...
:elink.
:li.
:link reftype=hd refid='PANEL_MENULICENSE'.Lizenz...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUABOUT'.šber...
:elink.
:eul.
.*********************************************************
.* Submenu "General Help" 
.*********************************************************
:h3 id='PANEL_MENUGENERALHELP' res=417.Menpunkt&colon. Allgemeine Hilfe...
:p.Falls Du nicht sicher bist, was Du tun sollst oder welche Hilfeseite die richtige
fr Dein Problem ist, rufe einfach :link reftype=hd refid='PANEL_WELCOME'.Allgemeine
Hilfe:elink. auf. Diese Seite wird auch angezeigt, wenn Du F1 drckst w„hrend kein
Menpunkt markiert ist.
.*********************************************************
.* Submenu "Rules" 
.*********************************************************
:h3 id='PANEL_MENURULES' res=412.Menpunkt&colon. Spielregeln...
:p.Dieser Menpunkt ”ffnet Dir das Hilfefenster mit den allgemeinen
:link reftype=hd refid='PANEL_RULES'.Spielregeln von Mastermind/2:elink..
.*********************************************************
.* Submenu "How to play" 
.*********************************************************
:h3 id='PANEL_MENUHOWTOPLAY' res=415.Menpunkt&colon. Bedienung...
:p.Wenn Du diesen Menpunkt ausw„hlst, bekommst Du die Hilfe zur 
:link reftype=hd res=402.Bedienung des Spiels:elink. angezeigt (z.B. wie w„hle ich
Farben aus etc).
.*********************************************************
.* Submenu "License" 
.*********************************************************
:h3 id='PANEL_MENULICENSE'.Menpunkt&colon. Lizenz...
:p.Hiermit kannst Du die :link reftype=hd res=414.Lizenzinformationen zu 
Mastermind/2:elink. abrufen.
.*********************************************************
.* Submenu "About" 
.*********************************************************
:h3 id='PANEL_MENUABOUT' res=413.Menpunkt&colon. šber...
:p.Hast Du Dich schon immer gefragt, welcher verrckte Kerl dieses grandiose Spiel
geschrieben hat? &colon.-) W„hle einfach 
:hp1.Hilfe / šber :ehp1. aus und Du wirst es erfahren (Du wirst sogar noch viel mehr
erfahren, wenn Du
:link reftype=hd refid='PANEL_LICENSE'.hier klickst:elink.)!
.*********************************************************
.* License-information for Mastermind/2 
.*********************************************************
:h1 id='PANEL_LICENSE' res=414.Lizenz
:p.Dieses Programm ist Postcardware. Das heiát: wenn Du das Spiel magst und spielst,
wirst Du darum gebeten, eine Postkarte an den Autor zu schicken (eigentlich bist Du dazu 
verpflichtet, aber ich wollte es mal nicht so hart ausdrcken). Dadurch erhalte ich
einen šberblick, wieviele Leute es berhaupt benutzen und ob es sich lohnt, weitere
Versionen zu machen. Die k”nnten dann Sound, Echtzeit-3D-Animationen, Untersttzung
fr die Force-Feedback-Joysticks etc enthalten &colon.-)
:p.Auáerdem sehe ich dann mal, ob es auch ein paar OS/2ler gibt, die gerne spielen 
&colon.-)
Vielleicht wird es mich ja sogar dazu veranlassen, ein paar weitere Programme (fr OS/2
natrlich) zu entwickeln. Du darfst dieses Programm frei verteilen und bist nicht
berechtigt, dafr Geld zu verlangen (ausgenommen der Kosten, die Du fr die Verteilung
hattest). Ich wrde mich sehr freuen, wenn Du das Programm mit auf CD-Sammlungen tust,
allerdings solltest Du mich vorher bitte darber informieren. Fr Deine
:hp1.:color fc='Red' bc='default'.kostenlose Lizenz:color fc='Default' bc='Default'.:ehp1.
schreib an:
:p.Ren‚ Auberger
.br
Breitensteiner Str. 11
.br
D-71032 B”blingen 
.br
Deutschland
:p.Falls Du statt dessen eMail verwenden m”chstest (allerdings nicht fr die
Registrierung, ich h„tte gerne Postkarten aus aller Welt): r.auberger@gmx.net, 
Subject: Mastermind/2.
.*********************************************************
.* Homepage of Mastermind/2 
.*********************************************************
:h1 id='PANEL_HOMEPAGE' res=420.Mastermind/2 Homepage
:p.:hp2.http&colon.//www.geocities.com/SiliconValley/Port/4718/:ehp2.
:p.Dies ist die URL der Homepage von Mastermind/2 (bitte beachten, daá sie Groábuchstaben
enth„lt, das ist wichtig!). Diese Seite enth„lt:
:ul.
:li.neue Versionen von Mastermind/2
:li.alle zur Zeit verfgbaren Sprachmodule
:li.alles, was Du ben”tigst, wenn Du selber Mastermind/2 in Deine Muttersprache
bersetzten willst
:li.zumindest eine alte Version von Mastermind/2 (wofr das auch immer gut sein kann)
:li.ein paar Links zu anderen Internetseiten fr alle, die selber Spiele schreiben
wollen oder die gerne spielen (dazu z„hle ich Dich einfach mal, da Du ja Mastermind/2
heruntergeladen hast)
:li.ein G„stebuch: hier kannst Du Vorschl„ge machen oder dem Autor oder den anderen
Benutzern etwas mitteilen (fr einen Hinweis auf einen Fehler bitte nicht das G„stebuch
benutzen, sondern eine eMail direkt an r.auberger@gmx.net mit dem Subject
:hp1.Mastermind/2:ehp1. schreiben).
:eul.
.* You may include a note for all who do not speak english that this webpage is only
.* in english available and I do not think that I will provide another language version
:p.Diese Seite ist nur in englisch verfgbar (und wird sie wohl auch immer nur sein).
:euserdoc.
