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
:title.Mastermind/2 - Guide de l'usager
:docprof  toc=123456
ctrlarea=coverpage.
.*********************************************************
.* First page
.*********************************************************
:h1 id='PANEL_WELCOME' res=400.Bienvenue … Mastermind/2
:artwork align=center name='F:\Projekte\Mastermind\logo.bmp'.
Les chapitres de ce document sont:
:ul.
:li.
:link reftype=hd refid='PANEL_RULES'.RŠgles de Mastermind/2
:elink.
:li.
:link reftype=hd refid='PANEL_HOWTOPLAY'.Comment jouer
:elink.
:li.
:link reftype=hd refid='PANEL_MENUS'.Ce que fait le menu?
:elink.
:li.
:link reftype=hd refid='PANEL_LICENSE'.License
:elink.
:li.
:link reftype=hd refid='PANEL_HOMEPAGE'.Homepage de Mastermind/2
:elink.
:eul.
.*********************************************************
.* RŠles de Mastermind 
.*********************************************************
:h1 id='PANEL_RULES' res=401.RŠles
:p.:hp2.But du jeu:
:ehp2.
:p.C'est trŠs facile - devinez la couleur que votre opposant (votre ordinateur) a choisis.
:p.:hp2.Comment atteindre l'objectif:
:ehp2.
:p.Chaque fois que vous choisissez 4 couleurs (et que vous croyez que ce sont les couleurs choisis par votre opposant) vous lui dites. Il compare vos couleurs avec les siennes et vous donne
des indices pour votre prochain essai - ok, ou il vous dit que vous avez trouvez juste.
Pour chacune des pins de la bonne couleur que vous positionnez au bon endroit Il l'indique avec une pin blanche. Pour chacune des pins de la bonne couleur mais positionn‚e au mauvais endroit, il vous l'indique avec une pin noire.
.br
La position des pins blanches et noires ne seront pas dans l'ordre, bien sur. C'est votre travail de d‚terminer laquelle de votre ou vos pins sont bien ou mal plac‚es et de la bonne ou mauvaise couleur.
:p.:hp2.Besoin d'un exemple? En voici un:
:ehp2.
:p.Ce sont les couleurs que vous devez deviner - vous ne les verrez pas tant que vous n'aurez pas deviner, ok? Ceci est un 
:hp1.example :ehp1.
;-)
:p.:artwork  align=center name='F:\Projekte\Mastermind\guess.BMP'.
:p.Maintenant vous essayez le groupe suivant:
:p.:artwork  align=center name='F:\Projekte\Mastermind\guessed.BMP'.
:p.Le rouge est mauvais ainsi que le vert. Violet est la couleur que vous devez deviner, mais vous la positionnez au mauvais endroit (il met une pin noire)
et la rose est bien positionn‚e (il met une pin blanche). Ainsi les indices qui vous seront donn‚s sont:
:p.:artwork  align=center name='F:\Projekte\Mastermind\hints01.BMP'.
:p.Peut-ˆtre votre joute prend l'aspect suivant:
:p.:artwork  align=center name='F:\Projekte\Mastermind\game.BMP'.
:p.Vous avez devin‚ les couleurs au cinquiŠme essais. Pas trop mal, mais ce n'est pas la seule chose dont vous vous devez de vous pr‚occuper. Vous devez trouver les couleurs dans le plus court laps de temps possible.
:p.:artwork  align=center name='F:\Projekte\Mastermind\time.BMP'.
:p.Les dix meilleurs joueurs peuvent avoir leur nom inscrit au tableau des plus haut pointages. Si deux joueurs ou plus ont le mˆme pointage et le mˆme temps il d‚cidera qui aura le plus haut rang.
.*********************************************************
.* Comment jouer … Mastermind/2 
.*********************************************************
:h1 id='PANEL_HOWTOPLAY' res=402.Comment jouer
:p.:hp2.Comment je dis … l'ordinateur quel couleur je veux mettre et … quel place?:ehp2.
:p.C'est facile: Glissez la couleur de votre choix … partir des "couleurs disponibles" et placez la … l'endroit d‚sir‚.
:p.:artwork  align=center name='F:\Projekte\Mastermind\availabl.BMP'.
:p.Laissez la tomber sur la marque:
:p.:artwork  align=center name='F:\Projekte\Mastermind\marks.BMP'.
:p.Pour vous assister - ce n'est pas toujours facile de voir si le pointeur est sur 
la marque - au moment ou la marque s'illumine vous pouvez jeter la couleur. Dans 
l'example suivant la pin rouge est d‚j… mise et maintenant la bleu est 
gliss‚ au dessus de la troisiŠme marque dans cette rang‚e&colon.
:p.:artwork  align=center name='F:\Projekte\Mastermind\drop.BMP'.
:p.AprŠs avoir s‚lectionner une couleur vous pouvez la changer simplement en glissant 
une autre couleur dessus. Si vous d‚cidez de d‚m‚nager une couleur d‚j… plac‚e … une 
autre position vous n'avez qu'… la glisser de sa position originale … sa nouvelle position.
:p.:hp2.Comment dire … l'ordinateur d'utilis‚ les couleurs deviner comme essais?:ehp2.
:p.Si vous choisissez quatre couleurs et voulez les utiliser comme essais poussez sur le bouton poussoir marqu‚ 'xxx essai' (o— xxx indique le num‚ro de votre essais):
:p.:artwork  align=center name='F:\Projekte\Mastermind\button.BMP'.
:p.C'est tout. Si vous ˆtres suffisamment bon vous pouvez mettre votre nom dans la table de 
:link reftype=hd refid='PANEL_MENUHIGHSCORE'.haut pointage:elink..
.*********************************************************
.* Aide pour le menu 
.*********************************************************
:h1 id='PANEL_MENUS' res=403.Menu
:p.Il y a deux items principaux dans le menu, et chacun d'eux a un sous-menu:
:ul.
:li.
:link reftype=hd refid='PANEL_MENUMASTERMIND'.Mastermind
:elink.
:ul.
:li.
:link reftype=hd refid='PANEL_MENUSTART'.D‚buter une nouvelle joute
:elink.
:li.
:link reftype=hd refid='PANEL_MENUPAUSE'.Pause
:elink.
:li.
:link reftype=hd refid='PANEL_MENUCANCEL'.Annuler
:elink.
:li.
:link reftype=hd refid='PANEL_MENUHIGHSCORE'.Haut pointage ...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUMULTIPLE'.Couleurs multiples
:elink.
:li.
:link reftype=hd refid='PANEL_MENULANGUAGE'.Langue
:elink.
:li.
:link reftype=hd refid='PANEL_MENUPINS'.Selectioner les pins … utiliser...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUEXIT'.Sortie de Mastermind
:elink.
:eul.
:li.
:link reftype=hd refid='PANEL_MENUHELP'.Aide
:elink.
:ul.
:li.
:link reftype=hd refid='PANEL_MENUGENERALHELP'.Aide g‚n‚ral...
:elink.
:li.
:link reftype=hd refid='PANEL_MENURULES'.RŠgles...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUHOWTOPLAY'.Comment jouer...
:elink.
:li.
:link reftype=hd refid='PANEL_MENULICENSE'.License...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUABOUT'.A Propos...
:elink.
:eul.
:eul.
.*********************************************************
.* Menu "Mastermind/2" 
.*********************************************************
:h2 id='PANEL_MENUMASTERMIND' res=404.Menu&colon. Mastermind
:p.Ce menu vous permet de faire quelques s‚lections pour le jeu en g‚n‚ral ou pour la joute actuel:
:ul.
:li.
:link reftype=hd refid='PANEL_MENUSTART'.D‚but d'une nouvelle joute
:elink.
:li.
:link reftype=hd refid='PANEL_MENUPAUSE'.Pause
:elink.
:li.
:link reftype=hd refid='PANEL_MENUCANCEL'.Annuler la joute
:elink.
:li.
:link reftype=hd refid='PANEL_MENUHIGHSCORE'.Haut pointage ...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUMULTIPLE'.Couleurs multiples
:elink.
:li.
:link reftype=hd refid='PANEL_MENULANGUAGE'.Langue
:elink.
:li.
:link reftype=hd refid='PANEL_MENUPINS'.Selectionez les pins … utiliser...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUEXIT'.Sortie de Mastermind
:elink.
:eul.
.*********************************************************
.* Submenu "D‚buter une nouvelle joute" 
.*********************************************************
:h3 id='PANEL_MENUSTART' res=405.Menuitem&colon. D‚buter une nouvelle joute
:p.Cet item est toujours s‚lectable. Vous pouvez d‚buter une nouvelle joute ici. Si une autre joute est en cours elle sera annul‚ aprŠs avoir donn‚ votre consentement.
.*********************************************************
.* Submenu "Pause" 
.*********************************************************
:p.:h3 id='PANEL_MENUPAUSE' res=406.Menuitem&colon. Pause
:p.Vous pouvez faire une pause au cours d'une joute. Toutes les couleurs choisis ainsi que les pins noires et blanches seront cach‚ jusqu'… ce que vous annulerez la pause. Si une joute est en pause, les changements aux items de menu le sont aussi :hp1.Fin de pause:ehp1..
:p.Vous pouvez mettre fin … la pause en s‚lectionnant
:hp1.fin de pause:ehp1..
Tous vos essais et les pins sont montr‚s. Le menu change au retour de la pause.
:p.Vous pouvez faire une pause … une joute aussi souvent que vous voulez (sans affecter la possiblilt‚e de s'inscrire dans le tableau des Haut Pointages).
:note.Un autre moyen de faire une pause ou de la terminer est de presser la touche "pause" du clavier.
Ceci a le mˆme effet que "pause" dans le menu.
.*********************************************************
.* Submenu "Annuler" 
.*********************************************************
:h3 id='PANEL_MENUCANCEL' res=407.Menuitem&colon. Annuler
:p.Vous en avez assez de la joute actuelle? Vous croyez que vous ne devinerez jamais? Ok, selectionnez
:hp1.Annuler :ehp1.
et la joute se termine. Vous verrez alors les couleurs que vous deviez trouver.
:note.Si vous voulez annuler votre joute, vous pouvez aussi appuyer sur "ESC" sur le clavier. Cela a le mˆme effet.
.*********************************************************
.* Submenu "Haut Pointage..." 
.*********************************************************
:h3 id='PANEL_MENUHIGHSCORE' res=408.Menuitem&colon. Haut Pointage.....
:p.Si vous ˆtes int‚ress‚ … ˆtre suffisamment bon pour entrer dans le temple de la renomm‚e, allez voir en
choisissant :hp1.Haut pointage:ehp1..
:p.Les dix meilleur joueurs peuvent avoir leur nom dans la table des Haut pointages. Si deux joueurs ou plus ont le mˆme pointage dans un mˆme temps, ce sera a eux de d‚cider qui sera inscrit dans la table.
.*********************************************************
.* Submenu "Couleurs multiples" 
.*********************************************************
:h3 id='PANEL_MENUMULTIPLE' res=409.Menuitem&colon. Couleurs multiples
:p.Pour tous ceux qui aime cela simple: n'utilisez pas ce menu et les couleurs que vous aurez … deviner seront toutes diff‚rentes.
 C'est un peu plus facile que d'avoir
:hp1.couleurs multiples:ehp1. … choisir.
:p.Si vous avez s‚lectionn‚ couleurs multiples vous pouvez s‚lectionner une seulement dans la rang‚e
que vous devinez. Si vous res‚lectionnez la mˆme couleur une seconde fois la premiŠre pin sera effac‚e. 
Si vous ne comprenez pas cette explication un peu confuse essayez de la fa‡on suivante:
:ol.
:li.s‚lectionnez :hp1.Couleurs multiples:ehp1.
:li.d‚marez une nouvelle joute
:li.s‚lectionnez par exemple la pin rouge de la table des "couleurs disponibles" et mettez la dans la table "mettre votre couleur ici" 
:li.essayez maintenant de mettre une seconde fois la mˆme couleur dans une autre position
:li.la premiŠre pin rouge disparaŒt.
:eol.
:p.La s‚lection par d‚faut est :hp1.Couleurs multiples:ehp1. s‚lection "on" (mais si vous la changez votre s‚lection
 sera m‚moris‚ pour les prochaines fois). Il n'y a pas de remarques
au Haut pointage qui dit si vous avez devinez des couleurs multiples ou simple (peut-ˆtre dans une version future, si
:link reftype=hd refid='PANEL_LICENSE'.des amateurs joue
:elink.ou non).
.*********************************************************
.* Submenu "Langage" 
.*********************************************************
:h3 id='PANEL_MENULANGUAGE' res=418.Menuitem&colon. Langage
:p.AprŠs le d‚marrage de Mastermind/2 le programme regarde les modules de langage qui sont disponible (vous les avez t‚l‚charg‚ de
:link reftype=hd refid='PANEL_HOMEPAGE'.Mastermind/2 Homepage:elink.). Dans ce sous-menu 
un item menu pour chacun des langage sera cr‚‚ de sorte … ce que vous ayez le choix du language que vous voulez utiliser. Vous pouvez changer le language sans avoir … red‚marrer le programme!
:p.Le langage choisis (et tous les autres ajustements de Mastermind/2) sera m‚moris‚ si vous arrˆtez la joute pour la prochaine fois que vous rejouerez.
:p.Pour votre information: les modules de langue dont des liens de librairies dynamiques (DLL) qui se nomment mmindxx.dll. Ou xx repr‚sente le code-langage, e.g. de = deuch (c'est comme
cela que se dit allemend en allemand) ou fr = fran‡ais.
.*********************************************************
.* Submenu "S‚lections de pins" 
.*********************************************************
:h3 id='PANEL_MENUPINS' res=419.Menuitem&colon. S‚lectionnez les pins...
:p.Si vous n'aimez pas les couleurs standards vous avez la possibilit‚ de les changers. S‚lectionnez l'item menu :hp1.Selectionnez les pins.....:ehp1. et vous verrez:
:p.:artwork  align=center name='F:\Projekte\Mastermind\selctpin.BMP'.
:p.Maintenamt choisissez vos :hp1.six:ehp1. pins favorites. Si vous choisissez moins de six pins 
vous ne pourrez pas appuyer sur le bouton OK, dŠs que vous en aurez choisis six toutes les autres cases deviendront grise
et vous ne serez plus capable d'en ajouter. Vous devrez en d‚s‚lectionner au moins une pour r‚allumer les cases. 
J'espŠre avoir aid‚ tous ceux qui ont des problŠmes … distinguer les couleurs.
:p.Comme tous les autres s‚lections que vous avez faites les couleurs de pins que vous avez choisis seront m‚moris‚ pour le futur.
Ce sera trŠs facile pour vous: s‚lectionnez vos couleurs une fois et vous les aurez pour tout le temps (ou du moins jusqu'… ce que vous les changiez).
:p.:note.Vous :hp1.ˆtes capable:ehp1. de changer le jeu de pin au moment ou vous jouez. Mais … moins que
vous faissiez une pause … la joute le temps de votre joute continura de compter. Et si vous changez le jeu de pins au moment d'une joute peut-ˆtre toutes les couleurs "changeront" parce qu'ils pourraient avoir
de nouvelle positions dans la ligne de couleurs. Comme vous pouvez le voir cela pourrait devenir confus de changer le d‚cor.
:p.:artwork runin align=left name='F:\projekte\mastermind\chngco00.bmp'.
:artwork runin align=right name='F:\projekte\mastermind\chngco01.bmp'.
:artwork runin align=right name='F:\projekte\mastermind\chngco04.bmp'.
:p.Maintenant nous avons enlev‚ la rouge et la jaune pour mettre la rose et la noir&colon.
:p.:artwork runin align=left name='F:\projekte\mastermind\chngco02.bmp'.
:artwork runin align=right name='F:\projekte\mastermind\chngco03.bmp'.
:artwork runin align=right name='F:\projekte\mastermind\chngco05.bmp'.
.*********************************************************
.* Submenu "Sortie de Mastermind" 
.*********************************************************
:h3 id='PANEL_MENUEXIT' res=410.Menuitem&colon. Sortie de Mastermind
:p.Ok, c'est trŠs difficile. Devinez &colon.-)
.*********************************************************
.* Menu "Aide" 
.*********************************************************
:h2 id='PANEL_MENUHELP' res=411.Menu&colon. Aide
:p.Si vous avez besoin d'aide aprŠs avoir d‚mar‚ Mastermind/2, vous pouvez choisir entre
:ul.
:li.
:link reftype=hd refid='PANEL_MENUGENERALHELP'.Aide g‚n‚rale...
:elink.
:li.
:link reftype=hd refid='PANEL_MENURULES'.RŠgles...
:elink.
:li.
:link reftype=hd res=415.Comment jouer...
:elink.
:li.
:link reftype=hd refid='PANEL_MENULICENSE'.License...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUABOUT'.· propos de...
:elink.
:eul.
.*********************************************************
.* Submenu "Aide G‚n‚rale" 
.*********************************************************
:h3 id='PANEL_MENUGENERALHELP' res=417.Menuitem&colon. Aide g‚n‚ral...
:p.Si vous n'etes pas certain quoi faire ou quel page d'aide est la bonne
:link reftype=hd refid='PANEL_WELCOME'.aide g‚n‚rale:elink..
Cette page est aussi visible si vous appuyez sur F1.
.*********************************************************
.* Submenu "RŠgles" 
.*********************************************************
:h3 id='PANEL_MENURULES' res=412.Menuitem&colon. RŠles...
:p. Cet item du menu ouvre la fenˆtre d'aide contenant les
:link reftype=hd refid='PANEL_RULES'.rŠgles de Mastermind/2:elink....
.*********************************************************
.* Submenu "Comment jouer" 
.*********************************************************
:h3 id='PANEL_MENUHOWTOPLAY' res=415.Menuitem&colon. Comment jouer
:p.Si vous s‚lectionnez l'item
:link reftype=hd res=402.aide pour jouer
:elink.(e.g. comment choisir vos couleurs etc.) sera montr‚.
.*********************************************************
.* Submenu "License" 
.*********************************************************
:h3 id='PANEL_MENULICENSE'.Menuitem&colon. License
:p.Selectionnez cet item pour voir
:link reftype=hd res=414.l'information sur la licence
:elink.de ce programme.
.*********************************************************
.* Submenu "A propos de" 
.*********************************************************
:h3 id='PANEL_MENUABOUT' res=413.Menuitem&colon. A propos de
:p.Vous ˆtes vous demander quel idiot a ‚cris ce grand jeu? &colon.-) Selectionner
:hp1.Aide / A propos de :ehp1.
et vous saurez (vous en surez
:link reftype=hd refid='PANEL_LICENSE'.si vous cliquez ici:elink.)!
.*********************************************************
.* License-information sur Mastermind/2 
.*********************************************************
:h1 id='PANEL_LICENSE' res=414.License
:p.Ce programme est "postcardware". Cela signifie:
si vous l'aimez et jouez avec , vous vous engagez … m'envoyer une carte postale. Ceci 
m'informera du nombre de personne qui l'utilise et m'encouragera … ‚laborer de nouvelles 
versions  - avec effet sonore, animations 3D,
niveau de difficult‚ - manette de jeu ...etc &colon.-)
:p.Et cela m'indiquera s'il y a des utilisateur de OS/2 qui aime les jeux &colon.-)
Peut-ˆtre aussi cela m'encouragera … d‚velopper d'autres applications (pour OS/2 bien 
sur). Vous pouvez distribuer ce programme librement et gratuitement (sauf pour les couts 
de distribution). Vous pouvez l'inclure dans une collection de programmes sur CD-ROM 
aprŠs avoir communiquer avec l'auteur. Pour obtenir votre
:hp1.:color fc='Red' bc='default'.license gratuite
:color fc='Default' bc='Default'.:ehp1.
write to:
:p.Ren‚ Auberger
.br
Breitensteiner Str. 11
.br
D-71032 B”blingen 
.br
Allemagne
:p.Si vous voulez utiliser le courrier ‚lectronique (pour licencier le logiciel, j'aime les cartes postale du monde entier): r.auberger@gmx.net, subjet: Mastermind/2.
.*********************************************************
.* Homepage de Mastermind/2 
.*********************************************************
:h1 id='PANEL_HOMEPAGE' res=420.Page web Mastermind/2
:p.:hp2.http&colon.//www.geocities.com/SiliconValley/Port/4718/:ehp2.
:p.C'est le URL de Mastermind/2 (attention il y a des lettres majuscules!).
Cette page contient:
:ul.
:li.nouvelle version de Mastermind/2
:li.tous les module de langue pr‚sentement disponible
:li.tout ce dont vous avez besoin si vous voulez traduire Mastermind/2 dans votre langue maternelle
:li.du moin une ancienne version de Mastermind/2 (pour cela ce sera bon)
:li.quelques liens utile si vous voulez d‚velopper un jeu ou si vous ˆtes un joueur (j'assume que vous en ˆtes un puisque vous avez t‚l‚charg‚ Mastermind/2)
:li.un livre d'amis: vous pouvez faire vos suggestion ici ou mˆme dire quelque chose … l'auteur ou autre utilisateurs (si vous d‚couvrez un bug S.V.P. ‚crivez moi directement … r.auberger@gmx.net avec comme sujet
:hp1.Mastermind/2:ehp1.).
:eul.
.* Vous pouvez inclure une note pour tous ceux qui ne parle pas l'anglais car cette page web est en anglais seulement et
.* que je n'ai aucun plan pour la faire dans une autre langue.
:euserdoc.

