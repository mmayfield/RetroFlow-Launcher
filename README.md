I hope to create a toggle option for whether you want to launch playstation games with adrenaline or retroarch. I prefer to use retroarch for retroachievements and I found many games run in retroarch that will not in adrenaline due to the lack of the popsloader firmware selections. 
In addition I would like to add a category for the built in Vita apps so that everything can be accessed from Retroflow, autobooting it and not needing to touch the bubble gui. I'd also like to add the ability to split Homebrew between apps and games and just add custom categories in general. I'm thinking I can pull from https://github.com/BlackSheepBoy69/HexFlow-Launcher-Unofficial-Custom, the custom category but make it so you can drop any customname.dat in the folder and have it added automatically, though requiring you to use overrides to put things in it. I haven't looked at the code thouroughly yet so this is just initial thoughts. Original readme for RetroFlow follows:



# RetroFlow-Launcher
[![](https://github.com/jimbob4000/RetroFlow-Launcher/raw/main/Media/main_screen.png "main_screen")](https://github.com/jimbob4000/RetroFlow-Launcher/blob/main/Media/main_screen.png)

**Project archived:** RetroFlow is no longer in active development.

# About
This is a modded version of [HexFlow Launcher](https://github.com/VitaHEX-Games/HexFlow-Launcher); a 3d coverflow like launcher for PS Vita.

This version includes categories for retro games which can be launched without bubbles for RetroArch and DaedalusX64.
Playstation and PSP games can also be launched without having to create bubbles for every game!

This version also has categories for favorites and recently played games.

Display and launch your retro games and homebrews in style.  
**RetroFlow Launcher** features a 3d user interface to display your games with their box art and supports many customization options like custom covers and backgrounds.

Launching a game or app from **RetroFlow Launcher** will close the launcher automaticaly without asking.


### Supported systems:
PS Vita, PSP, Playstation, Nintendo 64, Super Nintendo, Nintendo Entertainment System, Game Boy Advance, Game Boy Color, Game Boy, Sega CD, Sega 32X, Sega Mega Drive / Genesis, Sega Master System, Sega Game Gear, PC Engine, PC Engine CD, TurboGrafx-16, TurboGrafx-CD, Commodore Amiga, Commodore 64, WonderSwan, WonderSwan Color, MSX, MSX2, ZX Spectrum, Atari Lynx, Atari 600, Atari 5200, Atari 7800, ColecoVision, Vectrex, FBA 2012, MAME 2003 Plus, MAME 2000, Neo Geo (FBA 2012) and Neo Geo Pocket Color.


[DaedalusX64](https://github.com/Rinnegatamante/DaedalusX64-vitaGL/releases) is required for N64 games. [RetroArch](https://www.retroarch.com/index.php?page=platforms) is required for other retro systems. [Adrenaline](https://github.com/TheOfficialFloW/Adrenaline) is required for Playstation and PSP games.




# Installation

### 1. Install the RetroFlow VPK's.

Install the [latest version of RetroFlow](https://github.com/jimbob4000/RetroFlow-Launcher/releases) and additional RetroFlow Adrenaline launcher VPK from [here](https://github.com/jimbob4000/RetroFlow-Launcher/releases).

'RetroFlow Launcher' is the app you will use to browse games. 'RetroFlow Adrenaline launcher' is needed for launching Playstation and PSP games.

### 2. Rename your PSP games using the steps below.

Renaming is needed for cover matching. RetroFlow will look for a title ID in the filename.

#### Windows users:

Please rename PSP ISO and CSO files using Leecherman's [PSP ISO Renamer tool](https://sites.google.com/site/theleecherman/PSPISORenamer) using the following parameters:

    %NAME% (%REGION%) [%ID%]

The result should look like this (please notice the square brackets):

    Cars 2 (US) [UCUS-98766].iso

Games can also be named with just the title ID like so: "UCUS98766.iso" but this isn't recommended.

#### Mac users:
See the FAQ's section for a guide on [renaming on a mac](https://github.com/jimbob4000/RetroFlow-Launcher#im-on-a-mac-how-do-i-rename-psp-games).


More information on PSP and Playstation after the FAQ's section.


### 3. Check your PS1 and PSP are in the right folders

PS1 and PSP games with eboot files should be saved here:

    ux0:pspemu/PSP/GAME/


PSP ISO and CSO games should be saved here: 

    ux0:pspemu/ISO/

uma0 can also be used.

### 4. Add your retro games to RetroFlow

Launch RetroFlow for the first time, RetroFlow will create the folders where you can save your games.

Once it's finshed loading; close RetroFlow and copy your favourite retro games into the relevant subfolders below:

    ux0:/data/RetroFlow/ROMS/

For PC Engine CD and TurboGrafx-CD RetroFlow will look for '.cue' files for these CD systems. Please make sure all the games are loose with the system's rom folder with .cue files.

**Tip:**
It's important that your roms are named using the no-intro file naming convention, e.g. "Game Name (USA)" , otherwise cover images won't be found.


### 5. Download covers & backgrounds

To download cover images, press start, then choose which covers or backgrounds you would like to download. 


# Issues loading games with Adrenaline?

Please try installing [AdrBubbleBooterInstaller](https://vitadb.rinnegatamante.it/#/info/307).
Or try installing [Adrenaline Bubble Manager](https://github.com/ONElua/AdrenalineBubbleManager/releases) to check bubbles load okay.


# Possible incompatabilities

### Repatch
Potential issue with repatch / repatch_4 plugins in the tai config. May cause the Vita to shutdown. Try disabling these if you encounter an issue.

### PSP Categories lite
Unsupported, if you're experiencing please try without the plugin.

# RetroFlow FAQ's

### I'm on a Mac, how do I rename PSP games?
You can use the [UMD FileRenamer app here](https://github.com/BrosMakingSoftware/UMD_FileRenamer/releases/tag/v1.0).

Step 1. Download the UMD FileRenamer app above
Open the 'UMD_FileRenamer-1.0.jar' file and select your folder of games, then rename.

Step 2. Replace (parenthesis) with [brackets]
In the finder, select all the games, right click and select 'rename items'.
Replace the opening and closing parenthesis with square brackets instead.

    Name (XXXX-XXXXX).iso

Will be renamed to:

    Name [XXXX-XXXXX].iso

The game names will be missing the region code, but it's not required for the RetroFlow to work.


### Can I use HexFlow too?
Yes; RetroFlow is seperate, it uses different folders and a different title ID.

### Do I need to create bubbles for games?
No; RetroFlow doesn't need bubbles for games.

### How should I name my games so covers are found?
It's recommended that your roms are named using the no-intro file naming convention, e.g. "Game Name (USA)" , these names are used to match with cover images.

### Some systems aren't showing?
Empty collections are hidden by default, once you add some games into the roms folder, they will appear.

### Can I change the Mega Drive name to Genesis?
Sure; changing your language to 'English - American' will change the 'Mega Drive' name and logo to 'Genesis'.

### Can I change a core for RetroArch?
The cores have been set by system and cannot be changed on a game-by-game basis at the moment.

To change the core for an entire system, search for "Retroarch Cores" in the file below and edit the core file names accordingly. 

    ux0:/app/RETROFLOW/index.lua

The RetroArch core files can be found here: "ux0:/app/RETROVITA/"



### Can I change the rom folder locations?
No, sorry.


# Adding PSP and Playstation games

RetroFlow uses the game ID's for Playstation and PSP for cover matching.
Please use the guides below.

## PSP
For PSP ISO and CSO files please rename using Leecherman's [PSP ISO Renamer tool](https://sites.google.com/site/theleecherman/PSPISORenamer) using the following parameters:

    %NAME% (%REGION%) [%ID%]

The result should look like this:

    Cars 2 (US) [UCUS-98766].iso

RetroFlow uses the ID to match artwork, and tidies the rest of the filename to display in the app.
CSO files are also supported, and should be named as above.

## Playstation
For PSX2PSP, game folder name must match with the GameID. For example:

    ux0:pspemu/PSP/GAME/**SLES01234**

Games will need to be in a EBOOT format, see here for information on [how to convert PSX Disc Images to EBOOT for PSP](https://www.cfwaifu.com/psx2psp/).
RetroFlow also uses the ID to lookup the name of the game.



# Custom Game Covers & Game Backgrounds

Place your custom covers in the game system's here "_ux0:/data/RetroFlow/COVERS/_"

Place your custom game backgrounds in the game system's here "_ux0:/data/RetroFlow/BACKGROUNDS/_"

Cover and background images must be in **png** format. For Vita, PSP, PSX games and Homebrew the The cover image file name must match the **Game ID** or the **Game Name** of each app. For roms the cover image name should match the **Rom Name** i.e. "Game Name (USA).png". The recommended resolution for Vita covers is 250x320px. [Sample image](https://live.staticflickr.com/7176/6885249717_738e8ee187_n.jpg)

### Download Covers and Backgrounds

Covers and game backgrounds can be downloaded automatically from the artwork section of the settings menu (Start button). You can also download covers manually from the link below. A big thanks to **astuermer** for his contribution.

[https://github.com/andiweli/hexflow-covers](https://github.com/andiweli/hexflow-covers)

### Custom Backgrounds

Place your image in "_ux0:/data/RetroFlow/WALLPAPER_" (recomended resolution 1280x720px or less). Some custom backgrounds are available [HERE](https://github.com/andiweli/hexflow-covers/tree/main/Backgrounds)
You can change your background within the app by going to the settings menu > theme > custom background.

### Custom Music

Place your **Music.mp3** file in "_ux0:data/RetroFlow/_" (music will play automatically when the "Sounds" option is enabled)

## AutoBoot

If you want to auto-launch **RetroFlow Launcher** every time your PS Vita boots up you can use the [**AutoBoot**](https://vitadb.rinnegatamante.it/#/info/261) plugin by Rinnegatamante.

## Controls

Navigate your library using the **DPad** or the **Left Stick** or with the **Touch Screen**.

**DPad Up**: Skip to favorites category

**R/L triggers**: Skip 5 items

**Cross**: Select/Launch game/app

**Square**: Change Category

**Triangle**: Game Details/Add or remove favorites

**Circle**: Change View/Cancel

**Start**: Settings menu

**Select**: Search



# Credits

Original [HexFlow](https://github.com/VitaHEX-Games/HexFlow-Launcher) app by : **VitaHex Games**

Programming/UI: **Sakis RG**

Developed with [Lua Player Plus](http://rinnegatamante.github.io/lpp-vita/) by **Rinnegatamante**


### Special Thanks

**Creckeryop**

**andiweli** ([HEXFlow Covers database](https://github.com/andiweli/hexflow-covers))

**DRok17** for his work on bubble builders.

**Rinnegatamante** for tips and support with Lua.  

**Leecherman** for his work on AdrBubbleBooter and the [PSP ISO Renamer](https://sites.google.com/site/theleecherman/PSPISORenamer)


### Translations

French - @chronoss

German - @stuermerandreas

Spanish - @kodyna91

Italian - @TheheroGAC

Russian - @\_novff

Portuguese - @nighto

Japanese - @iGlitch

Chinese - @acd13141

Polish - @SK00RUPA


### Polite notice

Please note that I'm not a developer, this mod started as a personal project, please be mindful that there may be some redundant code, or some requests that will be beyond my knowledge to implement.
Please feel free to build upon the mod as long as you provide credit to the original HexFlow developer and the people who contributed to the project.


## Support

If you want to support VitaHex's work you can become a [Patron](https://www.patreon.com/vitahex).

PayPal option is also available [HERE](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=RM8ECMVYMTXGJ&source=url)

[VitaHEX Twitter](https://twitter.com/VitaHex)

[VitaHEX Official Page](https://vitahex.weebly.com/)
