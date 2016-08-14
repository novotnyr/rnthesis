O produkte
==========

`rn-thesis` je trieda pre tvorbu záverečných prác v LaTeXu v súlade so [smernicami UPJŠ](http://www.upjs.sk/pracoviska/univerzitna-kniznica/zaverecne-prace/).

Ako začať
=========

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

Rozširujúce príkazy
====================

Šablóna podporuje množstvo príkazov, ktoré prispôsobujú vzhľad. Podrobnosti nájdete v [zozname príkazov vo Wiki](https://github.com/novotnyr/rnthesis/wiki/Mo%C5%BEnosti-triedy-a-zoznam-pr%C3%ADkazov).

Ďalšie štýly
============

*	Štýl `rnt-thm` uľahčuje písanie definícií, viet, dôkazov. Podrobnosti nájdete vo [Wiki](https://github.com/novotnyr/rnthesis/wiki/rnt-thm.sty:-%C5%A1t%C3%BDl-pre-vety,-defin%C3%ADcie-a-d%C3%B4kazy).
*	Štýl `rnt-pic` uľahčuje vkladanie obrázkov (Podrobnosti nájdete vo [Wiki](https://github.com/novotnyr/rnthesis/wiki/rnt-thm.sty:-%C5%A1t%C3%BDl-pre-vety,-defin%C3%ADcie-a-d%C3%B4kazy).

Prispôsobenie pre iné univerzity
================================

Šablóna podporuje prispôsobenie textov pre iné univerzity či dokonca iné jazyky.

Podrobnosti nájdete v stati [o preddefinovaných textoch vo Wiki](#).

Prispôsobenie pre iné jazyky
=============================

Šablóna je štandardne napísaná pre podporu slovenčiny a angličtiny. Implicitný režim je slovenský, ale ak v deklarácii triedy použijete globálnu možnosť english v kombinácii s anglickou verziou balíčka babel, získate plnoprávnu anglickú modifikáciu.

	\documentclass[english]{rnthesis}
	\usepackage{babel}

Podrobnosti nájdete v stati [o preddefinovaných textoch vo Wiki](#).

FAQ
===
FAQ sa nachádza [vo Wiki](https://github.com/novotnyr/rnthesis/wiki/FAQ:-%C4%8Casto-kladen%C3%A9-ot%C3%A1zky).
