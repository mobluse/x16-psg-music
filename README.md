# Commander X16 PSG Music
Music programs for Commander X16 using it's PSG in Vera.

## Programmable Sound Generator (PSG)
https://github.com/commanderx16/x16-docs/blob/master/VERA%20Programmer%27s%20Reference.md#programmable-sound-generator-psg

## Example: Frere Gustav
The example Frere Gustav is modified from Sinclair ZX Spectrum BASIC Programming by Steven Vickers:
https://worldofspectrum.org/ZXBasicManual/zxmanchap19.html. It's played with minor coords.

Command line to run using x16emu:  
`x16emu -bas FRERE-GUSTAV.BAS -run`  
x16emu for Windows, Linux, and macOS can be downloaded from https://www.commanderx16.com/
I most often run x16emu in Raspberry Pi OS Linux on Raspberry Pi 4 B 8GB, but then you need to get it from https://snapcraft.io/x16emu, or compile it
from [source](https://github.com/commanderx16/).

## Example: DECPS Player - VT520/VT525 Play Sound Simulator
This simulates the DECPS escape sequence using BASIC v2 DATA statements.

Command line to run using x16emu:  
`x16emu -bas DECPS.BAS -run`  

## Basicode-3 and 3C
The subroutine in [FRERE-GUSTAV.BAS](FRERE-GUSTAV.BAS) and [DECPS.BAS](DECPS.BAS) is compatible with Basicode-3 and 3C, but has extra entry 
line numbers for polyphonic music:
https://github.com/robhagemans/basicode/blob/master/BASICODE.rst#gosub-400

## Other X16 PSG Examples
https://commander-cx16.fandom.com/wiki/Beep
