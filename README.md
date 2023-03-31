# Virtue Da Dirty Soul intro

An intro for **'Virtue Da Dirty Soul'** ZX-Spectrum game by Green Bit Group.

[![virtue-da-dirty-soul on zxart.ee](virtue_intro_screenshot(crt_filtered).png)](https://zxart.ee/rus/soft/game/adventure/textillustrated/virtue-da-dirty-soul/virtue-da-dirty-soul/)

## TLDR

These sources are for Zilog Z80 Assembler in Alasm format. You should import and compile this source in
[Alasm](https://zxart.ee/rus/soft/tool/music/pro-tracker-alasm/qid:365628/) ZX-Spectrum assembler
[(I have used v5.08)](https://speccy.info/ALASM) to compile. Or convert this source manually for 
[SjASMPlus](http://speccy.info/SjASMPlus) which is cross-platform.

## Technical info

This intro was written by an hour or so with 
'[software giga-screen](https://en.wikipedia.org/wiki/ZX_Spectrum_graphic_modes)' ZX-Spectrum effect usage, 25fps colour
blinking that allows you to mix colour palette.

## Story

A short intro which was based on C-jeff's (now [Seajeff](https://seajeff.com/)'s) ideas then. Made specially for final
version of the game which was totally repacked and re-linked. I had to clear system variables and other useless data
from the game code block, so I run this game over 100 times those night. As the result I still remember every note from 
the music... Anyway 18 years later I like this co-work, this prod looks good and fun enough.

## Credits

```
                  j._
     g.r.e.e.n b.I.`#$\r.o.u.p                 _.
   ..............`?$$@$#Ob,._......._.,dO#$Z$$b'.............
   ::::::::::::::::`?b\._`?$?:$S@$$Ob, :b\._d?'::::::::::::::
   ::::::::::::::::::'?z$$P'.S$$:::_.?$:?$S$'::::::::::::::::
   :::::::::::::::::::`$#$.:::'?#$S$?P'::`$#.::::::::::cjf:::
   :::::::::::::::::::.J$?'::::::::::::::.?$P::::::::::::::::
                  _.do$S?'          _.zoS$P' .2.o.o.3.
```

- mini-intro coded by **Alx/Brainwave** (Alexander Bazhenov) [[speccywiki](https://speccy.info/Alx) |
[zxart.ee](https://zxart.ee/rus/avtory/a/alx/qid:602008/)].
- mini-intro logo and music, game programming by **C-jeff/Green Bit Group** (C-jeff/Brainwave then 
[Seajeff](https://seajeff.com/), Dmitry Zhemkov) [[speccywiki](https://speccy.info/C-jeff) | 
[zxart.ee](https://zxart.ee/rus/avtory/c/c-jeff/qid:602010/)].
- game graphics *(game sources not included in this repository)* by **Dimidrol/Green Bit Group** (Dmitry Bakhtin)
[[speccywiki](https://speccy.info/Dimidrol) | [zxart.ee](https://zxart.ee/rus/avtory/d/dimidrol/qid:602007/)].

## Project content
```
.
├── Crazzy.f.bin                                - intro font
├── intro.asm                                   - intro sources
├── LICENSE                                     - license file
├── logoatr1.C.bin                              - 1st screen intro logo attributes
├── logoatr2.C.bin                              - 2nd screen intro logo attributes
├── logo.C.bin                                  - intro logo graphics
├── PICTURE.C.bin                               - loading 6912b game screen in columns format
├── README.md                                   - this file
├── starasci.t.bin                              - ascii
├── star_mu1.C.bin                              - intro music
└── virtue_intro_screenshot(crt_filtered).png   - screenshot of the erliest version of intro
```

## Related

- [**worldofspectrum.org**](https://worldofspectrum.org/archive/software/text-adventures/virtue-da-dirty-soul-green-bit)
- [**zxart.ee**](https://zxart.ee/rus/soft/game/adventure/textillustrated/virtue-da-dirty-soul/virtue-da-dirty-soul/)
- [**spectrumcomputing.co.uk**](https://spectrumcomputing.co.uk/index.php?cat=96&id=20747&__cf_chl_managed_tk__=pmd_X.cN3TQMHuk5Uln9ps4acrwdieQspYRax9aYF47gAYg-1632442789-0-gqNtZGzNAxCjcnBszRI9)

## About

- [**Green Bit Group on speccywiki**](https://speccy.info/Green_Bit_Group)
- [**brainwave on speccywiki**](http://speccy.info/Brainwave)
- [**brainwave on wikipedia**](https://ru.wikipedia.org/wiki/Brainwave_team)

