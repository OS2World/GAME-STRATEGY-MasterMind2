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
:title.Mastermind/2 - User's guide
:docprof  toc=123456
ctrlarea=coverpage.
.*********************************************************
.* First page
.*********************************************************
:h1 id='PANEL_WELCOME' res=400.Welcome to Mastermind/2
:artwork align=center name='F:\Projekte\Mastermind\logo.bmp'.
This book features the following:
:ul.
:li.
:link reftype=hd refid='PANEL_RULES'.Rules of Mastermind/2
:elink.
:li.
:link reftype=hd refid='PANEL_HOWTOPLAY'.How to play
:elink.
:li.
:link reftype=hd refid='PANEL_MENUS'.What do the menus do?
:elink.
:li.
:link reftype=hd refid='PANEL_LICENSE'.License
:elink.
:li.
:link reftype=hd refid='PANEL_HOMEPAGE'.Homepage of Mastermind/2
:elink.
:eul.
.*********************************************************
.* Rules of Mastermind 
.*********************************************************
:h1 id='PANEL_RULES' res=401.Rules
:p.:hp2.Object of the game:
:ehp2.
:p.That's quite easy - just guess the colors your opponent (in this case your
computer) has chosen.
:p.:hp2.How to reach the goal:
:ehp2.
:p.Each time you guessed four colors (and you think that this must be the colors
your opponent has chosen) you tell him. Now he compares yours and his and gives
you some hints for your next try - ok, or he tells you that you guessed them.
For each colored pin that you put in the right place with the right color you
get a white signal-pin. For each colored pin that you opponent has used too, but
in another place, he gives you a black pin.
.br
The signal-pins aren't assigned to any of your colored pins, of course. That's
your job to figure out which of your colors is totally wrong (they don't get any
signal-pins), which have the right color but are in the wrong place and which
you guessed absolutely right.
:p.:hp2.Need an example? Here is one:
:ehp2.
:p.These are the colors you have to guess - you won't see them until you guessed
them, ok? This is an
:hp1.example :ehp1.
;-)
:p.:artwork  align=center name='F:\Projekte\Mastermind\guess.BMP'.
:p.Now you guess the following:
:p.:artwork  align=center name='F:\Projekte\Mastermind\guessed.BMP'.
:p.The red one is totally wrong, as well as the green one. Cyan is one of the
colors you have to guess, but you  put it in the wrong place (black signal-pin)
and pink was absolutely right (white signal-pin). So the hints you will be given
will be:
:p.:artwork  align=center name='F:\Projekte\Mastermind\hints01.BMP'.
:p.Perhaps your game took the following way:
:p.:artwork  align=center name='F:\Projekte\Mastermind\game.BMP'.
:p.That means you guessed the colors in the fifth try. Not too bad, but not the
only thing you should take care of. You should try to guess the colors in the
shortest time that's possible.
:p.:artwork  align=center name='F:\Projekte\Mastermind\time.BMP'.
:p.The ten best players can enter their names in the highscores. If two or more
needed the same number of tries the time it took them will decide who's getting
the higher rank.
.*********************************************************
.* How to play Mastermind/2 
.*********************************************************
:h1 id='PANEL_HOWTOPLAY' res=402.How to play
:p.:hp2.How do I tell the computer which color I want to put in which place?:ehp2.
:p.That's easy: drag them from the area called "available colors" and drop them on
the place you want to put them.
:p.:artwork  align=center name='F:\Projekte\Mastermind\availabl.BMP'.
:p.Drop them on the marks:
:p.:artwork  align=center name='F:\Projekte\Mastermind\marks.BMP'.
:p.To assist you - it's not always easy to say if the round mouse pointer really targets on
one of the marks - the position is highlighted if you can drop a color. In the following
example the red pin is already droppped and now the blue (=mousepointer) is dragged over
the third mark in the first row:
:p.:artwork  align=center name='F:\Projekte\Mastermind\drop.BMP'.
:p.After selecting a color you can change it by simply dropping another color over
it on the same mark. If you decide to move a color that you have already dropped to another
position just drag it from it's old to it's new position.
:p.:hp2.How do I tell the computer to use the colors I just guessed as my try?:ehp2.
:p.If you selected four colors and want to use them as your
try press the pushbutton that says '... try' (where ... means the actual number
of your try):
:p.:artwork  align=center name='F:\Projekte\Mastermind\button.BMP'.
:p.That's all. If you were good enough you can enter your name in the
:link reftype=hd refid='PANEL_MENUHIGHSCORE'.highscores:elink..
.*********************************************************
.* Help for the menus 
.*********************************************************
:h1 id='PANEL_MENUS' res=403.Menus
:p.There are two main menu items, containing the following submenus:
:ul.
:li.
:link reftype=hd refid='PANEL_MENUMASTERMIND'.Mastermind
:elink.
:ul.
:li.
:link reftype=hd refid='PANEL_MENUSTART'.Start new game
:elink.
:li.
:link reftype=hd refid='PANEL_MENUPAUSE'.Pause game
:elink.
:li.
:link reftype=hd refid='PANEL_MENUCANCEL'.Cancel game
:elink.
:li.
:link reftype=hd refid='PANEL_MENUHIGHSCORE'.Highscore ...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUMULTIPLE'.Multiple colors
:elink.
:li.
:link reftype=hd refid='PANEL_MENULANGUAGE'.Language
:elink.
:li.
:link reftype=hd refid='PANEL_MENUPINS'.Select pins to use...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUEXIT'.Exit Mastermind
:elink.
:eul.
:li.
:link reftype=hd refid='PANEL_MENUHELP'.Help
:elink.
:ul.
:li.
:link reftype=hd refid='PANEL_MENUGENERALHELP'.General help...
:elink.
:li.
:link reftype=hd refid='PANEL_MENURULES'.Rules...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUHOWTOPLAY'.How to play...
:elink.
:li.
:link reftype=hd refid='PANEL_MENULICENSE'.License...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUABOUT'.About...
:elink.
:eul.
:eul.
.*********************************************************
.* Menu "Mastermind/2" 
.*********************************************************
:h2 id='PANEL_MENUMASTERMIND' res=404.Menu&colon. Mastermind
:p.This menu lets you make some selections for the game in general or for the
actual game:
:ul.
:li.
:link reftype=hd refid='PANEL_MENUSTART'.Start new game
:elink.
:li.
:link reftype=hd refid='PANEL_MENUPAUSE'.Pause game
:elink.
:li.
:link reftype=hd refid='PANEL_MENUCANCEL'.Cancel game
:elink.
:li.
:link reftype=hd refid='PANEL_MENUHIGHSCORE'.Highscore ...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUMULTIPLE'.Multiple colors
:elink.
:li.
:link reftype=hd refid='PANEL_MENULANGUAGE'.Language
:elink.
:li.
:link reftype=hd refid='PANEL_MENUPINS'.Select pins to use...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUEXIT'.Exit Mastermind
:elink.
:eul.
.*********************************************************
.* Submenu "Start new game" 
.*********************************************************
:h3 id='PANEL_MENUSTART' res=405.Menuitem&colon. Start new game
:p.This item is always selectable. You can start new games here. If another game is
already running it will be canceled after you agreed.
.*********************************************************
.* Submenu "Pause game" 
.*********************************************************
:p.:h3 id='PANEL_MENUPAUSE' res=406.Menuitem&colon. Pause game
:p.If a game is running you can pause it. All of your guessed colors and all
signal-pins will be hidden until you unpause the game. If a game is paused, the
menu item changes to :hp1.Unpause game:ehp1..
:p.You can continue a paused game by selecting the now
:hp1.Unpause game :ehp1.
called item. All of your guesses and all signal-pins are shown. The menu item
changes its name back to pause game.
:p.You may pause a game as often as you like (without any effects for a possible
entry in the highscores).
:note.Another way to pause or unpause the game is pressing the pause-key on you keyboard.
this has exactely the same effect as selecting the menuitem.
.*********************************************************
.* Submenu "Cancel game" 
.*********************************************************
:h3 id='PANEL_MENUCANCEL' res=407.Menuitem&colon. Cancel game
:p.You're fed up with the currently running game? You think you will never guess
the colors? Ok, select
:hp1.Cancel game :ehp1.
and the game is over. Now you can see how close you were because the computer
will show you the colors you had to guess.
:note.If you want to cancel your game, you can also press ESC on your keyboard. This does
the same as selecting the menuitem.
.*********************************************************
.* Submenu "Highscore..." 
.*********************************************************
:h3 id='PANEL_MENUHIGHSCORE' res=408.Menuitem&colon. Highscore...
:p.If you are interested in how good you must be to enter the hall of fame, take a
look at it by choosing :hp1.Highscore:ehp1..
:p.The ten best players can enter their names in the highscores. If two or more needed
the same number of tries the time it took them will decide who's getting the higher rank.
.*********************************************************
.* Submenu "Multiple colors" 
.*********************************************************
:h3 id='PANEL_MENUMULTIPLE' res=409.Menuitem&colon. Multiple colors
:p.For all of you who like it simple: uncheck this menu item and the colors you
have to guess will all be different. That's a little bit more easy than having
:hp1.multiple colors:ehp1. to choose.
:p.If you have switched off multiple colors you can drop a color only once into the row where you
are guessing. After dropping a color for the second time the first pin of this color will
be erased again. If you could not follow to my confuse explanation try it out by doing the following:
:ol.
:li.deselect :hp1.multiple colors:ehp1.
:li.start a new game
:li.drag for example the red pin from the field "available colors" and drop it into the "drop your
colors here" field
:li.do the same again but drop the pin at another position
:li.the first red pin will disappear
:eol.
:p.The default setting is :hp1.multiple colors:ehp1. turned on (but if you change it your selection
will be remembered at the next start of the game). There is no remark
within the highscores that says if you guessed
multiple or only single colors (perhaps in a future version, if
:link reftype=hd refid='PANEL_LICENSE'.anyone plays this game
:elink.at all).
.*********************************************************
.* Submenu "Language" 
.*********************************************************
:h3 id='PANEL_MENULANGUAGE' res=418.Menuitem&colon. Language
:p.After starting Mastermind/2 the program looks for language modules that are
available on your computer (you have downloaded them before from the
:link reftype=hd refid='PANEL_HOMEPAGE'.Mastermind/2 Homepage:elink.). In this submenu 
a menuitem for each language that can be found will be created so that you have
the choice of which language you would like to use. You can switch this during the
runtime of the program and do not need to restart it!
:p.This (and all other settings in Mastermind/2) is saved if you close the game and
reloaded if you start it the next time.
:p.Just for info: the language modules are dynamic link libraries (DLL) that are
named mmindxx.dll. With xx standing for the language-code, e.g. de = deutsch (that's how
german is called in german) or en = english.
.*********************************************************
.* Submenu "Select pins to use" 
.*********************************************************
:h3 id='PANEL_MENUPINS' res=419.Menuitem&colon. Select pins to use...
:p.If you dislike the standard-colors you now have the ability to change them. Select the
menuitem :hp1.Select pins to use...:ehp1. and this dialog shows up:
:p.:artwork  align=center name='F:\Projekte\Mastermind\selctpin.BMP'.
:p.Now choose the :hp1.six:ehp1. pins that are your favourite. If you select less than six
you cannot press the OK-button, if you already have selected six all other checkboxes are
greyed out so that you will not be able to select more than six. You first need to deselect at
least one to enable all checkboxes again. I hope that I have helped all people who have problems
in seeing colors.
:p.As with all settings you make the set of pins you select is saved and restored at the next program
start. This makes it very easy for you: select your favourite pins one time and you will have
them always (or at least until you change this set again in this dialog).
:p.:note.You :hp1.are able:ehp1. to change the set of pins during a running game. But unless you
explecitely pause the game your time will go on counting while you choose your pins. And if you 
change the set of pins while a game is running maybe all colors "change" because they may get a
new position in the array of colors. This can be confusing as you can see from the changes in the
pictures below&colon.
:p.:artwork runin align=left name='F:\projekte\mastermind\chngco00.bmp'.
:artwork runin align=right name='F:\projekte\mastermind\chngco01.bmp'.
:artwork runin align=right name='F:\projekte\mastermind\chngco04.bmp'.
:p.Now we just switch off red and yellow and switch on darkred and black&colon.
:p.:artwork runin align=left name='F:\projekte\mastermind\chngco02.bmp'.
:artwork runin align=right name='F:\projekte\mastermind\chngco03.bmp'.
:artwork runin align=right name='F:\projekte\mastermind\chngco05.bmp'.
.*********************************************************
.* Submenu "Exit Mastermind" 
.*********************************************************
:h3 id='PANEL_MENUEXIT' res=410.Menuitem&colon. Exit Mastermind
:p.Ok, that's a hard one. Guess it for yourself &colon.-)
.*********************************************************
.* Menu "Help" 
.*********************************************************
:h2 id='PANEL_MENUHELP' res=411.Menu&colon. Help
:p.If you need any help after starting Mastermind/2, you can choose between
:ul.
:li.
:link reftype=hd refid='PANEL_MENUGENERALHELP'.General help...
:elink.
:li.
:link reftype=hd refid='PANEL_MENURULES'.Rules...
:elink.
:li.
:link reftype=hd res=415.How to play...
:elink.
:li.
:link reftype=hd refid='PANEL_MENULICENSE'.License...
:elink.
:li.
:link reftype=hd refid='PANEL_MENUABOUT'.About...
:elink.
:eul.
.*********************************************************
.* Submenu "General Help" 
.*********************************************************
:h3 id='PANEL_MENUGENERALHELP' res=417.Menuitem&colon. General help...
:p.If you are unsure what to do or which help-page is right for you use
:link reftype=hd refid='PANEL_WELCOME'.general help:elink..
This page is also diplayed if you press F1 while no menuitem is selected.
.*********************************************************
.* Submenu "Rules" 
.*********************************************************
:h3 id='PANEL_MENURULES' res=412.Menuitem&colon. Rules...
:p.This menu item opens up a help window containing the
:link reftype=hd refid='PANEL_RULES'.rules of Mastermind/2:elink..
.*********************************************************
.* Submenu "How to play" 
.*********************************************************
:h3 id='PANEL_MENUHOWTOPLAY' res=415.Menuitem&colon. How to play
:p.If you select this menuitem the
:link reftype=hd res=402.help for playing the game
:elink.(e.g. how to choose your colors etc.) will be displayed.
.*********************************************************
.* Submenu "License" 
.*********************************************************
:h3 id='PANEL_MENULICENSE'.Menuitem&colon. License
:p.Select this menuitem to display the
:link reftype=hd res=414.license information
:elink.for the program.
.*********************************************************
.* Submenu "About" 
.*********************************************************
:h3 id='PANEL_MENUABOUT' res=413.Menuitem&colon. About
:p.Have you ever wondered which crazy guy wrote this great game? &colon.-) Select
:hp1.Help / About :ehp1.
and you will know (you will know even
:link reftype=hd refid='PANEL_LICENSE'.more if you klick here:elink.)!
.*********************************************************
.* License-information for Mastermind/2 
.*********************************************************
:h1 id='PANEL_LICENSE' res=414.License
:p.This program is postcardware. That means:
if you like it and play it you are engaged to send a picture postcard to the
author. This will inform me of how many people use it and if it is worth to do
some future versions  - which may contain sounds, real-time 3D animations,
support of force-feedback joysticks etc &colon.-)
:p.And it will show me if there are some OS/2ers out there who play games &colon.-)
Perhaps it will also drive me to develop some more programs (for OS/2 of
course). You may distribute this program freely and are not allowed to charge for
it (except the costs you have for distribution). You are welcome to put it on
CD-ROM collections etc after contacting the author. To get your
:hp1.:color fc='Red' bc='default'.free license
:color fc='Default' bc='Default'.:ehp1.
write to:
:p.Ren‚ Auberger
.br
Breitensteiner Str. 11
.br
D-71032 B”blingen 
.br
Germany
:p.If you want to use e-mail instead (not for registering please, I like picture
postcards from all over the world): r.auberger@gmx.net, subject: Mastermind/2.
.*********************************************************
.* Homepage of Mastermind/2 
.*********************************************************
:h1 id='PANEL_HOMEPAGE' res=420.Homepage of Mastermind/2
:p.:hp2.http&colon.//www.geocities.com/SiliconValley/Port/4718/:ehp2.
:p.This is the URL of the Mastermind/2 Homepage (please note that there are capital letters!).
This page contains:
:ul.
:li.new versions of Mastermind/2
:li.all language modules currently available
:li.everything you need if you would like to translate Mastermind/2 into your
native language
:li.at least one old version of Mastermind/2 (for whatever this will be good)
:li.some links that may be useful to you if want to develop games or if you are
a gamer (I assume that you are at least the last since you downloaded Mastermind/2)
:li.a guestbook: you may make suggestions here or even tell something to the author or other
users (for a bug-report please write an email directly to r.auberger@gmx.net with the subject
containing :hp1.Mastermind/2:ehp1.).
:eul.
.* You may include a note for all who do not speak english that this webpage is only
.* in english available and I do not think that I will provide another language version
:euserdoc.
