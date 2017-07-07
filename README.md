Šablóna pre diplomové, bakalárske a iné práce v LaTeXu pre UPJŠ
===============================================================

`rn-thesis` je trieda pre tvorbu záverečných prác v LaTeXu v súlade so [smernicami UPJŠ](http://www.upjs.sk/pracoviska/univerzitna-kniznica/zaverecne-prace/).

Ako začať
=========
1.	[Stiahnite si ZIP súbor](https://github.com/novotnyr/rnthesis/archive/master.zip) so zdrojákmi a ukážkami.
2.	Vzorový súbor `dp.tex` predstavuje ukážku diplomovej práce, ktorú môžete použiť ako základ pre vlastnú záverečnú prácu.
3.	Uistite sa, že máte nastavené prostredie LaTeXu pre použitie UTF-8.


Ukážky
======
PDF súbory sú zostavené z príslušných súborov `.tex`.

*	[**`dp.pdf`**](https://github.com/novotnyr/rnthesis/blob/master/dp.pdf). Štandardná práca podľa Smernice rektora 1/2011 s dodatkami. Demonštruje diplomovú prácu s odporúčanými okrajmi, výzorom úvodnej strany podľa smernice, poďakovaním, miestom pre vloženie zadania z AiS2 a abstraktmi v slovenčine a angličtine.
*	[**`dp-min.pdf`**](https://github.com/novotnyr/rnthesis/blob/master/dp-min.pdf): minimalistická verzia práce. Definuje len názov, autora, označí prácu ako bakalársku, definuje pracovisko a oponenta. Predpokladá, že kapitoly sú definované pomocou `chapter`. Okraje sú ponechané podľa štandardov LaTeXu.
*	[**`dp-eng.pdf`**](https://github.com/novotnyr/rnthesis/blob/master/dp-eng.pdf): ukážka anglickej lokalizácie práce.

Minimalistická verzia
=====================

Šablóna dodržiava zvyklosti definované v základnej LaTeXovskej triede article. Minimalistická verzia vyzerá nasledovne:

	\documentclass{rnthesis}
	\usepackage[slovak]{babel}
	\usepackage[T1]{fontenc}
	\usepackage[utf8]{inputenc}

	\title{O diplomových prácach}
	\author{Bc. Milan Makrela}
	\typprace{bakalárska}
	\pracovisko{Ústav informatiky}
	\veduci{doc. RNDr. Jozef Mak, DrSc.}
	\rok{2010}

	\begin{document}
	\maketitle
	\newpage
	\chapter{Tradičný Lipsum}
	Lorem ipsum dolor sit amet.
	\end{document}

Následne prekompilovať pomocou

	latex nazovsuboru.tex

Príkazy a nastavenia
====================

Šablóna podporuje množstvo príkazov, ktoré prispôsobujú vzhľad. Podrobnosti nájdete v [zozname príkazov vo Wiki](https://github.com/novotnyr/rnthesis/wiki/Mo%C5%BEnosti-triedy-a-zoznam-pr%C3%ADkazov).


Dokumentácia
============
Jadro dokumentácie je vo [zozname príkazov vo Wiki](https://github.com/novotnyr/rnthesis/wiki/).

Ďalšie štýly
------------

*	Štýl `rnt-thm` uľahčuje písanie definícií, viet, dôkazov. Podrobnosti nájdete vo [Wiki](https://github.com/novotnyr/rnthesis/wiki/rnt-thm.sty:-%C5%A1t%C3%BDl-pre-vety,-defin%C3%ADcie-a-d%C3%B4kazy).
*	Štýl `rnt-pic` uľahčuje vkladanie obrázkov (Podrobnosti nájdete vo [Wiki](https://github.com/novotnyr/rnthesis/wiki/rnt-pic.sty:-%C5%A1t%C3%BDl-pre-jednoduch%C3%A9-vkladanie-obr%C3%A1zkov).

Prispôsobenie pre iné univerzity
--------------------------------

Šablóna podporuje prispôsobenie textov pre iné univerzity či dokonca iné jazyky.

Podrobnosti nájdete v stati [o preddefinovaných textoch vo Wiki](https://github.com/novotnyr/rnthesis/wiki/Preddefinovan%C3%A9-texty).

Prispôsobenie pre iné jazyky
----------------------------

Šablóna je štandardne napísaná pre podporu slovenčiny a angličtiny. Implicitný režim je slovenský, ale ak v deklarácii triedy použijete globálnu možnosť english v kombinácii s anglickou verziou balíčka `babel`, získate plnoprávnu anglickú modifikáciu.

	\documentclass[english]{rnthesis}
	\usepackage{babel}

Podrobnosti nájdete v stati [o preddefinovaných textoch vo Wiki](https://github.com/novotnyr/rnthesis/wiki/Preddefinovan%C3%A9-texty).

FAQ
===
FAQ sa nachádza [vo Wiki](https://github.com/novotnyr/rnthesis/wiki/FAQ:-%C4%8Casto-kladen%C3%A9-ot%C3%A1zky).
