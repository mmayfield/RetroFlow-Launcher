-- RetroFlow Launcher - HexFlow Mod version by jimbob4000
-- Based on HexFlow Launcher  version 0.5 by VitaHEX
-- https://www.patreon.com/vitahex



dofile("app0:addons/threads.lua")
local working_dir = "ux0:/app"
local appversion = "3.5"
function System.currentDirectory(dir)
    if dir == nil then
        return working_dir
    else
        working_dir = dir
    end
end


local romDir = "ux0:/data/RetroFlow/ROMS/"
local covDir = "ux0:/data/RetroFlow/COVERS/"
local snapDir = "ux0:/data/RetroFlow/BACKGROUNDS/"

-- Tidy up legacy COVER folder structure to a more standard naming convention
if System.doesDirExist("ux0:/data/RetroFlow/COVERS/MAME") then System.rename("ux0:/data/RetroFlow/COVERS/MAME", "ux0:/data/RetroFlow/COVERS/MAME 2000") end
if System.doesDirExist("ux0:/data/RetroFlow/ROMS/MAME 2000") then System.rename("ux0:/data/RetroFlow/ROMS/MAME 2000", "ux0:/data/RetroFlow/ROMS/MAME 2000") end


SystemsToScan =
{
    [1] = 
    {
        ["apptype"] = 1,
        ["table"] = "games_table",
        -- ["romFolder"] = "",
        ["localCoverPath"] = covDir .. "Sony - PlayStation Vita" .. "/",
        ["localSnapPath"] = snapDir .. "Sony - PlayStation Vita" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/PSVita/",
        ["onlineSnapPathSystem"] = "",
        ["Missing_Cover"] = "missing_cover_psv.png",
    },
    [2] = 
    {
        ["apptype"] = 0,
        ["table"] = "homebrews_table",
        -- ["romFolder"] = "",
        ["localCoverPath"] = covDir .. "Homebrew" .. "/",
        ["localSnapPath"] = snapDir .. "Homebrew" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/HOMEBREW/",
        ["onlineSnapPathSystem"] = "",
        ["Missing_Cover"] = "missing_cover_homebrew.png",
    },
    [3] = 
    {
        ["apptype"] = 2,
        ["table"] = "psp_table",
        -- ["romFolder"] = "",
        ["localCoverPath"] = covDir .. "Sony - PlayStation Portable" .. "/",
        ["localSnapPath"] = snapDir .. "Sony - PlayStation Portable" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/PSP/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/PSP/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_psp.png",
    },
    [4] = 
    {
        ["apptype"] = 3,
        ["table"] = "psx_table",
        -- ["romFolder"] = "",
        ["localCoverPath"] = covDir .. "Sony - PlayStation" .. "/",
        ["localSnapPath"] = snapDir .. "Sony - PlayStation Portable" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/PS1/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/PS1/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_psx.png",
    },
    [5] = 
    {
        ["apptype"] = 5,
        ["table"] = "n64_table",
        ["romFolder"] = romDir ..  "Nintendo - Nintendo 64",
        ["localCoverPath"] = covDir .. "Nintendo - Nintendo 64" .. "/",
        ["localSnapPath"] = snapDir .. "Nintendo - Nintendo 64" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/N64/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/Nintendo_-_Nintendo_64/ec7430189022b591a8fb0fa16101201f861363f8/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_n64.png",
    },
    [6] = 
    {
        ["apptype"] = 6,
        ["table"] = "snes_table",
        ["romFolder"] = romDir .. "Nintendo - Super Nintendo Entertainment System",
        ["localCoverPath"] = covDir .. "Nintendo - Super Nintendo Entertainment System" .. "/",
        ["localSnapPath"] = snapDir .. "Nintendo - Super Nintendo Entertainment System" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/SNES/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/Nintendo_-_Super_Nintendo_Entertainment_System/5c469e48755fec26b4b9d651b6962a2cdea3133d/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_snes.png",
    },
    [7] = 
    {
        ["apptype"] = 7,
        ["table"] = "nes_table",
        ["romFolder"] = romDir ..  "Nintendo - Nintendo Entertainment System",
        ["localCoverPath"] = covDir .. "Nintendo - Nintendo Entertainment System" .. "/",
        ["localSnapPath"] = snapDir .. "Nintendo - Nintendo Entertainment System" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/NES/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/Nintendo_-_Nintendo_Entertainment_System/f4415b21a256bcbe7b30a9d71a571d6ba4815c71/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_nes.png",
    },
    [8] = 
    {
        ["apptype"] = 8,
        ["table"] = "gba_table",
        ["romFolder"] = romDir ..  "Nintendo - Game Boy Advance",
        ["localCoverPath"] = covDir .. "Nintendo - Game Boy Advance" .. "/",
        ["localSnapPath"] = snapDir .. "Nintendo - Game Boy Advance" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/GBA/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/Nintendo_-_Game_Boy_Advance/fd58a8fae1cec5857393c0405c3d0514c7fdf6cf/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_gba.png",
    },
    [9] = 
    {
        ["apptype"] = 9,
        ["table"] = "gbc_table",
        ["romFolder"] = romDir ..  "Nintendo - Game Boy Color",
        ["localCoverPath"] = covDir .. "Nintendo - Game Boy Color" .. "/",
        ["localSnapPath"] = snapDir .. "Nintendo - Game Boy Color" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/GBC/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/Nintendo_-_Game_Boy_Color/a0cc546d2b4e2eebefdcf91b90ae3601c377c3ce/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_gbc.png",
    },
    [10] = 
    {
        ["apptype"] = 10,
        ["table"] = "gb_table",
        ["romFolder"] = romDir ..   "Nintendo - Game Boy",
        ["localCoverPath"] = covDir .. "Nintendo - Game Boy" .. "/",
        ["localSnapPath"] = snapDir .. "Nintendo - Game Boy" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/GB/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/Nintendo_-_Game_Boy/d5ad94ba8c5159381d7f618ec987e609d23ae203/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_gb.png",
    },
    [11] = 
    {
        ["apptype"] = 11,
        ["table"] = "sega_cd_table",
        ["romFolder"] = romDir ..   "Sega - Mega-CD - Sega CD",
        ["localCoverPath"] = covDir .. "Sega - Mega-CD - Sega CD" .. "/",
        ["localSnapPath"] = snapDir .. "Sega - Mega-CD - Sega CD" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/SEGA_CD/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/Sega_-_Mega-CD_-_Sega_CD/a8737a2a394645f27415f7346ac2ceb0cfcd0942/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_sega_cd.png",
    },
    [12] = 
    {
        ["apptype"] = 12,
        ["table"] = "s32x_table",
        ["romFolder"] = romDir ..   "Sega - 32X",
        ["localCoverPath"] = covDir .. "Sega - 32X" .. "/",
        ["localSnapPath"] = snapDir .. "Sega - 32X" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/32X/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/Sega_-_32X/4deb45e651e29506a7bfc440408b3343f0e1a3ae/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_32x.png",
    },
    [13] = 
    {
        ["apptype"] = 13,
        ["table"] = "md_table",
        ["romFolder"] = romDir ..   "Sega - Mega Drive - Genesis",
        ["localCoverPath"] = covDir .. "Sega - Mega Drive - Genesis" .. "/",
        ["localSnapPath"] = snapDir .. "Sega - Mega Drive - Genesis" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/MD/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/Sega_-_Mega_Drive_-_Genesis/6ac232741f979a6f0aa54d077ff392fe170f4725/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_md.png",
    },
    [14] = 
    {
        ["apptype"] = 14,
        ["table"] = "sms_table",
        ["romFolder"] = romDir ..  "Sega - Master System - Mark III",
        ["localCoverPath"] = covDir .. "Sega - Master System - Mark III" .. "/",
        ["localSnapPath"] = snapDir .. "Sega - Master System - Mark III" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/SMS/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/Sega_-_Master_System_-_Mark_III/02f8c7f989db6124475b7e0978c27af8534655eb/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_sms.png",
    },
    [15] = 
    {
        ["apptype"] = 15,
        ["table"] = "gg_table",
        ["romFolder"] = romDir ..   "Sega - Game Gear",
        ["localCoverPath"] = covDir .. "Sega - Game Gear" .. "/",
        ["localSnapPath"] = snapDir .. "Sega - Game Gear" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/GG/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/Sega_-_Game_Gear/b99b424d2adcf5ccd45c372db2c15f01653f2b92/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_gg.png",
    },
    [16] = 
    {
        ["apptype"] = 16,
        ["table"] = "tg16_table",
        ["romFolder"] = romDir .. "NEC - TurboGrafx 16",
        ["localCoverPath"] = covDir .. "NEC - TurboGrafx 16" .. "/",
        ["localSnapPath"] = snapDir .. "NEC - TurboGrafx 16" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/TG16/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/NEC_-_PC_Engine_-_TurboGrafx_16/d0d6e27f84d757416799e432154e0adcadb154c9/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_tg16.png",
    },
    [17] = 
    {
        ["apptype"] = 17,
        ["table"] = "tgcd_table",
        ["romFolder"] = romDir .. "NEC - TurboGrafx CD",
        ["localCoverPath"] = covDir .. "NEC - TurboGrafx CD" .. "/",
        ["localSnapPath"] = snapDir .. "NEC - TurboGrafx CD" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/TG_CD/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/NEC_-_PC_Engine_CD_-_TurboGrafx-CD/cd554a5cdca862f090e6c3f9510a3b1b6c2d5b38/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_tgcd.png",
    },
    [18] = 
    {
        ["apptype"] = 18,
        ["table"] = "pce_table",
        ["romFolder"] = romDir .. "NEC - PC Engine",
        ["localCoverPath"] = covDir .. "NEC - PC Engine" .. "/",
        ["localSnapPath"] = snapDir .. "NEC - PC Engine" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/PCE/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/NEC_-_PC_Engine_-_TurboGrafx_16/d0d6e27f84d757416799e432154e0adcadb154c9/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_pce.png",
    },
    [19] = 
    {
        ["apptype"] = 19,
        ["table"] = "pcecd_table",
        ["romFolder"] = romDir .. "NEC - PC Engine CD",
        ["localCoverPath"] = covDir .. "NEC - PC Engine CD" .. "/",
        ["localSnapPath"] = snapDir .. "NEC - PC Engine CD" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/PCE_CD/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/NEC_-_PC_Engine_CD_-_TurboGrafx-CD/cd554a5cdca862f090e6c3f9510a3b1b6c2d5b38/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_pcecd.png",
    },
    [20] = 
    {
        ["apptype"] = 20,
        ["table"] = "amiga_table",
        ["romFolder"] = romDir .. "Commodore - Amiga",
        ["localCoverPath"] = covDir .. "Commodore - Amiga" .. "/",
        ["localSnapPath"] = snapDir .. "Commodore - Amiga" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/AMIGA/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/Commodore_-_Amiga/b6446e83b3dc93446371a5dbfb0f24574eb56461/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_amiga.png",
    },
    [21] = 
    {
        ["apptype"] = 21,
        ["table"] = "c64_table",
        ["romFolder"] = romDir .. "Commodore - 64",
        ["localCoverPath"] = covDir .. "Commodore - 64" .. "/",
        ["localSnapPath"] = snapDir .. "Commodore - 64" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/C64/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/Commodore_-_64/df90042ef9823d1b0b9d3ec303051f555dca2246/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_c64.png",
    },
    [22] = 
    {
        ["apptype"] = 22,
        ["table"] = "wswan_col_table",
        ["romFolder"] = romDir .. "Bandai - WonderSwan Color",
        ["localCoverPath"] = covDir .. "Bandai - WonderSwan Color" .. "/",
        ["localSnapPath"] = snapDir .. "Bandai - WonderSwan Color" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/WSWAN_COL/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/Bandai_-_WonderSwan_Color/5b57a78fafa4acb8590444c15c116998fcea9dce/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_wswan_col.png",
    },
    [23] = 
    {
        ["apptype"] = 23,
        ["table"] = "wswan_table",
        ["romFolder"] = romDir .. "Bandai - WonderSwan",
        ["localCoverPath"] = covDir .. "Bandai - WonderSwan" .. "/",
        ["localSnapPath"] = snapDir .. "Bandai - WonderSwan" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/WSWAN/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/Bandai_-_WonderSwan/3913706e173ec5f8c0cdeebd225b16f4dc3dd6c6/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_wswan.png",
    },
    [24] = 
    {
        ["apptype"] = 24,
        ["table"] = "msx2_table",
        ["romFolder"] = romDir .. "Microsoft - MSX2",
        ["localCoverPath"] = covDir .. "Microsoft - MSX2" .. "/",
        ["localSnapPath"] = snapDir .. "Microsoft - MSX2" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/MSX2/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/Microsoft_-_MSX2/12d7e10728cc4c3314b8b14b5a9b1892a886d2ab/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_msx2.png",
    },
    [25] = 
    {
        ["apptype"] = 25,
        ["table"] = "msx1_table",
        ["romFolder"] = romDir .. "Microsoft - MSX",
        ["localCoverPath"] = covDir .. "Microsoft - MSX" .. "/",
        ["localSnapPath"] = snapDir .. "Microsoft - MSX" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/MSX/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/Microsoft_-_MSX/ed54675a51597fd5bf66a45318a273f330b7662f/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_msx1.png",
    },
    [26] = 
    {
        ["apptype"] = 26,
        ["table"] = "zxs_table",
        ["romFolder"] = romDir .. "Sinclair - ZX Spectrum",
        ["localCoverPath"] = covDir .. "Sinclair - ZX Spectrum" .. "/",
        ["localSnapPath"] = snapDir .. "Sinclair - ZX Spectrum" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/ZXS/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/Sinclair_-_ZX_Spectrum/d23c953dc9853983fb2fce2b8e96a1ccc08b70e8/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_zxs.png",
    },
    [27] = 
    {
        ["apptype"] = 27,
        ["table"] = "atari_7800_table",
        ["romFolder"] = romDir .. "Atari - 7800",
        ["localCoverPath"] = covDir .. "Atari - 7800" .. "/",
        ["localSnapPath"] = snapDir .. "Atari - 7800" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/ATARI_7800/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/Atari_-_7800/eff4d49a71a62764dd66d414b1bf7a843f85f7ae/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_atari_7800.png",
    },
    [28] = 
    {
        ["apptype"] = 28,
        ["table"] = "atari_5200_table",
        ["romFolder"] = romDir .. "Atari - 5200",
        ["localCoverPath"] = covDir .. "Atari - 5200" .. "/",
        ["localSnapPath"] = snapDir .. "Atari - 5200" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/ATARI_5200/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/Atari_-_5200/793489381646954046dd1767a1af0fa4f6b86c24/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_atari_5200.png",
    },
    [29] = 
    {
        ["apptype"] = 29,
        ["table"] = "atari_2600_table",
        ["romFolder"] = romDir .. "Atari - 2600",
        ["localCoverPath"] = covDir .. "Atari - 2600" .. "/",
        ["localSnapPath"] = snapDir .. "Atari - 2600" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/ATARI_2600/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/Atari_-_2600/ea2ba38f9bace8e85539d12e2f65e31c797c6585/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_atari_2600.png",
    },
    [30] = 
    {
        ["apptype"] = 30,
        ["table"] = "atari_lynx_table",
        ["romFolder"] = romDir .. "Atari - Lynx",
        ["localCoverPath"] = covDir .. "Atari - Lynx" .. "/",
        ["localSnapPath"] = snapDir .. "Atari - Lynx" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/ATARI_LYNX/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/Atari_-_Lynx/91278444136e9c19f89331421ffe84cce6f82fb9/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_atari_lynx.png",
    },
    [31] = 
    {
        ["apptype"] = 31,
        ["table"] = "colecovision_table",
        ["romFolder"] = romDir .. "Coleco - ColecoVision",
        ["localCoverPath"] = covDir .. "Coleco - ColecoVision" .. "/",
        ["localSnapPath"] = snapDir .. "Coleco - ColecoVision" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/COLECOVISION/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/Coleco_-_ColecoVision/332c63436431ea5fceedf50b94447bb6e7a8e1f5/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_colecovision.png",
    },
    [32] = 
    {
        ["apptype"] = 32,
        ["table"] = "vectrex_table",
        ["romFolder"] = romDir .. "GCE - Vectrex",
        ["localCoverPath"] = covDir .. "GCE - Vectrex" .. "/",
        ["localSnapPath"] = snapDir .. "GCE - Vectrex" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/VECTREX/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/GCE_-_Vectrex/ed03e5d1214399d2f4429109874b2ad3d8a18709/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_vectrex.png",
    },
    [33] = 
    {
        ["apptype"] = 33,
        ["table"] = "fba_table",
        ["romFolder"] = romDir .. "FBA 2012",
        ["localCoverPath"] = covDir .. "FBA 2012" .. "/",
        ["localSnapPath"] = snapDir .. "FBA 2012" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/MAME/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/MAME/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_fba.png",
    },
    [34] = 
    {
        ["apptype"] = 34,
        ["table"] = "mame_2003_plus_table",
        ["romFolder"] = romDir .. "MAME 2003 Plus",
        ["localCoverPath"] = covDir .. "MAME 2003 Plus" .. "/",
        ["localSnapPath"] = snapDir .. "MAME 2003 Plus" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/MAME/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/MAME/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_mame.png",
    },
    [35] = 
    {
        ["apptype"] = 35,
        ["table"] = "mame_2000_table",
        ["romFolder"] = romDir .. "MAME 2000",
        ["localCoverPath"] = covDir .. "MAME 2000" .. "/",
        ["localSnapPath"] = snapDir .. "MAME 2000" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/MAME/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/MAME/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_mame.png",
    },
    [36] = 
    {
        ["apptype"] = 36,
        ["table"] = "neogeo_table",
        ["romFolder"] = romDir .. "SNK - Neo Geo - FBA 2012",
        ["localCoverPath"] = covDir .. "SNK - Neo Geo - FBA 2012" .. "/",
        ["localSnapPath"] = snapDir .. "SNK - Neo Geo - FBA 2012" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/NEOGEO/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/NEOGEO/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_neogeo.png",
    },
    [37] = 
    {
        ["apptype"] = 37,
        ["table"] = "ngpc_table",
        ["romFolder"] = romDir .. "SNK - Neo Geo Pocket Color",
        ["localCoverPath"] = covDir .. "SNK - Neo Geo Pocket Color" .. "/",
        ["localSnapPath"] = snapDir .. "SNK - Neo Geo Pocket Color" .. "/",
        ["onlineCoverPathSystem"] = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/NEOGEO_PC/Covers/",
        ["onlineSnapPathSystem"] = "https://raw.githubusercontent.com/libretro-thumbnails/SNK_-_Neo_Geo_Pocket_Color/f940bd5da36105397897c093dda77ef06d51cbcf/Named_Snaps/",
        ["Missing_Cover"] = "missing_cover_ngpc.png",
    },
    [38] = 
    {
        -- ["apptype"] = 21,
        ["table"] = "fav_count",
        -- ["romFolder"] = "",
        -- ["localCoverPath"] = "",
        -- ["onlineCoverPathSystem"] = "",
        -- ["Missing_Cover"] = "",
    },
    [39] = 
    {
        -- ["apptype"] = 22,
        ["table"] = "recently_played_table",
        -- ["romFolder"] = "",
        -- ["localCoverPath"] = "",
        -- ["onlineCoverPathSystem"] = "",
        -- ["Missing_Cover"] = "",
    },
    [40] = 
    {
        -- ["apptype"] = 22,
        ["table"] = "search_results_table",
        -- ["romFolder"] = "",
        -- ["localCoverPath"] = "",
        -- ["onlineCoverPathSystem"] = "",
        -- ["Missing_Cover"] = "",
    },
}

local adrenaline_PSP_GAME_ux0 = "ux0:/pspemu/PSP/GAME"
local adrenaline_PSP_GAME_uma0 = "uma0:/pspemu/PSP/GAME"

local adrenaline_PSP_ISO_ux0 = "ux0:/pspemu/ISO"
local adrenaline_PSP_ISO_uma0 = "uma0:/pspemu/ISO"

-- Counts
count_of_systems = #SystemsToScan - 1 -- Minus: Favorites, Recently played
count_of_categories = #SystemsToScan
count_of_start_categories = #SystemsToScan - 1  -- Minus: Search
count_of_cache_files = #SystemsToScan - 1 -- + 1 removed with search
count_of_get_covers = #SystemsToScan - 4
count_of_get_snaps = #SystemsToScan - 5 -- Minus vita too

Network.init()


Sound.init()
local click = Sound.open("app0:/DATA/click2.ogg")
local sndMusic = click--temp
local imgCoverTmp = Graphics.loadImage("app0:/DATA/noimg.png")
local backTmp = Graphics.loadImage("app0:/DATA/noimg.png")
local btnX = Graphics.loadImage("app0:/DATA/x.png")
local btnT = Graphics.loadImage("app0:/DATA/t.png")
local btnS = Graphics.loadImage("app0:/DATA/s.png")
local btnO = Graphics.loadImage("app0:/DATA/o.png")
local imgWifi = Graphics.loadImage("app0:/DATA/wifi.png")
local imgBattery = Graphics.loadImage("app0:/DATA/bat.png")
local imgBack = Graphics.loadImage("app0:/DATA/back_01.jpg")
local imgFloor = Graphics.loadImage("app0:/DATA/floor.png")
local imgFavorite_small_on = Graphics.loadImage("app0:/DATA/fav-small-on.png")
local imgFavorite_small_off = Graphics.loadImage("app0:/DATA/fav-small-off.png")
local imgFavorite_small_blank = Graphics.loadImage("app0:/DATA/fav-small-blank.png")
local imgFavorite_large_on = Graphics.loadImage("app0:/DATA/fav-large-on.png")
local imgFavorite_large_off = Graphics.loadImage("app0:/DATA/fav-large-off.png")
local setting_icon_theme = Graphics.loadImage("app0:/DATA/setting-icon-theme.png")
local setting_icon_artwork = Graphics.loadImage("app0:/DATA/setting-icon-artwork.png")
local setting_icon_categories = Graphics.loadImage("app0:/DATA/setting-icon-categories.png")
local setting_icon_language = Graphics.loadImage("app0:/DATA/setting-icon-language.png")
local setting_icon_scanning = Graphics.loadImage("app0:/DATA/setting-icon-scanning.png")
local setting_icon_search = Graphics.loadImage("app0:/DATA/setting-icon-search.png")
local setting_icon_sounds = Graphics.loadImage("app0:/DATA/setting-icon-sounds.png")
local setting_icon_about = Graphics.loadImage("app0:/DATA/setting-icon-about.png")




Graphics.setImageFilters(imgFloor, FILTER_LINEAR, FILTER_LINEAR)


-- CREATE DIRECTORIES

-- Create directory: Main
local cur_dir = "ux0:/data/RetroFlow/"
System.createDirectory("ux0:/data/RetroFlow/")

-- Create directory: Backgrounds
local background_dir = "ux0:/data/RetroFlow/WALLPAPER/"
System.createDirectory(background_dir)

-- Create directory: Rom Folders
System.createDirectory(romDir)
for k, v in pairs(SystemsToScan) do
    System.createDirectory(tostring(v.romFolder))
end

-- Create directory: Cover Folders
System.createDirectory(covDir)
for k, v in pairs(SystemsToScan) do
    System.createDirectory(tostring(v.localCoverPath))
end

-- Create directory: Snap Folders
System.createDirectory(snapDir)
for k, v in pairs(SystemsToScan) do
    System.createDirectory(tostring(v.localSnapPath))
end

-- Create directory: User Database
local user_DB_Folder = "ux0:/data/RetroFlow/TITLES/"
System.createDirectory(user_DB_Folder)

-- Create directory: Databases
local db_Folder = "ux0:/data/RetroFlow/DATABASES/"
System.createDirectory(db_Folder)

-- Copy databases from app to data
if not System.doesFileExist(db_Folder .. "/mame_2000.db") then
    System.copyFile("app0:/addons/mame_2000.db", db_Folder .. "/mame_2000.db")
end
if not System.doesFileExist(db_Folder .. "/mame_2003_plus.db") then
    System.copyFile("app0:/addons/mame_2003_plus.db", db_Folder .. "/mame_2003_plus.db")
end
if not System.doesFileExist(db_Folder .. "/neogeo.db") then
    System.copyFile("app0:/addons/neogeo.db", db_Folder .. "/neogeo.db")
end
if not System.doesFileExist(db_Folder .. "/fba_2012.db") then
    System.copyFile("app0:/addons/fba_2012.db", db_Folder .. "/fba_2012.db")
end
if not System.doesFileExist(db_Folder .. "/psp.db") then
    System.copyFile("app0:/addons/psp.db", db_Folder .. "/psp.db")
end
if not System.doesFileExist(db_Folder .. "/psx.db") then
    System.copyFile("app0:/addons/psx.db", db_Folder .. "/psx.db")
end

-- Table Cache
local db_Cache_Folder = "ux0:/data/RetroFlow/CACHE/"
System.createDirectory(db_Cache_Folder)

-- Move old background images to new location
if System.doesFileExist("ux0:/data/RetroFlow/Background.jpg") then System.rename("ux0:/data/RetroFlow/Background.jpg", "ux0:/data/RetroFlow/WALLPAPER/Background.jpg") end
if System.doesFileExist("ux0:/data/RetroFlow/Background.png") then System.rename("ux0:/data/RetroFlow/Background.png", "ux0:/data/RetroFlow/WALLPAPER/Background.png") end
if not System.doesFileExist(background_dir .. "Aurora.png") then System.copyFile("app0:/DATA/Aurora.png", background_dir .. "Aurora.png") end


-- Retroarch Cores
core =
{
SNES = "app0:/snes9x2005_libretro.self",
NES = "app0:/quicknes_libretro.self",
GBA = "app0:/gpsp_libretro.self",
GBC = "app0:/gambatte_libretro.self",
GB = "app0:/gambatte_libretro.self",
SEGA_CD = "app0:/genesis_plus_gx_libretro.self",
s32X = "app0:/genesis_plus_gx_libretro.self",
MD = "app0:/genesis_plus_gx_libretro.self",
SMS = "app0:/smsplus_libretro.self",
GG = "app0:/smsplus_libretro.self",
TG16 = "app0:/mednafen_pce_fast_libretro.self",
TGCD = "app0:/mednafen_pce_fast_libretro.self",
PCE = "app0:/mednafen_pce_fast_libretro.self",
PCECD = "app0:/mednafen_pce_fast_libretro.self",
AMIGA = "app0:/puae_libretro.self",
C64 = "app0:/vice_x64_libretro.self",
WSWAN_COL = "app0:/mednafen_wswan_libretro.self",
WSWAN = "app0:/mednafen_wswan_libretro.self",
MSX2 = "app0:/fmsx_libretro.self",
MSX1 = "app0:/fmsx_libretro.self",
ZXS = "app0:/fuse_libretro.self",
ATARI_7800 = "app0:/prosystem_libretro.self",
ATARI_5200 = "app0:/atari800_libretro.self",
ATARI_2600 = "app0:/stella2014_libretro.self",
ATARI_LYNX = "app0:/handy_libretro.self",
COLECOVISION = "app0:/bluemsx_libretro.self",
VECTREX = "app0:/vecx_libretro.self",
FBA = "app0:/fbalpha2012_libretro.self",
MAME_2003_PLUS = "app0:/mame2003_plus_libretro.self",
MAME_2000 = "app0:/mame2000_libretro.self",
NEOGEO = "app0:/fbalpha2012_neogeo_libretro.self",
NGPC = "app0:/mednafen_ngp_libretro.self",
}

-- Launcher App Directory
local launch_dir = "ux0:/rePatch/RETROFLOW/"
local launch_dir_adr = "ux0:/app/RETROLNCR/"
local launch_app_adr = "RETROLNCR"

-- Create Overrides file
if not System.doesFileExist(cur_dir .. "/overrides.dat") then
    local file_over = System.openFile(cur_dir .. "/overrides.dat", FCREATE)
    System.writeFile(file_over, " ", 1)
    System.closeFile(file_over)
end

-- Create Favorites file
if not System.doesFileExist(cur_dir .. "/favorites.dat") then
    local file_favorites = System.openFile(cur_dir .. "/favorites.dat", FCREATE)
    System.writeFile(file_favorites, " ", 1)
    System.closeFile(file_favorites)
end

-- load textures
local imgBox = Graphics.loadImage("app0:/DATA/vita_cover.png")
local imgBoxPSP = Graphics.loadImage("app0:/DATA/psp_cover.png")
local imgBoxPSX = Graphics.loadImage("app0:/DATA/psx_cover.png")
local imgBoxTAPE = Graphics.loadImage("app0:/DATA/tape_cover.png")
local imgBoxBLANK = Graphics.loadImage("app0:/DATA/blank_cover.png")

-- Load models
local modBox = Render.loadObject("app0:/DATA/box.obj", imgBox)
local modCover = Render.loadObject("app0:/DATA/cover.obj", imgCoverTmp)
local modBoxNoref = Render.loadObject("app0:/DATA/box_noreflx.obj", imgBox)
local modCoverNoref = Render.loadObject("app0:/DATA/cover_noreflx.obj", imgCoverTmp)

local modBoxPSP = Render.loadObject("app0:/DATA/boxpsp.obj", imgBoxPSP)
local modCoverPSP = Render.loadObject("app0:/DATA/coverpsp.obj", imgCoverTmp)
local modBoxPSPNoref = Render.loadObject("app0:/DATA/boxpsp_noreflx.obj", imgBoxPSP)
local modCoverPSPNoref = Render.loadObject("app0:/DATA/coverpsp_noreflx.obj", imgCoverTmp)

local modBoxPSX = Render.loadObject("app0:/DATA/boxpsx.obj", imgBoxPSX)
local modCoverPSX = Render.loadObject("app0:/DATA/coverpsx.obj", imgCoverTmp)
local modBoxPSXNoref = Render.loadObject("app0:/DATA/boxpsx_noreflx.obj", imgBoxPSX)
local modCoverPSXNoref = Render.loadObject("app0:/DATA/coverpsx_noreflx.obj", imgCoverTmp)

local modBoxN64 = Render.loadObject("app0:/DATA/boxn64.obj", imgBoxBLANK)
local modCoverN64 = Render.loadObject("app0:/DATA/covern64.obj", imgCoverTmp)
local modBoxN64Noref = Render.loadObject("app0:/DATA/boxn64_noreflx.obj", imgBoxBLANK)
local modCoverN64Noref = Render.loadObject("app0:/DATA/covern64_noreflx.obj", imgCoverTmp)

local modBoxNES = Render.loadObject("app0:/DATA/boxnes.obj", imgBoxBLANK)
local modCoverNES = Render.loadObject("app0:/DATA/covernes.obj", imgCoverTmp)
local modBoxNESNoref = Render.loadObject("app0:/DATA/boxnes_noreflx.obj", imgBoxBLANK)
local modCoverNESNoref = Render.loadObject("app0:/DATA/covernes_noreflx.obj", imgCoverTmp)

local modBoxGB = Render.loadObject("app0:/DATA/boxgb.obj", imgBoxBLANK)
local modCoverGB = Render.loadObject("app0:/DATA/covergb.obj", imgCoverTmp)
local modBoxGBNoref = Render.loadObject("app0:/DATA/boxgb_noreflx.obj", imgBoxBLANK)
local modCoverGBNoref = Render.loadObject("app0:/DATA/covergb_noreflx.obj", imgCoverTmp)

local modBoxMD = Render.loadObject("app0:/DATA/boxmd.obj", imgBoxBLANK)
local modCoverMD = Render.loadObject("app0:/DATA/covermd.obj", imgCoverTmp)
local modBoxMDNoref = Render.loadObject("app0:/DATA/boxmd_noreflx.obj", imgBoxBLANK)
local modCoverMDNoref = Render.loadObject("app0:/DATA/covermd_noreflx.obj", imgCoverTmp)

local modBoxTAPE = Render.loadObject("app0:/DATA/boxtape.obj", imgBoxBLANK)
local modCoverTAPE = Render.loadObject("app0:/DATA/covertape.obj", imgCoverTmp)
local modBoxTAPENoref = Render.loadObject("app0:/DATA/boxtape_noreflx.obj", imgBoxBLANK)
local modCoverTAPENoref = Render.loadObject("app0:/DATA/covertape_noreflx.obj", imgCoverTmp)

local modBoxATARI = Render.loadObject("app0:/DATA/boxatari.obj", imgBoxBLANK)
local modCoverATARI = Render.loadObject("app0:/DATA/coveratari.obj", imgCoverTmp)
local modBoxATARINoref = Render.loadObject("app0:/DATA/boxatari_noreflx.obj", imgBoxBLANK)
local modCoverATARINoref = Render.loadObject("app0:/DATA/coveratari_noreflx.obj", imgCoverTmp)

local modBoxLYNX = Render.loadObject("app0:/DATA/boxlynx.obj", imgBoxBLANK)
local modCoverLYNX = Render.loadObject("app0:/DATA/coverlynx.obj", imgCoverTmp)
local modBoxLYNXNoref = Render.loadObject("app0:/DATA/boxlynx_noreflx.obj", imgBoxBLANK)
local modCoverLYNXNoref = Render.loadObject("app0:/DATA/coverlynx_noreflx.obj", imgCoverTmp)

local modCoverHbr = Render.loadObject("app0:/DATA/cover_square.obj", imgCoverTmp)
local modCoverHbrNoref = Render.loadObject("app0:/DATA/cover_square_noreflx.obj", imgCoverTmp)

local modBackground = Render.loadObject("app0:/DATA/planebg.obj", imgBack)
local modDefaultBackground = Render.loadObject("app0:/DATA/planebg.obj", imgBack)
local modFloor = Render.loadObject("app0:/DATA/planefloor.obj", imgFloor)

local img_path = ""

local fnt = Font.load("app0:/DATA/font.ttf")
local fnt20 = Font.load("app0:/DATA/font.ttf")
local fnt22 = Font.load("app0:/DATA/font.ttf")
local fnt25 = Font.load("app0:/DATA/font.ttf")
local fnt35 = Font.load("app0:/DATA/font.ttf")

Font.setPixelSizes(fnt20, 20)
Font.setPixelSizes(fnt22, 22)
Font.setPixelSizes(fnt25, 25)
Font.setPixelSizes(fnt35, 35)

-- Search
local hasTyped = false
local ret = ""

function count_cache_and_reload()
    cache_file_count = System.listDirectory(db_Cache_Folder)
    if #cache_file_count < count_of_cache_files then
        -- Files missing - rescan
        cache_all_tables()
        files_table = import_cached_DB(System.currentDirectory())
    else
        files_table = import_cached_DB(System.currentDirectory())
    end
end


-- PRINT TABLE FUNCTIONS
function cache_all_tables()
    dofile("app0:addons/printTable.lua")
    print_tables()
end
function update_cached_table(def_user_db_file, def_table_name)
    dofile("app0:addons/printTable.lua")
    print_table_system((def_user_db_file), (def_table_name))
end
function update_cached_table_recently_played()
    dofile("app0:addons/printTable.lua")
    print_table_recently_played()
end
function update_cached_table_recently_played_pre_launch()
    dofile("app0:addons/printTable.lua")
    print_table_recently_played_pre_launch()
end


local menuX = 0
local menuY = 0
local showMenu = 0
local showCat = 1 -- Category: 0 = all, 1 = games, 2 = homebrews, 3 = psp, 4 = psx, 5 = N64, 6 = SNES, 7 = NES, 8 = GBA, 9 = GBC, 10 = GB, 11 = MD, 12 = SMS, 13 = GG, 14 = MAME, 15 = AMIGA, 16 = TG16, 17 = TG CD, 18 = PCE, 19 = PCE CD, 20 = NGPC, 21 = Favorites
local showView = 0

local info = System.extractSfo("app0:/sce_sys/param.sfo")
local app_version = info.version
local app_title = info.title
local app_category = info.category
local app_titleid = info.titleid
local app_size = 0

local master_index = 1
local p = 1
local oldpad = 0
local delayTouch = 8.0
local delayButton = 8.0
local hideBoxes = 1.0
local prvRotY = 0

local gettingCovers = false
local gettingBackgrounds = false
local scanComplete = false
local bgscanComplete = false

-- Init Colors
local black = Color.new(0, 0, 0)
local grey = Color.new(45, 45, 45)
local darkalpha = Color.new(40, 40, 40, 180)
local lightgrey = Color.new(58, 58, 58)
local white = Color.new(255, 255, 255)
local red = Color.new(190, 0, 0)
local blue = Color.new(2, 72, 158)
local yellow = Color.new(225, 184, 0)
local green = Color.new(79, 152, 37)
local purple = Color.new(151, 0, 185)
local darkpurple = Color.new(77, 4, 160)
local orange = Color.new(220, 120, 0)
local bg = Color.new(153, 217, 234)
local themeCol = Color.new(2, 72, 158)

local targetX = 0
local xstart = 0
local ystart = 0
local space = 1
local touchdown = 0
local startCovers = false
local inPreview = false
local apptype = 0
local appdir = ""
local getCovers = 0
local getSnaps = 0
local tmpappcat = 0

local prevX = 0
local prevZ = 0
local prevRot = 0

local total_all = 0
local total_games = 0
local total_homebrews = 0
local total_favorites = 0
local curTotal = 1

-- Settings
local startCategory = 1
local setReflections = 1
local setSounds = 1
local themeColor = 0 -- 0 blue, 1 red, 2 yellow, 3 green, 4 grey, 5 black, 6 purple, 7 darkpurple, 8 orange
local menuItems = 3
local setBackground = 1
local setLanguage = 0
local showHomebrews = 1 -- On
local startupScan = 0 -- 0 Off, 1 On
local showRecentlyPlayed = 1 -- On
local showAll = 1 -- On
local Adrenaline_roms = 1 -- ux0
local Game_Backgrounds = 1 -- On

function SaveSettings()
    local file_config = System.openFile(cur_dir .. "/config.dat", FCREATE)
    settings = {}
    local settings = "Reflections=" .. setReflections .. " " .. "\nSounds=" .. setSounds .. " " .. "\nColor=" .. themeColor .. " " .. "\nBackground=" .. setBackground .. " " .. "\nLanguage=" .. setLanguage .. " " .. "\nView=" .. showView .. " " .. "\nHomebrews=" .. showHomebrews .. " " .. "\nScan=" .. startupScan .. " " .. "\nCategory=" .. startCategory .. " " .. "\nRecent=" .. showRecentlyPlayed .. " " .. "\nAll=" .. showAll .. " " .. "\nAdrenaline_rom_location=" .. Adrenaline_roms.. " " .. "\nGame_Backgrounds=" .. Game_Backgrounds
    file_settings = io.open(cur_dir .. "/config.dat", "w")
    file_settings:write(settings)
    file_settings:close()
end

if System.doesFileExist(cur_dir .. "/config.dat") then
    local file_config = System.openFile(cur_dir .. "/config.dat", FREAD)
    local filesize = System.sizeFile(file_config)
    local str = System.readFile(file_config, filesize)
    System.closeFile(file_config)
    
    -- Convert space seperated setting numbers to values, can be 1 or more digits
    local function tovector(s)
        local settingValue = {}
        s:gsub("\n", " "):gsub('%-?%d+', function(n) settingValue[#settingValue+1] = tonumber(n) end)
        return settingValue
    end

    local settingValue = tovector(str)

    local getReflections = settingValue[1]; if getReflections ~= nil then setReflections = getReflections end
    local getSounds = settingValue[2]; if getSounds ~= nil then setSounds = getSounds end
    local getthemeColor = settingValue[3]; if getthemeColor ~= nil then themeColor = getthemeColor end
    local getBackground = settingValue[4]; if getBackground ~= nil then setBackground = getBackground end
    local getLanguage = settingValue[5]; if getLanguage ~= nil then setLanguage = getLanguage end
    local getView = settingValue[6]; if getView ~= nil then showView = getView end
    local getHomebrews = settingValue[7]; if getHomebrews ~= nil then showHomebrews = getHomebrews end
    local getStartupScan = settingValue[8]; if getStartupScan ~= nil then startupScan = getStartupScan end
    local getCategory = settingValue[9]; if getCategory ~= nil then startCategory = getCategory end
    local getRecent = settingValue[10]; if getRecent ~= nil then showRecentlyPlayed = getRecent end
    local getAll = settingValue[11]; if getAll ~= nil then showAll = getAll end
    local getAdrenaline_rom_location = settingValue[12]; if getAdrenaline_rom_location ~= nil then Adrenaline_roms = getAdrenaline_rom_location end
    local getGame_Backgrounds = settingValue[13]; if getGame_Backgrounds ~= nil then Game_Backgrounds = getGame_Backgrounds end
    selectedwall = setBackground

else
    SaveSettings()
end
showCat = startCategory




-- Custom Music
if System.doesFileExist(cur_dir .. "/Music.mp3") then
    sndMusic = Sound.open(cur_dir .. "/Music.mp3")
    if setSounds == 1 then
        Sound.play(sndMusic, LOOP)
    end
end

function SetThemeColor()
    if themeColor == 1 then
        themeCol = red
    elseif themeColor == 2 then
        themeCol = yellow
    elseif themeColor == 3 then
        themeCol = green
    elseif themeColor == 4 then
        themeCol = lightgrey
    elseif themeColor == 5 then
        themeCol = black
    elseif themeColor == 6 then
        themeCol = purple
    elseif themeColor == 7 then
        themeCol = darkpurple
    elseif themeColor == 8 then
        themeCol = orange
    else
        themeCol = blue -- default blue
    end
end
SetThemeColor()

-- Speed related settings
local cpu_speed = 444 -- Was 333
System.setBusSpeed(222)
System.setGpuSpeed(222)
System.setGpuXbarSpeed(166)
System.setCpuSpeed(cpu_speed)

function OneshotPrint(my_func)
    my_func()
    Screen.flip()
    my_func()
    Screen.flip()
    my_func()
end

local lang_lines = {}
local lang_default = 
{
-- Footer
["Settings"] = "Settings",
["Launch"] = "Launch",
["Details"] = "Details",
["Category"] = "Category",
["View"] = "View",
["Close"] = "Close",
["Select"] = "Select",
["About"] = "About",

-- General settings
["Language_colon"] = "Language: ",
["Homebrews_Category_colon"] = "Homebrews Category: ",
["Recently_Played_colon"] = "Recently Played: ",
["Startup_scan_colon"] = "Startup scan: ",
["On"] = "On",
["Off"] = "Off",

-- Appearance
["Custom_Background_colon"] = "Custom Background: ",
["Reflection_Effect_colon"] = "Reflection Effect: ",
["Sounds_colon"] = "Sounds: ",
["Theme_Color_colon"] = "Theme Color: ",
["Red"] = "Red",
["Yellow"] = "Yellow",
["Green"] = "Green",
["Grey"] = "Grey",
["Black"] = "Black",
["Purple"] = "Purple",
["Dark_Purple"] = "Dark Purple",
["Orange"] = "Orange",
["Blue"] = "Blue",

-- Startup Categories
["Startup_Category_colon"] = "Startup Category: ",
["Favorites"] = "Favorites",
["Recently_Played"] = "Recently Played",
["PS_Vita"] = "PS Vita",
["Homebrews"] = "Homebrews",
["PSP"] = "PSP",
["PlayStation"] = "PlayStation",
["Nintendo_64"] = "Nintendo 64",
["Super_Nintendo"] = "Super Nintendo",
["Nintendo_Entertainment_System"] = "Nintendo Entertainment System",
["Game_Boy_Advance"] = "Game Boy Advance",
["Game_Boy_Color"] = "Game Boy Color",
["Game_Boy"] = "Game Boy",
["Sega_Mega_Drive"] = "Sega Mega Drive",
["Sega_Master_System"] = "Sega Master System",
["Sega_Game_Gear"] = "Sega Game Gear",
["MAME_2000"] = "MAME 2000",
["Amiga"] = "Amiga",
["TurboGrafx_16"] = "TurboGrafx-16",
["TurboGrafx_CD"] = "TurboGrafx-CD",
["PC_Engine"] = "PC Engine",
["PC_Engine_CD"] = "PC Engine CD",
["Neo_Geo_Pocket_Color"] = "Neo Geo Pocket Color",
["Sega_CD"] = "Sega CD",
["Sega_32X"] = "Sega 32X",
["Commodore_64"] = "Commodore 64",
["WonderSwan_Color"] = "WonderSwan Color",
["WonderSwan"] = "WonderSwan",
["MSX2"] = "MSX2",
["MSX"] = "MSX",
["ZX_Spectrum"] = "ZX Spectrum",
["Atari_7800"] = "Atari 7800",
["Atari_5200"] = "Atari 5200",
["Atari_2600"] = "Atari 2600",
["Atari_Lynx"] = "Atari Lynx",
["ColecoVision"] = "ColecoVision",
["Vectrex"] = "Vectrex",
["FBA_2012"] = "FBA 2012",
["MAME_2003Plus"] = "MAME 2003 Plus",
["Neo_Geo"] = "Neo Geo",

-- Download
["Download_Covers_colon"] = "Download Covers: ",
["Download_Covers"] = "Download Covers",
["Download_Backgrounds_colon"] = "Download Backgrounds: ",

["All"] = "All",
["Reload_Covers_Database"] = "Reload Covers Database",
["Reload_Backgound_Database"] = "Reload Background Database",
["Internet_Connection_Required"] = "Internet Connection Required",
["Cover"] = "Cover",
["Background"] = "Background",
["Found"] = "Found",
["found_exclamation"] = "found!",
["Cover_not_found"] = "Cover not found",
["Background_not_found"] = "Background not found",
["of"] = " of ",

["Downloading_covers"] = "Downloading covers",
["Downloading_all_covers"] = "Downloading all covers",
["Downloading_PS_Vita_covers"] = "Downloading PS Vita covers",
["Downloading_PSP_covers"] = "Downloading PSP covers",
["Downloading_PS1_covers"] = "Downloading PS1 covers",
["Downloading_N64_covers"] = "Downloading N64 covers",
["Downloading_SNES_covers"] = "Downloading SNES covers",
["Downloading_NES_covers"] = "Downloading NES covers",
["Downloading_GBA_covers"] = "Downloading GBA covers",
["Downloading_GBC_covers"] = "Downloading GBC covers",
["Downloading_GB_covers"] = "Downloading GB covers",
["Downloading_MD_covers"] = "Downloading MD covers",
["Downloading_SMS_covers"] = "Downloading SMS covers",
["Downloading_GG_covers"] = "Downloading GG covers",
["Downloading_MAME_2000_covers"] = "Downloading MAME 2000 covers",
["Downloading_AMIGA_covers"] = "Downloading AMIGA covers",
["Downloading_TG_16_covers"] = "Downloading TG-16 covers",
["Downloading_TG_CD_covers"] = "Downloading TG-CD covers",
["Downloading_PCE_covers"] = "Downloading PCE covers",
["Downloading_PCE_CD_covers"] = "Downloading PCE-CD covers",
["Downloading_NG_PC_covers"] = "Downloading NG-PC covers",
["Downloading_SCD_covers"] = "Downloading SCD covers",
["Downloading_32X_covers"] = "Downloading 32X covers",
["Downloading_C64_covers"] = "Downloading C64 covers",
["Downloading_WSWANCOL_covers"] = "Downloading WSWANCOL covers",
["Downloading_WSWAN_covers"] = "Downloading WSWAN covers",
["Downloading_MSX2_covers"] = "Downloading MSX2 covers",
["Downloading_MSX_covers"] = "Downloading MSX covers",
["Downloading_ZXS_covers"] = "Downloading ZXS covers",
["Downloading_A7800_covers"] = "Downloading A7800 covers",
["Downloading_A5200_covers"] = "Downloading A5200 covers",
["Downloading_A600_covers"] = "Downloading A600 covers",
["Downloading_LYNX_covers"] = "Downloading LYNX covers",
["Downloading_COLECO_covers"] = "Downloading COLECO covers",
["Downloading_VECTREX_covers"] = "Downloading VECTREX covers",
["Downloading_FBA2012_covers"] = "Downloading FBA2012 covers",
["Downloading_MAME_2003_covers"] = "Downloading MAME 2003 covers",
["Downloading_NG_covers"] = "Downloading NG covers",

["Downloading_backgrounds"] = "Downloading backgrounds",
["Downloading_all_backgrounds"] = "Downloading all backgrounds",
["Downloading_PS_Vita_backgrounds"] = "Downloading PS Vita backgrounds",
["Downloading_PSP_backgrounds"] = "Downloading PSP backgrounds",
["Downloading_PS1_backgrounds"] = "Downloading PS1 backgrounds",
["Downloading_N64_backgrounds"] = "Downloading N64 backgrounds",
["Downloading_SNES_backgrounds"] = "Downloading SNES backgrounds",
["Downloading_NES_backgrounds"] = "Downloading NES backgrounds",
["Downloading_GBA_backgrounds"] = "Downloading GBA backgrounds",
["Downloading_GBC_backgrounds"] = "Downloading GBC backgrounds",
["Downloading_GB_backgrounds"] = "Downloading GB backgrounds",
["Downloading_MD_backgrounds"] = "Downloading MD backgrounds",
["Downloading_SMS_backgrounds"] = "Downloading SMS backgrounds",
["Downloading_GG_backgrounds"] = "Downloading GG backgrounds",
["Downloading_MAME_2000_backgrounds"] = "Downloading MAME 2000 backgrounds",
["Downloading_AMIGA_backgrounds"] = "Downloading AMIGA backgrounds",
["Downloading_TG_16_backgrounds"] = "Downloading TG-16 backgrounds",
["Downloading_TG_CD_backgrounds"] = "Downloading TG-CD backgrounds",
["Downloading_PCE_backgrounds"] = "Downloading PCE backgrounds",
["Downloading_PCE_CD_backgrounds"] = "Downloading PCE-CD backgrounds",
["Downloading_NG_PC_backgrounds"] = "Downloading NG-PC backgrounds",
["Downloading_SCD_backgrounds"] = "Downloading SCD backgrounds",
["Downloading_32X_backgrounds"] = "Downloading 32X backgrounds",
["Downloading_C64_backgrounds"] = "Downloading C64 backgrounds",
["Downloading_WSWANCOL_backgrounds"] = "Downloading WSWANCOL backgrounds",
["Downloading_WSWAN_backgrounds"] = "Downloading WSWAN backgrounds",
["Downloading_MSX2_backgrounds"] = "Downloading MSX2 backgrounds",
["Downloading_MSX_backgrounds"] = "Downloading MSX backgrounds",
["Downloading_ZXS_backgrounds"] = "Downloading ZXS backgrounds",
["Downloading_A7800_backgrounds"] = "Downloading A7800 backgrounds",
["Downloading_A5200_backgrounds"] = "Downloading A5200 backgrounds",
["Downloading_A600_backgrounds"] = "Downloading A600 backgrounds",
["Downloading_LYNX_backgrounds"] = "Downloading LYNX backgrounds",
["Downloading_COLECO_backgrounds"] = "Downloading COLECO backgrounds",
["Downloading_VECTREX_backgrounds"] = "Downloading VECTREX backgrounds",
["Downloading_FBA2012_backgrounds"] = "Downloading FBA2012 backgrounds",
["Downloading_MAME_2003_backgrounds"] = "Downloading MAME 2003 backgrounds",
["Downloading_NG_backgrounds"] = "Downloading NG backgrounds",

-- Info Screen
["App_ID_colon"] = "App ID: ",
["Size_colon"] = "Size: ",
["Version_colon"] = "Version: ",
["Download_Cover"] = "Download Cover",
["Download_Background"] = "Download Background",
["Override_Category_colon"] = "Override Category: ",
["Press_X_to_apply_Category"] = "Press X to apply Category",
["Default"] = "Default",
["Favorite"] = "Favorite",
["PS_Vita_Game"] = "PS Vita Game",
["Homebrew"] = "Homebrew",
["PSP_Game"] = "PSP Game",
["PS1_Game"] = "PlayStation Game",
["N64_Game"] = "Nintendo 64 Game",
["SNES_Game"] = "Super Nintendo Game",
["NES_Game"] = "Nintendo Entertainment System Game",
["GBA_Game"] = "Game Boy Advance Game",
["GBC_Game"] = "Game Boy Color Game",
["GB_Game"] = "Game Boy Game",
["MD_Game"] = "Sega Mega Drive Game",
["SMS_Game"] = "Sega Master System Game",
["GG_Game"] = "Sega Game Gear Game",
["MAME_2000_Game"] = "MAME 2000 Game",
["Amiga_Game"] = "Amiga Game",
["TurboGrafx_16_Game"] = "TurboGrafx-16 Game",
["TurboGrafx_CD_Game"] = "TurboGrafx-CD Game",
["PC_Engine_Game"] = "PC Engine Game",
["PC_Engine_CD_Game"] = "PC Engine CD Game",
["Neo_Geo_Pocket_Color_Game"] = "Neo Geo Pocket Color Game",
["SCD_Game"] = "Sega CD Game",
["S32X_Game"] = "Sega 32X Game",
["C64_Game"] = "Commodore 64 Game",
["WSWANCOL_Game"] = "WonderSwan Color Game",
["WSWAN_Game"] = "WonderSwan Game",
["MSX2_Game"] = "MSX2 Game",
["MSX_Game"] = "MSX Game",
["ZXS_Game"] = "ZX Spectrum Game",
["A7800_Game"] = "Atari 7800 Game",
["A5200_Game"] = "Atari 5200 Game",
["A600_Game"] = "Atari 600 Game",
["LYNX_Game"] = "Atari Lynx Game",
["COLECO_Game"] = "ColecoVision Game",
["VECTREX_Game"] = "Vectrex Game",
["FBA2012_Game"] = "FBA 2012 Game",
["MAME2003_Game"] = "MAME 2003 Plus Game",
["Neo_Geo_Game"] = "Neo Geo Game",

-- Missing launcher message
["Please_install_RetroFlow_Adrenaline_Launcher"] = "Please install RetroFlow Adrenaline Launcher.",
["The_VPK_is_saved_here"] = "The VPK is saved here",

-- Search
["Search"] = "Search",
["Search_Results"] = "Search Results",
["Search_No_Results"] = "Press select to search again",

-- Settings Menu
["Categories"] = "Categories",
["Sounds"] = "Sounds",
["Artwork"] = "Artwork",
["Scan_Settings"] = "Scan Settings",
["Adrenaline_roms"] = "Adrenaline games: ",
["All_Category"] = "All Category: ",
["Back_Chevron"] = "<  Back",
["Theme"] = "Theme",
["Game_backgounds_colon"] = "Game Backgrounds: ",
}

function ChangeLanguage()
if #lang_lines>0 then
    for k in pairs (lang_lines) do
        lang_lines [k] = nil
    end
end

local lang = "EN.lua"
 -- 0 EN, 1 EN USA, 2 DE, 3 FR, 4 IT, 5 SP, 6 PT, 7 SW, 8 RU, 9 JA, 10 CN, 11 PL
    if setLanguage == 1 then
        lang = "EN_USA.lua"
    elseif setLanguage == 2 then
        lang = "DE.lua"
    elseif setLanguage == 3 then
        lang = "FR.lua"
    elseif setLanguage == 4 then
        lang = "IT.lua"
    elseif setLanguage == 5 then
        lang = "SP.lua"
    elseif setLanguage == 6 then
        lang = "PT.lua"
    elseif setLanguage == 7 then
        lang = "SW.lua"
    elseif setLanguage == 8 then
        lang = "RU.lua"
    elseif setLanguage == 9 then
        lang = "JA.lua"
    elseif setLanguage == 10 then
        lang = "CN.lua"
    elseif setLanguage == 11 then
        lang = "PL.lua"
    else
        lang = "EN.lua"
    end
    
    -- Import lang file
    if System.doesFileExist("app0:/translations/" .. lang) then
        langfile = {}
        langfile = "app0:/translations/" .. lang
        -- lang_lines = {}
        lang_lines = dofile(langfile)
    else
        -- If missing use default EN table
        lang_lines = lang_default
    end

end
ChangeLanguage()


function TableConcat(t1, t2)
    for i = 1, #t2 do
        t1[#t1 + 1] = t2[i]
    end
    return t1
end


-- GET WALLPAPER - START

-- Add default: workaround hack as game backgrounds only show if setBackground is not 0
wallpaper_table_default =
{
    [1] = 
    {
        ["filename"] = "back_01.jpg",
        ["wallpaper_string"] = lang_lines.Off,
        ["wallpaper_path"] = "app0:/DATA/back_01.jpg",
    },
}

-- Scan wallpaper folder for settings
local wallpaper_table_scanned = {}
files_wallpaper = System.listDirectory("ux0:/data/RetroFlow/WALLPAPER/")
for i, file in pairs(files_wallpaper) do
    if not file.directory then
        if string.match(file.name, ".png") or string.match(file.name, ".jpg") then
            wallpaper_name_noExtension = file.name:match("(.+)%..+$")
            -- wallpaper_name_noExtension = file.name
            file.filename = file.name
            file.wallpaper_string = wallpaper_name_noExtension
            file.wallpaper_path = "ux0:/data/RetroFlow/WALLPAPER/" .. file.name
            table.insert(wallpaper_table_scanned, file)
        end
    end
end
table.sort(wallpaper_table_scanned, function(a, b) return (a.filename:lower() < b.filename:lower()) end)

-- Combine default and scanned, so default is number 1
local wallpaper_table_settings = {}
wallpaper_table_settings = TableConcat(wallpaper_table_default, wallpaper_table_scanned)

-- GET WALLPAPER - END


-- Custom Background

-- If setting is for a deleted wallpaper, set to default
if selectedwall == nil then
    selectedwall = 1
end

if selectedwall > #wallpaper_table_settings then
    setBackground = 1
    SaveSettings()
end

local imgCustomBack = imgBack
if selectedwall == 0 or selectedwall > #wallpaper_table_settings then
else
    local selected_wallpaper_path = tostring(wallpaper_table_settings[selectedwall].wallpaper_path)
    if selected_wallpaper_path == nil then
        setBackground = 0
        SaveSettings()
    else
        if System.doesFileExist(wallpaper_table_settings[selectedwall].wallpaper_path) then
            imgCustomBack = Graphics.loadImage(wallpaper_table_settings[selectedwall].wallpaper_path)
            Graphics.setImageFilters(imgCustomBack, FILTER_LINEAR, FILTER_LINEAR)
            Render.useTexture(modBackground, imgCustomBack)
        end
    end
end


-- Menu Layout
    btnMargin = 32 -- Distance between footer buttons

    -- Setting screen positions

    -- Horizontal positions
    setting_x = 78
    if setLanguage == 3 then -- French language fix
        setting_x_offset = 435
    else
        setting_x_offset = 365
    end
    setting_x_icon = 75
    setting_x_icon_offset = 115

    -- Vertical positions
    setting_yh = 56
    setting_y0 = 110
    setting_y1 = 160
    setting_y2 = 210
    setting_y3 = 260
    setting_y4 = 310
    setting_y5 = 360
    setting_y6 = 410



-- Message - Check if RetroFlow Adrenaline Launcher needs to be installed
    if not System.doesAppExist("RETROLNCR") then
        if System.doesDirExist("ux0:/pspemu") then
            System.setMessage(lang_lines.Please_install_RetroFlow_Adrenaline_Launcher .. "\n" .. lang_lines.The_VPK_is_saved_here .. "\n\nux0:/app/RETROFLOW/payloads/\nRetroFlow Adrenaline Launcher.vpk", false, BUTTON_OK)
            --                Please install RetroFlow Adrenaline Launcher.     The VPK is saved here:
        else
        end
    end


function PrintCentered(font, x, y, text, color, size)
    text = text:gsub("\n","")
    local width = Font.getTextWidth(font,text)
    Font.print(font, x - width / 2, y, text, color)
end


function FreeMemory()
    if System.doesFileExist(cur_dir .. "/Music.mp3") then
        Sound.close(sndMusic)
    end
    Sound.close(click)
    Graphics.freeImage(imgCoverTmp)
    Graphics.freeImage(btnX)
    Graphics.freeImage(btnT)
    Graphics.freeImage(btnS)
    Graphics.freeImage(btnO)
    Graphics.freeImage(imgWifi)
    Graphics.freeImage(imgBack)
    Graphics.freeImage(imgBattery)
    Graphics.freeImage(imgBox)
    Graphics.freeImage(imgFavorite_small_on)
    Graphics.freeImage(imgFavorite_small_off)
    Graphics.freeImage(imgFavorite_small_blank)
    Graphics.freeImage(imgFavorite_large_on)
    Graphics.freeImage(imgFavorite_large_off)
    Graphics.freeImage(setting_icon_theme)
    Graphics.freeImage(setting_icon_artwork)
    Graphics.freeImage(setting_icon_categories)
    Graphics.freeImage(setting_icon_language)
    Graphics.freeImage(setting_icon_scanning)
    Graphics.freeImage(setting_icon_search)
    Graphics.freeImage(setting_icon_sounds)
    Graphics.freeImage(setting_icon_about)
end


-- Manipulate Rom Name - remove region code and url encode spaces for image download
function cleanRomNames()
    -- file.name = {}
    -- romname_withExtension = file.name
    romname_noExtension = {}
    romname_noExtension = romname_withExtension:match("(.+)%..+$")

    -- remove space before parenthesis " (" then letters and numbers "(.*)"
    romname_noRegion_noExtension = {}
    romname_noRegion_noExtension = romname_noExtension:gsub(" %(", "%("):gsub('%b()', '')

    romname_url_encoded = {}
    romname_url_encoded = romname_noExtension:gsub("%s+", '%%%%20')

    -- Check if name contains parenthesis, if yes strip out to show as version
    if string.find(romname_noExtension, "%(") then
        -- Remove all text except for within "()"
        romname_region_initial = {}
        romname_region_initial = romname_noExtension:match("%((.+)%)")

        -- Tidy up remainder when more than one set of parenthesis used, replace  ") (" with ", "
        romname_region = {}
        romname_region = romname_region_initial:gsub("%) %(", ', ')
    -- If no parenthesis, then add blank to prevent nil error
    else
        -- romname_region = " "
        romname_region = " "
    end
end


-- Manipulate Rom Name - remove region code and url encode spaces for image download
function cleanRomNamesPSP()
    -- file.name = {}
    -- romname_withExtension = file.name
    romname_noExtension = {}
    romname_noExtension = romname_withExtension:match("(.+)%..+$")

    romname_noExtension_notitleid = {}
    romname_noExtension_notitleid = romname_noExtension:gsub(' %b[]', '')

    -- remove space before parenthesis " (" then letters and numbers "(.*)"
    romname_noRegion_noExtension = {}
    romname_noRegion_noExtension = romname_noExtension:gsub(" %(", "%("):gsub('%b()', '')

    romname_noRegion_noExtension_notitleid = {}
    romname_noRegion_noExtension_notitleid = romname_noRegion_noExtension:gsub(" %[", "%["):gsub('%b[]', '') -- game without [ULUS-0000]

    titleID_withHyphen = {}
    titleID_withHyphen = romname_noExtension:match("%[(.+)%]") -- game id without brackets, with hypen ULUS-0000

    titleID_noHyphen = {}
    titleID_noHyphen = tostring(titleID_withHyphen):gsub("%-", '') -- game id without brackets, with hypen ULUS-0000

    romname_url_encoded = {}
    romname_url_encoded = tostring(titleID_noHyphen)

    -- Check if name contains parenthesis, if yes strip out to show as version
    if string.find(romname_noExtension, "%(") then
        -- Remove all text except for within "()"
        romname_region_initial = {}
        romname_region_initial = romname_noExtension:match("%((.+)%)")

        -- Tidy up remainder when more than one set of parenthesis used, replace  ") (" with ", "
        romname_region = {}
        romname_region = romname_region_initial:gsub("%) %(", ', ')
    -- If no parenthesis, then add blank to prevent nil error
    else
        -- romname_region = " "
        romname_region = " "
    end

    if string.match(titleID_noHyphen, "nil") then
        titleID_noHyphen = romname_noExtension
    end

end


function launch_Adrenaline()

    -- Delete the old Adrenaline inf file
    if  System.doesFileExist(launch_dir_adr .. "data/boot.inf") then
        System.deleteFile(launch_dir_adr .. "data/boot.inf")
    end

    -- Delete the old Adrenaline bin file
    if  System.doesFileExist(launch_dir_adr .. "data/boot.bin") then
        System.deleteFile(launch_dir_adr .. "data/boot.bin")
    end

    -- Create Boot.inf
    local file_boot = System.openFile("ux0:/app/RETROLNCR/data/boot.inf", FCREATE)
    System.closeFile(file_boot)

    file = io.open("ux0:/app/RETROLNCR/data/boot.inf", "w")
    file:write(rom_location)
    file:close()

    System.launchApp("RETROLNCR")

end


function clean_launch_dir()
    
    -- Load repatch    
    plug_repatch_ex = System.loadKernelPlugin("ux0:/app/RETROFLOW/modules/repatch_ex.skprx")

    -- Create rePatch directory if doesn't exist
    if not System.doesDirExist("ux0:/rePatch") then
        System.createDirectory("ux0:/rePatch")
    end

    -- Create launch directory if doesn't exist
    if not System.doesDirExist(launch_dir) then
        System.createDirectory(launch_dir)
    end

    -- Delete the old rom file
    if  System.doesFileExist(launch_dir .. "rom.txt") then
        System.deleteFile(launch_dir .. "rom.txt")
    end

    -- Delete the old core file
    if  System.doesFileExist(launch_dir .. "core.txt") then
        System.deleteFile(launch_dir .. "core.txt")
    end

    -- Delete the old N64 args file
    if  System.doesFileExist(launch_dir .. "args.txt") then
        System.deleteFile(launch_dir .. "args.txt")
    end
end


function launch_retroarch(def_core_name)

    clean_launch_dir()

    -- Create rom.txt
    local file_over = System.openFile(launch_dir .. "rom.txt", FCREATE)
    System.closeFile(file_over)

    rom_txt_file = io.open(launch_dir .. "rom.txt", "w")
    rom_txt_file:write(rom_location)
    rom_txt_file:close()

    -- Create core.txt
    local file_over = System.openFile(launch_dir .. "core.txt", FCREATE)
    System.closeFile(file_over)

    core_txt_file = io.open(launch_dir .. "core.txt", "w")
    core_txt_file:write((def_core_name))
    core_txt_file:close()

    System.launchEboot("app0:/launch_retroarch.bin")
end


function launch_DaedalusX64()

    clean_launch_dir()

    -- Create args.txt
    local file_over = System.openFile(launch_dir .. "args.txt", FCREATE)
    System.closeFile(file_over)

    args_txt_file = io.open(launch_dir .. "args.txt", "w")
    args_txt_file:write(rom_location)
    args_txt_file:close()

    System.launchEboot("app0:/launch_n64.bin")
end


-- function CreateUserTitleTable_Vita()

--     table.sort(vita_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)

--     local file_over = System.openFile(user_DB_Folder .. "vita.lua", FCREATE)
--     System.closeFile(file_over)

--     file = io.open(user_DB_Folder .. "vita.lua", "w")
--     file:write('return {' .. "\n")
--     for k, v in pairs(vita_table) do

--         file:write('["' .. v.name .. '"] = {app_title = "' .. string.gsub(v.title,"\n"," ") .. '", titleid = "' .. v.name .. '", version = "' .. v.version .. '"},' .. "\n")

--     end
--     file:write('}')
--     file:close()

-- end

function CreateUserTitleTable_PSP_game(def_user_db_file)

    table.sort(psp_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)

    local file_over = System.openFile(user_DB_Folder .. (def_user_db_file), FCREATE)
    System.closeFile(file_over)

    file = io.open(user_DB_Folder .. (def_user_db_file), "w")
    file:write('return {' .. "\n")
    for k, v in pairs(psp_table) do

        if v.directory == true then
            file:write('["' .. v.name .. '"] = {name = "' .. v.name_title_search .. '"},' .. "\n")
        end
    end
    file:write('}')
    file:close()

end


function CreateUserTitleTable_PSX(def_user_db_file)

    table.sort(psx_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)

    local file_over = System.openFile(user_DB_Folder .. (def_user_db_file), FCREATE)
    System.closeFile(file_over)

    file = io.open(user_DB_Folder .. (def_user_db_file), "w")
    file:write('return {' .. "\n")
    for k, v in pairs(psx_table) do

        if v.directory == true then
            file:write('["' .. v.name .. '"] = {name = "' .. v.name_title_search .. '"},' .. "\n")
        end
    end
    file:write('}')
    file:close()
    
end


function CreateUserTitleTable_PSP_iso(def_user_db_file)

    table.sort(psp_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)

    local file_over = System.openFile(user_DB_Folder .. (def_user_db_file), FCREATE)
    System.closeFile(file_over)

    file = io.open(user_DB_Folder .. (def_user_db_file), "w")
    file:write('return {' .. "\n")
    for k, v in pairs(psp_table) do

        if v.directory == false then
            file:write('["' .. v.name .. '"] = {name = "' .. v.name_title_search .. '"},' .. "\n")
        end
    end
    file:write('}')
    file:close()

end

function CreateUserTitleTable_for_File(def_user_db_file, def_table_name)

    table.sort((def_table_name), function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)

    local file_over = System.openFile(user_DB_Folder .. (def_user_db_file), FCREATE)
    System.closeFile(file_over)

    file = io.open(user_DB_Folder .. (def_user_db_file), "w")
    file:write('return {' .. "\n")
    for k, v in pairs((def_table_name)) do

        if v.directory == false then
            file:write('["' .. v.name .. '"] = {name = "' .. v.name_title_search .. '"},' .. "\n")
        end
    end
    file:write('}')
    file:close()

end


function update_md_regional_cover()
    -- Megadrive, update regional missing cover
    if setLanguage == 1 then
        for k, v in pairs(md_table) do
              if v.icon_path=="ux0:/app/RETROFLOW/DATA/missing_cover_md.png" then
                  v.icon_path="ux0:/app/RETROFLOW/DATA/missing_cover_md_usa.png"
              end
        end
    end
end


function import_recently_played()

    local file_over = System.openFile(cur_dir .. "/overrides.dat", FREAD)
    local filesize = System.sizeFile(file_over)
    local str = System.readFile(file_over, filesize)
    System.closeFile(file_over)

    -- RECENTLY PLAYED
    if showRecentlyPlayed == 1 then
        if System.doesFileExist("ux0:/data/RetroFlow/recently_played.lua") then
            db_Cache_recently_played = "ux0:/data/RetroFlow/recently_played.lua"

            local db_recently_played = {}
            db_recently_played = dofile(db_Cache_recently_played)

            for k, v in ipairs(db_recently_played) do
                -- Check rom exists
                -- If file
                if v.directory == false then
                    if System.doesFileExist(v.game_path) then
                        if showHomebrews == 0 then
                             -- ignore homebrew apps
                            if v.app_type > 0 then
                                table.insert(recently_played_table, v)
                                --add blank icon to all
                                v.icon = imgCoverTmp
                                v.icon_path = v.icon_path
                                v.apptitle = v.apptitle
                            else
                            end
                        else
                        -- Import all
                            table.insert(recently_played_table, v)
                            --add blank icon to all
                            v.icon = imgCoverTmp
                            v.icon_path = v.icon_path
                            v.apptitle = v.apptitle
                        end
                    else
                    end
                else
                    -- Not file, is folder
                    if System.doesDirExist(v.game_path) then
                        if showHomebrews == 0 then
                             -- ignore homebrew apps
                            if v.app_type > 0 then
                                table.insert(recently_played_table, v)
                                --add blank icon to all
                                v.icon = imgCoverTmp
                                v.icon_path = v.icon_path
                                v.apptitle = v.apptitle
                            else
                            end
                        else
                        -- Import all
                            table.insert(recently_played_table, v)
                            --add blank icon to all
                            v.icon = imgCoverTmp
                            v.icon_path = v.icon_path
                            v.apptitle = v.apptitle
                        end
                    else
                    end
                end

            end

            -- apply_overrides_to_recently_played
            if System.doesFileExist(cur_dir .. "/overrides.dat") then
                
                for k, v in pairs(recently_played_table) do

                    if string.match(str, v.name .. "=1") then
                        v.app_type=1
                        v.cover_path_online = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/PSVita/"
                        v.cover_path_local = "ux0:/data/RetroFlow/COVERS/Sony - PlayStation Vita/"

                        if "ux0:/data/RetroFlow/COVERS/Sony - PlayStation Vita/" .. v.apptitle .. ".png" and System.doesFileExist("ux0:/data/RetroFlow/COVERS/Sony - PlayStation Vita/" .. v.apptitle .. ".png") then
                            v.icon_path = "ux0:/data/RetroFlow/COVERS/Sony - PlayStation Vita/" .. v.apptitle .. ".png" --custom cover by app name
                        elseif "ux0:/data/RetroFlow/COVERS/Sony - PlayStation Vita/" .. v.name .. ".png" and System.doesFileExist("ux0:/data/RetroFlow/COVERS/Sony - PlayStation Vita/" .. v.name .. ".png") then
                            v.icon_path = "ux0:/data/RetroFlow/COVERS/Sony - PlayStation Vita/" .. v.name .. ".png" --custom cover by app id
                        else
                            if System.doesFileExist("ur0:/appmeta/" .. v.name .. "/icon0.png") then
                                v.icon_path = "ur0:/appmeta/" .. v.name .. "/icon0.png"  --app icon
                            else
                                v.icon_path = "app0:/DATA/noimg.png" --blank grey
                            end
                        end

                    elseif string.match(str, v.name .. "=2") then
                        v.app_type=2
                        v.cover_path_online = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/PSP/"
                        v.cover_path_local = "ux0:/data/RetroFlow/COVERS/Sony - PlayStation Portable/"

                        if "ux0:/data/RetroFlow/COVERS/Sony - PlayStation Portable/" .. v.apptitle .. ".png" and System.doesFileExist("ux0:/data/RetroFlow/COVERS/Sony - PlayStation Portable/" .. v.apptitle .. ".png") then
                            v.icon_path = "ux0:/data/RetroFlow/COVERS/Sony - PlayStation Portable/" .. v.apptitle .. ".png" --custom cover by app name
                        elseif "ux0:/data/RetroFlow/COVERS/Sony - PlayStation Portable/" .. v.name .. ".png" and System.doesFileExist("ux0:/data/RetroFlow/COVERS/Sony - PlayStation Portable/" .. v.name .. ".png") then
                            v.icon_path = "ux0:/data/RetroFlow/COVERS/Sony - PlayStation Portable/" .. v.name .. ".png" --custom cover by app id
                        else
                            if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psp.png") then
                                v.icon_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psp.png"  --app icon
                            else
                                v.icon_path = "app0:/DATA/noimg.png" --blank grey
                            end
                        end

                    elseif string.match(str, v.name .. "=3") then
                        v.app_type=3
                        v.cover_path_online = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/PS1/"
                        v.cover_path_local = "ux0:/data/RetroFlow/COVERS/Sony - PlayStation/"

                        if "ux0:/data/RetroFlow/COVERS/Sony - PlayStation/" .. v.apptitle .. ".png" and System.doesFileExist("ux0:/data/RetroFlow/COVERS/Sony - PlayStation/" .. v.apptitle .. ".png") then
                            v.icon_path = "ux0:/data/RetroFlow/COVERS/Sony - PlayStation/" .. v.apptitle .. ".png" --custom cover by app name
                        elseif "ux0:/data/RetroFlow/COVERS/Sony - PlayStation/" .. v.name .. ".png" and System.doesFileExist("ux0:/data/RetroFlow/COVERS/Sony - PlayStation/" .. v.name .. ".png") then
                            v.icon_path = "ux0:/data/RetroFlow/COVERS/Sony - PlayStation/" .. v.name .. ".png" --custom cover by app id
                        else
                            if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psx.png") then
                                v.icon_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psx.png"  --app icon
                            else
                                v.icon_path = "app0:/DATA/noimg.png" --blank grey
                            end
                        end

                    elseif string.match(str, v.name .. "=4") then
                        v.app_type=0
                        v.cover_path_online = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/HOMEBREW/"
                        v.cover_path_local = "ux0:/data/RetroFlow/COVERS/Homebrew/"

                        if "ux0:/data/RetroFlow/COVERS/Homebrew/" .. v.apptitle .. ".png" and System.doesFileExist("ux0:/data/RetroFlow/COVERS/Homebrew/" .. v.apptitle .. ".png") then
                            v.icon_path = "ux0:/data/RetroFlow/COVERS/Homebrew/" .. v.apptitle .. ".png" --custom cover by app name
                        elseif "ux0:/data/RetroFlow/COVERS/Homebrew/" .. v.name .. ".png" and System.doesFileExist("ux0:/data/RetroFlow/COVERS/Homebrew/" .. v.name .. ".png") then
                            v.icon_path = "ux0:/data/RetroFlow/COVERS/Homebrew/" .. v.name .. ".png" --custom cover by app id
                        else
                            if System.doesFileExist("ur0:/appmeta/" .. v.name .. "/icon0.png") then
                                v.icon_path = "ur0:/appmeta/" .. v.name .. "/icon0.png"  --app icon
                            else
                                v.icon_path = "app0:/DATA/noimg.png" --blank grey
                            end
                        end

                    else
                        -- Fix for existing lists which don't have the snap path local entry
                        if v.snap_path_local == nil then
                            v.snap_path_local = ""
                        end 

                    end
                end
            end

        end
    else
    end
end


function listDirectory(dir)
    dir = System.listDirectory(dir)
    -- vita_table = {}
    folders_table = {}
    files_table = {}
    games_table = {}
    homebrews_table = {}
    psp_table = {}
    psx_table = {}
    n64_table = {}
    snes_table = {}
    nes_table = {}
    gba_table = {}
    gbc_table = {}
    gb_table = {}
    sega_cd_table = {}
    s32x_table = {}
    md_table = {}
    sms_table = {}
    gg_table = {}
    tg16_table = {}
    tgcd_table = {}
    pce_table = {}
    pcecd_table = {}
    amiga_table = {}
    c64_table = {}
    wswan_col_table = {}
    wswan_table = {}
    msx2_table = {}
    msx1_table = {}
    zxs_table = {}
    atari_7800_table = {}
    atari_5200_table = {}
    atari_2600_table = {}
    atari_lynx_table = {}
    colecovision_table = {}
    vectrex_table = {}
    fba_table = {}
    mame_2003_plus_table = {}
    mame_2000_table = {}
    neogeo_table = {} 
    ngpc_table = {}
    recently_played_table = {}
    search_results_table = {}

    -- psxdbfull = {}
    -- pspdbfull = {}
    -- mamedbfull = {}

    local customCategory = 0
    
    local file_over = System.openFile(cur_dir .. "/overrides.dat", FREAD)
    local filesize = System.sizeFile(file_over)
    local str = System.readFile(file_over, filesize)
    System.closeFile(file_over)

    local fileFav_over = System.openFile(cur_dir .. "/favorites.dat", FREAD)
    local fileFavsize = System.sizeFile(fileFav_over)
    local strFav = System.readFile(fileFav_over, fileFavsize)
    System.closeFile(fileFav_over)

    for i, file in pairs(dir) do
    local custom_path, custom_path_id, app_type = nil, nil, nil


        if file.directory
            and not string.match(file.name, "RETROFLOW") -- Don't index Retroflow
            and not string.match(file.name, "RETROLNCR") -- Don't index Retroflow Adrenaline Launcher
            and not string.match(file.name, "ADRLANCHR") -- Don't index Adrenaline Launcher
            and not System.doesFileExist(working_dir .. "/" .. file.name .. "/data/boot.bin") -- Don't scan PSP and PSX Bubbles
            then


            -- check if game is in the favorites list
            if System.doesFileExist(cur_dir .. "/favorites.dat") then
                if string.find(strFav, file.name,1,true) ~= nil then
                    file.favourite = true
                else
                    file.favourite = false
                end
            end

            -- Load previous matches
            -- if System.doesFileExist(user_DB_Folder .. "vita.lua") then
            --     database_rename_VITA = user_DB_Folder .. "vita.lua"
            --     vitadb = dofile(database_rename_VITA)
            -- else
            --     vitadb = {}
            -- end

            -- vita_search = vitadb[file.name]

            -- if vita_search == nil then
            --     -- get app name to match with custom cover file name
            --     if System.doesFileExist(working_dir .. "/" .. file.name .. "/sce_sys/param.sfo") then
            --         info = System.extractSfo(working_dir .. "/" .. file.name .. "/sce_sys/param.sfo")
            --         app_title = info.title
            --         file.titleid = tostring(info.titleid)
            --         file.version = tostring(info.version)
            --     end
            -- else
            --     app_title = tostring(vitadb[file.name].app_title)
            --     file.titleid = tostring(vitadb[file.name].titleid)
            --     file.version = tostring(vitadb[file.name].version)
            -- end


            -- get app name to match with custom cover file name
            if System.doesFileExist(working_dir .. "/" .. file.name .. "/sce_sys/param.sfo") then
                info = System.extractSfo(working_dir .. "/" .. file.name .. "/sce_sys/param.sfo")
                app_title = info.title:gsub("\n"," ")
                file.titleid = tostring(info.titleid)
                file.version = tostring(info.version)
            end

            file.game_path = (working_dir .. "/" .. file.name)

            file.filename = file.name
            file.name = file.name
            file.title = app_title
            file.name_online = file.name
            file.version = file.version
            file.name_title_search = file.name
            file.apptitle = app_title
            file.date_played = 0

            -- Added for caching sfo scan results
            -- table.insert(vita_table, file)

            if string.match(file.name, "PCS") and not string.match(file.name, "PCSI") then
                
                
                --CHECK FOR OVERRIDDEN CATEGORY of VITA game
                if System.doesFileExist(cur_dir .. "/overrides.dat") then
                    
                    --0 default, 1 vita, 2 psp, 3 psx, 4 homebrew

                    -- VITA
                    if string.match(str, file.name .. "=1") then
                        table.insert(games_table, file)

                        table.insert(folders_table, file)
                        file.app_type=1

                        file.cover_path_online = SystemsToScan[1].onlineCoverPathSystem
                        file.cover_path_local = SystemsToScan[1].localCoverPath
                        file.snap_path_online = SystemsToScan[1].onlineSnapPathSystem
                        file.snap_path_local = SystemsToScan[1].localSnapPath

                        if SystemsToScan[1].localCoverPath .. app_title .. ".png" and System.doesFileExist(SystemsToScan[1].localCoverPath .. app_title .. ".png") then
                            img_path = SystemsToScan[1].localCoverPath .. app_title .. ".png" --custom cover by app name
                        elseif SystemsToScan[1].localCoverPath .. file.name .. ".png" and System.doesFileExist(SystemsToScan[1].localCoverPath .. file.name .. ".png") then
                            img_path = SystemsToScan[1].localCoverPath .. file.name .. ".png" --custom cover by app id
                        else
                            if System.doesFileExist("ur0:/appmeta/" .. file.name .. "/icon0.png") then
                                img_path = "ur0:/appmeta/" .. file.name .. "/icon0.png"  --app icon
                            else
                                img_path = "app0:/DATA/noimg.png" --blank grey
                            end
                        end

                    -- PSP
                    elseif string.match(str, file.name .. "=2") then
                        table.insert(psp_table, file)

                        table.insert(folders_table, file)
                        file.app_type=2

                        file.cover_path_online = SystemsToScan[3].onlineCoverPathSystem
                        file.cover_path_local = SystemsToScan[3].localCoverPath
                        file.snap_path_online = SystemsToScan[3].onlineSnapPathSystem
                        file.snap_path_local = SystemsToScan[3].localSnapPath

                        if SystemsToScan[3].localCoverPath .. app_title .. ".png" and System.doesFileExist(SystemsToScan[3].localCoverPath .. app_title .. ".png") then
                            img_path = SystemsToScan[3].localCoverPath .. app_title .. ".png" --custom cover by app name
                        elseif SystemsToScan[3].localCoverPath .. file.name .. ".png" and System.doesFileExist(SystemsToScan[3].localCoverPath .. file.name .. ".png") then
                            img_path = SystemsToScan[3].localCoverPath .. file.name .. ".png" --custom cover by app id
                        else
                            if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psp.png") then
                                img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psp.png"  --app icon
                            else
                                img_path = "app0:/DATA/noimg.png" --blank grey
                            end
                        end

                    -- PSX
                    elseif string.match(str, file.name .. "=3") then
                        table.insert(psx_table, file)

                        table.insert(folders_table, file)
                        file.app_type=3

                        file.cover_path_online = SystemsToScan[4].onlineCoverPathSystem
                        file.cover_path_local = SystemsToScan[4].localCoverPath
                        file.snap_path_online = SystemsToScan[4].onlineSnapPathSystem
                        file.snap_path_local = SystemsToScan[4].localSnapPath

                        if SystemsToScan[4].localCoverPath .. app_title .. ".png" and System.doesFileExist(SystemsToScan[4].localCoverPath .. app_title .. ".png") then
                            img_path = SystemsToScan[4].localCoverPath .. app_title .. ".png" --custom cover by app name
                        elseif SystemsToScan[4].localCoverPath .. file.name .. ".png" and System.doesFileExist(SystemsToScan[4].localCoverPath .. file.name .. ".png") then
                            img_path = SystemsToScan[4].localCoverPath .. file.name .. ".png" --custom cover by app id
                        else
                            if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psx.png") then
                                img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psx.png"  --app icon
                            else
                                img_path = "app0:/DATA/noimg.png" --blank grey
                            end
                        end

                    -- HOMEBREW
                    elseif string.match(str, file.name .. "=4") then
                        -- Homebrew
                        table.insert(homebrews_table, file)

                        table.insert(folders_table, file)
                        file.app_type=0

                        file.cover_path_online = SystemsToScan[2].onlineCoverPathSystem
                        file.cover_path_local = SystemsToScan[2].localCoverPath
                        file.snap_path_online = SystemsToScan[2].onlineSnapPathSystem
                        file.snap_path_local = SystemsToScan[2].localSnapPath

                        if SystemsToScan[2].localCoverPath .. app_title .. ".png" and System.doesFileExist(SystemsToScan[2].localCoverPath .. app_title .. ".png") then
                            img_path = SystemsToScan[2].localCoverPath .. app_title .. ".png" --custom cover by app name
                        elseif SystemsToScan[2].localCoverPath .. file.name .. ".png" and System.doesFileExist(SystemsToScan[2].localCoverPath .. file.name .. ".png") then
                            img_path = SystemsToScan[2].localCoverPath .. file.name .. ".png" --custom cover by app id
                        else
                            if System.doesFileExist("ur0:/appmeta/" .. file.name .. "/icon0.png") then
                                img_path = "ur0:/appmeta/" .. file.name .. "/icon0.png"  --app icon
                            else
                                img_path = "app0:/DATA/noimg.png" --blank grey
                            end
                        end

                    -- DEFAULT - VITA
                    else
                        table.insert(games_table, file)

                        table.insert(folders_table, file)
                        file.app_type=1

                        file.cover_path_local = SystemsToScan[1].localCoverPath
                        file.cover_path_online = SystemsToScan[1].onlineCoverPathSystem
                        file.snap_path_online = SystemsToScan[1].onlineSnapPathSystem
                        file.snap_path_local = SystemsToScan[1].localSnapPath

                        if SystemsToScan[1].localCoverPath .. app_title .. ".png" and System.doesFileExist(SystemsToScan[1].localCoverPath .. app_title .. ".png") then
                            img_path = SystemsToScan[1].localCoverPath .. app_title .. ".png" --custom cover by app name
                        elseif SystemsToScan[1].localCoverPath .. file.name .. ".png" and System.doesFileExist(SystemsToScan[1].localCoverPath .. file.name .. ".png") then
                            img_path = SystemsToScan[1].localCoverPath .. file.name .. ".png" --custom cover by app id
                        else
                            if System.doesFileExist("ur0:/appmeta/" .. file.name .. "/icon0.png") then
                                img_path = "ur0:/appmeta/" .. file.name .. "/icon0.png"  --app icon
                            else
                                img_path = "app0:/DATA/noimg.png" --blank grey
                            end
                        end

                    end

                -- NO OVERRIDE - VITA
                else
                    table.insert(games_table, file)

                    table.insert(folders_table, file)
                    file.app_type=1

                    file.cover_path_online = SystemsToScan[1].onlineCoverPathSystem
                    file.cover_path_local = SystemsToScan[1].localCoverPath
                    file.snap_path_online = SystemsToScan[1].onlineSnapPathSystem
                    file.snap_path_local = SystemsToScan[1].localSnapPath

                    if SystemsToScan[1].localCoverPath .. app_title .. ".png" and System.doesFileExist(SystemsToScan[1].localCoverPath .. app_title .. ".png") then
                        img_path = SystemsToScan[1].localCoverPath .. app_title .. ".png" --custom cover by app name
                    elseif SystemsToScan[1].localCoverPath .. file.name .. ".png" and System.doesFileExist(SystemsToScan[1].localCoverPath .. file.name .. ".png") then
                        img_path = SystemsToScan[1].localCoverPath .. file.name .. ".png" --custom cover by app id
                    else
                        if System.doesFileExist("ur0:/appmeta/" .. file.name .. "/icon0.png") then
                            img_path = "ur0:/appmeta/" .. file.name .. "/icon0.png"  --app icon
                        else
                            img_path = "app0:/DATA/noimg.png" --blank grey
                        end
                    end

                end
                --END OVERRIDDEN CATEGORY of Vita game

            else
                
                
            --CHECK FOR OVERRIDDEN CATEGORY of HOMEBREW game
                if System.doesFileExist(cur_dir .. "/overrides.dat") then
                    --0 default, 1 vita, 2 psp, 3 psx, 4 homebrew

                    -- VITA
                    if string.match(str, file.name .. "=1") then
                        table.insert(games_table, file)

                        table.insert(folders_table, file)
                        file.app_type=1

                        file.cover_path_online = SystemsToScan[1].onlineCoverPathSystem
                        file.cover_path_local = SystemsToScan[1].localCoverPath
                        file.snap_path_online = SystemsToScan[1].onlineSnapPathSystem
                        file.snap_path_local = SystemsToScan[1].localSnapPath

                        if SystemsToScan[1].localCoverPath .. app_title .. ".png" and System.doesFileExist(SystemsToScan[1].localCoverPath .. app_title .. ".png") then
                            img_path = SystemsToScan[1].localCoverPath .. app_title .. ".png" --custom cover by app name
                        elseif SystemsToScan[1].localCoverPath .. file.name .. ".png" and System.doesFileExist(SystemsToScan[1].localCoverPath .. file.name .. ".png") then
                            img_path = SystemsToScan[1].localCoverPath .. file.name .. ".png" --custom cover by app id
                        else
                            if System.doesFileExist("ur0:/appmeta/" .. file.name .. "/icon0.png") then
                                img_path = "ur0:/appmeta/" .. file.name .. "/icon0.png"  --app icon
                            else
                                img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psv.png" --blank grey
                            end
                        end

                    -- PSP
                    elseif string.match(str, file.name .. "=2") then
                        table.insert(psp_table, file)

                        table.insert(folders_table, file)
                        file.app_type=2

                        file.cover_path_online = SystemsToScan[3].onlineCoverPathSystem
                        file.cover_path_local = SystemsToScan[3].localCoverPath
                        file.snap_path_online = SystemsToScan[3].onlineSnapPathSystem
                        file.snap_path_local = SystemsToScan[3].localSnapPath

                        if SystemsToScan[3].localCoverPath .. app_title .. ".png" and System.doesFileExist(SystemsToScan[3].localCoverPath .. app_title .. ".png") then
                            img_path = SystemsToScan[3].localCoverPath .. app_title .. ".png" --custom cover by app name
                        elseif SystemsToScan[3].localCoverPath .. file.name .. ".png" and System.doesFileExist(SystemsToScan[3].localCoverPath .. file.name .. ".png") then
                            img_path = SystemsToScan[3].localCoverPath .. file.name .. ".png" --custom cover by app id
                        else
                            if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psp.png") then
                                img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psp.png"  --app icon
                            else
                                img_path = "app0:/DATA/noimg.png" --blank grey
                            end
                        end
                    
                    -- PSX
                    elseif string.match(str, file.name .. "=3") then
                        table.insert(psx_table, file)

                        table.insert(folders_table, file)
                        file.app_type=3

                        file.cover_path_online = SystemsToScan[4].onlineCoverPathSystem
                        file.cover_path_local = SystemsToScan[4].localCoverPath
                        file.snap_path_online = SystemsToScan[4].onlineSnapPathSystem
                        file.snap_path_local = SystemsToScan[4].localSnapPath

                        if SystemsToScan[4].localCoverPath .. app_title .. ".png" and System.doesFileExist(SystemsToScan[4].localCoverPath .. app_title .. ".png") then
                            img_path = SystemsToScan[4].localCoverPath .. app_title .. ".png" --custom cover by app name
                        elseif SystemsToScan[4].localCoverPath .. file.name .. ".png" and System.doesFileExist(SystemsToScan[4].localCoverPath .. file.name .. ".png") then
                            img_path = SystemsToScan[4].localCoverPath .. file.name .. ".png" --custom cover by app id
                        else
                            if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psx.png") then
                                img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psx.png"  --app icon
                            else
                                img_path = "app0:/DATA/noimg.png" --blank grey
                            end
                        end


                    -- HOMEBREW
                    elseif string.match(str, file.name .. "=4") then
                        table.insert(homebrews_table, file)

                        table.insert(folders_table, file)
                        file.app_type=0

                        file.cover_path_online = SystemsToScan[2].onlineCoverPathSystem
                        file.cover_path_local = SystemsToScan[2].localCoverPath
                        file.snap_path_online = SystemsToScan[2].onlineSnapPathSystem
                        file.snap_path_local = SystemsToScan[2].localSnapPath

                        if SystemsToScan[2].localCoverPath .. app_title .. ".png" and System.doesFileExist(SystemsToScan[2].localCoverPath .. app_title .. ".png") then
                            img_path = SystemsToScan[2].localCoverPath .. app_title .. ".png" --custom cover by app name
                        elseif SystemsToScan[2].localCoverPath .. file.name .. ".png" and System.doesFileExist(SystemsToScan[2].localCoverPath .. file.name .. ".png") then
                            img_path = SystemsToScan[2].localCoverPath .. file.name .. ".png" --custom cover by app id
                        else
                            if System.doesFileExist("ur0:/appmeta/" .. file.name .. "/icon0.png") then
                                img_path = "ur0:/appmeta/" .. file.name .. "/icon0.png"  --app icon
                            else
                                img_path = "app0:/DATA/noimg.png" --blank grey
                            end
                        end

                    -- DEFAULT - HOMEBREW
                    else
                        table.insert(homebrews_table, file)

                        table.insert(folders_table, file)
                        file.app_type=0

                        file.cover_path_online = SystemsToScan[2].onlineCoverPathSystem
                        file.cover_path_local = SystemsToScan[2].localCoverPath
                        file.snap_path_online = SystemsToScan[2].onlineSnapPathSystem
                        file.snap_path_local = SystemsToScan[2].localSnapPath

                        if SystemsToScan[2].localCoverPath .. app_title .. ".png" and System.doesFileExist(SystemsToScan[2].localCoverPath .. app_title .. ".png") then
                            img_path = SystemsToScan[2].localCoverPath .. app_title .. ".png" --custom cover by app name
                        elseif SystemsToScan[2].localCoverPath .. file.name .. ".png" and System.doesFileExist(SystemsToScan[2].localCoverPath .. file.name .. ".png") then
                            img_path = SystemsToScan[2].localCoverPath .. file.name .. ".png" --custom cover by app id
                        else
                            if System.doesFileExist("ur0:/appmeta/" .. file.name .. "/icon0.png") then
                                img_path = "ur0:/appmeta/" .. file.name .. "/icon0.png"  --app icon
                            else
                                img_path = "app0:/DATA/noimg.png" --blank grey
                            end
                        end
                    end

                -- NO OVERRIDE - HOMEBREW
                else
                    table.insert(homebrews_table, file)

                    table.insert(folders_table, file)
                    file.app_type=0

                    file.cover_path_online = SystemsToScan[2].onlineCoverPathSystem
                    file.cover_path_local = SystemsToScan[2].localCoverPath
                    file.snap_path_online = SystemsToScan[2].onlineSnapPathSystem
                    file.snap_path_local = SystemsToScan[2].localSnapPath

                    if SystemsToScan[2].localCoverPath .. app_title .. ".png" and System.doesFileExist(SystemsToScan[2].localCoverPath .. app_title .. ".png") then
                        img_path = SystemsToScan[2].localCoverPath .. app_title .. ".png" --custom cover by app name
                    elseif SystemsToScan[2].localCoverPath .. file.name .. ".png" and System.doesFileExist(SystemsToScan[2].localCoverPath .. file.name .. ".png") then
                        img_path = SystemsToScan[2].localCoverPath .. file.name .. ".png" --custom cover by app id
                    else
                        if System.doesFileExist("ur0:/appmeta/" .. file.name .. "/icon0.png") then
                            img_path = "ur0:/appmeta/" .. file.name .. "/icon0.png"  --app icon
                        else
                            img_path = "app0:/DATA/noimg.png" --blank grey
                        end
                    end

                end
                --END OVERRIDDEN CATEGORY of homebrew
            end

        end
        
    
        
        table.insert(files_table, count_of_systems, file.app_type) 
        
        --add blank icon to all
        file.icon = imgCoverTmp
        file.icon_path = img_path
        
        table.insert(files_table, count_of_systems, file.icon) 
        
        file.apptitle = app_title
        table.insert(files_table, count_of_systems, file.apptitle) 
        
    end

    -- LOOKUP TITLE ID: Delete old file and save new list of matches

    -- if not System.doesFileExist(user_DB_Folder .. "vita.lua") then
    --     CreateUserTitleTable_Vita()
    -- else
    --     System.deleteFile(user_DB_Folder .. "vita.lua")
    --     CreateUserTitleTable_Vita()
    -- end


    -- SCAN ROMS

    function scan_PSP_iso_folder (def_adrenaline_rom_location, def_user_db_file)
        if  System.doesDirExist(def_adrenaline_rom_location) then

            files_PSP = System.listDirectory(def_adrenaline_rom_location)

            for i, file in pairs(files_PSP) do
            local custom_path, custom_path_id, app_type, name, title, name_online, version, name_title_search = nil, nil, nil, nil, nil, nil, nil, nil
                if not file.directory and not string.match(file.name, "Thumbs%.db") and not string.match(file.name, "DS_Store") and not string.match(file.name, "%._") then

                        -- check if game is in the favorites list
                        if System.doesFileExist(cur_dir .. "/favorites.dat") then
                            if string.find(strFav, file.name,1,true) ~= nil then
                                file.favourite = true
                            else
                                file.favourite = false
                            end
                        end

                        file.launch_argument = ("PATH=ms0:/ISO/" .. file.name)
                        file.game_path = (def_adrenaline_rom_location .. "/" .. file.name)
                        file.date_played = 0

                        romname_withExtension = file.name

                        -- Check file naming, are there any spaces?

                        if string.match(romname_withExtension, "%s") then
                        -- Spaces found, cleanup the filename
                            
                            cleanRomNamesPSP()

                            info = romname_noRegion_noExtension
                            app_title = romname_noRegion_noExtension_notitleid
                            

                            file.filename = file.name
                            file.name = titleID_noHyphen
                            file.title = romname_noRegion_noExtension_notitleid
                            file.name_online = titleID_noHyphen
                            file.version = romname_region
                            file.name_title_search = romname_noExtension_notitleid
                            file.apptitle = romname_noRegion_noExtension_notitleid

                            custom_path = SystemsToScan[3].localCoverPath .. romname_noRegion_noExtension_notitleid .. ".png"
                            custom_path_id = SystemsToScan[3].localCoverPath .. titleID_noHyphen .. ".png"

                        else
                        -- No spaces, it's probably a title ID, so scan the database
                            romname_noExtension = {}
                            romname_noExtension = tostring(file.name:match("(.+)%..+$"))

                            -- LOOKUP TITLE ID: Get game name based on titleID, search saved table of data, or sql table of data if titleID not found
                            
                            -- Load previous matches
                            
                            if System.doesFileExist(user_DB_Folder .. def_user_db_file) then
                                database_rename_PSP = user_DB_Folder .. def_user_db_file
                                pspdb = dofile(database_rename_PSP)
                            else
                                pspdb = {}
                            end

                            -- Check if scanned titleID is a saved match
                            psp_search = pspdb[romname_noExtension]

                            -- If no
                            if psp_search == nil then

                                -- Load the full sql database to find the new titleID
                                if System.doesFileExist(cur_dir .. "/DATABASES/psp.db") then
                                    db = Database.open(cur_dir .. "/DATABASES/psp.db")

                                    sql_db_search_mame = "\"" .. romname_noExtension .. "\""
                                    search_term = "SELECT title FROM games where filename is "  .. sql_db_search_mame
                                    sql_db_search_result = Database.execQuery(db, search_term)

                                    if next(sql_db_search_result) == nil then
                                        -- Not found; use the folder name without adding a game name
                                        title = romname_noExtension
                                    else
                                        -- Found; use the game name from the full database
                                        title = sql_db_search_result[1].title
                                    end                                

                                else
                                end

                            -- If found; use the game name from the saved match
                            else
                                title = pspdb[romname_noExtension].name
                            end

                            romname_noRegion_noExtension = {}
                            romname_noRegion_noExtension = title:gsub(" %(", "%("):gsub('%b()', '')

                            -- Check if name contains parenthesis, if yes strip out to show as version
                            if string.find(title, "%(") then
                                -- Remove all text except for within "()"
                                romname_region_initial = {}
                                romname_region_initial = title:match("%((.+)%)")

                                -- Tidy up remainder when more than one set of parenthesis used, replace  ") (" with ", "
                                romname_region = {}
                                romname_region = romname_region_initial:gsub("%) %(", ', ')
                            -- If no parenthesis, then add blank to prevent nil error
                            else
                                romname_region = " "
                            end

                            info = romname_noRegion_noExtension
                            app_title = romname_noRegion_noExtension

                            file.filename = file.name
                            file.name = romname_noExtension
                            file.title = romname_noRegion_noExtension
                            file.name_online = file.name
                            file.version = romname_region
                            file.name_title_search = title
                            file.apptitle = romname_noRegion_noExtension

                        end
                        --end of database lookup

                        -- OVERRIDES START

                        if System.doesFileExist(cur_dir .. "/overrides.dat") then
                            --String:   1 vita, 2 psp, 3 psx, 4 homebrew
                            --App_type: 1 vita, 2 psp, 3 psx, 0 homebrew                         

                            -- VITA
                            if string.match(str, file.name .. "=1") then
                                table.insert(games_table, file)

                                table.insert(folders_table, file)
                                file.app_type=1

                                custom_path = SystemsToScan[1].localCoverPath .. app_title .. ".png"
                                custom_path_id = SystemsToScan[1].localCoverPath .. file.name .. ".png"

                                file.cover_path_online = SystemsToScan[1].onlineCoverPathSystem
                                file.cover_path_local = SystemsToScan[1].localCoverPath
                                file.snap_path_online = SystemsToScan[1].onlineSnapPathSystem
                                file.snap_path_local = SystemsToScan[1].localSnapPath

                                if custom_path and System.doesFileExist(custom_path) then
                                    img_path = custom_path --custom cover by app name
                                elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                    img_path = custom_path_id --custom cover by app id
                                else
                                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psv.png") then
                                        img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psv.png"  --app icon
                                    else
                                        img_path = "app0:/DATA/noimg.png" --blank grey
                                    end
                                end

                            -- PSP
                            elseif string.match(str, file.name .. "=2") then
                                table.insert(psp_table, file)

                                table.insert(folders_table, file)
                                file.app_type=2

                                custom_path = SystemsToScan[3].localCoverPath .. app_title .. ".png"
                                custom_path_id = SystemsToScan[3].localCoverPath .. file.name .. ".png"

                                file.cover_path_online = SystemsToScan[3].onlineCoverPathSystem
                                file.cover_path_local = SystemsToScan[3].localCoverPath
                                file.snap_path_online = SystemsToScan[3].onlineSnapPathSystem
                                file.snap_path_local = SystemsToScan[3].localSnapPath

                                if custom_path and System.doesFileExist(custom_path) then
                                    img_path = custom_path --custom cover by app name
                                elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                    img_path = custom_path_id --custom cover by app id
                                else
                                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psp.png") then
                                        img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psp.png"  --app icon
                                    else
                                        img_path = "app0:/DATA/noimg.png" --blank grey
                                    end
                                end
                            
                            -- PSX
                            elseif string.match(str, file.name .. "=3") then
                                table.insert(psx_table, file)

                                table.insert(folders_table, file)
                                file.app_type=3

                                custom_path = SystemsToScan[4].localCoverPath .. app_title .. ".png"
                                custom_path_id = SystemsToScan[4].localCoverPath .. file.name .. ".png"

                                file.cover_path_online = SystemsToScan[4].onlineCoverPathSystem
                                file.cover_path_local = SystemsToScan[4].localCoverPath
                                file.snap_path_online = SystemsToScan[4].onlineSnapPathSystem
                                file.snap_path_local = SystemsToScan[4].localSnapPath

                                if custom_path and System.doesFileExist(custom_path) then
                                    img_path = custom_path --custom cover by app name
                                elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                    img_path = custom_path_id --custom cover by app id
                                else
                                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psx.png") then
                                        img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psx.png"  --app icon
                                    else
                                        img_path = "app0:/DATA/noimg.png" --blank grey
                                    end
                                end

                            -- HOMEBREW
                            elseif string.match(str, file.name .. "=4") then
                                table.insert(homebrews_table, file)

                                table.insert(folders_table, file)
                                file.app_type=0

                                custom_path = "ux0:/data/RetroFlow/COVERS/Homebrew/" .. app_title .. ".png"
                                custom_path_id = SystemsToScan[2].localCoverPath .. file.name .. ".png"

                                file.cover_path_online = SystemsToScan[2].onlineCoverPathSystem
                                file.cover_path_local = SystemsToScan[2].localCoverPath
                                file.snap_path_online = SystemsToScan[2].onlineSnapPathSystem
                                file.snap_path_local = SystemsToScan[2].localSnapPath

                                if custom_path and System.doesFileExist(custom_path) then
                                    img_path = custom_path --custom cover by app name
                                elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                    img_path = custom_path_id --custom cover by app id
                                else
                                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/icon_homebrew.png") then
                                        img_path = "ux0:/app/RETROFLOW/DATA/icon_homebrew.png"  --app icon
                                    else
                                        img_path = "app0:/DATA/noimg.png" --blank grey
                                    end
                                end

                            -- DEFAULT - PSP
                            else
                                table.insert(psp_table, file)

                                table.insert(folders_table, file)
                                file.app_type=2

                                custom_path = SystemsToScan[3].localCoverPath .. app_title .. ".png"
                                custom_path_id = SystemsToScan[3].localCoverPath .. file.name .. ".png"

                                file.cover_path_online = SystemsToScan[3].onlineCoverPathSystem
                                file.cover_path_local = SystemsToScan[3].localCoverPath
                                file.snap_path_online = SystemsToScan[3].onlineSnapPathSystem
                                file.snap_path_local = SystemsToScan[3].localSnapPath

                                if custom_path and System.doesFileExist(custom_path) then
                                    img_path = custom_path --custom cover by app name
                                elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                    img_path = custom_path_id --custom cover by app id
                                else
                                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psp.png") then
                                        img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psp.png"  --app icon
                                    else
                                        img_path = "app0:/DATA/noimg.png" --blank grey
                                    end
                                end
                            end
                        -- OVERRIDES END

                        -- NO OVERRIDE - PSP
                        else
                            table.insert(psp_table, file)

                            table.insert(folders_table, file)
                            file.app_type=2

                            custom_path = SystemsToScan[3].localCoverPath .. app_title .. ".png"
                            custom_path_id = SystemsToScan[3].localCoverPath .. file.name .. ".png"

                            file.cover_path_online = SystemsToScan[3].onlineCoverPathSystem
                            file.cover_path_local = SystemsToScan[3].localCoverPath
                            file.snap_path_online = SystemsToScan[3].onlineSnapPathSystem
                            file.snap_path_local = SystemsToScan[3].localSnapPath

                            if custom_path and System.doesFileExist(custom_path) then
                                img_path = custom_path --custom cover by app name
                            elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                img_path = custom_path_id --custom cover by app id
                            else
                                if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psp.png") then
                                    img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psp.png"  --app icon
                                else
                                    img_path = "app0:/DATA/noimg.png" --blank grey
                                end
                            end
                        end

                        table.insert(files_table, count_of_systems, file.app_type) 
                        table.insert(files_table, count_of_systems, file.name)
                        table.insert(files_table, count_of_systems, file.title)
                        table.insert(files_table, count_of_systems, file.name_online)
                        table.insert(files_table, count_of_systems, file.version)
                        table.insert(files_table, count_of_systems, file.name_title_search)

                        --add blank icon to all
                        file.icon = imgCoverTmp
                        file.icon_path = img_path
                        
                        table.insert(files_table, count_of_systems, file.icon)                     
                        table.insert(files_table, count_of_systems, file.apptitle) 

                    else
                    
                end
            end

            -- LOOKUP TITLE ID: Delete old file and save new list of matches

            if not System.doesFileExist(user_DB_Folder .. def_user_db_file) then
                CreateUserTitleTable_PSP_iso(def_user_db_file)
            else
                System.deleteFile(user_DB_Folder .. def_user_db_file)
                CreateUserTitleTable_PSP_iso(def_user_db_file)
            end

        end
    end

    function scan_PSP_game_folder (def_adrenaline_rom_location, def_user_db_file)
        if  System.doesDirExist(def_adrenaline_rom_location) then

            files_PSP = System.listDirectory(def_adrenaline_rom_location)

            for i, file in pairs(files_PSP) do
            local custom_path, custom_path_id, app_type, name, title, name_online, version, name_title_search = nil, nil, nil, nil, nil, nil, nil, nil
                if file.directory and System.doesFileExist(def_adrenaline_rom_location .. "/" .. file.name .. "/EBOOT.PBP") then

                    -- check if game is in the favorites list
                    if System.doesFileExist(cur_dir .. "/favorites.dat") then
                        if string.find(strFav, file.name,1,true) ~= nil then
                            file.favourite = true
                        else
                            file.favourite = false
                        end
                    end

                    if string.match(file.name, "NPEG")
                    or string.match(file.name, "NPEH")
                    or string.match(file.name, "UCES")
                    or string.match(file.name, "ULES")
                    or string.match(file.name, "NPUG")
                    or string.match(file.name, "NPUH")
                    or string.match(file.name, "UCUS")
                    or string.match(file.name, "ULUS")
                    or string.match(file.name, "NPJG")
                    or string.match(file.name, "NPJH")
                    or string.match(file.name, "NPHG")
                    or string.match(file.name, "NPHH")
                    or string.match(file.name, "UCAS") then

                        file.launch_argument = ("PATH=ms0:/PSP/GAME/" .. file.name .. "/EBOOT.PBP")
                        file.game_path = (def_adrenaline_rom_location .. "/" .. file.name)

                        romname_withExtension = file.name

                        romname_noExtension = {}
                        romname_noExtension = file.name

                        -- LOOKUP TITLE ID: Get game name based on titleID, search saved table of data, or sql table of data if titleID not found

                        -- Load previous matches
                        if System.doesFileExist(user_DB_Folder .. def_user_db_file) then
                            database_rename_PSP = user_DB_Folder .. def_user_db_file
                            pspdb = dofile(database_rename_PSP)
                        else
                            pspdb = {}
                        end

                        -- Check if scanned titleID is a saved match
                        psp_search = pspdb[romname_noExtension]

                        -- If no
                        if psp_search == nil then

                            -- Load the full sql database to find the new titleID

                            if System.doesFileExist(cur_dir .. "/DATABASES/psp.db") then
                                db = Database.open(cur_dir .. "/DATABASES/psp.db")

                                sql_db_search_mame = "\"" .. romname_noExtension .. "\""
                                search_term = "SELECT title FROM games where filename is "  .. sql_db_search_mame
                                sql_db_search_result = Database.execQuery(db, search_term)

                                if next(sql_db_search_result) == nil then
                                    -- Not found; use the folder name without adding a game name
                                    title = romname_noExtension
                                else
                                    -- Found; use the game name from the full database
                                    title = sql_db_search_result[1].title
                                end

                            else
                            end

                        -- If found; use the game name from the saved match
                        else
                            title = pspdb[romname_noExtension].name
                        end

                        romname_noRegion_noExtension = {}
                        romname_noRegion_noExtension = title:gsub(" %(", "%("):gsub('%b()', '')

                        -- Check if name contains parenthesis, if yes strip out to show as version
                        if string.find(title, "%(") then
                            -- Remove all text except for within "()"
                            romname_region_initial = {}
                            romname_region_initial = title:match("%((.+)%)")

                            -- Tidy up remainder when more than one set of parenthesis used, replace  ") (" with ", "
                            romname_region = {}
                            romname_region = romname_region_initial:gsub("%) %(", ', ')
                        -- If no parenthesis, then add blank to prevent nil error
                        else
                            romname_region = " "
                        end

                        info = romname_noRegion_noExtension
                        app_title = romname_noRegion_noExtension

                        file.filename = file.name
                        file.name = romname_noExtension
                        file.title = romname_noRegion_noExtension
                        file.name_online = tostring(file.name)
                        file.version = romname_region
                        file.name_title_search = title
                        file.apptitle = romname_noRegion_noExtension
                        file.date_played = 0

                        -- OVERRIDES START

                        if System.doesFileExist(cur_dir .. "/overrides.dat") then
                            --String:   1 vita, 2 psp, 3 psx, 4 homebrew
                            --App_type: 1 vita, 2 psp, 3 psx, 0 homebrew                         

                            -- VITA
                            if string.match(str, file.name .. "=1") then
                                table.insert(games_table, file)

                                table.insert(folders_table, file)
                                file.app_type=1

                                custom_path = SystemsToScan[1].localCoverPath .. app_title .. ".png"
                                custom_path_id = SystemsToScan[1].localCoverPath .. file.name .. ".png"

                                file.cover_path_online = SystemsToScan[1].onlineCoverPathSystem
                                file.cover_path_local = SystemsToScan[1].localCoverPath
                                file.snap_path_online = SystemsToScan[1].onlineSnapPathSystem
                                file.snap_path_local = SystemsToScan[1].localSnapPath

                                if custom_path and System.doesFileExist(custom_path) then
                                    img_path = custom_path --custom cover by app name
                                elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                    img_path = custom_path_id --custom cover by app id
                                else
                                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psv.png") then
                                        img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psv.png"  --app icon
                                    else
                                        img_path = "app0:/DATA/noimg.png" --blank grey
                                    end
                                end

                            -- PSP
                            elseif string.match(str, file.name .. "=2") then
                                table.insert(psp_table, file)

                                table.insert(folders_table, file)
                                file.app_type=2

                                custom_path = SystemsToScan[3].localCoverPath .. app_title .. ".png"
                                custom_path_id = SystemsToScan[3].localCoverPath .. file.name .. ".png"

                                file.cover_path_online = SystemsToScan[3].onlineCoverPathSystem
                                file.cover_path_local = SystemsToScan[3].localCoverPath
                                file.snap_path_online = SystemsToScan[3].onlineSnapPathSystem
                                file.snap_path_local = SystemsToScan[3].localSnapPath

                                if custom_path and System.doesFileExist(custom_path) then
                                    img_path = custom_path --custom cover by app name
                                elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                    img_path = custom_path_id --custom cover by app id
                                else
                                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psp.png") then
                                        img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psp.png"  --app icon
                                    else
                                        img_path = "app0:/DATA/noimg.png" --blank grey
                                    end
                                end
                            
                            -- PSX
                            elseif string.match(str, file.name .. "=3") then
                                table.insert(psx_table, file)

                                table.insert(folders_table, file)
                                file.app_type=3

                                custom_path = SystemsToScan[4].localCoverPath .. app_title .. ".png"
                                custom_path_id = SystemsToScan[4].localCoverPath .. file.name .. ".png"

                                file.cover_path_online = SystemsToScan[4].onlineCoverPathSystem
                                file.cover_path_local = SystemsToScan[4].localCoverPath
                                file.snap_path_online = SystemsToScan[4].onlineSnapPathSystem
                                file.snap_path_local = SystemsToScan[4].localSnapPath

                                if custom_path and System.doesFileExist(custom_path) then
                                    img_path = custom_path --custom cover by app name
                                elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                    img_path = custom_path_id --custom cover by app id
                                else
                                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psx.png") then
                                        img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psx.png"  --app icon
                                    else
                                        img_path = "app0:/DATA/noimg.png" --blank grey
                                    end
                                end

                            -- HOMEBREW
                            elseif string.match(str, file.name .. "=4") then
                                table.insert(homebrews_table, file)

                                table.insert(folders_table, file)
                                file.app_type=0

                                custom_path = SystemsToScan[2].localCoverPath .. app_title .. ".png"
                                custom_path_id = SystemsToScan[2].localCoverPath .. file.name .. ".png"

                                file.cover_path_online = SystemsToScan[2].onlineCoverPathSystem
                                file.cover_path_local = SystemsToScan[2].localCoverPath
                                file.snap_path_online = SystemsToScan[2].onlineSnapPathSystem
                                file.snap_path_local = SystemsToScan[2].localSnapPath

                                if custom_path and System.doesFileExist(custom_path) then
                                    img_path = custom_path --custom cover by app name
                                elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                    img_path = custom_path_id --custom cover by app id
                                else
                                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/icon_homebrew.png") then
                                        img_path = "ux0:/app/RETROFLOW/DATA/icon_homebrew.png"  --app icon
                                    else
                                        img_path = "app0:/DATA/noimg.png" --blank grey
                                    end
                                end

                            -- DEFAULT - PSP
                            else
                                table.insert(psp_table, file)

                                table.insert(folders_table, file)
                                file.app_type=2

                                custom_path = SystemsToScan[3].localCoverPath .. app_title .. ".png"
                                custom_path_id = SystemsToScan[3].localCoverPath .. file.name .. ".png"

                                file.cover_path_online = SystemsToScan[3].onlineCoverPathSystem
                                file.cover_path_local = SystemsToScan[3].localCoverPath
                                file.snap_path_online = SystemsToScan[3].onlineSnapPathSystem
                                file.snap_path_local = SystemsToScan[3].localSnapPath

                                if custom_path and System.doesFileExist(custom_path) then
                                    img_path = custom_path --custom cover by app name
                                elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                    img_path = custom_path_id --custom cover by app id
                                else
                                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psp.png") then
                                        img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psp.png"  --app icon
                                    else
                                        img_path = "app0:/DATA/noimg.png" --blank grey
                                    end
                                end
                            end
                        -- OVERRIDES END

                        -- NO OVERRIDE - PSP
                        else
                            table.insert(psp_table, file)

                            table.insert(folders_table, file)
                            file.app_type=2

                            custom_path = SystemsToScan[3].localCoverPath .. app_title .. ".png"
                            custom_path_id = SystemsToScan[3].localCoverPath .. file.name .. ".png"

                            file.cover_path_online = SystemsToScan[3].onlineCoverPathSystem
                            file.cover_path_local = SystemsToScan[3].localCoverPath
                            file.snap_path_online = SystemsToScan[3].onlineSnapPathSystem
                            file.snap_path_local = SystemsToScan[3].localSnapPath

                            if custom_path and System.doesFileExist(custom_path) then
                                img_path = custom_path --custom cover by app name
                            elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                img_path = custom_path_id --custom cover by app id
                            else
                                if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psp.png") then
                                    img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psp.png"  --app icon
                                else
                                    img_path = "app0:/DATA/noimg.png" --blank grey
                                end
                            end
                        end

                        table.insert(files_table, count_of_systems, file.app_type) 
                        table.insert(files_table, count_of_systems, file.name)
                        table.insert(files_table, count_of_systems, file.title)
                        table.insert(files_table, count_of_systems, file.name_online)
                        table.insert(files_table, count_of_systems, file.version)
                        table.insert(files_table, count_of_systems, file.name_title_search)

                        --add blank icon to all
                        file.icon = imgCoverTmp
                        file.icon_path = img_path
                        
                        table.insert(files_table, count_of_systems, file.icon)                     
                        table.insert(files_table, count_of_systems, file.apptitle) 

                    else
                    end
                    
                end
            end

            -- LOOKUP TITLE ID: Delete old file and save new list of matches

            if not System.doesFileExist(user_DB_Folder .. def_user_db_file) then
                CreateUserTitleTable_PSP_game(def_user_db_file)
            else
                System.deleteFile(user_DB_Folder .. def_user_db_file)
                CreateUserTitleTable_PSP_game(def_user_db_file)
            end

        end
    end

    function scan_PS1_game_folder (def_adrenaline_rom_location, def_user_db_file)
            if  System.doesDirExist(def_adrenaline_rom_location) then

                files_PSX = System.listDirectory(def_adrenaline_rom_location)

                for i, file in pairs(files_PSX) do
                local custom_path, custom_path_id, app_type, name, title, name_online, version, name_title_search = nil, nil, nil, nil, nil, nil, nil, nil
                    if file.directory and System.doesFileExist(def_adrenaline_rom_location .. "/" .. file.name .. "/EBOOT.PBP") then

                        -- check if game is in the favorites list
                        if System.doesFileExist(cur_dir .. "/favorites.dat") then
                            if string.find(strFav, file.name,1,true) ~= nil then
                                file.favourite = true
                            else
                                file.favourite = false
                            end
                        end

                        if not string.match(file.name, "NPEG")
                        and not string.match(file.name, "NPEH")
                        and not string.match(file.name, "UCES")
                        and not string.match(file.name, "ULES")
                        and not string.match(file.name, "NPUG")
                        and not string.match(file.name, "NPUH")
                        and not string.match(file.name, "UCUS")
                        and not string.match(file.name, "ULUS")
                        and not string.match(file.name, "NPJG")
                        and not string.match(file.name, "NPJH")
                        and not string.match(file.name, "NPHG")
                        and not string.match(file.name, "NPHH")
                        and not string.match(file.name, "UCAS") then

                            file.launch_argument = ("PATH=ms0:/PSP/GAME/" .. file.name .. "/EBOOT.PBP")
                            file.game_path = (def_adrenaline_rom_location .. "/" .. file.name)

                            romname_withExtension = file.name

                            romname_noExtension = {}
                            romname_noExtension = file.name

                            -- LOOKUP TITLE ID: Get game name based on titleID, search saved table of data, or sql table of data if titleID not found

                            -- Load previous matches
                            if System.doesFileExist(user_DB_Folder .. def_user_db_file) then
                                database_rename_PSX = user_DB_Folder .. def_user_db_file
                                psxdb = dofile(database_rename_PSX)
                            else
                                psxdb = {}
                            end

                            -- Check if scanned titleID is a saved match
                            psx_search = psxdb[romname_noExtension]

                            -- If no
                            if psx_search == nil then

                                -- Load the full sql database to find the new titleID

                                if System.doesFileExist(cur_dir .. "/DATABASES/psx.db") then
                                    db = Database.open(cur_dir .. "/DATABASES/psx.db")

                                    sql_db_search_mame = "\"" .. romname_noExtension .. "\""
                                    search_term = "SELECT title FROM games where filename is "  .. sql_db_search_mame
                                    sql_db_search_result = Database.execQuery(db, search_term)

                                    if next(sql_db_search_result) == nil then
                                        -- Not found; use the folder name without adding a game name
                                        title = romname_noExtension
                                    else
                                        -- Found; use the game name from the full database
                                        title = sql_db_search_result[1].title
                                    end

                                else
                                end

                            -- If found; use the game name from the saved match
                            else
                                title = psxdb[romname_noExtension].name
                            end

                            romname_noRegion_noExtension = {}
                            romname_noRegion_noExtension = title:gsub(" %(", "%("):gsub('%b()', ''):gsub(" %[", "%["):gsub('%b[]', '')

                            -- Check if name contains parenthesis, if yes strip out to show as version
                            if string.find(title, "%(") then
                                -- Remove all text except for within "()"
                                romname_region_initial = {}
                                romname_region_initial = title:match("%((.+)%)")

                                -- Tidy up remainder when more than one set of parenthesis used, replace  ") (" with ", "
                                romname_region = {}
                                romname_region = romname_region_initial:gsub("%) %(", ', ')
                            -- If no parenthesis, then add blank to prevent nil error
                            else
                                romname_region = " "
                            end

                            info = romname_noRegion_noExtension
                            app_title = romname_noRegion_noExtension
                            
                            file.filename = file.name
                            file.name = romname_noExtension
                            file.title = romname_noRegion_noExtension
                            file.name_online = tostring(file.name)
                            file.version = romname_region
                            file.name_title_search = title
                            file.apptitle = romname_noRegion_noExtension
                            file.date_played = 0

                            -- OVERRIDES START

                            if System.doesFileExist(cur_dir .. "/overrides.dat") then
                                --String:   1 vita, 2 psp, 3 psx, 4 homebrew
                                --App_type: 1 vita, 2 psp, 3 psx, 0 homebrew                         

                                -- VITA
                                if string.match(str, file.name .. "=1") then
                                    table.insert(games_table, file)

                                    table.insert(folders_table, file)
                                    file.app_type=1

                                    custom_path = SystemsToScan[1].localCoverPath .. app_title .. ".png"
                                    custom_path_id = SystemsToScan[1].localCoverPath .. file.name .. ".png"

                                    file.cover_path_online = SystemsToScan[1].onlineCoverPathSystem
                                    file.cover_path_local = SystemsToScan[1].localCoverPath
                                    file.snap_path_online = SystemsToScan[1].onlineSnapPathSystem
                                    file.snap_path_local = SystemsToScan[1].localSnapPath

                                    if custom_path and System.doesFileExist(custom_path) then
                                        img_path = custom_path --custom cover by app name
                                    elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                        img_path = custom_path_id --custom cover by app id
                                    else
                                        if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psv.png") then
                                            img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psv.png"  --app icon
                                        else
                                            img_path = "app0:/DATA/noimg.png" --blank grey
                                        end
                                    end

                                -- PSP
                                elseif string.match(str, file.name .. "=2") then
                                    table.insert(psp_table, file)

                                    table.insert(folders_table, file)
                                    file.app_type=2

                                    custom_path = SystemsToScan[3].localCoverPath .. app_title .. ".png"
                                    custom_path_id = SystemsToScan[3].localCoverPath .. file.name .. ".png"

                                    file.cover_path_online = SystemsToScan[3].onlineCoverPathSystem
                                    file.cover_path_local = SystemsToScan[3].localCoverPath
                                    file.snap_path_online = SystemsToScan[3].onlineSnapPathSystem
                                    file.snap_path_local = SystemsToScan[3].localSnapPath

                                    if custom_path and System.doesFileExist(custom_path) then
                                        img_path = custom_path --custom cover by app name
                                    elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                        img_path = custom_path_id --custom cover by app id
                                    else
                                        if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psp.png") then
                                            img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psp.png"  --app icon
                                        else
                                            img_path = "app0:/DATA/noimg.png" --blank grey
                                        end
                                    end
                                
                                -- PSX
                                elseif string.match(str, file.name .. "=3") then
                                    table.insert(psx_table, file)

                                    table.insert(folders_table, file)
                                    file.app_type=3

                                    custom_path = SystemsToScan[4].localCoverPath .. app_title .. ".png"
                                    custom_path_id = SystemsToScan[4].localCoverPath .. file.name .. ".png"

                                    file.cover_path_online = SystemsToScan[4].onlineCoverPathSystem
                                    file.cover_path_local = SystemsToScan[4].localCoverPath
                                    file.snap_path_online = SystemsToScan[4].onlineSnapPathSystem
                                    file.snap_path_local = SystemsToScan[4].localSnapPath

                                    if custom_path and System.doesFileExist(custom_path) then
                                        img_path = custom_path --custom cover by app name
                                    elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                        img_path = custom_path_id --custom cover by app id
                                    else
                                        if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psx.png") then
                                            img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psx.png"  --app icon
                                        else
                                            img_path = "app0:/DATA/noimg.png" --blank grey
                                        end
                                    end

                                -- HOMEBREW
                                elseif string.match(str, file.name .. "=4") then
                                    table.insert(homebrews_table, file)

                                    table.insert(folders_table, file)
                                    file.app_type=0

                                    custom_path = SystemsToScan[2].localCoverPath .. app_title .. ".png"
                                    custom_path_id = SystemsToScan[2].localCoverPath .. file.name .. ".png"

                                    file.cover_path_online = SystemsToScan[2].onlineCoverPathSystem
                                    file.cover_path_local = SystemsToScan[2].localCoverPath
                                    file.snap_path_online = SystemsToScan[2].onlineSnapPathSystem
                                    file.snap_path_local = SystemsToScan[2].localSnapPath

                                    if custom_path and System.doesFileExist(custom_path) then
                                        img_path = custom_path --custom cover by app name
                                    elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                        img_path = custom_path_id --custom cover by app id
                                    else
                                        if System.doesFileExist("ux0:/app/RETROFLOW/DATA/icon_homebrew.png") then
                                            img_path = "ux0:/app/RETROFLOW/DATA/icon_homebrew.png"  --app icon
                                        else
                                            img_path = "app0:/DATA/noimg.png" --blank grey
                                        end
                                    end

                                -- DEFAULT - PSX
                                else
                                    table.insert(psx_table, file)

                                    table.insert(folders_table, file)
                                    file.app_type=3

                                    custom_path = SystemsToScan[4].localCoverPath .. app_title .. ".png"
                                    custom_path_id = SystemsToScan[4].localCoverPath .. file.name .. ".png"

                                    file.cover_path_online = SystemsToScan[4].onlineCoverPathSystem
                                    file.cover_path_local = SystemsToScan[4].localCoverPath
                                    file.snap_path_online = SystemsToScan[4].onlineSnapPathSystem
                                    file.snap_path_local = SystemsToScan[4].localSnapPath

                                    if custom_path and System.doesFileExist(custom_path) then
                                        img_path = custom_path --custom cover by app name
                                    elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                        img_path = custom_path_id --custom cover by app id
                                    else
                                        if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psx.png") then
                                            img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psx.png"  --app icon
                                        else
                                            img_path = "app0:/DATA/noimg.png" --blank grey
                                        end
                                    end
                                end
                            -- OVERRIDES END

                            -- NO OVERRIDE
                            else
                                table.insert(psx_table, file)

                                table.insert(folders_table, file)
                                file.app_type=3

                                custom_path = SystemsToScan[4].localCoverPath .. app_title .. ".png"
                                custom_path_id = SystemsToScan[4].localCoverPath .. file.name .. ".png"

                                file.cover_path_online = SystemsToScan[4].onlineCoverPathSystem
                                file.cover_path_local = SystemsToScan[4].localCoverPath
                                file.snap_path_online = SystemsToScan[4].onlineSnapPathSystem
                                file.snap_path_local = SystemsToScan[4].localSnapPath
                                
                                if custom_path and System.doesFileExist(custom_path) then
                                    img_path = SystemsToScan[4].localCoverPath .. file.name .. ".png" --custom cover by app name
                                elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                    img_path = SystemsToScan[4].localCoverPath .. file.name .. ".png" --custom cover by app id
                                else
                                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psx.png") then
                                        img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psx.png"  --app icon
                                    else
                                        img_path = "app0:/DATA/noimg.png" --blank grey
                                    end
                                end
                            end

                            table.insert(files_table, count_of_systems, file.app_type) 
                            table.insert(files_table, count_of_systems, file.name)
                            table.insert(files_table, count_of_systems, file.title)
                            table.insert(files_table, count_of_systems, file.name_online)
                            table.insert(files_table, count_of_systems, file.version)
                            table.insert(files_table, count_of_systems, file.name_title_search)

                            --add blank icon to all
                            file.icon = imgCoverTmp
                            file.icon_path = img_path
                            
                            table.insert(files_table, count_of_systems, file.icon)                     
                            table.insert(files_table, count_of_systems, file.apptitle)

                        else
                        end

                        
                    end
                end

                -- LOOKUP TITLE ID: Delete old file and save new list of matches
                if not System.doesFileExist(user_DB_Folder .. def_user_db_file) then
                    CreateUserTitleTable_PSX(def_user_db_file)
                else
                    System.deleteFile(user_DB_Folder .. def_user_db_file)
                    CreateUserTitleTable_PSX(def_user_db_file)
                end

            end
        end

    if Adrenaline_roms == 1 then
        -- Scan Adrenaline - ux0
        scan_PSP_iso_folder (adrenaline_PSP_ISO_ux0, "psp_iso.lua")
        scan_PSP_game_folder (adrenaline_PSP_GAME_ux0, "psp_game.lua")
        scan_PS1_game_folder (adrenaline_PSP_GAME_ux0, "psx.lua")
    else
        -- Scan Adrenaline - uma0
        scan_PSP_iso_folder (adrenaline_PSP_ISO_uma0, "psp_iso_uma0.lua")   
        scan_PSP_game_folder (adrenaline_PSP_GAME_uma0, "psp_game_uma0.lua")
        scan_PS1_game_folder (adrenaline_PSP_GAME_uma0, "psx_uma0.lua")
    end


    function Scan_Rom_Simple(def, def_table_name)

        files = System.listDirectory((SystemsToScan[(def)].romFolder))
        for i, file in pairs(files) do
            local custom_path, custom_path_id, app_type, name, title, name_online, version = nil, nil, nil, nil, nil, nil, nil
            -- Scan files only, ignore temporary files, Windows = "Thumbs.db", Mac = "DS_Store", and "._name" 
            if not file.directory and not string.match(file.name, "Thumbs%.db") and not string.match(file.name, "DS_Store") and not string.match(file.name, "%._") then

                -- check if game is in the favorites list
                if System.doesFileExist(cur_dir .. "/favorites.dat") then
                    if string.find(strFav, file.name,1,true) ~= nil then
                        file.favourite = true
                    else
                        file.favourite = false
                    end
                end

                file.game_path = ((SystemsToScan[(def)].romFolder) .. "/" .. file.name)

                romname_withExtension = file.name
                cleanRomNames()
                info = romname_noRegion_noExtension
                app_title = romname_noExtension
                
                table.insert(folders_table, file)
                --table.insert(games_table, file)
                custom_path = (SystemsToScan[(def)].localCoverPath) .. romname_noExtension .. ".png"
                custom_path_id = (SystemsToScan[(def)].localCoverPath) .. romname_noExtension .. ".png"
                file.app_type=((def))

                file.filename = file.name
                file.name = romname_noExtension
                file.title = romname_noRegion_noExtension
                file.name_online = romname_url_encoded
                file.version = romname_region
                file.date_played = 0
                file.snap_path_local = (SystemsToScan[(def)].localSnapPath)
                file.snap_path_online = (SystemsToScan[(def)].onlineSnapPathSystem)

                table.insert((def_table_name), file)

                if custom_path and System.doesFileExist(custom_path) then
                    img_path = (SystemsToScan[(def)].localCoverPath) .. romname_noExtension .. ".png" --custom cover by app name
                elseif custom_path_id and System.doesFileExist(custom_path_id) then
                    img_path = (SystemsToScan[(def)].localCoverPath) .. romname_noExtension .. ".png" --custom cover by app id
                else
                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/" .. (SystemsToScan[(def)].Missing_Cover)) then
                        img_path = "ux0:/app/RETROFLOW/DATA/" .. (SystemsToScan[(def)].Missing_Cover)  --app icon
                    else
                        img_path = "app0:/DATA/noimg.png" --blank grey
                    end
                end

                table.insert(files_table, count_of_systems, file.app_type) 
                table.insert(files_table, count_of_systems, file.name)
                table.insert(files_table, count_of_systems, file.title)
                table.insert(files_table, count_of_systems, file.name_online)
                table.insert(files_table, count_of_systems, file.version)

                file.app_type=((def))
                file.cover_path_online = (SystemsToScan[(def)].onlineCoverPathSystem)
                file.cover_path_local = (SystemsToScan[(def)].localCoverPath)

                --add blank icon to all
                file.icon = imgCoverTmp
                file.icon_path = img_path
                
                table.insert(files_table, count_of_systems, file.icon) 
                
                file.apptitle = romname_noRegion_noExtension
                table.insert(files_table, count_of_systems, file.apptitle) 

            end
        end
    end

    function Scan_Rom_Cue_Filter(def, def_table_name)

        files = System.listDirectory((SystemsToScan[(def)].romFolder))
        for i, file in pairs(files) do
            local custom_path, custom_path_id, app_type, name, title, name_online, version = nil, nil, nil, nil, nil, nil, nil
            -- Scan files only, ignore temporary files, Windows = "Thumbs.db", Mac = "DS_Store", and "._name" 
            if not file.directory and string.match(file.name, ".cue") and not string.match(file.name, "Thumbs%.db") and not string.match(file.name, "DS_Store") and not string.match(file.name, "%._") then

                -- check if game is in the favorites list
                if System.doesFileExist(cur_dir .. "/favorites.dat") then
                    if string.find(strFav, file.name,1,true) ~= nil then
                        file.favourite = true
                    else
                        file.favourite = false
                    end
                end

                file.game_path = ((SystemsToScan[(def)].romFolder) .. "/" .. file.name)

                romname_withExtension = file.name
                cleanRomNames()
                info = romname_noRegion_noExtension
                app_title = romname_noExtension
                
                table.insert(folders_table, file)
                --table.insert(games_table, file)
                custom_path = (SystemsToScan[(def)].localCoverPath) .. romname_noExtension .. ".png"
                custom_path_id = (SystemsToScan[(def)].localCoverPath) .. romname_noExtension .. ".png"
                file.app_type=((def))

                file.filename = file.name
                file.name = romname_noExtension
                file.title = romname_noRegion_noExtension
                file.name_online = romname_url_encoded
                file.version = romname_region
                file.date_played = 0
                file.snap_path_local = (SystemsToScan[(def)].localSnapPath)
                file.snap_path_online = (SystemsToScan[(def)].onlineSnapPathSystem)

                table.insert((def_table_name), file)

                if custom_path and System.doesFileExist(custom_path) then
                    img_path = (SystemsToScan[(def)].localCoverPath) .. romname_noExtension .. ".png" --custom cover by app name
                elseif custom_path_id and System.doesFileExist(custom_path_id) then
                    img_path = (SystemsToScan[(def)].localCoverPath) .. romname_noExtension .. ".png" --custom cover by app id
                else
                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/" .. (SystemsToScan[(def)].Missing_Cover)) then
                        img_path = "ux0:/app/RETROFLOW/DATA/" .. (SystemsToScan[(def)].Missing_Cover)  --app icon
                    else
                        img_path = "app0:/DATA/noimg.png" --blank grey
                    end
                end

                table.insert(files_table, count_of_systems, file.app_type) 
                table.insert(files_table, count_of_systems, file.name)
                table.insert(files_table, count_of_systems, file.title)
                table.insert(files_table, count_of_systems, file.name_online)
                table.insert(files_table, count_of_systems, file.version)

                file.app_type=((def))
                file.cover_path_online = (SystemsToScan[(def)].onlineCoverPathSystem)
                file.cover_path_local = (SystemsToScan[(def)].localCoverPath)

                --add blank icon to all
                file.icon = imgCoverTmp
                file.icon_path = img_path
                
                table.insert(files_table, count_of_systems, file.icon) 
                
                file.apptitle = romname_noRegion_noExtension
                table.insert(files_table, count_of_systems, file.apptitle) 

            end

            -- Scan Sub Folders
            if file.directory then
                file_subfolder = System.listDirectory((SystemsToScan[(def)].romFolder .. "/" .. file.name))
                for i, file_subfolder in pairs(file_subfolder) do
                    -- Scan files only, ignore temporary files, Windows = "Thumbs.db", Mac = "DS_Store", and "._name" 
                    if not file_subfolder.directory and string.match(file_subfolder.name, ".cue") and not string.match(file_subfolder.name, "Thumbs%.db") and not string.match(file_subfolder.name, "DS_Store") and not string.match(file_subfolder.name, "%._") then

                        -- check if game is in the favorites list
                        if System.doesFileExist(cur_dir .. "/favorites.dat") then
                            if string.find(strFav, file_subfolder.name,1,true) ~= nil then
                                file_subfolder.favourite = true
                            else
                                file_subfolder.favourite = false
                            end
                        end

                        file_subfolder.game_path = ((SystemsToScan[(def)].romFolder) .. "/" .. file.name .. "/" .. file_subfolder.name)

                        romname_withExtension = file_subfolder.name
                        cleanRomNames()
                        info = romname_noRegion_noExtension
                        app_title = romname_noExtension
                        
                        table.insert(folders_table, file_subfolder)
                        --table.insert(games_table, file)
                        custom_path = (SystemsToScan[(def)].localCoverPath) .. romname_noExtension .. ".png"
                        custom_path_id = (SystemsToScan[(def)].localCoverPath) .. romname_noExtension .. ".png"
                        file_subfolder.app_type=((def))

                        file_subfolder.filename = file_subfolder.name
                        file_subfolder.name = romname_noExtension
                        file_subfolder.title = romname_noRegion_noExtension
                        file_subfolder.name_online = romname_url_encoded
                        file_subfolder.version = romname_region
                        file_subfolder.date_played = 0
                        file_subfolder.snap_path_local = (SystemsToScan[(def)].localSnapPath)
                        file_subfolder.snap_path_online = (SystemsToScan[(def)].onlineSnapPathSystem)

                        table.insert((def_table_name), file_subfolder)

                        if custom_path and System.doesFileExist(custom_path) then
                            img_path = (SystemsToScan[(def)].localCoverPath) .. romname_noExtension .. ".png" --custom cover by app name
                        elseif custom_path_id and System.doesFileExist(custom_path_id) then
                            img_path = (SystemsToScan[(def)].localCoverPath) .. romname_noExtension .. ".png" --custom cover by app id
                        else
                            if System.doesFileExist("ux0:/app/RETROFLOW/DATA/" .. (SystemsToScan[(def)].Missing_Cover)) then
                                img_path = "ux0:/app/RETROFLOW/DATA/" .. (SystemsToScan[(def)].Missing_Cover)  --app icon
                            else
                                img_path = "app0:/DATA/noimg.png" --blank grey
                            end
                        end

                        table.insert(files_table, count_of_systems, file_subfolder.app_type) 
                        table.insert(files_table, count_of_systems, file_subfolder.name)
                        table.insert(files_table, count_of_systems, file_subfolder.title)
                        table.insert(files_table, count_of_systems, file_subfolder.name_online)
                        table.insert(files_table, count_of_systems, file_subfolder.version)

                        file_subfolder.app_type=((def))
                        file_subfolder.cover_path_online = (SystemsToScan[(def)].onlineCoverPathSystem)
                        file_subfolder.cover_path_local = (SystemsToScan[(def)].localCoverPath)

                        --add blank icon to all
                        file_subfolder.icon = imgCoverTmp
                        file_subfolder.icon_path = img_path
                        
                        table.insert(files_table, count_of_systems, file_subfolder.icon) 
                        
                        file_subfolder.apptitle = romname_noRegion_noExtension
                        table.insert(files_table, count_of_systems, file_subfolder.apptitle) 

                    end
                end
            end

        end
    end

    function Scan_Rom_DB_Lookup(def, def_table_name, def_user_db_file, def_sql_db_file)

        files = System.listDirectory((SystemsToScan[(def)].romFolder))

        for i, file in pairs(files) do
        local custom_path, custom_path_id, app_type, name, title, name_online, version, name_title_search = nil, nil, nil, nil, nil, nil, nil, nil
            -- Scan files only, ignore temporary files, Windows = "Thumbs.db", Mac = "DS_Store", and "._name" 
        if not file.directory and not string.match(file.name, "neogeo") and not string.match(file.name, "Thumbs%.db") and not string.match(file.name, "DS_Store") and not string.match(file.name, "%._") then

                -- check if game is in the favorites list
                if System.doesFileExist(cur_dir .. "/favorites.dat") then
                    if string.find(strFav, file.name,1,true) ~= nil then
                        file.favourite = true
                    else
                        file.favourite = false
                    end
                end

                file.game_path = ((SystemsToScan[(def)].romFolder) .. "/" .. file.name)

                romname_withExtension = file.name
                romname_noExtension = {}
                romname_noExtension = romname_withExtension:match("(.+)%..+$")

                -- LOOKUP TITLE ID: Get game name based on titleID, search saved table of data, or sql table of data if titleID not found

                -- Load previous matches
                if System.doesFileExist(user_DB_Folder .. (def_user_db_file)) then
                    database_rename_PSP = user_DB_Folder .. (def_user_db_file)
                    pspdb = dofile(database_rename_PSP)
                else
                    pspdb = {}
                end

                -- Check if scanned titleID is a saved match
                psp_search = pspdb[romname_noExtension]

                -- If no
                if psp_search == nil then

                    -- Load the full sql database to find the new titleID

                    if System.doesFileExist(cur_dir .. "/DATABASES/" .. (def_sql_db_file)) then
                        db = Database.open(cur_dir .. "/DATABASES/" .. (def_sql_db_file))

                        sql_db_search_mame = "\"" .. romname_noExtension .. "\""
                        search_term = "SELECT title FROM games where filename is "  .. sql_db_search_mame
                        sql_db_search_result = Database.execQuery(db, search_term)

                        if next(sql_db_search_result) == nil then
                            -- Not found; use the name without adding a game name
                            title = romname_noExtension
                        else
                            -- Found; use the game name from the full database
                            title = sql_db_search_result[1].title
                        end
                    else
                    end

                -- If found; use the game name from the saved match
                else
                    title = pspdb[romname_noExtension].name
                end

                romname_noRegion_noExtension = {}
                romname_noRegion_noExtension = title:gsub('%b()', '')

                -- Check if name contains parenthesis, if yes strip out to show as version
                if string.find(title, "%(") then
                    -- Remove all text except for within "()"
                    romname_region_initial = {}
                    romname_region_initial = title:match("%((.+)%)")

                    -- Tidy up remainder when more than one set of parenthesis used, replace  ") (" with ", "
                    romname_region = {}
                    romname_region = romname_region_initial:gsub("%) %(", ', ')
                -- If no parenthesis, then add blank to prevent nil error
                else
                    romname_region = " "
                end

                --end of function

                info = romname_noRegion_noExtension
                app_title = romname_noRegion_noExtension
                
                if not string.match(title, "bios") and not string.match(title, "Bios") and not string.match(title, "BIOS") then
                    table.insert(folders_table, file)
                else
                end
                --table.insert(games_table, file)
                custom_path = (SystemsToScan[(def)].localCoverPath) .. romname_noExtension .. ".png"
                custom_path_id = (SystemsToScan[(def)].localCoverPath) .. romname_noExtension .. ".png"
                file.app_type=((def))

                -- file.filename = file.name
                file.filename = file.name
                file.name = romname_noExtension
                file.title = romname_noRegion_noExtension
                file.name_online = romname_noExtension
                file.version = romname_region
                file.name_title_search = title
                file.apptitle = romname_noRegion_noExtension
                file.date_played = 0
                file.snap_path_local = (SystemsToScan[(def)].localSnapPath)
                file.snap_path_online = (SystemsToScan[(def)].onlineSnapPathSystem)

                if not string.match(title, "bios") and not string.match(title, "Bios") and not string.match(title, "BIOS") then
                    table.insert((def_table_name), file)
                else
                end


                if custom_path and System.doesFileExist(custom_path) then
                    img_path = (SystemsToScan[(def)].localCoverPath) .. romname_noExtension .. ".png" --custom cover by app name
                elseif custom_path_id and System.doesFileExist(custom_path_id) then
                    img_path = (SystemsToScan[(def)].localCoverPath) .. romname_noExtension .. ".png" --custom cover by app id
                else
                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/" .. (SystemsToScan[(def)].Missing_Cover)) then
                        img_path = "ux0:/app/RETROFLOW/DATA/" .. (SystemsToScan[(def)].Missing_Cover)  --app icon
                    else
                        img_path = "app0:/DATA/noimg.png" --blank grey
                    end
                end

                if not string.match(title, "bios") and not string.match(title, "Bios") and not string.match(title, "BIOS") then
                    table.insert(files_table, count_of_systems, file.app_type) 
                    table.insert(files_table, count_of_systems, file.name)
                    table.insert(files_table, count_of_systems, file.title)
                    table.insert(files_table, count_of_systems, file.name_online)
                    table.insert(files_table, count_of_systems, file.version)
                    table.insert(files_table, count_of_systems, file.name_title_search)
                else
                end
                
                file.app_type=((def))

                -- file.filename = file.name
                file.filename = romname_withExtension
                file.name = romname_noExtension
                file.cover_path_online = (SystemsToScan[(def)].onlineCoverPathSystem)
                file.cover_path_local = (SystemsToScan[(def)].localCoverPath)
                file.snap_path_local = (SystemsToScan[(def)].localSnapPath)
                file.snap_path_online = (SystemsToScan[(def)].onlineSnapPathSystem)

                --add blank icon to all
                file.icon = imgCoverTmp
                file.icon_path = img_path
                
                if not string.match(title, "bios") and not string.match(title, "Bios") and not string.match(title, "BIOS") then
                    table.insert(files_table, count_of_systems, file.icon) 
                    table.insert(files_table, count_of_systems, file.apptitle) 
                else
                end

            end
        end

        -- LOOKUP TITLE ID: Delete old file and save new list of matches
        if not System.doesFileExist(user_DB_Folder .. (def_user_db_file)) then
            CreateUserTitleTable_for_File((def_user_db_file), (def_table_name))
        else
            System.deleteFile(user_DB_Folder .. (def_user_db_file))
            CreateUserTitleTable_for_File((def_user_db_file), (def_table_name))
        end
    end

    
    -- SCAN ROMS
    -- Scan_Type        (def,  def_table_name)
    Scan_Rom_Simple     (5, n64_table)
    Scan_Rom_Simple     (6, snes_table)
    Scan_Rom_Simple     (7, nes_table)
    Scan_Rom_Simple     (8, gba_table)
    Scan_Rom_Simple     (9, gbc_table)
    Scan_Rom_Simple     (10, gb_table)
    Scan_Rom_Cue_Filter (11, sega_cd_table)
    Scan_Rom_Simple     (12, s32x_table)
    Scan_Rom_Simple     (13, md_table)
    Scan_Rom_Simple     (14, sms_table)
    Scan_Rom_Simple     (15, gg_table)
    Scan_Rom_Simple     (16, tg16_table)
    Scan_Rom_Cue_Filter (17, tgcd_table)
    Scan_Rom_Simple     (18, pce_table)
    Scan_Rom_Cue_Filter (19, pcecd_table)
    Scan_Rom_Simple     (20, amiga_table)
    Scan_Rom_Simple     (21, c64_table)
    Scan_Rom_Simple     (22, wswan_col_table)
    Scan_Rom_Simple     (23, wswan_table)
    Scan_Rom_Simple     (24, msx2_table)
    Scan_Rom_Simple     (25, msx1_table)
    Scan_Rom_Simple     (26, zxs_table)
    Scan_Rom_Simple     (27, atari_7800_table)
    Scan_Rom_Simple     (28, atari_5200_table)
    Scan_Rom_Simple     (29, atari_2600_table)
    Scan_Rom_Simple     (30, atari_lynx_table)
    Scan_Rom_Simple     (31, colecovision_table)
    Scan_Rom_Simple     (32, vectrex_table)
    Scan_Rom_DB_Lookup  (33, fba_table, "fba_2012.lua", "fba_2012.db")
    Scan_Rom_DB_Lookup  (34, mame_2003_plus_table, "mame_2003_plus.lua", "mame_2003_plus.db")
    Scan_Rom_DB_Lookup  (35, mame_2000_table, "mame_2000.lua", "mame_2000.db")
    Scan_Rom_DB_Lookup  (36, neogeo_table, "neogeo.lua", "neogeo.db")
    Scan_Rom_Simple     (37, ngpc_table)

    import_recently_played()
    update_md_regional_cover()

    table.sort(files_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(folders_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(games_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(homebrews_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(psp_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(psx_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)

    table.sort(n64_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(snes_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(nes_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(gba_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(gbc_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(gb_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(sega_cd_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(s32x_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(md_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(sms_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(gg_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(tg16_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(tgcd_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(pce_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(pcecd_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(amiga_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(c64_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(wswan_col_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(wswan_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(msx2_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(msx1_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(zxs_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(atari_7800_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(atari_5200_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(atari_2600_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(atari_lynx_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(colecovision_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(vectrex_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(fba_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(mame_2003_plus_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(mame_2000_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(neogeo_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(ngpc_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)

    table.sort(recently_played_table, function(a, b) return (tonumber(a.date_played) > tonumber(b.date_played)) end)
    
    return_table = TableConcat(folders_table, files_table)

    total_all = #files_table
    total_games = #games_table
    total_homebrews = #homebrews_table
    total_recently_played = #recently_played_table

    -- CACHE ALL TABLES - PRINT AND SAVE
    cache_all_tables()

    return return_table
end

function ScanAdrenalineDirectoryOnly()
    psp_table = {}
    psx_table = {}

    local customCategory = 0
    
    local file_over = System.openFile(cur_dir .. "/overrides.dat", FREAD)
    local filesize = System.sizeFile(file_over)
    local str = System.readFile(file_over, filesize)
    System.closeFile(file_over)

    local fileFav_over = System.openFile(cur_dir .. "/favorites.dat", FREAD)
    local fileFavsize = System.sizeFile(fileFav_over)
    local strFav = System.readFile(fileFav_over, fileFavsize)
    System.closeFile(fileFav_over)

    function scan_PSP_iso_folder (def_adrenaline_rom_location, def_user_db_file)
        if  System.doesDirExist(def_adrenaline_rom_location) then

            files_PSP = System.listDirectory(def_adrenaline_rom_location)

            for i, file in pairs(files_PSP) do
            local custom_path, custom_path_id, app_type, name, title, name_online, version, name_title_search = nil, nil, nil, nil, nil, nil, nil, nil
                if not file.directory and not string.match(file.name, "Thumbs%.db") and not string.match(file.name, "DS_Store") and not string.match(file.name, "%._") then

                        -- check if game is in the favorites list
                        if System.doesFileExist(cur_dir .. "/favorites.dat") then
                            if string.find(strFav, file.name,1,true) ~= nil then
                                file.favourite = true
                            else
                                file.favourite = false
                            end
                        end

                        file.launch_argument = ("PATH=ms0:/ISO/" .. file.name)
                        file.game_path = (def_adrenaline_rom_location .. "/" .. file.name)
                        file.date_played = 0

                        romname_withExtension = file.name

                        -- Check file naming, are there any spaces?

                        if string.match(romname_withExtension, "%s") then
                        -- Spaces found, cleanup the filename
                            
                            cleanRomNamesPSP()

                            info = romname_noRegion_noExtension
                            app_title = romname_noRegion_noExtension_notitleid
                            

                            file.filename = file.name
                            file.name = titleID_noHyphen
                            file.title = romname_noRegion_noExtension_notitleid
                            file.name_online = titleID_noHyphen
                            file.version = romname_region
                            file.name_title_search = romname_noExtension_notitleid
                            file.apptitle = romname_noRegion_noExtension_notitleid

                            custom_path = SystemsToScan[3].localCoverPath .. romname_noRegion_noExtension_notitleid .. ".png"
                            custom_path_id = SystemsToScan[3].localCoverPath .. titleID_noHyphen .. ".png"

                        else
                        -- No spaces, it's probably a title ID, so scan the database
                            romname_noExtension = {}
                            romname_noExtension = tostring(file.name:match("(.+)%..+$"))

                            -- LOOKUP TITLE ID: Get game name based on titleID, search saved table of data, or sql table of data if titleID not found
                            
                            -- Load previous matches
                            
                            if System.doesFileExist(user_DB_Folder .. def_user_db_file) then
                                database_rename_PSP = user_DB_Folder .. def_user_db_file
                                pspdb = dofile(database_rename_PSP)
                            else
                                pspdb = {}
                            end

                            -- Check if scanned titleID is a saved match
                            psp_search = pspdb[romname_noExtension]

                            -- If no
                            if psp_search == nil then

                                -- Load the full sql database to find the new titleID
                                if System.doesFileExist(cur_dir .. "/DATABASES/psp.db") then
                                    db = Database.open(cur_dir .. "/DATABASES/psp.db")

                                    sql_db_search_mame = "\"" .. romname_noExtension .. "\""
                                    search_term = "SELECT title FROM games where filename is "  .. sql_db_search_mame
                                    sql_db_search_result = Database.execQuery(db, search_term)

                                    if next(sql_db_search_result) == nil then
                                        -- Not found; use the folder name without adding a game name
                                        title = romname_noExtension
                                    else
                                        -- Found; use the game name from the full database
                                        title = sql_db_search_result[1].title
                                    end                                

                                else
                                end

                            -- If found; use the game name from the saved match
                            else
                                title = pspdb[romname_noExtension].name
                            end

                            romname_noRegion_noExtension = {}
                            romname_noRegion_noExtension = title:gsub(" %(", "%("):gsub('%b()', '')

                            -- Check if name contains parenthesis, if yes strip out to show as version
                            if string.find(title, "%(") then
                                -- Remove all text except for within "()"
                                romname_region_initial = {}
                                romname_region_initial = title:match("%((.+)%)")

                                -- Tidy up remainder when more than one set of parenthesis used, replace  ") (" with ", "
                                romname_region = {}
                                romname_region = romname_region_initial:gsub("%) %(", ', ')
                            -- If no parenthesis, then add blank to prevent nil error
                            else
                                romname_region = " "
                            end

                            info = romname_noRegion_noExtension
                            app_title = romname_noRegion_noExtension

                            file.filename = file.name
                            file.name = romname_noExtension
                            file.title = romname_noRegion_noExtension
                            file.name_online = file.name
                            file.version = romname_region
                            file.name_title_search = title
                            file.apptitle = romname_noRegion_noExtension

                        end
                        --end of database lookup

                        -- OVERRIDES START

                        if System.doesFileExist(cur_dir .. "/overrides.dat") then
                            --String:   1 vita, 2 psp, 3 psx, 4 homebrew
                            --App_type: 1 vita, 2 psp, 3 psx, 0 homebrew                         

                            -- VITA
                            if string.match(str, file.name .. "=1") then
                                table.insert(games_table, file)

                                table.insert(folders_table, file)
                                file.app_type=1

                                custom_path = SystemsToScan[1].localCoverPath .. app_title .. ".png"
                                custom_path_id = SystemsToScan[1].localCoverPath .. file.name .. ".png"

                                file.cover_path_online = SystemsToScan[1].onlineCoverPathSystem
                                file.cover_path_local = SystemsToScan[1].localCoverPath
                                file.snap_path_online = SystemsToScan[1].onlineSnapPathSystem
                                file.snap_path_local = SystemsToScan[1].localSnapPath

                                if custom_path and System.doesFileExist(custom_path) then
                                    img_path = custom_path --custom cover by app name
                                elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                    img_path = custom_path_id --custom cover by app id
                                else
                                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psv.png") then
                                        img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psv.png"  --app icon
                                    else
                                        img_path = "app0:/DATA/noimg.png" --blank grey
                                    end
                                end

                            -- PSP
                            elseif string.match(str, file.name .. "=2") then
                                table.insert(psp_table, file)

                                table.insert(folders_table, file)
                                file.app_type=2

                                custom_path = SystemsToScan[3].localCoverPath .. app_title .. ".png"
                                custom_path_id = SystemsToScan[3].localCoverPath .. file.name .. ".png"

                                file.cover_path_online = SystemsToScan[3].onlineCoverPathSystem
                                file.cover_path_local = SystemsToScan[3].localCoverPath
                                file.snap_path_online = SystemsToScan[3].onlineSnapPathSystem
                                file.snap_path_local = SystemsToScan[3].localSnapPath

                                if custom_path and System.doesFileExist(custom_path) then
                                    img_path = custom_path --custom cover by app name
                                elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                    img_path = custom_path_id --custom cover by app id
                                else
                                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psp.png") then
                                        img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psp.png"  --app icon
                                    else
                                        img_path = "app0:/DATA/noimg.png" --blank grey
                                    end
                                end
                            
                            -- PSX
                            elseif string.match(str, file.name .. "=3") then
                                table.insert(psx_table, file)

                                table.insert(folders_table, file)
                                file.app_type=3

                                custom_path = SystemsToScan[4].localCoverPath .. app_title .. ".png"
                                custom_path_id = SystemsToScan[4].localCoverPath .. file.name .. ".png"

                                file.cover_path_online = SystemsToScan[4].onlineCoverPathSystem
                                file.cover_path_local = SystemsToScan[4].localCoverPath
                                file.snap_path_online = SystemsToScan[4].onlineSnapPathSystem
                                file.snap_path_local = SystemsToScan[4].localSnapPath

                                if custom_path and System.doesFileExist(custom_path) then
                                    img_path = custom_path --custom cover by app name
                                elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                    img_path = custom_path_id --custom cover by app id
                                else
                                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psx.png") then
                                        img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psx.png"  --app icon
                                    else
                                        img_path = "app0:/DATA/noimg.png" --blank grey
                                    end
                                end

                            -- HOMEBREW
                            elseif string.match(str, file.name .. "=4") then
                                table.insert(homebrews_table, file)

                                table.insert(folders_table, file)
                                file.app_type=0

                                custom_path = "ux0:/data/RetroFlow/COVERS/Homebrew/" .. app_title .. ".png"
                                custom_path_id = SystemsToScan[2].localCoverPath .. file.name .. ".png"

                                file.cover_path_online = SystemsToScan[2].onlineCoverPathSystem
                                file.cover_path_local = SystemsToScan[2].localCoverPath
                                file.snap_path_online = SystemsToScan[2].onlineSnapPathSystem
                                file.snap_path_local = SystemsToScan[2].localSnapPath

                                if custom_path and System.doesFileExist(custom_path) then
                                    img_path = custom_path --custom cover by app name
                                elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                    img_path = custom_path_id --custom cover by app id
                                else
                                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/icon_homebrew.png") then
                                        img_path = "ux0:/app/RETROFLOW/DATA/icon_homebrew.png"  --app icon
                                    else
                                        img_path = "app0:/DATA/noimg.png" --blank grey
                                    end
                                end

                            -- DEFAULT - PSP
                            else
                                table.insert(psp_table, file)

                                table.insert(folders_table, file)
                                file.app_type=2

                                custom_path = SystemsToScan[3].localCoverPath .. app_title .. ".png"
                                custom_path_id = SystemsToScan[3].localCoverPath .. file.name .. ".png"

                                file.cover_path_online = SystemsToScan[3].onlineCoverPathSystem
                                file.cover_path_local = SystemsToScan[3].localCoverPath
                                file.snap_path_online = SystemsToScan[3].onlineSnapPathSystem
                                file.snap_path_local = SystemsToScan[3].localSnapPath

                                if custom_path and System.doesFileExist(custom_path) then
                                    img_path = custom_path --custom cover by app name
                                elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                    img_path = custom_path_id --custom cover by app id
                                else
                                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psp.png") then
                                        img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psp.png"  --app icon
                                    else
                                        img_path = "app0:/DATA/noimg.png" --blank grey
                                    end
                                end
                            end
                        -- OVERRIDES END

                        -- NO OVERRIDE - PSP
                        else
                            table.insert(psp_table, file)

                            table.insert(folders_table, file)
                            file.app_type=2

                            custom_path = SystemsToScan[3].localCoverPath .. app_title .. ".png"
                            custom_path_id = SystemsToScan[3].localCoverPath .. file.name .. ".png"

                            file.cover_path_online = SystemsToScan[3].onlineCoverPathSystem
                            file.cover_path_local = SystemsToScan[3].localCoverPath
                            file.snap_path_online = SystemsToScan[3].onlineSnapPathSystem
                            file.snap_path_local = SystemsToScan[3].localSnapPath

                            if custom_path and System.doesFileExist(custom_path) then
                                img_path = custom_path --custom cover by app name
                            elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                img_path = custom_path_id --custom cover by app id
                            else
                                if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psp.png") then
                                    img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psp.png"  --app icon
                                else
                                    img_path = "app0:/DATA/noimg.png" --blank grey
                                end
                            end
                        end

                        table.insert(files_table, count_of_systems, file.app_type) 
                        table.insert(files_table, count_of_systems, file.name)
                        table.insert(files_table, count_of_systems, file.title)
                        table.insert(files_table, count_of_systems, file.name_online)
                        table.insert(files_table, count_of_systems, file.version)
                        table.insert(files_table, count_of_systems, file.name_title_search)

                        --add blank icon to all
                        file.icon = imgCoverTmp
                        file.icon_path = img_path
                        
                        table.insert(files_table, count_of_systems, file.icon)                     
                        table.insert(files_table, count_of_systems, file.apptitle) 

                    else
                    
                end
            end

            -- LOOKUP TITLE ID: Delete old file and save new list of matches

            if not System.doesFileExist(user_DB_Folder .. def_user_db_file) then
                CreateUserTitleTable_PSP_iso(def_user_db_file)
            else
                System.deleteFile(user_DB_Folder .. def_user_db_file)
                CreateUserTitleTable_PSP_iso(def_user_db_file)
            end

        end
    end

    function scan_PSP_game_folder (def_adrenaline_rom_location, def_user_db_file)
        if  System.doesDirExist(def_adrenaline_rom_location) then

            files_PSP = System.listDirectory(def_adrenaline_rom_location)

            for i, file in pairs(files_PSP) do
            local custom_path, custom_path_id, app_type, name, title, name_online, version, name_title_search = nil, nil, nil, nil, nil, nil, nil, nil
                if file.directory and System.doesFileExist(def_adrenaline_rom_location .. "/" .. file.name .. "/EBOOT.PBP") then

                    -- check if game is in the favorites list
                    if System.doesFileExist(cur_dir .. "/favorites.dat") then
                        if string.find(strFav, file.name,1,true) ~= nil then
                            file.favourite = true
                        else
                            file.favourite = false
                        end
                    end

                    if string.match(file.name, "NPEG")
                    or string.match(file.name, "NPEH")
                    or string.match(file.name, "UCES")
                    or string.match(file.name, "ULES")
                    or string.match(file.name, "NPUG")
                    or string.match(file.name, "NPUH")
                    or string.match(file.name, "UCUS")
                    or string.match(file.name, "ULUS")
                    or string.match(file.name, "NPJG")
                    or string.match(file.name, "NPJH")
                    or string.match(file.name, "NPHG")
                    or string.match(file.name, "NPHH")
                    or string.match(file.name, "UCAS") then

                        file.launch_argument = ("PATH=ms0:/PSP/GAME/" .. file.name .. "/EBOOT.PBP")
                        file.game_path = (def_adrenaline_rom_location .. "/" .. file.name)

                        romname_withExtension = file.name

                        romname_noExtension = {}
                        romname_noExtension = file.name

                        -- LOOKUP TITLE ID: Get game name based on titleID, search saved table of data, or sql table of data if titleID not found

                        -- Load previous matches
                        if System.doesFileExist(user_DB_Folder .. def_user_db_file) then
                            database_rename_PSP = user_DB_Folder .. def_user_db_file
                            pspdb = dofile(database_rename_PSP)
                        else
                            pspdb = {}
                        end

                        -- Check if scanned titleID is a saved match
                        psp_search = pspdb[romname_noExtension]

                        -- If no
                        if psp_search == nil then

                            -- Load the full sql database to find the new titleID

                            if System.doesFileExist(cur_dir .. "/DATABASES/psp.db") then
                                db = Database.open(cur_dir .. "/DATABASES/psp.db")

                                sql_db_search_mame = "\"" .. romname_noExtension .. "\""
                                search_term = "SELECT title FROM games where filename is "  .. sql_db_search_mame
                                sql_db_search_result = Database.execQuery(db, search_term)

                                if next(sql_db_search_result) == nil then
                                    -- Not found; use the folder name without adding a game name
                                    title = romname_noExtension
                                else
                                    -- Found; use the game name from the full database
                                    title = sql_db_search_result[1].title
                                end

                            else
                            end

                        -- If found; use the game name from the saved match
                        else
                            title = pspdb[romname_noExtension].name
                        end

                        romname_noRegion_noExtension = {}
                        romname_noRegion_noExtension = title:gsub(" %(", "%("):gsub('%b()', '')

                        -- Check if name contains parenthesis, if yes strip out to show as version
                        if string.find(title, "%(") then
                            -- Remove all text except for within "()"
                            romname_region_initial = {}
                            romname_region_initial = title:match("%((.+)%)")

                            -- Tidy up remainder when more than one set of parenthesis used, replace  ") (" with ", "
                            romname_region = {}
                            romname_region = romname_region_initial:gsub("%) %(", ', ')
                        -- If no parenthesis, then add blank to prevent nil error
                        else
                            romname_region = " "
                        end

                        info = romname_noRegion_noExtension
                        app_title = romname_noRegion_noExtension

                        file.filename = file.name
                        file.name = romname_noExtension
                        file.title = romname_noRegion_noExtension
                        file.name_online = tostring(file.name)
                        file.version = romname_region
                        file.name_title_search = title
                        file.apptitle = romname_noRegion_noExtension
                        file.date_played = 0

                        -- OVERRIDES START

                        if System.doesFileExist(cur_dir .. "/overrides.dat") then
                            --String:   1 vita, 2 psp, 3 psx, 4 homebrew
                            --App_type: 1 vita, 2 psp, 3 psx, 0 homebrew                         

                            -- VITA
                            if string.match(str, file.name .. "=1") then
                                table.insert(games_table, file)

                                table.insert(folders_table, file)
                                file.app_type=1

                                custom_path = SystemsToScan[1].localCoverPath .. app_title .. ".png"
                                custom_path_id = SystemsToScan[1].localCoverPath .. file.name .. ".png"

                                file.cover_path_online = SystemsToScan[1].onlineCoverPathSystem
                                file.cover_path_local = SystemsToScan[1].localCoverPath
                                file.snap_path_online = SystemsToScan[1].onlineSnapPathSystem
                                file.snap_path_local = SystemsToScan[1].localSnapPath

                                if custom_path and System.doesFileExist(custom_path) then
                                    img_path = custom_path --custom cover by app name
                                elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                    img_path = custom_path_id --custom cover by app id
                                else
                                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psv.png") then
                                        img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psv.png"  --app icon
                                    else
                                        img_path = "app0:/DATA/noimg.png" --blank grey
                                    end
                                end

                            -- PSP
                            elseif string.match(str, file.name .. "=2") then
                                table.insert(psp_table, file)

                                table.insert(folders_table, file)
                                file.app_type=2

                                custom_path = SystemsToScan[3].localCoverPath .. app_title .. ".png"
                                custom_path_id = SystemsToScan[3].localCoverPath .. file.name .. ".png"

                                file.cover_path_online = SystemsToScan[3].onlineCoverPathSystem
                                file.cover_path_local = SystemsToScan[3].localCoverPath
                                file.snap_path_online = SystemsToScan[3].onlineSnapPathSystem
                                file.snap_path_local = SystemsToScan[3].localSnapPath

                                if custom_path and System.doesFileExist(custom_path) then
                                    img_path = custom_path --custom cover by app name
                                elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                    img_path = custom_path_id --custom cover by app id
                                else
                                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psp.png") then
                                        img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psp.png"  --app icon
                                    else
                                        img_path = "app0:/DATA/noimg.png" --blank grey
                                    end
                                end
                            
                            -- PSX
                            elseif string.match(str, file.name .. "=3") then
                                table.insert(psx_table, file)

                                table.insert(folders_table, file)
                                file.app_type=3

                                custom_path = SystemsToScan[4].localCoverPath .. app_title .. ".png"
                                custom_path_id = SystemsToScan[4].localCoverPath .. file.name .. ".png"

                                file.cover_path_online = SystemsToScan[4].onlineCoverPathSystem
                                file.cover_path_local = SystemsToScan[4].localCoverPath
                                file.snap_path_online = SystemsToScan[4].onlineSnapPathSystem
                                file.snap_path_local = SystemsToScan[4].localSnapPath

                                if custom_path and System.doesFileExist(custom_path) then
                                    img_path = custom_path --custom cover by app name
                                elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                    img_path = custom_path_id --custom cover by app id
                                else
                                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psx.png") then
                                        img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psx.png"  --app icon
                                    else
                                        img_path = "app0:/DATA/noimg.png" --blank grey
                                    end
                                end

                            -- HOMEBREW
                            elseif string.match(str, file.name .. "=4") then
                                table.insert(homebrews_table, file)

                                table.insert(folders_table, file)
                                file.app_type=0

                                custom_path = SystemsToScan[2].localCoverPath .. app_title .. ".png"
                                custom_path_id = SystemsToScan[2].localCoverPath .. file.name .. ".png"

                                file.cover_path_online = SystemsToScan[2].onlineCoverPathSystem
                                file.cover_path_local = SystemsToScan[2].localCoverPath
                                file.snap_path_online = SystemsToScan[2].onlineSnapPathSystem
                                file.snap_path_local = SystemsToScan[2].localSnapPath

                                if custom_path and System.doesFileExist(custom_path) then
                                    img_path = custom_path --custom cover by app name
                                elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                    img_path = custom_path_id --custom cover by app id
                                else
                                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/icon_homebrew.png") then
                                        img_path = "ux0:/app/RETROFLOW/DATA/icon_homebrew.png"  --app icon
                                    else
                                        img_path = "app0:/DATA/noimg.png" --blank grey
                                    end
                                end

                            -- DEFAULT - PSP
                            else
                                table.insert(psp_table, file)

                                table.insert(folders_table, file)
                                file.app_type=2

                                custom_path = SystemsToScan[3].localCoverPath .. app_title .. ".png"
                                custom_path_id = SystemsToScan[3].localCoverPath .. file.name .. ".png"

                                file.cover_path_online = SystemsToScan[3].onlineCoverPathSystem
                                file.cover_path_local = SystemsToScan[3].localCoverPath
                                file.snap_path_online = SystemsToScan[3].onlineSnapPathSystem
                                file.snap_path_local = SystemsToScan[3].localSnapPath

                                if custom_path and System.doesFileExist(custom_path) then
                                    img_path = custom_path --custom cover by app name
                                elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                    img_path = custom_path_id --custom cover by app id
                                else
                                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psp.png") then
                                        img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psp.png"  --app icon
                                    else
                                        img_path = "app0:/DATA/noimg.png" --blank grey
                                    end
                                end
                            end
                        -- OVERRIDES END

                        -- NO OVERRIDE - PSP
                        else
                            table.insert(psp_table, file)

                            table.insert(folders_table, file)
                            file.app_type=2

                            custom_path = SystemsToScan[3].localCoverPath .. app_title .. ".png"
                            custom_path_id = SystemsToScan[3].localCoverPath .. file.name .. ".png"

                            file.cover_path_online = SystemsToScan[3].onlineCoverPathSystem
                            file.cover_path_local = SystemsToScan[3].localCoverPath
                            file.snap_path_online = SystemsToScan[3].onlineSnapPathSystem
                            file.snap_path_local = SystemsToScan[3].localSnapPath

                            if custom_path and System.doesFileExist(custom_path) then
                                img_path = custom_path --custom cover by app name
                            elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                img_path = custom_path_id --custom cover by app id
                            else
                                if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psp.png") then
                                    img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psp.png"  --app icon
                                else
                                    img_path = "app0:/DATA/noimg.png" --blank grey
                                end
                            end
                        end

                        table.insert(files_table, count_of_systems, file.app_type) 
                        table.insert(files_table, count_of_systems, file.name)
                        table.insert(files_table, count_of_systems, file.title)
                        table.insert(files_table, count_of_systems, file.name_online)
                        table.insert(files_table, count_of_systems, file.version)
                        table.insert(files_table, count_of_systems, file.name_title_search)

                        --add blank icon to all
                        file.icon = imgCoverTmp
                        file.icon_path = img_path
                        
                        table.insert(files_table, count_of_systems, file.icon)                     
                        table.insert(files_table, count_of_systems, file.apptitle) 

                    else
                    end
                    
                end
            end

            -- LOOKUP TITLE ID: Delete old file and save new list of matches

            if not System.doesFileExist(user_DB_Folder .. def_user_db_file) then
                CreateUserTitleTable_PSP_game(def_user_db_file)
            else
                System.deleteFile(user_DB_Folder .. def_user_db_file)
                CreateUserTitleTable_PSP_game(def_user_db_file)
            end

        end
    end

    function scan_PS1_game_folder (def_adrenaline_rom_location, def_user_db_file)
            if  System.doesDirExist(def_adrenaline_rom_location) then

                files_PSX = System.listDirectory(def_adrenaline_rom_location)

                for i, file in pairs(files_PSX) do
                local custom_path, custom_path_id, app_type, name, title, name_online, version, name_title_search = nil, nil, nil, nil, nil, nil, nil, nil
                    if file.directory and System.doesFileExist(def_adrenaline_rom_location .. "/" .. file.name .. "/EBOOT.PBP") then

                        -- check if game is in the favorites list
                        if System.doesFileExist(cur_dir .. "/favorites.dat") then
                            if string.find(strFav, file.name,1,true) ~= nil then
                                file.favourite = true
                            else
                                file.favourite = false
                            end
                        end

                        if not string.match(file.name, "NPEG")
                        and not string.match(file.name, "NPEH")
                        and not string.match(file.name, "UCES")
                        and not string.match(file.name, "ULES")
                        and not string.match(file.name, "NPUG")
                        and not string.match(file.name, "NPUH")
                        and not string.match(file.name, "UCUS")
                        and not string.match(file.name, "ULUS")
                        and not string.match(file.name, "NPJG")
                        and not string.match(file.name, "NPJH")
                        and not string.match(file.name, "NPHG")
                        and not string.match(file.name, "NPHH")
                        and not string.match(file.name, "UCAS") then

                            file.launch_argument = ("PATH=ms0:/PSP/GAME/" .. file.name .. "/EBOOT.PBP")
                            file.game_path = (def_adrenaline_rom_location .. "/" .. file.name)

                            romname_withExtension = file.name

                            romname_noExtension = {}
                            romname_noExtension = file.name

                            -- LOOKUP TITLE ID: Get game name based on titleID, search saved table of data, or sql table of data if titleID not found

                            -- Load previous matches
                            if System.doesFileExist(user_DB_Folder .. def_user_db_file) then
                                database_rename_PSX = user_DB_Folder .. def_user_db_file
                                psxdb = dofile(database_rename_PSX)
                            else
                                psxdb = {}
                            end

                            -- Check if scanned titleID is a saved match
                            psx_search = psxdb[romname_noExtension]

                            -- If no
                            if psx_search == nil then

                                -- Load the full sql database to find the new titleID

                                if System.doesFileExist(cur_dir .. "/DATABASES/psx.db") then
                                    db = Database.open(cur_dir .. "/DATABASES/psx.db")

                                    sql_db_search_mame = "\"" .. romname_noExtension .. "\""
                                    search_term = "SELECT title FROM games where filename is "  .. sql_db_search_mame
                                    sql_db_search_result = Database.execQuery(db, search_term)

                                    if next(sql_db_search_result) == nil then
                                        -- Not found; use the folder name without adding a game name
                                        title = romname_noExtension
                                    else
                                        -- Found; use the game name from the full database
                                        title = sql_db_search_result[1].title
                                    end

                                else
                                end

                            -- If found; use the game name from the saved match
                            else
                                title = psxdb[romname_noExtension].name
                            end

                            romname_noRegion_noExtension = {}
                            romname_noRegion_noExtension = title:gsub(" %(", "%("):gsub('%b()', ''):gsub(" %[", "%["):gsub('%b[]', '')

                            -- Check if name contains parenthesis, if yes strip out to show as version
                            if string.find(title, "%(") then
                                -- Remove all text except for within "()"
                                romname_region_initial = {}
                                romname_region_initial = title:match("%((.+)%)")

                                -- Tidy up remainder when more than one set of parenthesis used, replace  ") (" with ", "
                                romname_region = {}
                                romname_region = romname_region_initial:gsub("%) %(", ', ')
                            -- If no parenthesis, then add blank to prevent nil error
                            else
                                romname_region = " "
                            end

                            info = romname_noRegion_noExtension
                            app_title = romname_noRegion_noExtension
                            
                            file.filename = file.name
                            file.name = romname_noExtension
                            file.title = romname_noRegion_noExtension
                            file.name_online = tostring(file.name)
                            file.version = romname_region
                            file.name_title_search = title
                            file.apptitle = romname_noRegion_noExtension
                            file.date_played = 0

                            -- OVERRIDES START

                            if System.doesFileExist(cur_dir .. "/overrides.dat") then
                                --String:   1 vita, 2 psp, 3 psx, 4 homebrew
                                --App_type: 1 vita, 2 psp, 3 psx, 0 homebrew                         

                                -- VITA
                                if string.match(str, file.name .. "=1") then
                                    table.insert(games_table, file)

                                    table.insert(folders_table, file)
                                    file.app_type=1

                                    custom_path = SystemsToScan[1].localCoverPath .. app_title .. ".png"
                                    custom_path_id = SystemsToScan[1].localCoverPath .. file.name .. ".png"

                                    file.cover_path_online = SystemsToScan[1].onlineCoverPathSystem
                                    file.cover_path_local = SystemsToScan[1].localCoverPath
                                    file.snap_path_online = SystemsToScan[1].onlineSnapPathSystem
                                    file.snap_path_local = SystemsToScan[1].localSnapPath

                                    if custom_path and System.doesFileExist(custom_path) then
                                        img_path = custom_path --custom cover by app name
                                    elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                        img_path = custom_path_id --custom cover by app id
                                    else
                                        if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psv.png") then
                                            img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psv.png"  --app icon
                                        else
                                            img_path = "app0:/DATA/noimg.png" --blank grey
                                        end
                                    end

                                -- PSP
                                elseif string.match(str, file.name .. "=2") then
                                    table.insert(psp_table, file)

                                    table.insert(folders_table, file)
                                    file.app_type=2

                                    custom_path = SystemsToScan[3].localCoverPath .. app_title .. ".png"
                                    custom_path_id = SystemsToScan[3].localCoverPath .. file.name .. ".png"

                                    file.cover_path_online = SystemsToScan[3].onlineCoverPathSystem
                                    file.cover_path_local = SystemsToScan[3].localCoverPath
                                    file.snap_path_online = SystemsToScan[3].onlineSnapPathSystem
                                    file.snap_path_local = SystemsToScan[3].localSnapPath

                                    if custom_path and System.doesFileExist(custom_path) then
                                        img_path = custom_path --custom cover by app name
                                    elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                        img_path = custom_path_id --custom cover by app id
                                    else
                                        if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psp.png") then
                                            img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psp.png"  --app icon
                                        else
                                            img_path = "app0:/DATA/noimg.png" --blank grey
                                        end
                                    end
                                
                                -- PSX
                                elseif string.match(str, file.name .. "=3") then
                                    table.insert(psx_table, file)

                                    table.insert(folders_table, file)
                                    file.app_type=3

                                    custom_path = SystemsToScan[4].localCoverPath .. app_title .. ".png"
                                    custom_path_id = SystemsToScan[4].localCoverPath .. file.name .. ".png"

                                    file.cover_path_online = SystemsToScan[4].onlineCoverPathSystem
                                    file.cover_path_local = SystemsToScan[4].localCoverPath
                                    file.snap_path_online = SystemsToScan[4].onlineSnapPathSystem
                                    file.snap_path_local = SystemsToScan[4].localSnapPath

                                    if custom_path and System.doesFileExist(custom_path) then
                                        img_path = custom_path --custom cover by app name
                                    elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                        img_path = custom_path_id --custom cover by app id
                                    else
                                        if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psx.png") then
                                            img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psx.png"  --app icon
                                        else
                                            img_path = "app0:/DATA/noimg.png" --blank grey
                                        end
                                    end

                                -- HOMEBREW
                                elseif string.match(str, file.name .. "=4") then
                                    table.insert(homebrews_table, file)

                                    table.insert(folders_table, file)
                                    file.app_type=0

                                    custom_path = SystemsToScan[2].localCoverPath .. app_title .. ".png"
                                    custom_path_id = SystemsToScan[2].localCoverPath .. file.name .. ".png"

                                    file.cover_path_online = SystemsToScan[2].onlineCoverPathSystem
                                    file.cover_path_local = SystemsToScan[2].localCoverPath
                                    file.snap_path_online = SystemsToScan[2].onlineSnapPathSystem
                                    file.snap_path_local = SystemsToScan[2].localSnapPath

                                    if custom_path and System.doesFileExist(custom_path) then
                                        img_path = custom_path --custom cover by app name
                                    elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                        img_path = custom_path_id --custom cover by app id
                                    else
                                        if System.doesFileExist("ux0:/app/RETROFLOW/DATA/icon_homebrew.png") then
                                            img_path = "ux0:/app/RETROFLOW/DATA/icon_homebrew.png"  --app icon
                                        else
                                            img_path = "app0:/DATA/noimg.png" --blank grey
                                        end
                                    end

                                -- DEFAULT - PSX
                                else
                                    table.insert(psx_table, file)

                                    table.insert(folders_table, file)
                                    file.app_type=3

                                    custom_path = SystemsToScan[4].localCoverPath .. app_title .. ".png"
                                    custom_path_id = SystemsToScan[4].localCoverPath .. file.name .. ".png"

                                    file.cover_path_online = SystemsToScan[4].onlineCoverPathSystem
                                    file.cover_path_local = SystemsToScan[4].localCoverPath
                                    file.snap_path_online = SystemsToScan[4].onlineSnapPathSystem
                                    file.snap_path_local = SystemsToScan[4].localSnapPath

                                    if custom_path and System.doesFileExist(custom_path) then
                                        img_path = custom_path --custom cover by app name
                                    elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                        img_path = custom_path_id --custom cover by app id
                                    else
                                        if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psx.png") then
                                            img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psx.png"  --app icon
                                        else
                                            img_path = "app0:/DATA/noimg.png" --blank grey
                                        end
                                    end
                                end
                            -- OVERRIDES END

                            -- NO OVERRIDE
                            else
                                table.insert(psx_table, file)

                                table.insert(folders_table, file)
                                file.app_type=3

                                custom_path = SystemsToScan[4].localCoverPath .. app_title .. ".png"
                                custom_path_id = SystemsToScan[4].localCoverPath .. file.name .. ".png"

                                file.cover_path_online = SystemsToScan[4].onlineCoverPathSystem
                                file.cover_path_local = SystemsToScan[4].localCoverPath
                                file.snap_path_online = SystemsToScan[4].onlineSnapPathSystem
                                file.snap_path_local = SystemsToScan[4].localSnapPath
                                
                                if custom_path and System.doesFileExist(custom_path) then
                                    img_path = SystemsToScan[4].localCoverPath .. file.name .. ".png" --custom cover by app name
                                elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                    img_path = SystemsToScan[4].localCoverPath .. file.name .. ".png" --custom cover by app id
                                else
                                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psx.png") then
                                        img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psx.png"  --app icon
                                    else
                                        img_path = "app0:/DATA/noimg.png" --blank grey
                                    end
                                end
                            end

                            table.insert(files_table, count_of_systems, file.app_type) 
                            table.insert(files_table, count_of_systems, file.name)
                            table.insert(files_table, count_of_systems, file.title)
                            table.insert(files_table, count_of_systems, file.name_online)
                            table.insert(files_table, count_of_systems, file.version)
                            table.insert(files_table, count_of_systems, file.name_title_search)

                            --add blank icon to all
                            file.icon = imgCoverTmp
                            file.icon_path = img_path
                            
                            table.insert(files_table, count_of_systems, file.icon)                     
                            table.insert(files_table, count_of_systems, file.apptitle)

                        else
                        end

                        
                    end
                end

                -- LOOKUP TITLE ID: Delete old file and save new list of matches
                if not System.doesFileExist(user_DB_Folder .. def_user_db_file) then
                    CreateUserTitleTable_PSX(def_user_db_file)
                else
                    System.deleteFile(user_DB_Folder .. def_user_db_file)
                    CreateUserTitleTable_PSX(def_user_db_file)
                end

            end
        end

    if Adrenaline_roms == 1 then
        -- Scan Adrenaline - ux0
        scan_PSP_iso_folder (adrenaline_PSP_ISO_ux0, "psp_iso.lua")
        scan_PSP_game_folder (adrenaline_PSP_GAME_ux0, "psp_game.lua")
        scan_PS1_game_folder (adrenaline_PSP_GAME_ux0, "psx.lua")
    else
        -- Scan Adrenaline - uma0
        scan_PSP_iso_folder (adrenaline_PSP_ISO_uma0, "psp_iso_uma0.lua")   
        scan_PSP_game_folder (adrenaline_PSP_GAME_uma0, "psp_game_uma0.lua")
        scan_PS1_game_folder (adrenaline_PSP_GAME_uma0, "psx_uma0.lua")
    end

    update_cached_table("db_psp.lua", psp_table)
    update_cached_table("db_psx.lua", psx_table)
end


function import_cached_DB(dir)
    dir = System.listDirectory(dir)
    folders_table = {}
    files_table = {}
    games_table = {}
    homebrews_table = {}
    psp_table = {}
    psx_table = {}
    n64_table = {}
    snes_table = {}
    nes_table = {}
    gba_table = {}
    gbc_table = {}
    gb_table = {}
    sega_cd_table = {}
    s32x_table = {}
    md_table = {}
    sms_table = {}
    gg_table = {}
    tg16_table = {}
    tgcd_table = {}
    pce_table = {}
    pcecd_table = {}
    amiga_table = {}
    c64_table = {}
    wswan_col_table = {}
    wswan_table = {}
    msx2_table = {}
    msx1_table = {}
    zxs_table = {}
    atari_7800_table = {}
    atari_5200_table = {}
    atari_2600_table = {}
    atari_lynx_table = {}
    colecovision_table = {}
    vectrex_table = {}
    fba_table = {}
    mame_2003_plus_table = {}
    mame_2000_table = {}
    neogeo_table = {} 
    ngpc_table = {}
    recently_played_table = {}
    search_results_table = {}

    local file_over = System.openFile(cur_dir .. "/overrides.dat", FREAD)
    local filesize = System.sizeFile(file_over)
    local str = System.readFile(file_over, filesize)
    System.closeFile(file_over)


    function import_cached_DB_tables(def_user_db_file, def_table_name)
        if System.doesFileExist(db_Cache_Folder .. (def_user_db_file)) then
            db_Cache = db_Cache_Folder .. (def_user_db_file)

            local db_import = {}
            db_import = dofile(db_Cache)

            for k, v in ipairs(db_import) do
                table.insert(folders_table, v)
                table.insert((def_table_name), v)

                --add blank icon to all
                v.icon = imgCoverTmp
                v.icon_path = v.icon_path

                v.apptitle = v.apptitle
                table.insert(files_table, count_of_systems, v.apptitle) 
            end
        end
    end

    
    import_cached_DB_tables("db_games.lua", games_table)
    if showHomebrews == 1 then
        import_cached_DB_tables("db_homebrews.lua", homebrews_table)
    else
    end
    import_cached_DB_tables("db_psp.lua", psp_table)
    import_cached_DB_tables("db_psx.lua", psx_table)
    import_cached_DB_tables("db_n64.lua", n64_table)
    import_cached_DB_tables("db_snes.lua", snes_table)
    import_cached_DB_tables("db_nes.lua", nes_table)
    import_cached_DB_tables("db_gba.lua", gba_table)
    import_cached_DB_tables("db_gbc.lua", gbc_table)
    import_cached_DB_tables("db_gb.lua", gb_table)
    import_cached_DB_tables("db_sega_cd.lua", sega_cd_table)
    import_cached_DB_tables("db_32x.lua", s32x_table)
    import_cached_DB_tables("db_md.lua", md_table)
    import_cached_DB_tables("db_sms.lua", sms_table)
    import_cached_DB_tables("db_gg.lua", gg_table)
    import_cached_DB_tables("db_tg16.lua", tg16_table)
    import_cached_DB_tables("db_tgcdlua", tgcd_table)
    import_cached_DB_tables("db_pce.lua", pce_table)
    import_cached_DB_tables("db_pcecd.lua", pcecd_table)
    import_cached_DB_tables("db_amiga.lua", amiga_table)
    import_cached_DB_tables("db_c64.lua", c64_table)
    import_cached_DB_tables("db_wswan_col.lua", wswan_col_table)
    import_cached_DB_tables("db_wswan.lua", wswan_table)
    import_cached_DB_tables("db_msx2.lua", msx2_table)
    import_cached_DB_tables("db_msx1.lua", msx1_table)
    import_cached_DB_tables("db_zxs.lua", zxs_table)
    import_cached_DB_tables("db_atari_7800.lua", atari_7800_table)
    import_cached_DB_tables("db_atari_5200.lua", atari_5200_table)
    import_cached_DB_tables("db_atari_2600.lua", atari_2600_table)
    import_cached_DB_tables("db_atari_lynx.lua", atari_lynx_table)
    import_cached_DB_tables("db_colecovision.lua", colecovision_table)
    import_cached_DB_tables("db_vectrex.lua", vectrex_table)
    import_cached_DB_tables("db_fba.lua", fba_table)
    import_cached_DB_tables("db_mame_2003_plus.lua", mame_2003_plus_table)
    import_cached_DB_tables("db_mame_2000.lua", mame_2000_table)
    import_cached_DB_tables("db_neogeo.lua", neogeo_table)
    import_cached_DB_tables("db_ngpc.lua", ngpc_table)
    import_recently_played()
    update_md_regional_cover()
    

    table.sort(files_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(folders_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(games_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(homebrews_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(psp_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(psx_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)

    table.sort(n64_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(snes_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(nes_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(gba_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(gbc_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(gb_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(sega_cd_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(s32x_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(md_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(sms_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(gg_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(tg16_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(tgcd_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(pce_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(pcecd_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(amiga_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(c64_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(wswan_col_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(wswan_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(msx2_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(msx1_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(zxs_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(atari_7800_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(atari_5200_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(atari_2600_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(atari_lynx_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(colecovision_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(vectrex_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(fba_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(mame_2003_plus_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(mame_2000_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(neogeo_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(ngpc_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)

    table.sort(recently_played_table, function(a, b) return (tonumber(a.date_played) > tonumber(b.date_played)) end)

    return_table = TableConcat(folders_table, files_table)

    total_all = #files_table
    total_games = #games_table
    total_homebrews = #homebrews_table
    total_recently_played = #recently_played_table
    
    return return_table
end


function loadImage(img_path)
    imgTmp = Graphics.loadImage(img_path)
end


-- CHECK IF STARTUP SCAN IS ON
-- 0 Off, 1 On
if startupScan == 1 then
    -- Startup scan is ON

    -- Scan folders and games
    files_table = listDirectory(System.currentDirectory())
else
    -- Startup scan is OFF

    -- Check cache files before importing, does the folder exist?
    if  System.doesDirExist(db_Cache_Folder) then

        -- Folder exists - Count files
        cache_file_count = System.listDirectory(db_Cache_Folder)
        if #cache_file_count < count_of_cache_files then
            -- Files missing - rescan
            files_table = listDirectory(System.currentDirectory())
        else
            -- Files all pesent - Import Cached Database
            files_table = import_cached_DB(System.currentDirectory())
        end
    else
        -- Folder missing - rescan
        files_table = listDirectory(System.currentDirectory())
    end
end


function getAppSize(dir)
    local size = 0
    local function get_size(dir)
        local d = System.listDirectory(dir) or {}
        for _, v in ipairs(d) do
            if v.directory then
                get_size(dir .. "/" .. v.name)
            else
                size = size + v.size
            end
        end
    end
    get_size(dir)
    return size
end



function getRomSize()
    -- Get rom size in mb and kb for info screen
    local size = 0
    tmpfile = System.openFile(appdir, FREAD)
    size = System.sizeFile(tmpfile)
    System.closeFile(tmpfile)

    if size < 900000 then -- Guessed at number, seems fine
        app_size = size/1024
        game_size = string.format("%02d", app_size) .. "Kb"
    else
        app_size = size/1024/1024
        game_size = string.format("%02d", app_size) .. "Mb"
    end
end


function GetPicPath(def_table_name)
    -- Get pic from backgrounds folder, or use default

    -- Check backgrounds folder
    if System.doesFileExist((def_table_name)[p].snap_path_local .. (def_table_name)[p].name .. ".png") then
        pic_path = (def_table_name)[p].snap_path_local .. (def_table_name)[p].name .. ".png"

    -- Not found? Then check ur0 pic
    elseif System.doesFileExist("ur0:/appmeta/" .. (def_table_name)[p].name .. "/pic0.png") then
        pic_path = "ur0:/appmeta/" .. (def_table_name)[p].name .. "/pic0.png"

    -- Still not found? Then check ux0 and use bg.png instead
    elseif System.doesFileExist("ux0:/app/" .. (def_table_name)[p].name .. "/sce_sys/livearea/contents/bg.png") then
        pic_path = "ux0:/app/" .. (def_table_name)[p].name .. "/sce_sys/livearea/contents/bg.png"

    -- Still not found? Then check ux0 and use bg0.png instead
    elseif System.doesFileExist("ux0:/app/" .. (def_table_name)[p].name .. "/sce_sys/livearea/contents/bg0.png") then
        pic_path = "ux0:/app/" .. (def_table_name)[p].name .. "/sce_sys/livearea/contents/bg0.png"

    -- Still not found? Are you kidding? Screw it, no background then
    else
        pic_path = ""
    end
end

function GetInfoSelected()
    if showCat == 1 then
        if #games_table > 0 then
            info = games_table[p].name

            if string.match (games_table[p].game_path, "pspemu") then
                icon_path = "ux0:/app/RETROFLOW/DATA/icon_psv.png"
            else
                icon_path = "ur0:/appmeta/" .. games_table[p].name .. "/icon0.png"
            end

            -- Get pic
            GetPicPath(games_table)

            app_title = games_table[p].title
            apptype = games_table[p].app_type
            appdir = games_table[p].game_path
            folder = games_table[p].directory
            filename = games_table[p].filename
            favourite_flag = games_table[p].favourite

            app_titleid = games_table[p].name
            app_version = games_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 2 then
        if #homebrews_table > 0 then
            info = homebrews_table[p].name
            icon_path = homebrews_table[p].icon_path

            -- if string.match (homebrews_table[p].icon_path, "pspemu") then
            --     icon_path = "ux0:/app/RETROFLOW/DATA/icon_homebrew.png"
            -- else
            --     icon_path = homebrews_table[p].icon_path
            -- end

            -- Get pic
            GetPicPath(homebrews_table)

            app_title = homebrews_table[p].title
            apptype = homebrews_table[p].app_type
            appdir = homebrews_table[p].game_path
            folder = homebrews_table[p].directory
            filename = homebrews_table[p].filename
            favourite_flag = homebrews_table[p].favourite

            app_titleid = homebrews_table[p].name
            app_version = homebrews_table[p].version
        else
            app_title = "-"
        end

    elseif showCat == 3 then
        if #psp_table > 0 then
            info = psp_table[p].name
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_psp.png"
            pic_path = psp_table[p].snap_path_local .. psp_table[p].name .. ".png"
            app_title = psp_table[p].title
            apptype = psp_table[p].app_type
            appdir = psp_table[p].game_path
            folder = psp_table[p].directory
            filename = psp_table[p].filename
            favourite_flag = psp_table[p].favourite

            app_titleid = psp_table[p].name
            app_version = psp_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 4 then
        if #psx_table > 0 then
            info = psx_table[p].name
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_psx.png"
            pic_path = psx_table[p].snap_path_local .. psx_table[p].name .. ".png"
            app_title = psx_table[p].title
            apptype = psx_table[p].app_type
            appdir = psx_table[p].game_path
            folder = psx_table[p].directory
            filename = psx_table[p].filename
            favourite_flag = psx_table[p].favourite

            app_titleid = psx_table[p].name
            app_version = psx_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 5 then
        if #n64_table > 0 then
            info = n64_table[p].name            
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_n64.png"
            pic_path = n64_table[p].snap_path_local .. n64_table[p].name .. ".png"
            app_title = n64_table[p].title
            apptype = n64_table[p].app_type
            appdir = n64_table[p].game_path
            folder = n64_table[p].directory
            filename = n64_table[p].filename
            favourite_flag = n64_table[p].favourite

            app_titleid = n64_table[p].name
            app_version = n64_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 6 then
        if #snes_table > 0 then
            info = snes_table[p].name
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_snes.png"
            pic_path = snes_table[p].snap_path_local .. snes_table[p].name .. ".png"
            app_title = snes_table[p].title
            apptype = snes_table[p].app_type
            appdir = snes_table[p].game_path
            folder = snes_table[p].directory
            filename = snes_table[p].filename
            favourite_flag = snes_table[p].favourite

            app_titleid = snes_table[p].name
            app_version = snes_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 7 then
        if #nes_table > 0 then
            info = nes_table[p].name
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_nes.png"
            pic_path = nes_table[p].snap_path_local .. nes_table[p].name .. ".png"
            app_title = nes_table[p].title
            apptype = nes_table[p].app_type
            appdir = nes_table[p].game_path
            folder = nes_table[p].directory
            filename = nes_table[p].filename
            favourite_flag = nes_table[p].favourite

            app_titleid = nes_table[p].name
            app_version = nes_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 8 then
        if #gba_table > 0 then
            info = gba_table[p].name            
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_gba.png"
            pic_path = gba_table[p].snap_path_local .. gba_table[p].name .. ".png"
            app_title = gba_table[p].title
            apptype = gba_table[p].app_type
            appdir = gba_table[p].game_path
            folder = gba_table[p].directory
            filename = gba_table[p].filename
            favourite_flag = gba_table[p].favourite

            app_titleid = gba_table[p].name
            app_version = gba_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 9 then
        if #gbc_table > 0 then
            info = gbc_table[p].name            
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_gbc.png"
            pic_path = gbc_table[p].snap_path_local .. gbc_table[p].name .. ".png"
            app_title = gbc_table[p].title
            apptype = gbc_table[p].app_type
            appdir = gbc_table[p].game_path
            folder = gbc_table[p].directory
            filename = gbc_table[p].filename
            favourite_flag = gbc_table[p].favourite

            app_titleid = gbc_table[p].name
            app_version = gbc_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 10 then
        if #gb_table > 0 then
            info = gb_table[p].name            
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_gb.png"
            pic_path = gb_table[p].snap_path_local .. gb_table[p].name .. ".png"
            app_title = gb_table[p].title
            apptype = gb_table[p].app_type
            appdir = gb_table[p].game_path
            folder = gb_table[p].directory
            filename = gb_table[p].filename
            favourite_flag = gb_table[p].favourite

            app_titleid = gb_table[p].name
            app_version = gb_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 11 then
        if #sega_cd_table > 0 then
            info = sega_cd_table[p].name            
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_sega_cd.png"
            pic_path = sega_cd_table[p].snap_path_local .. sega_cd_table[p].name .. ".png"
            app_title = sega_cd_table[p].title
            apptype = sega_cd_table[p].app_type
            appdir = sega_cd_table[p].game_path
            folder = sega_cd_table[p].directory
            filename = sega_cd_table[p].filename
            favourite_flag = sega_cd_table[p].favourite

            app_titleid = sega_cd_table[p].name
            app_version = sega_cd_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 12 then
        if #s32x_table > 0 then
            info = s32x_table[p].name            
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_32x.png"
            pic_path = s32x_table[p].snap_path_local .. s32x_table[p].name .. ".png"
            app_title = s32x_table[p].title
            apptype = s32x_table[p].app_type
            appdir = s32x_table[p].game_path
            folder = s32x_table[p].directory
            filename = s32x_table[p].filename
            favourite_flag = s32x_table[p].favourite

            app_titleid = s32x_table[p].name
            app_version = s32x_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 13 then
        if #md_table > 0 then
            info = md_table[p].name
            if setLanguage == 1 then
                icon_path = "ux0:/app/RETROFLOW/DATA/icon_md_usa.png"
            else
                icon_path = "ux0:/app/RETROFLOW/DATA/icon_md.png"
            end
            pic_path = md_table[p].snap_path_local .. md_table[p].name .. ".png"
            app_title = md_table[p].title
            apptype = md_table[p].app_type
            appdir = md_table[p].game_path
            folder = md_table[p].directory
            filename = md_table[p].filename
            favourite_flag = md_table[p].favourite

            app_titleid = md_table[p].name
            app_version = md_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 14 then
        if #sms_table > 0 then
            info = sms_table[p].name
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_sms.png"
            pic_path = sms_table[p].snap_path_local .. sms_table[p].name .. ".png"
            app_title = sms_table[p].title
            apptype = sms_table[p].app_type
            appdir = sms_table[p].game_path
            folder = sms_table[p].directory
            filename = sms_table[p].filename
            favourite_flag = sms_table[p].favourite

            app_titleid = sms_table[p].name
            app_version = sms_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 15 then
        if #gg_table > 0 then
            info = gg_table[p].name
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_gg.png"
            pic_path = gg_table[p].snap_path_local .. gg_table[p].name .. ".png"
            app_title = gg_table[p].title
            apptype = gg_table[p].app_type
            appdir = gg_table[p].game_path
            folder = gg_table[p].directory
            filename = gg_table[p].filename
            favourite_flag = gg_table[p].favourite

            app_titleid = gg_table[p].name
            app_version = gg_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 16 then
        if #tg16_table > 0 then
            info = tg16_table[p].name
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_tg16.png"
            pic_path = tg16_table[p].snap_path_local .. tg16_table[p].name .. ".png"
            app_title = tg16_table[p].title
            apptype = tg16_table[p].app_type
            appdir = tg16_table[p].game_path
            folder = tg16_table[p].directory
            filename = tg16_table[p].filename
            favourite_flag = tg16_table[p].favourite

            app_titleid = tg16_table[p].name
            app_version = tg16_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 17 then
        if #tgcd_table > 0 then
            info = tgcd_table[p].name
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_tgcd.png"
            pic_path = tgcd_table[p].snap_path_local .. tgcd_table[p].name .. ".png"
            app_title = tgcd_table[p].title
            apptype = tgcd_table[p].app_type
            appdir = tgcd_table[p].game_path
            folder = tgcd_table[p].directory
            filename = tgcd_table[p].filename
            favourite_flag = tgcd_table[p].favourite

            app_titleid = tgcd_table[p].name
            app_version = tgcd_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 18 then
        if #pce_table > 0 then
            info = pce_table[p].name
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_pce.png"
            pic_path = pce_table[p].snap_path_local .. pce_table[p].name .. ".png"
            app_title = pce_table[p].title
            apptype = pce_table[p].app_type
            appdir = pce_table[p].game_path
            folder = pce_table[p].directory
            filename = pce_table[p].filename
            favourite_flag = pce_table[p].favourite

            app_titleid = pce_table[p].name
            app_version = pce_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 19 then
        if #pcecd_table > 0 then
            info = pcecd_table[p].name
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_pcecd.png"
            pic_path = pcecd_table[p].snap_path_local .. pcecd_table[p].name .. ".png"
            app_title = pcecd_table[p].title
            apptype = pcecd_table[p].app_type
            appdir = pcecd_table[p].game_path
            folder = pcecd_table[p].directory
            filename = pcecd_table[p].filename
            favourite_flag = pcecd_table[p].favourite

            app_titleid = pcecd_table[p].name
            app_version = pcecd_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 20 then
        if #amiga_table > 0 then
            info = amiga_table[p].name
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_amiga.png"
            pic_path = amiga_table[p].snap_path_local .. amiga_table[p].name .. ".png"
            app_title = amiga_table[p].title
            apptype = amiga_table[p].app_type
            appdir = amiga_table[p].game_path
            folder = amiga_table[p].directory
            filename = amiga_table[p].filename
            favourite_flag = amiga_table[p].favourite

            app_titleid = amiga_table[p].name
            app_version = amiga_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 21 then
        if #c64_table > 0 then
            info = c64_table[p].name            
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_c64.png"
            pic_path = c64_table[p].snap_path_local .. c64_table[p].name .. ".png"
            app_title = c64_table[p].title
            apptype = c64_table[p].app_type
            appdir = c64_table[p].game_path
            folder = c64_table[p].directory
            filename = c64_table[p].filename
            favourite_flag = c64_table[p].favourite

            app_titleid = c64_table[p].name
            app_version = c64_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 22 then
        if #wswan_col_table > 0 then
            info = wswan_col_table[p].name            
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_wswan_col.png"
            pic_path = wswan_col_table[p].snap_path_local .. wswan_col_table[p].name .. ".png"
            app_title = wswan_col_table[p].title
            apptype = wswan_col_table[p].app_type
            appdir = wswan_col_table[p].game_path
            folder = wswan_col_table[p].directory
            filename = wswan_col_table[p].filename
            favourite_flag = wswan_col_table[p].favourite

            app_titleid = wswan_col_table[p].name
            app_version = wswan_col_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 23 then
        if #wswan_table > 0 then
            info = wswan_table[p].name            
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_wswan.png"
            pic_path = wswan_table[p].snap_path_local .. wswan_table[p].name .. ".png"
            app_title = wswan_table[p].title
            apptype = wswan_table[p].app_type
            appdir = wswan_table[p].game_path
            folder = wswan_table[p].directory
            filename = wswan_table[p].filename
            favourite_flag = wswan_table[p].favourite

            app_titleid = wswan_table[p].name
            app_version = wswan_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 24 then
        if #msx2_table > 0 then
            info = msx2_table[p].name            
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_msx2.png"
            pic_path = msx2_table[p].snap_path_local .. msx2_table[p].name .. ".png"
            app_title = msx2_table[p].title
            apptype = msx2_table[p].app_type
            appdir = msx2_table[p].game_path
            folder = msx2_table[p].directory
            filename = msx2_table[p].filename
            favourite_flag = msx2_table[p].favourite

            app_titleid = msx2_table[p].name
            app_version = msx2_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 25 then
        if #msx1_table > 0 then
            info = msx1_table[p].name            
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_msx1.png"
            pic_path = msx1_table[p].snap_path_local .. msx1_table[p].name .. ".png"
            app_title = msx1_table[p].title
            apptype = msx1_table[p].app_type
            appdir = msx1_table[p].game_path
            folder = msx1_table[p].directory
            filename = msx1_table[p].filename
            favourite_flag = msx1_table[p].favourite

            app_titleid = msx1_table[p].name
            app_version = msx1_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 26 then
        if #zxs_table > 0 then
            info = zxs_table[p].name            
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_zxs.png"
            pic_path = zxs_table[p].snap_path_local .. zxs_table[p].name .. ".png"
            app_title = zxs_table[p].title
            apptype = zxs_table[p].app_type
            appdir = zxs_table[p].game_path
            folder = zxs_table[p].directory
            filename = zxs_table[p].filename
            favourite_flag = zxs_table[p].favourite

            app_titleid = zxs_table[p].name
            app_version = zxs_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 27 then
        if #atari_7800_table > 0 then
            info = atari_7800_table[p].name            
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_atari_7800.png"
            pic_path = atari_7800_table[p].snap_path_local .. atari_7800_table[p].name .. ".png"
            app_title = atari_7800_table[p].title
            apptype = atari_7800_table[p].app_type
            appdir = atari_7800_table[p].game_path
            folder = atari_7800_table[p].directory
            filename = atari_7800_table[p].filename
            favourite_flag = atari_7800_table[p].favourite

            app_titleid = atari_7800_table[p].name
            app_version = atari_7800_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 28 then
        if #atari_5200_table > 0 then
            info = atari_5200_table[p].name            
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_atari_5200.png"
            pic_path = atari_5200_table[p].snap_path_local .. atari_5200_table[p].name .. ".png"
            app_title = atari_5200_table[p].title
            apptype = atari_5200_table[p].app_type
            appdir = atari_5200_table[p].game_path
            folder = atari_5200_table[p].directory
            filename = atari_5200_table[p].filename
            favourite_flag = atari_5200_table[p].favourite

            app_titleid = atari_5200_table[p].name
            app_version = atari_5200_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 29 then
        if #atari_2600_table > 0 then
            info = atari_2600_table[p].name            
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_atari_2600.png"
            pic_path = atari_2600_table[p].snap_path_local .. atari_2600_table[p].name .. ".png"
            app_title = atari_2600_table[p].title
            apptype = atari_2600_table[p].app_type
            appdir = atari_2600_table[p].game_path
            folder = atari_2600_table[p].directory
            filename = atari_2600_table[p].filename
            favourite_flag = atari_2600_table[p].favourite

            app_titleid = atari_2600_table[p].name
            app_version = atari_2600_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 30 then
        if #atari_lynx_table > 0 then
            info = atari_lynx_table[p].name            
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_atari_lynx.png"
            pic_path = atari_lynx_table[p].snap_path_local .. atari_lynx_table[p].name .. ".png"
            app_title = atari_lynx_table[p].title
            apptype = atari_lynx_table[p].app_type
            appdir = atari_lynx_table[p].game_path
            folder = atari_lynx_table[p].directory
            filename = atari_lynx_table[p].filename
            favourite_flag = atari_lynx_table[p].favourite

            app_titleid = atari_lynx_table[p].name
            app_version = atari_lynx_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 31 then
        if #colecovision_table > 0 then
            info = colecovision_table[p].name            
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_colecovision.png"
            pic_path = colecovision_table[p].snap_path_local .. colecovision_table[p].name .. ".png"
            app_title = colecovision_table[p].title
            apptype = colecovision_table[p].app_type
            appdir = colecovision_table[p].game_path
            folder = colecovision_table[p].directory
            filename = colecovision_table[p].filename
            favourite_flag = colecovision_table[p].favourite

            app_titleid = colecovision_table[p].name
            app_version = colecovision_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 32 then
        if #vectrex_table > 0 then
            info = vectrex_table[p].name            
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_vectrex.png"
            pic_path = vectrex_table[p].snap_path_local .. vectrex_table[p].name .. ".png"
            app_title = vectrex_table[p].title
            apptype = vectrex_table[p].app_type
            appdir = vectrex_table[p].game_path
            folder = vectrex_table[p].directory
            filename = vectrex_table[p].filename
            favourite_flag = vectrex_table[p].favourite

            app_titleid = vectrex_table[p].name
            app_version = vectrex_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 33 then
        if #fba_table > 0 then
            info = fba_table[p].name            
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_fba.png"
            pic_path = fba_table[p].snap_path_local .. fba_table[p].name .. ".png"
            app_title = fba_table[p].title
            apptype = fba_table[p].app_type
            appdir = fba_table[p].game_path
            folder = fba_table[p].directory
            filename = fba_table[p].filename
            favourite_flag = fba_table[p].favourite

            app_titleid = fba_table[p].name
            app_version = fba_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 34 then
        if #mame_2003_plus_table > 0 then
            info = mame_2003_plus_table[p].name            
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_mame.png"
            pic_path = mame_2003_plus_table[p].snap_path_local .. mame_2003_plus_table[p].name .. ".png"
            app_title = mame_2003_plus_table[p].title
            apptype = mame_2003_plus_table[p].app_type
            appdir = mame_2003_plus_table[p].game_path
            folder = mame_2003_plus_table[p].directory
            filename = mame_2003_plus_table[p].filename
            favourite_flag = mame_2003_plus_table[p].favourite

            app_titleid = mame_2003_plus_table[p].name
            app_version = mame_2003_plus_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 35 then
        if #mame_2000_table > 0 then
            info = mame_2000_table[p].name
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_mame.png"
            pic_path = mame_2000_table[p].snap_path_local .. mame_2000_table[p].name .. ".png"
            app_title = mame_2000_table[p].title
            apptype = mame_2000_table[p].app_type
            appdir = mame_2000_table[p].game_path
            folder = mame_2000_table[p].directory
            filename = mame_2000_table[p].filename
            favourite_flag = mame_2000_table[p].favourite

            app_titleid = mame_2000_table[p].name
            app_version = mame_2000_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 36 then
        if #neogeo_table > 0 then
            info = neogeo_table[p].name            
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_neogeo.png"
            pic_path = neogeo_table[p].snap_path_local .. neogeo_table[p].name .. ".png"
            app_title = neogeo_table[p].title
            apptype = neogeo_table[p].app_type
            appdir = neogeo_table[p].game_path
            folder = neogeo_table[p].directory
            filename = neogeo_table[p].filename
            favourite_flag = neogeo_table[p].favourite

            app_titleid = neogeo_table[p].name
            app_version = neogeo_table[p].version
        else
            app_title = "-"
        end
    elseif showCat == 37 then
        if #ngpc_table > 0 then
            info = ngpc_table[p].name
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_ngpc.png"
            pic_path = ngpc_table[p].snap_path_local .. ngpc_table[p].name .. ".png"
            app_title = ngpc_table[p].title
            apptype = ngpc_table[p].app_type
            appdir = ngpc_table[p].game_path
            folder = ngpc_table[p].directory
            filename = ngpc_table[p].filename
            favourite_flag = ngpc_table[p].favourite

            app_titleid = ngpc_table[p].name
            app_version = ngpc_table[p].version
        else
            app_title = "-"
        end

    elseif showCat == 38 then

        -- count favorites
        fav_count = {}
        for l, file in pairs(files_table) do
            if file.favourite==true then
                if showHomebrews == 0 then
                    -- ignore homebrew apps
                    if file.app_type > 0 then
                        if file.favourite==true then
                            table.insert(fav_count, file)
                        end
                    else
                    end
                else
                    if file.favourite==true then
                        table.insert(fav_count, file)
                    end
                end
            end
        end

        if #fav_count > 0 then
            info = fav_count[p].name
            app_title = fav_count[p].title
            apptype = fav_count[p].app_type
            appdir = fav_count[p].game_path
            folder = fav_count[p].directory
            filename = fav_count[p].filename
            favourite_flag = fav_count[p].favourite

            app_titleid = fav_count[p].name
            app_version = fav_count[p].version

            -- Get pic
            GetPicPath(fav_count)

            -- Vita
            if System.doesFileExist(working_dir .. "/" .. fav_count[p].name .. "/sce_sys/param.sfo") and apptype==1 then
                icon_path = "ur0:/appmeta/" .. fav_count[p].name .. "/icon0.png"

            -- Homebrew 
            elseif System.doesFileExist(working_dir .. "/" .. fav_count[p].name .. "/sce_sys/param.sfo") and apptype==0 then
                icon_path = fav_count[p].icon_path

            else
                icon_path = fav_count[p].icon_path

                if apptype==1 then
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_psv.png"
                elseif apptype==2 then
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_psp.png"
                elseif apptype==3 then
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_psx.png"
                elseif apptype==5 then -- N64
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_n64.png"
                elseif apptype==6 then -- SNES
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_snes.png"
                elseif apptype==7 then -- NES
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_nes.png"
                elseif apptype==8 then -- GBA
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_gba.png"
                elseif apptype==9 then -- GBC
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_gbc.png"
                elseif apptype==10 then -- GB
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_gb.png"
                elseif apptype==11 then -- SEGA_CD
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_sega_cd.png"
                elseif apptype==12 then -- 32X
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_32x.png"
                elseif apptype==13 then -- MD
                    if setLanguage == 1 then
                        icon_path = "ux0:/app/RETROFLOW/DATA/icon_md_usa.png"
                    else
                        icon_path = "ux0:/app/RETROFLOW/DATA/icon_md.png"
                    end
                elseif apptype==14 then -- SMS
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_sms.png"
                elseif apptype==15 then -- GG
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_gg.png"
                elseif apptype==16 then -- TG16
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_tg16.png"
                elseif apptype==17 then -- TGCD
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_tgcd.png"
                elseif apptype==18 then -- PCE
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_pce.png"
                elseif apptype==19 then -- PCECD
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_pcecd.png"
                elseif apptype==20 then -- AMIGA
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_amiga.png"
                elseif apptype==21 then -- C64
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_c64.png"
                elseif apptype==22 then -- WSWAN_COL
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_wswan_col.png"
                elseif apptype==23 then -- WSWAN
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_wswan.png"
                elseif apptype==24 then -- MSX2
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_msx2.png"
                elseif apptype==25 then -- MSX1
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_msx1.png"
                elseif apptype==26 then -- ZXS
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_zxs.png"
                elseif apptype==27 then -- ATARI_7800
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_atari_7800.png"
                elseif apptype==28 then -- ATARI_5200
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_atari_5200.png"
                elseif apptype==29 then -- ATARI_2600
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_atari_2600.png"
                elseif apptype==30 then -- ATARI_LYNX
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_atari_lynx.png"
                elseif apptype==31 then -- COLECOVISION
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_colecovision.png"
                elseif apptype==32 then -- VECTREX
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_vectrex.png"
                elseif apptype==33 then -- FBA
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_fba.png"
                elseif apptype==34 then -- MAME_2003_PLUS
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_mame.png"
                elseif apptype==35 then -- MAME_2000
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_mame.png"
                elseif apptype==36 then -- NEOGEO
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_neogeo.png"
                elseif apptype==37 then -- NGPC
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_ngpc.png"
                else
                    icon_path = fav_count[p].icon_path
                end

            end
        else
            -- app_title = "-"
        end

    elseif showCat == 39 then

        if #recently_played_table > 0 then
            info = recently_played_table[p].name
            app_title = recently_played_table[p].title
            apptype = recently_played_table[p].app_type
            appdir = recently_played_table[p].game_path
            folder = recently_played_table[p].directory
            filename = recently_played_table[p].filename
            favourite_flag = recently_played_table[p].favourite

            app_titleid = recently_played_table[p].name
            app_version = recently_played_table[p].version

            -- Get pic
            GetPicPath(recently_played_table)

            -- Vita
            if System.doesFileExist(working_dir .. "/" .. recently_played_table[p].name .. "/sce_sys/param.sfo") and apptype==1 then
                icon_path = "ur0:/appmeta/" .. recently_played_table[p].name .. "/icon0.png"

            -- Homebrew 
            elseif System.doesFileExist(working_dir .. "/" .. recently_played_table[p].name .. "/sce_sys/param.sfo") and apptype==0 then
                icon_path = recently_played_table[p].icon_path

            else
                pic_path = recently_played_table[p].snap_path_local .. recently_played_table[p].name .. ".png"
                icon_path = recently_played_table[p].icon_path

                if apptype==1 then
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_psv.png"
                elseif apptype==2 then
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_psp.png"
                elseif apptype==3 then
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_psx.png"
                elseif apptype==5 then -- N64
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_n64.png"
                elseif apptype==6 then -- SNES
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_snes.png"
                elseif apptype==7 then -- NES
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_nes.png"
                elseif apptype==8 then -- GBA
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_gba.png"
                elseif apptype==9 then -- GBC
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_gbc.png"
                elseif apptype==10 then -- GB
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_gb.png"
                elseif apptype==11 then -- SEGA_CD
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_sega_cd.png"
                elseif apptype==12 then -- 32X
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_32x.png"
                elseif apptype==13 then -- MD
                    if setLanguage == 1 then
                        icon_path = "ux0:/app/RETROFLOW/DATA/icon_md_usa.png"
                    else
                        icon_path = "ux0:/app/RETROFLOW/DATA/icon_md.png"
                    end
                elseif apptype==14 then -- SMS
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_sms.png"
                elseif apptype==15 then -- GG
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_gg.png"
                elseif apptype==16 then -- TG16
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_tg16.png"
                elseif apptype==17 then -- TGCD
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_tgcd.png"
                elseif apptype==18 then -- PCE
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_pce.png"
                elseif apptype==19 then -- PCECD
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_pcecd.png"
                elseif apptype==20 then -- AMIGA
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_amiga.png"
                elseif apptype==21 then -- C64
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_c64.png"
                elseif apptype==22 then -- WSWAN_COL
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_wswan_col.png"
                elseif apptype==23 then -- WSWAN
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_wswan.png"
                elseif apptype==24 then -- MSX2
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_msx2.png"
                elseif apptype==25 then -- MSX1
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_msx1.png"
                elseif apptype==26 then -- ZXS
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_zxs.png"
                elseif apptype==27 then -- ATARI_7800
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_atari_7800.png"
                elseif apptype==28 then -- ATARI_5200
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_atari_5200.png"
                elseif apptype==29 then -- ATARI_2600
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_atari_2600.png"
                elseif apptype==30 then -- ATARI_LYNX
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_atari_lynx.png"
                elseif apptype==31 then -- COLECOVISION
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_colecovision.png"
                elseif apptype==32 then -- VECTREX
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_vectrex.png"
                elseif apptype==33 then -- FBA
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_fba.png"
                elseif apptype==34 then -- MAME_2003_PLUS
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_mame.png"
                elseif apptype==35 then -- MAME_2000
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_mame.png"
                elseif apptype==36 then -- NEOGEO
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_neogeo.png"
                elseif apptype==37 then -- NGPC
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_ngpc.png"
                else
                    icon_path = recently_played_table[p].icon_path
                end

            end
        else
            -- app_title = "-"
        end
            
    elseif showCat == 40 then

        if #search_results_table > 0 then
            info = search_results_table[p].name
            app_title = search_results_table[p].title
            apptype = search_results_table[p].app_type
            appdir = search_results_table[p].game_path
            folder = search_results_table[p].directory
            filename = search_results_table[p].filename
            favourite_flag = search_results_table[p].favourite

            app_titleid = search_results_table[p].name
            app_version = search_results_table[p].version

            -- Get pic
            GetPicPath(search_results_table)

            -- Vita
            if System.doesFileExist(working_dir .. "/" .. search_results_table[p].name .. "/sce_sys/param.sfo") and apptype==1 then
                icon_path = "ur0:/appmeta/" .. search_results_table[p].name .. "/icon0.png" 

            -- Homebrew 
            elseif System.doesFileExist(working_dir .. "/" .. search_results_table[p].name .. "/sce_sys/param.sfo") and apptype==0 then
                icon_path = search_results_table[p].icon_path

            else
                pic_path = search_results_table[p].snap_path_local .. search_results_table[p].name .. ".png"
                icon_path = search_results_table[p].icon_path

                if apptype==1 then
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_psv.png"
                elseif apptype==2 then
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_psp.png"
                elseif apptype==3 then
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_psx.png"
                elseif apptype==5 then -- N64
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_n64.png"
                elseif apptype==6 then -- SNES
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_snes.png"
                elseif apptype==7 then -- NES
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_nes.png"
                elseif apptype==8 then -- GBA
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_gba.png"
                elseif apptype==9 then -- GBC
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_gbc.png"
                elseif apptype==10 then -- GB
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_gb.png"
                elseif apptype==11 then -- SEGA_CD
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_sega_cd.png"
                elseif apptype==12 then -- 32X
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_32x.png"
                elseif apptype==13 then -- MD
                    if setLanguage == 1 then
                        icon_path = "ux0:/app/RETROFLOW/DATA/icon_md_usa.png"
                    else
                        icon_path = "ux0:/app/RETROFLOW/DATA/icon_md.png"
                    end
                elseif apptype==14 then -- SMS
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_sms.png"
                elseif apptype==15 then -- GG
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_gg.png"
                elseif apptype==16 then -- TG16
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_tg16.png"
                elseif apptype==17 then -- TGCD
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_tgcd.png"
                elseif apptype==18 then -- PCE
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_pce.png"
                elseif apptype==19 then -- PCECD
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_pcecd.png"
                elseif apptype==20 then -- AMIGA
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_amiga.png"
                elseif apptype==21 then -- C64
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_c64.png"
                elseif apptype==22 then -- WSWAN_COL
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_wswan_col.png"
                elseif apptype==23 then -- WSWAN
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_wswan.png"
                elseif apptype==24 then -- MSX2
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_msx2.png"
                elseif apptype==25 then -- MSX1
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_msx1.png"
                elseif apptype==26 then -- ZXS
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_zxs.png"
                elseif apptype==27 then -- ATARI_7800
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_atari_7800.png"
                elseif apptype==28 then -- ATARI_5200
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_atari_5200.png"
                elseif apptype==29 then -- ATARI_2600
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_atari_2600.png"
                elseif apptype==30 then -- ATARI_LYNX
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_atari_lynx.png"
                elseif apptype==31 then -- COLECOVISION
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_colecovision.png"
                elseif apptype==32 then -- VECTREX
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_vectrex.png"
                elseif apptype==33 then -- FBA
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_fba.png"
                elseif apptype==34 then -- MAME_2003_PLUS
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_mame.png"
                elseif apptype==35 then -- MAME_2000
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_mame.png"
                elseif apptype==36 then -- NEOGEO
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_neogeo.png"
                elseif apptype==37 then -- NGPC
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_ngpc.png"
                else
                    icon_path = search_results_table[p].icon_path
                end

            end
        else
            -- app_title = "-"
        end



    else
        if #files_table > 0 then
            info = files_table[p].name
            app_title = files_table[p].title
            apptype = files_table[p].app_type
            appdir = files_table[p].game_path
            folder = files_table[p].directory
            filename = files_table[p].filename
            favourite_flag = files_table[p].favourite

            app_titleid = files_table[p].name
            app_version = files_table[p].version

            -- Get pic
            GetPicPath(files_table)

            -- Vita
            if System.doesFileExist(working_dir .. "/" .. files_table[p].name .. "/sce_sys/param.sfo") and apptype==1 then
                icon_path = "ur0:/appmeta/" .. files_table[p].name .. "/icon0.png"

            -- Homebrew 
            elseif System.doesFileExist(working_dir .. "/" .. files_table[p].name .. "/sce_sys/param.sfo") and apptype==0 then
                icon_path = files_table[p].icon_path

            else
                pic_path = files_table[p].snap_path_local .. files_table[p].name .. ".png"
                icon_path = files_table[p].icon_path

                if apptype==1 then
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_psv.png"
                elseif apptype==2 then
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_psp.png"
                elseif apptype==3 then
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_psx.png"
                elseif apptype==5 then -- N64
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_n64.png"
                elseif apptype==6 then -- SNES
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_snes.png"
                elseif apptype==7 then -- NES
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_nes.png"
                elseif apptype==8 then -- GBA
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_gba.png"
                elseif apptype==9 then -- GBC
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_gbc.png"
                elseif apptype==10 then -- GB
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_gb.png"
                elseif apptype==11 then -- SEGA_CD
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_sega_cd.png"
                elseif apptype==12 then -- 32X
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_32x.png"
                elseif apptype==13 then -- MD
                    if setLanguage == 1 then
                        icon_path = "ux0:/app/RETROFLOW/DATA/icon_md_usa.png"
                    else
                        icon_path = "ux0:/app/RETROFLOW/DATA/icon_md.png"
                    end
                elseif apptype==14 then -- SMS
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_sms.png"
                elseif apptype==15 then -- GG
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_gg.png"
                elseif apptype==16 then -- TG16
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_tg16.png"
                elseif apptype==17 then -- TGCD
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_tgcd.png"
                elseif apptype==18 then -- PCE
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_pce.png"
                elseif apptype==19 then -- PCECD
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_pcecd.png"
                elseif apptype==20 then -- AMIGA
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_amiga.png"
                elseif apptype==21 then -- C64
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_c64.png"
                elseif apptype==22 then -- WSWAN_COL
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_wswan_col.png"
                elseif apptype==23 then -- WSWAN
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_wswan.png"
                elseif apptype==24 then -- MSX2
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_msx2.png"
                elseif apptype==25 then -- MSX1
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_msx1.png"
                elseif apptype==26 then -- ZXS
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_zxs.png"
                elseif apptype==27 then -- ATARI_7800
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_atari_7800.png"
                elseif apptype==28 then -- ATARI_5200
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_atari_5200.png"
                elseif apptype==29 then -- ATARI_2600
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_atari_2600.png"
                elseif apptype==30 then -- ATARI_LYNX
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_atari_lynx.png"
                elseif apptype==31 then -- COLECOVISION
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_colecovision.png"
                elseif apptype==32 then -- VECTREX
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_vectrex.png"
                elseif apptype==33 then -- FBA
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_fba.png"
                elseif apptype==34 then -- MAME_2003_PLUS
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_mame.png"
                elseif apptype==35 then -- MAME_2000
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_mame.png"
                elseif apptype==36 then -- NEOGEO
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_neogeo.png"
                elseif apptype==37 then -- NGPC
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_ngpc.png"
                else
                    icon_path = files_table[p].icon_path
                end

            end
        else
            -- app_title = "-"
        end
    end
end


function update_recently_played_table_favorite(def)
    for k, v in pairs(recently_played_table) do
        if v.filename==filename then
            v.favourite=(def)
        end
    end
end

function update_favorites_table_system(def_table_name)
    if (def_table_name)[p].favourite == true then 
        (def_table_name)[p].favourite=false
        update_recently_played_table_favorite(false)
    else
        (def_table_name)[p].favourite=true
        update_recently_played_table_favorite(true)
    end
end

function update_favorites_table_favorites(def_table_name)
    if fav_count[p].favourite == true then
        fav_count[p].favourite=false
        for k, v in pairs((def_table_name)) do
              if v.filename==filename then
                  v.favourite=false
              end
        end
        update_recently_played_table_favorite(false)
    else
        fav_count[p].favourite=true
        for k, v in pairs((def_table_name)) do
              if v.filename==filename then
                  v.favourite=true
              end
        end
        update_recently_played_table_favorite(true)
    end
end

function update_favorites_table_recent(def_table_name)
    if recently_played_table[p].favourite == true then
        recently_played_table[p].favourite=false
        for k, v in pairs((def_table_name)) do
              if v.filename==filename then
                  v.favourite=false
              end
        end
    else
        recently_played_table[p].favourite=true
        for k, v in pairs((def_table_name)) do
              if v.filename==filename then
                  v.favourite=true
              end
        end
    end
end


function update_favorites_table_files(def_table_name)
    if files_table[p].favourite == true then
        files_table[p].favourite=false
        for k, v in pairs((def_table_name)) do
              if v.filename==filename then
                  v.favourite=false
              end
        end
    else
        files_table[p].favourite=true
        for k, v in pairs((def_table_name)) do
              if v.filename==filename then
                  v.favourite=true
              end
        end
    end
end

function AddOrRemoveFavorite()

    if System.doesFileExist(cur_dir .. "/favorites.dat") then
        local inf = assert(io.open(cur_dir .. "/favorites.dat", "rw"), "Failed to open favorites.dat")
        local lines = ""
        local favoriteExists = false;

        while(true) do
            local line = inf:read("*line")
            if not line then break end
            if string.find(line, filename .. "", 1,true) == nil then
                lines = lines .. line .. "\n"
            else
                favoriteExists = true;
            end
        end
        if not favoriteExists then
            lines = lines .. filename .. "\n"
        end
        inf:close()
        file_override = io.open(cur_dir .. "/favorites.dat", "w")
        file_override:write(lines)
        file_override:close()

        -- Update live favorites for all lists and cache
        if showCat == 1 then        update_favorites_table_system(games_table)          update_cached_table("db_games.lua", games_table)
        elseif showCat == 2 then    update_favorites_table_system(homebrews_table)      update_cached_table("db_homebrews.lua", homebrews_table)
        elseif showCat == 3 then    update_favorites_table_system(psp_table)            update_cached_table("db_psp.lua", psp_table)
        elseif showCat == 4 then    update_favorites_table_system(psx_table)            update_cached_table("db_psx.lua", psx_table)
        elseif showCat == 5 then    update_favorites_table_system(n64_table)            update_cached_table("db_n64.lua", n64_table)
        elseif showCat == 6 then    update_favorites_table_system(snes_table)           update_cached_table("db_snes.lua", snes_table)
        elseif showCat == 7 then    update_favorites_table_system(nes_table)            update_cached_table("db_nes.lua", nes_table)
        elseif showCat == 8 then    update_favorites_table_system(gba_table)            update_cached_table("db_gba.lua", gba_table)
        elseif showCat == 9 then    update_favorites_table_system(gbc_table)            update_cached_table("db_gbc.lua", gbc_table)
        elseif showCat == 10 then   update_favorites_table_system(gb_table)             update_cached_table("db_gb.lua", gb_table)
        elseif showCat == 11 then   update_favorites_table_system(sega_cd_table)        update_cached_table("db_sega_cd.lua", sega_cd_table)
        elseif showCat == 12 then   update_favorites_table_system(s32x_table)           update_cached_table("db_32x.lua", s32x_table)
        elseif showCat == 13 then   update_favorites_table_system(md_table)             update_cached_table("db_md.lua", md_table)
        elseif showCat == 14 then   update_favorites_table_system(sms_table)            update_cached_table("db_sms.lua", sms_table)
        elseif showCat == 15 then   update_favorites_table_system(gg_table)             update_cached_table("db_gg.lua", gg_table)
        elseif showCat == 16 then   update_favorites_table_system(tg16_table)           update_cached_table("db_tg16.lua", tg16_table)
        elseif showCat == 17 then   update_favorites_table_system(tgcd_table)           update_cached_table("db_tgcd.lua", tgcd_table)
        elseif showCat == 18 then   update_favorites_table_system(pce_table)            update_cached_table("db_pce.lua", pce_table)
        elseif showCat == 19 then   update_favorites_table_system(pcecd_table)          update_cached_table("db_pcecd.lua", pcecd_table)
        elseif showCat == 20 then   update_favorites_table_system(amiga_table)          update_cached_table("db_amiga.lua", amiga_table)
        elseif showCat == 21 then   update_favorites_table_system(c64_table)            update_cached_table("db_c64.lua", c64_table)
        elseif showCat == 22 then   update_favorites_table_system(wswan_col_table)      update_cached_table("db_wswan_col.lua", wswan_col_table)
        elseif showCat == 23 then   update_favorites_table_system(wswan_table)          update_cached_table("db_wswan.lua", wswan_table)
        elseif showCat == 24 then   update_favorites_table_system(msx2_table)           update_cached_table("db_msx2.lua", msx2_table)
        elseif showCat == 25 then   update_favorites_table_system(msx1_table)           update_cached_table("db_msx1.lua", msx1_table)
        elseif showCat == 26 then   update_favorites_table_system(zxs_table)            update_cached_table("db_zxs.lua", zxs_table)
        elseif showCat == 27 then   update_favorites_table_system(atari_7800_table)     update_cached_table("db_atari_7800.lua", atari_7800_table)
        elseif showCat == 28 then   update_favorites_table_system(atari_5200_table)     update_cached_table("db_atari_5200.lua", atari_5200_table)
        elseif showCat == 29 then   update_favorites_table_system(atari_2600_table)     update_cached_table("db_atari_2600.lua", atari_2600_table)
        elseif showCat == 30 then   update_favorites_table_system(atari_lynx_table)     update_cached_table("db_atari_lynx.lua", atari_lynx_table)
        elseif showCat == 31 then   update_favorites_table_system(colecovision_table)   update_cached_table("db_colecovision.lua", colecovision_table)
        elseif showCat == 32 then   update_favorites_table_system(vectrex_table)        update_cached_table("db_vectrex.lua", vectrex_table)
        elseif showCat == 33 then   update_favorites_table_system(fba_table)            update_cached_table("db_fba.lua", fba_table)
        elseif showCat == 34 then   update_favorites_table_system(mame_2003_plus_table) update_cached_table("db_mame_2003_plus.lua", mame_2003_plus_table)
        elseif showCat == 35 then   update_favorites_table_system(mame_2000_table)      update_cached_table("db_mame_2000.lua", mame_2000_table)
        elseif showCat == 36 then   update_favorites_table_system(neogeo_table)         update_cached_table("db_neogeo.lua", neogeo_table)
        elseif showCat == 37 then   update_favorites_table_system(ngpc_table)           update_cached_table("db_ngpc.lua", ngpc_table)
        elseif showCat == 40 then   update_favorites_table_system(search_results_table)

        
        elseif showCat == 38 then
            -- Find game in other tables and update
            if apptype == 1 then        update_favorites_table_favorites(games_table)           update_cached_table("db_games.lua", games_table)
            elseif apptype == 2 then    update_favorites_table_favorites(psp_table)             update_cached_table("db_psp.lua", psp_table)
            elseif apptype == 3 then    update_favorites_table_favorites(psx_table)             update_cached_table("db_psx.lua", psx_table) 
            elseif apptype == 4 then    update_favorites_table_favorites(homebrews_table)       update_cached_table("db_homebrews.lua", homebrews_table)    
            elseif apptype == 5 then    update_favorites_table_favorites(n64_table)             update_cached_table("db_n64.lua", n64_table)
            elseif apptype == 6 then    update_favorites_table_favorites(snes_table)            update_cached_table("db_snes.lua", snes_table)
            elseif apptype == 7 then    update_favorites_table_favorites(nes_table)             update_cached_table("db_nes.lua", nes_table)
            elseif apptype == 8 then    update_favorites_table_favorites(gba_table)             update_cached_table("db_gba.lua", gba_table)
            elseif apptype == 9 then    update_favorites_table_favorites(gbc_table)             update_cached_table("db_gbc.lua", gbc_table)
            elseif apptype == 10 then   update_favorites_table_favorites(gb_table)              update_cached_table("db_gb.lua", gb_table)
            elseif apptype == 11 then   update_favorites_table_favorites(sega_cd_table)         update_cached_table("db_sega_cd.lua", sega_cd_table)
            elseif apptype == 12 then   update_favorites_table_favorites(s32x_table)            update_cached_table("db_32x.lua", s32x_table)
            elseif apptype == 13 then   update_favorites_table_favorites(md_table)              update_cached_table("db_md.lua", md_table)
            elseif apptype == 14 then   update_favorites_table_favorites(sms_table)             update_cached_table("db_sms.lua", sms_table)
            elseif apptype == 15 then   update_favorites_table_favorites(gg_table)              update_cached_table("db_gg.lua", gg_table)
            elseif apptype == 16 then   update_favorites_table_favorites(tg16_table)            update_cached_table("db_tg16.lua", tg16_table)
            elseif apptype == 17 then   update_favorites_table_favorites(tgcd_table)            update_cached_table("db_tgcd.lua", tgcd_table)
            elseif apptype == 18 then   update_favorites_table_favorites(pce_table)             update_cached_table("db_pce.lua", pce_table)
            elseif apptype == 19 then   update_favorites_table_favorites(pcecd_table)           update_cached_table("db_pcecd.lua", pcecd_table)
            elseif apptype == 20 then   update_favorites_table_favorites(amiga_table)           update_cached_table("db_amiga.lua", amiga_table)
            elseif apptype == 21 then   update_favorites_table_favorites(c64_table)             update_cached_table("db_c64.lua", c64_table)
            elseif apptype == 22 then   update_favorites_table_favorites(wswan_col_table)       update_cached_table("db_wswan_col.lua", wswan_col_table)
            elseif apptype == 23 then   update_favorites_table_favorites(wswan_table)           update_cached_table("db_wswan.lua", wswan_table)
            elseif apptype == 24 then   update_favorites_table_favorites(msx2_table)            update_cached_table("db_msx2.lua", msx2_table)
            elseif apptype == 25 then   update_favorites_table_favorites(msx1_table)            update_cached_table("db_msx1.lua", msx1_table)
            elseif apptype == 26 then   update_favorites_table_favorites(zxs_table)             update_cached_table("db_zxs.lua", zxs_table)
            elseif apptype == 27 then   update_favorites_table_favorites(atari_7800_table)      update_cached_table("db_atari_7800.lua", atari_7800_table)
            elseif apptype == 28 then   update_favorites_table_favorites(atari_5200_table)      update_cached_table("db_atari_5200.lua", atari_5200_table)
            elseif apptype == 29 then   update_favorites_table_favorites(atari_2600_table)      update_cached_table("db_atari_2600.lua", atari_2600_table)
            elseif apptype == 30 then   update_favorites_table_favorites(atari_lynx_table)      update_cached_table("db_atari_lynx.lua", atari_lynx_table)
            elseif apptype == 31 then   update_favorites_table_favorites(colecovision_table)    update_cached_table("db_colecovision.lua", colecovision_table)
            elseif apptype == 32 then   update_favorites_table_favorites(vectrex_table)         update_cached_table("db_vectrex.lua", vectrex_table)
            elseif apptype == 33 then   update_favorites_table_favorites(fba_table)             update_cached_table("db_fba.lua", fba_table)
            elseif apptype == 34 then   update_favorites_table_favorites(mame_2003_plus_table)  update_cached_table("db_mame_2003_plus.lua", mame_2003_plus_table)
            elseif apptype == 35 then   update_favorites_table_favorites(mame_2000_table)       update_cached_table("db_mame_2000.lua", mame_2000_table)
            elseif apptype == 36 then   update_favorites_table_favorites(neogeo_table)          update_cached_table("db_neogeo.lua", neogeo_table)
            elseif apptype == 37 then   update_favorites_table_favorites(ngpc_table)            update_cached_table("db_ngpc.lua", ngpc_table)
            else    
            end

        elseif showCat == 39 then
            -- Find game in other tables and update
            if apptype == 1 then        update_favorites_table_recent(games_table)           update_cached_table("db_games.lua", games_table)
            elseif apptype == 2 then    update_favorites_table_recent(psp_table)             update_cached_table("db_psp.lua", psp_table)
            elseif apptype == 3 then    update_favorites_table_recent(psx_table)             update_cached_table("db_psx.lua", psx_table) 
            elseif apptype == 4 then    update_favorites_table_recent(homebrews_table)       update_cached_table("db_homebrews.lua", homebrews_table)    
            elseif apptype == 5 then    update_favorites_table_recent(n64_table)             update_cached_table("db_n64.lua", n64_table)
            elseif apptype == 6 then    update_favorites_table_recent(snes_table)            update_cached_table("db_snes.lua", snes_table)
            elseif apptype == 7 then    update_favorites_table_recent(nes_table)             update_cached_table("db_nes.lua", nes_table)
            elseif apptype == 8 then    update_favorites_table_recent(gba_table)             update_cached_table("db_gba.lua", gba_table)
            elseif apptype == 9 then    update_favorites_table_recent(gbc_table)             update_cached_table("db_gbc.lua", gbc_table)
            elseif apptype == 10 then   update_favorites_table_recent(gb_table)              update_cached_table("db_gb.lua", gb_table)
            elseif apptype == 11 then   update_favorites_table_recent(sega_cd_table)         update_cached_table("db_sega_cd.lua", sega_cd_table)
            elseif apptype == 12 then   update_favorites_table_recent(s32x_table)            update_cached_table("db_32x.lua", s32x_table)
            elseif apptype == 13 then   update_favorites_table_recent(md_table)              update_cached_table("db_md.lua", md_table)
            elseif apptype == 14 then   update_favorites_table_recent(sms_table)             update_cached_table("db_sms.lua", sms_table)
            elseif apptype == 15 then   update_favorites_table_recent(gg_table)              update_cached_table("db_gg.lua", gg_table)
            elseif apptype == 16 then   update_favorites_table_recent(tg16_table)            update_cached_table("db_tg16.lua", tg16_table)
            elseif apptype == 17 then   update_favorites_table_recent(tgcd_table)            update_cached_table("db_tgcd.lua", tgcd_table)
            elseif apptype == 18 then   update_favorites_table_recent(pce_table)             update_cached_table("db_pce.lua", pce_table)
            elseif apptype == 19 then   update_favorites_table_recent(pcecd_table)           update_cached_table("db_pcecd.lua", pcecd_table)
            elseif apptype == 20 then   update_favorites_table_recent(amiga_table)           update_cached_table("db_amiga.lua", amiga_table)
            elseif apptype == 21 then   update_favorites_table_recent(c64_table)             update_cached_table("db_c64.lua", c64_table)
            elseif apptype == 22 then   update_favorites_table_recent(wswan_col_table)       update_cached_table("db_wswan_col.lua", wswan_col_table)
            elseif apptype == 23 then   update_favorites_table_recent(wswan_table)           update_cached_table("db_wswan.lua", wswan_table)
            elseif apptype == 24 then   update_favorites_table_recent(msx2_table)            update_cached_table("db_msx2.lua", msx2_table)
            elseif apptype == 25 then   update_favorites_table_recent(msx1_table)            update_cached_table("db_msx1.lua", msx1_table)
            elseif apptype == 26 then   update_favorites_table_recent(zxs_table)             update_cached_table("db_zxs.lua", zxs_table)
            elseif apptype == 27 then   update_favorites_table_recent(atari_7800_table)      update_cached_table("db_atari_7800.lua", atari_7800_table)
            elseif apptype == 28 then   update_favorites_table_recent(atari_5200_table)      update_cached_table("db_atari_5200.lua", atari_5200_table)
            elseif apptype == 29 then   update_favorites_table_recent(atari_2600_table)      update_cached_table("db_atari_2600.lua", atari_2600_table)
            elseif apptype == 30 then   update_favorites_table_recent(atari_lynx_table)      update_cached_table("db_atari_lynx.lua", atari_lynx_table)
            elseif apptype == 31 then   update_favorites_table_recent(colecovision_table)    update_cached_table("db_colecovision.lua", colecovision_table)
            elseif apptype == 32 then   update_favorites_table_recent(vectrex_table)         update_cached_table("db_vectrex.lua", vectrex_table)
            elseif apptype == 33 then   update_favorites_table_recent(fba_table)             update_cached_table("db_fba.lua", fba_table)
            elseif apptype == 34 then   update_favorites_table_recent(mame_2003_plus_table)  update_cached_table("db_mame_2003_plus.lua", mame_2003_plus_table)
            elseif apptype == 35 then   update_favorites_table_recent(mame_2000_table)       update_cached_table("db_mame_2000.lua", mame_2000_table)
            elseif apptype == 36 then   update_favorites_table_recent(neogeo_table)          update_cached_table("db_neogeo.lua", neogeo_table)
            elseif apptype == 37 then   update_favorites_table_recent(ngpc_table)            update_cached_table("db_ngpc.lua", ngpc_table)
            else    
            end

        elseif showCat == 40 then
            -- Find game in other tables and update
            if apptype == 1 then        update_favorites_table_recent(games_table)           update_cached_table("db_games.lua", games_table)
            elseif apptype == 2 then    update_favorites_table_recent(psp_table)             update_cached_table("db_psp.lua", psp_table)
            elseif apptype == 3 then    update_favorites_table_recent(psx_table)             update_cached_table("db_psx.lua", psx_table) 
            elseif apptype == 4 then    update_favorites_table_recent(homebrews_table)       update_cached_table("db_homebrews.lua", homebrews_table)    
            elseif apptype == 5 then    update_favorites_table_recent(n64_table)             update_cached_table("db_n64.lua", n64_table)
            elseif apptype == 6 then    update_favorites_table_recent(snes_table)            update_cached_table("db_snes.lua", snes_table)
            elseif apptype == 7 then    update_favorites_table_recent(nes_table)             update_cached_table("db_nes.lua", nes_table)
            elseif apptype == 8 then    update_favorites_table_recent(gba_table)             update_cached_table("db_gba.lua", gba_table)
            elseif apptype == 9 then    update_favorites_table_recent(gbc_table)             update_cached_table("db_gbc.lua", gbc_table)
            elseif apptype == 10 then   update_favorites_table_recent(gb_table)              update_cached_table("db_gb.lua", gb_table)
            elseif apptype == 11 then   update_favorites_table_recent(sega_cd_table)         update_cached_table("db_sega_cd.lua", sega_cd_table)
            elseif apptype == 12 then   update_favorites_table_recent(s32x_table)            update_cached_table("db_32x.lua", s32x_table)
            elseif apptype == 13 then   update_favorites_table_recent(md_table)              update_cached_table("db_md.lua", md_table)
            elseif apptype == 14 then   update_favorites_table_recent(sms_table)             update_cached_table("db_sms.lua", sms_table)
            elseif apptype == 15 then   update_favorites_table_recent(gg_table)              update_cached_table("db_gg.lua", gg_table)
            elseif apptype == 16 then   update_favorites_table_recent(tg16_table)            update_cached_table("db_tg16.lua", tg16_table)
            elseif apptype == 17 then   update_favorites_table_recent(tgcd_table)            update_cached_table("db_tgcd.lua", tgcd_table)
            elseif apptype == 18 then   update_favorites_table_recent(pce_table)             update_cached_table("db_pce.lua", pce_table)
            elseif apptype == 19 then   update_favorites_table_recent(pcecd_table)           update_cached_table("db_pcecd.lua", pcecd_table)
            elseif apptype == 20 then   update_favorites_table_recent(amiga_table)           update_cached_table("db_amiga.lua", amiga_table)
            elseif apptype == 21 then   update_favorites_table_recent(c64_table)             update_cached_table("db_c64.lua", c64_table)
            elseif apptype == 22 then   update_favorites_table_recent(wswan_col_table)       update_cached_table("db_wswan_col.lua", wswan_col_table)
            elseif apptype == 23 then   update_favorites_table_recent(wswan_table)           update_cached_table("db_wswan.lua", wswan_table)
            elseif apptype == 24 then   update_favorites_table_recent(msx2_table)            update_cached_table("db_msx2.lua", msx2_table)
            elseif apptype == 25 then   update_favorites_table_recent(msx1_table)            update_cached_table("db_msx1.lua", msx1_table)
            elseif apptype == 26 then   update_favorites_table_recent(zxs_table)             update_cached_table("db_zxs.lua", zxs_table)
            elseif apptype == 27 then   update_favorites_table_recent(atari_7800_table)      update_cached_table("db_atari_7800.lua", atari_7800_table)
            elseif apptype == 28 then   update_favorites_table_recent(atari_5200_table)      update_cached_table("db_atari_5200.lua", atari_5200_table)
            elseif apptype == 29 then   update_favorites_table_recent(atari_2600_table)      update_cached_table("db_atari_2600.lua", atari_2600_table)
            elseif apptype == 30 then   update_favorites_table_recent(atari_lynx_table)      update_cached_table("db_atari_lynx.lua", atari_lynx_table)
            elseif apptype == 31 then   update_favorites_table_recent(colecovision_table)    update_cached_table("db_colecovision.lua", colecovision_table)
            elseif apptype == 32 then   update_favorites_table_recent(vectrex_table)         update_cached_table("db_vectrex.lua", vectrex_table)
            elseif apptype == 33 then   update_favorites_table_recent(fba_table)             update_cached_table("db_fba.lua", fba_table)
            elseif apptype == 34 then   update_favorites_table_recent(mame_2003_plus_table)  update_cached_table("db_mame_2003_plus.lua", mame_2003_plus_table)
            elseif apptype == 35 then   update_favorites_table_recent(mame_2000_table)       update_cached_table("db_mame_2000.lua", mame_2000_table)
            elseif apptype == 36 then   update_favorites_table_recent(neogeo_table)          update_cached_table("db_neogeo.lua", neogeo_table)
            elseif apptype == 37 then   update_favorites_table_recent(ngpc_table)            update_cached_table("db_ngpc.lua", ngpc_table)
            else    
            end

        else
            -- Find game in files tables and update
            if apptype == 1 then        update_favorites_table_files(games_table)           update_cached_table("db_games.lua", games_table)
            elseif apptype == 2 then    update_favorites_table_files(psp_table)             update_cached_table("db_psp.lua", psp_table)
            elseif apptype == 3 then    update_favorites_table_files(psx_table)             update_cached_table("db_psx.lua", psx_table) 
            elseif apptype == 4 then    update_favorites_table_files(homebrews_table)       update_cached_table("db_homebrews.lua", homebrews_table)    
            elseif apptype == 5 then    update_favorites_table_files(n64_table)             update_cached_table("db_n64.lua", n64_table)
            elseif apptype == 6 then    update_favorites_table_files(snes_table)            update_cached_table("db_snes.lua", snes_table)
            elseif apptype == 7 then    update_favorites_table_files(nes_table)             update_cached_table("db_nes.lua", nes_table)
            elseif apptype == 8 then    update_favorites_table_files(gba_table)             update_cached_table("db_gba.lua", gba_table)
            elseif apptype == 9 then    update_favorites_table_files(gbc_table)             update_cached_table("db_gbc.lua", gbc_table)
            elseif apptype == 10 then   update_favorites_table_files(gb_table)              update_cached_table("db_gb.lua", gb_table)
            elseif apptype == 11 then   update_favorites_table_files(sega_cd_table)         update_cached_table("db_sega_cd.lua", sega_cd_table)
            elseif apptype == 12 then   update_favorites_table_files(s32x_table)            update_cached_table("db_32x.lua", s32x_table)
            elseif apptype == 13 then   update_favorites_table_files(md_table)              update_cached_table("db_md.lua", md_table)
            elseif apptype == 14 then   update_favorites_table_files(sms_table)             update_cached_table("db_sms.lua", sms_table)
            elseif apptype == 15 then   update_favorites_table_files(gg_table)              update_cached_table("db_gg.lua", gg_table)
            elseif apptype == 16 then   update_favorites_table_files(tg16_table)            update_cached_table("db_tg16.lua", tg16_table)
            elseif apptype == 17 then   update_favorites_table_files(tgcd_table)            update_cached_table("db_tgcd.lua", tgcd_table)
            elseif apptype == 18 then   update_favorites_table_files(pce_table)             update_cached_table("db_pce.lua", pce_table)
            elseif apptype == 19 then   update_favorites_table_files(pcecd_table)           update_cached_table("db_pcecd.lua", pcecd_table)
            elseif apptype == 20 then   update_favorites_table_files(amiga_table)           update_cached_table("db_amiga.lua", amiga_table)
            elseif apptype == 21 then   update_favorites_table_files(c64_table)             update_cached_table("db_c64.lua", c64_table)
            elseif apptype == 22 then   update_favorites_table_files(wswan_col_table)       update_cached_table("db_wswan_col.lua", wswan_col_table)
            elseif apptype == 23 then   update_favorites_table_files(wswan_table)           update_cached_table("db_wswan.lua", wswan_table)
            elseif apptype == 24 then   update_favorites_table_files(msx2_table)            update_cached_table("db_msx2.lua", msx2_table)
            elseif apptype == 25 then   update_favorites_table_files(msx1_table)            update_cached_table("db_msx1.lua", msx1_table)
            elseif apptype == 26 then   update_favorites_table_files(zxs_table)             update_cached_table("db_zxs.lua", zxs_table)
            elseif apptype == 27 then   update_favorites_table_files(atari_7800_table)      update_cached_table("db_atari_7800.lua", atari_7800_table)
            elseif apptype == 28 then   update_favorites_table_files(atari_5200_table)      update_cached_table("db_atari_5200.lua", atari_5200_table)
            elseif apptype == 29 then   update_favorites_table_files(atari_2600_table)      update_cached_table("db_atari_2600.lua", atari_2600_table)
            elseif apptype == 30 then   update_favorites_table_files(atari_lynx_table)      update_cached_table("db_atari_lynx.lua", atari_lynx_table)
            elseif apptype == 31 then   update_favorites_table_files(colecovision_table)    update_cached_table("db_colecovision.lua", colecovision_table)
            elseif apptype == 32 then   update_favorites_table_files(vectrex_table)         update_cached_table("db_vectrex.lua", vectrex_table)
            elseif apptype == 33 then   update_favorites_table_files(fba_table)             update_cached_table("db_fba.lua", fba_table)
            elseif apptype == 34 then   update_favorites_table_files(mame_2003_plus_table)  update_cached_table("db_mame_2003_plus.lua", mame_2003_plus_table)
            elseif apptype == 35 then   update_favorites_table_files(mame_2000_table)       update_cached_table("db_mame_2000.lua", mame_2000_table)
            elseif apptype == 36 then   update_favorites_table_files(neogeo_table)          update_cached_table("db_neogeo.lua", neogeo_table)
            elseif apptype == 37 then   update_favorites_table_files(ngpc_table)            update_cached_table("db_ngpc.lua", ngpc_table)
            else    
            end

        end
        update_cached_table("db_files.lua", files_table)
        update_cached_table_recently_played()

        --Reload
        -- FreeIcons()
        -- FreeMemory()
        -- Network.term()
        showMenu = 0
    end

end

function AddtoRecentlyPlayed()

    -- Get system date and time
    day_num, dd, mm, yyyy = System.getDate()
    h,m,s = System.getTime()

    -- Format numbers to double digits
    if string.len(mm) == 1 then mm = "0" .. mm end
    if string.len(dd) == 1 then dd = "0" .. dd end
    if string.len(h) == 1 then h = "0" .. h end
    if string.len(m) == 1 then m = "0" .. m end
    if string.len(s) == 1 then s = "0" .. s end

    -- Create timestamp string
    timestamp = tonumber(yyyy .. mm .. dd .. h .. m .. s)
    
    -- Find the game in files table and add timestamp
    for k, v in pairs(files_table) do
        if v.filename==filename then
            v.date_played=timestamp
        end
    end
    update_cached_table("db_files.lua", files_table)

    -- Find the games with the timestamp and insert into most table 
    recently_played_new = {}
    for k, v in pairs(files_table) do
        if v.date_played > 0 then
            table.insert(recently_played_new, v)
        end
    end

    for k, v in pairs(recently_played_table) do
        if v.filename==filename then
        else
            table.insert(recently_played_new, v)
        end
    end

    -- Sort played table by date
    table.sort(recently_played_new, function(a, b) return (tonumber(a.date_played) > tonumber(b.date_played)) end)

    -- Select 20 most recent and add to recently played table
    recently_played_pre_launch_table = {}
    for k, v in pairs(recently_played_new) do
        if k < 21 then -- Limit to 20 games
            table.insert(recently_played_pre_launch_table, v)
        end
    end

end


function OverrideCategory()
    if System.doesFileExist(cur_dir .. "/overrides.dat") then
        local inf = assert(io.open(cur_dir .. "/overrides.dat", "rw"), "Failed to open overrides.dat")
        local lines = ""
        while(true) do
            local line = inf:read("*line")
            if not line then break end
            
            if not string.find(line, app_titleid .. "", 1) then
                lines = lines .. line .. "\n"
            end
        end
        if tmpappcat>0 then
            lines = lines .. app_titleid .. "=" .. tmpappcat .. "\n"
        end
        inf:close()
        file_override = io.open(cur_dir .. "/overrides.dat", "w")
        file_override:write(lines)
        file_override:close()
        
        if startupScan == 0 then -- 0 Off, 1 On
            -- Startup scan is OFF
            -- Scan folders and games
            files_table = listDirectory(System.currentDirectory())
            -- Import Cached Database
            files_table = import_cached_DB(System.currentDirectory())
        else
        end


        --Reload
        FreeIcons()
        FreeMemory()
        Network.term()
        dofile("app0:index.lua")
    end

end




function DownloadCovers()
    local txt = lang_lines.Downloading_covers .. "..."
    --          Downloading covers
    local old_txt = txt
    local percent = 0
    local old_percent = 0
    local cvrfound = 0
    
    local app_idx = 1
    local running = false
    status = System.getMessageState()
    
    if Network.isWifiEnabled() then

        -- getCovers - 0 All, 1 PSV, 2 PSP, 3 PS1, 4 N64, 5 SNES, 6 NES, 7 GBA, 8 GBC, 9 GB, 10 MD, 11 SMS, 12 GG, 13 MAME, 14 AMIGA, 15 TG16, 16 TGCD, 17 PCE, 18 PCECD, 19 NGPC
        
        function DownloadCovers_System(def_getCovers, def_table_name, def_lang_lines_Downloading_SysName_covers)

            if getCovers == 0 then -- sort all games by system
                table.sort(return_table, function(a, b) return (a.app_type < b.app_type) end)
            end

            if  getCovers==(def_getCovers) and #(def_table_name) > 0 then -- Check getcover number against system
                
                if status ~= RUNNING then
                    if scanComplete == false then
                        System.setMessage("Downloading covers...", true)
                        System.setMessageProgMsg(txt)
                        
                        while app_idx <= #(def_table_name) do

                            if System.getAsyncState() ~= 0 then
                                Network.downloadFileAsync((def_table_name)[app_idx].cover_path_online .. (def_table_name)[app_idx].name_online .. ".png", "ux0:/data/RetroFlow/" .. (def_table_name)[app_idx].name .. ".png")
                                running = true
                            end
                            if System.getAsyncState() == 1 then
                                Graphics.initBlend()
                                Graphics.termBlend()
                                Screen.flip()
                                running = false
                            end
                            if running == false then
                                if System.doesFileExist("ux0:/data/RetroFlow/" .. (def_table_name)[app_idx].name .. ".png") then
                                    tmpfile = System.openFile("ux0:/data/RetroFlow/" .. (def_table_name)[app_idx].name .. ".png", FREAD)
                                    size = System.sizeFile(tmpfile)
                                    if size < 1024 then
                                        System.deleteFile("ux0:/data/RetroFlow/" .. (def_table_name)[app_idx].name .. ".png")

                                    -- delete if already exists
                                    elseif System.doesFileExist((def_table_name)[app_idx].cover_path_local .. (def_table_name)[app_idx].name .. ".png") then
                                        System.deleteFile("ux0:/data/RetroFlow/" .. (def_table_name)[app_idx].name .. ".png")
                                        cvrfound = cvrfound + 1

                                    else
                                        System.rename("ux0:/data/RetroFlow/" .. (def_table_name)[app_idx].name .. ".png", (def_table_name)[app_idx].cover_path_local .. (def_table_name)[app_idx].name .. ".png")
                                        cvrfound = cvrfound + 1
                                        
                                    end
                                    System.closeFile(tmpfile)
                                    
                                    percent = (app_idx / #(def_table_name)) * 100
                                    clean_name = (def_table_name)[app_idx].name:gsub("\n","")
                                    txt = (def_lang_lines_Downloading_SysName_covers) .. "...\n" .. lang_lines.Cover .. " " .. clean_name .. "\n" .. lang_lines.Found .. " " .. cvrfound .. lang_lines.of .. #(def_table_name)

                                    Graphics.initBlend()
                                    Graphics.termBlend()
                                    Screen.flip()
                                    app_idx = app_idx + 1
                                end
                            end
                            
                            if txt ~= old_txt then
                                System.setMessageProgMsg(txt)
                                old_txt = txt
                            end
                            if percent ~= old_percent then
                                System.setMessageProgress(percent)
                                old_percent = percent
                            end
                        end
                        if app_idx >= #(def_table_name) then
                            System.closeMessage()
                            scanComplete = true
                        end
                    else

                        if startupScan == 0 then -- 0 Off, 1 On
                            -- Startup scan is OFF
                            -- Scan folders and games
                            files_table = listDirectory(System.currentDirectory())
                            -- Import Cached Database
                            files_table = import_cached_DB(System.currentDirectory())
                        else
                        end

                        FreeIcons()
                        FreeMemory()
                        Network.term()
                        dofile("app0:index.lua")
                    end
                end
            end

            if getCovers == 0 then -- sort all games by app title
                table.sort(return_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
            end
        end

        -- def_getCovers, def_table_name, def_lang_lines_Downloading_SysName_covers)
        DownloadCovers_System(0,    return_table,           lang_lines.Downloading_all_covers)
        DownloadCovers_System(1,    games_table,            lang_lines.Downloading_PSP_covers)
        DownloadCovers_System(2,    psp_table,              lang_lines.Downloading_PSP_covers)
        DownloadCovers_System(3,    psx_table,              lang_lines.Downloading_PS1_covers)
                                                   -- Homebrew is number 4 kicking out numbers
        DownloadCovers_System(4,    n64_table,              lang_lines.Downloading_N64_covers)
        DownloadCovers_System(5,    snes_table,             lang_lines.Downloading_SNES_covers)
        DownloadCovers_System(6,    nes_table,              lang_lines.Downloading_NES_covers)
        DownloadCovers_System(7,    gba_table,              lang_lines.Downloading_GBA_covers)
        DownloadCovers_System(8,    gbc_table,              lang_lines.Downloading_GBC_covers)
        DownloadCovers_System(9,    gb_table,               lang_lines.Downloading_GB_covers)
        DownloadCovers_System(10,   sega_cd_table,          lang_lines.Downloading_SCD_covers)
        DownloadCovers_System(11,   s32x_table,             lang_lines.Downloading_32X_covers)
        DownloadCovers_System(12,   md_table,               lang_lines.Downloading_MD_covers)
        DownloadCovers_System(13,   sms_table,              lang_lines.Downloading_SMS_covers)
        DownloadCovers_System(14,   gg_table,               lang_lines.Downloading_GG_covers)
        DownloadCovers_System(15,   tg16_table,             lang_lines.Downloading_TG_16_covers)
        DownloadCovers_System(16,   tgcd_table,             lang_lines.Downloading_TG_CD_covers)
        DownloadCovers_System(17,   pce_table,              lang_lines.Downloading_PCE_covers)
        DownloadCovers_System(18,   pcecd_table,            lang_lines.Downloading_PCE_CD_covers)
        DownloadCovers_System(19,   amiga_table,            lang_lines.Downloading_AMIGA_covers)
        DownloadCovers_System(20,   c64_table,              lang_lines.Downloading_C64_covers)
        DownloadCovers_System(21,   wswan_col_table,        lang_lines.Downloading_WSWANCOL_covers)
        DownloadCovers_System(22,   wswan_table,            lang_lines.Downloading_WSWAN_covers)
        DownloadCovers_System(23,   msx2_table,             lang_lines.Downloading_MSX2_covers)
        DownloadCovers_System(24,   msx1_table,             lang_lines.Downloading_MSX_covers)
        DownloadCovers_System(25,   zxs_table,              lang_lines.Downloading_ZXS_covers)
        DownloadCovers_System(26,   atari_7800_table,       lang_lines.Downloading_A7800_covers)
        DownloadCovers_System(27,   atari_5200_table,       lang_lines.Downloading_A5200_covers)
        DownloadCovers_System(28,   atari_2600_table,       lang_lines.Downloading_A600_covers)
        DownloadCovers_System(29,   atari_lynx_table,       lang_lines.Downloading_LYNX_covers)
        DownloadCovers_System(30,   colecovision_table,     lang_lines.Downloading_COLECO_covers)
        DownloadCovers_System(31,   vectrex_table,          lang_lines.Downloading_VECTREX_covers)
        DownloadCovers_System(32,   fba_table,              lang_lines.Downloading_FBA2012_covers)
        DownloadCovers_System(33,   mame_2003_plus_table,   lang_lines.Downloading_MAME_2003_covers)
        DownloadCovers_System(34,   mame_2000_table,        lang_lines.Downloading_MAME_2000_covers)
        DownloadCovers_System(35,   neogeo_table,           lang_lines.Downloading_NG_covers)
        DownloadCovers_System(36,   ngpc_table,             lang_lines.Downloading_NG_PC_covers)
        
    else
        if status ~= RUNNING then
            System.setMessage(lang_lines.Internet_Connection_Required, false, BUTTON_OK)
        end
        
    end
    gettingCovers = false

    -- RESCAN ALL AND UPDATE CACHE

    -- -- Scan folders and games
    -- files_table = listDirectory(System.currentDirectory())
    -- -- Import Cached Database
    -- files_table = import_cached_DB(System.currentDirectory())

end


function DownloadSnaps()
    local txt = lang_lines.Downloading_backgrounds .. "..."
    --          Downloading covers
    local old_txt = txt
    local percent = 0
    local old_percent = 0
    local bgfound = 0
    
    local app_idx = 1
    local running = false
    status = System.getMessageState()
    
    if Network.isWifiEnabled() then

        -- getSnaps - 0 All, 1 PSV, 2 PSP, 3 PS1, 4 N64, 5 SNES, 6 NES, 7 GBA, 8 GBC, 9 GB, 10 MD, 11 SMS, 12 GG, 13 MAME, 14 AMIGA, 15 TG16, 16 TGCD, 17 PCE, 18 PCECD, 19 NGPC
        
        function DownloadSnaps_System(def_getSnaps, def_table_name, def_lang_lines_Downloading_SysName_backgrounds)
            if  getSnaps==(def_getSnaps) and #(def_table_name) > 0 then -- Check getcover number against system
                
                if status ~= RUNNING then
                    if bgscanComplete == false then
                        System.setMessage("Downloading covers...", true)
                        System.setMessageProgMsg(txt)
                        
                        while app_idx <= #(def_table_name) do

                            if System.getAsyncState() ~= 0 then
                                Network.downloadFileAsync((def_table_name)[app_idx].snap_path_online .. (def_table_name)[app_idx].name_online .. ".png", "ux0:/data/RetroFlow/" .. (def_table_name)[app_idx].name .. ".png")
                                running = true
                            end
                            if System.getAsyncState() == 1 then
                                Graphics.initBlend()
                                Graphics.termBlend()
                                Screen.flip()
                                running = false
                            end
                            if running == false then
                                if System.doesFileExist("ux0:/data/RetroFlow/" .. (def_table_name)[app_idx].name .. ".png") then
                                    tmpfile = System.openFile("ux0:/data/RetroFlow/" .. (def_table_name)[app_idx].name .. ".png", FREAD)
                                    size = System.sizeFile(tmpfile)
                                    if size < 1024 then
                                        System.deleteFile("ux0:/data/RetroFlow/" .. (def_table_name)[app_idx].name .. ".png")

                                    -- delete if already exists
                                    elseif System.doesFileExist((def_table_name)[app_idx].snap_path_local .. (def_table_name)[app_idx].name .. ".png") then
                                        System.deleteFile("ux0:/data/RetroFlow/" .. (def_table_name)[app_idx].name .. ".png")
                                        bgfound = bgfound + 1

                                    else
                                        System.rename("ux0:/data/RetroFlow/" .. (def_table_name)[app_idx].name .. ".png", (def_table_name)[app_idx].snap_path_local .. (def_table_name)[app_idx].name .. ".png")
                                        bgfound = bgfound + 1
                                        
                                    end
                                    System.closeFile(tmpfile)
                                    
                                    percent = (app_idx / #(def_table_name)) * 100
                                    clean_name = (def_table_name)[app_idx].name:gsub("\n","")
                                    txt = (def_lang_lines_Downloading_SysName_backgrounds) .. "...\n" .. lang_lines.Background .. " " .. clean_name .. "\n" .. lang_lines.Found .. " " .. bgfound .. lang_lines.of .. #(def_table_name)

                                    Graphics.initBlend()
                                    Graphics.termBlend()
                                    Screen.flip()
                                    app_idx = app_idx + 1
                                end
                            end
                            
                            if txt ~= old_txt then
                                System.setMessageProgMsg(txt)
                                old_txt = txt
                            end
                            if percent ~= old_percent then
                                System.setMessageProgress(percent)
                                old_percent = percent
                            end
                        end
                        if app_idx >= #(def_table_name) then
                            System.closeMessage()
                            bgscanComplete = true
                        end
                    else

                        if startupScan == 0 then -- 0 Off, 1 On
                            -- Startup scan is OFF
                            -- Scan folders and games
                            files_table = listDirectory(System.currentDirectory())
                            -- Import Cached Database
                            files_table = import_cached_DB(System.currentDirectory())
                        else
                        end

                        FreeIcons()
                        FreeMemory()
                        Network.term()
                        dofile("app0:index.lua")
                    end
                end
            end
        end

        -- def_getSnaps, def_table_name, def_lang_lines_Downloading_SysName_backgrounds)
        DownloadSnaps_System(0,    bg_table,               lang_lines.Downloading_all_backgrounds)
        -- DownloadSnaps_System(1,    games_table,            lang_lines.Downloading_PSP_backgrounds)
        DownloadSnaps_System(1,    psp_table,              lang_lines.Downloading_PSP_backgrounds)
        DownloadSnaps_System(2,    psx_table,              lang_lines.Downloading_PS1_backgrounds)
                                                   -- Homebrew is number 4 kicking out numbers
        DownloadSnaps_System(3,    n64_table,              lang_lines.Downloading_N64_backgrounds)
        DownloadSnaps_System(4,    snes_table,             lang_lines.Downloading_SNES_backgrounds)
        DownloadSnaps_System(5,    nes_table,              lang_lines.Downloading_NES_backgrounds)
        DownloadSnaps_System(6,    gba_table,              lang_lines.Downloading_GBA_backgrounds)
        DownloadSnaps_System(7,    gbc_table,              lang_lines.Downloading_GBC_backgrounds)
        DownloadSnaps_System(8,    gb_table,               lang_lines.Downloading_GB_backgrounds)
        DownloadSnaps_System(9,   sega_cd_table,          lang_lines.Downloading_SCD_backgrounds)
        DownloadSnaps_System(10,   s32x_table,             lang_lines.Downloading_32X_backgrounds)
        DownloadSnaps_System(11,   md_table,               lang_lines.Downloading_MD_backgrounds)
        DownloadSnaps_System(12,   sms_table,              lang_lines.Downloading_SMS_backgrounds)
        DownloadSnaps_System(13,   gg_table,               lang_lines.Downloading_GG_backgrounds)
        DownloadSnaps_System(14,   tg16_table,             lang_lines.Downloading_TG_16_backgrounds)
        DownloadSnaps_System(15,   tgcd_table,             lang_lines.Downloading_TG_CD_backgrounds)
        DownloadSnaps_System(16,   pce_table,              lang_lines.Downloading_PCE_backgrounds)
        DownloadSnaps_System(17,   pcecd_table,            lang_lines.Downloading_PCE_CD_backgrounds)
        DownloadSnaps_System(18,   amiga_table,            lang_lines.Downloading_AMIGA_backgrounds)
        DownloadSnaps_System(19,   c64_table,              lang_lines.Downloading_C64_backgrounds)
        DownloadSnaps_System(20,   wswan_col_table,        lang_lines.Downloading_WSWANCOL_backgrounds)
        DownloadSnaps_System(21,   wswan_table,            lang_lines.Downloading_WSWAN_backgrounds)
        DownloadSnaps_System(22,   msx2_table,             lang_lines.Downloading_MSX2_backgrounds)
        DownloadSnaps_System(23,   msx1_table,             lang_lines.Downloading_MSX_backgrounds)
        DownloadSnaps_System(24,   zxs_table,              lang_lines.Downloading_ZXS_backgrounds)
        DownloadSnaps_System(25,   atari_7800_table,       lang_lines.Downloading_A7800_backgrounds)
        DownloadSnaps_System(26,   atari_5200_table,       lang_lines.Downloading_A5200_backgrounds)
        DownloadSnaps_System(27,   atari_2600_table,       lang_lines.Downloading_A600_backgrounds)
        DownloadSnaps_System(28,   atari_lynx_table,       lang_lines.Downloading_LYNX_backgrounds)
        DownloadSnaps_System(29,   colecovision_table,     lang_lines.Downloading_COLECO_backgrounds)
        DownloadSnaps_System(30,   vectrex_table,          lang_lines.Downloading_VECTREX_backgrounds)
        DownloadSnaps_System(31,   fba_table,              lang_lines.Downloading_FBA2012_backgrounds)
        DownloadSnaps_System(32,   mame_2003_plus_table,   lang_lines.Downloading_MAME_2003_backgrounds)
        DownloadSnaps_System(33,   mame_2000_table,        lang_lines.Downloading_MAME_2000_backgrounds)
        DownloadSnaps_System(34,   neogeo_table,           lang_lines.Downloading_NG_backgrounds)
        DownloadSnaps_System(35,   ngpc_table,             lang_lines.Downloading_NG_PC_backgrounds)
        
    else
        if status ~= RUNNING then
            System.setMessage(lang_lines.Internet_Connection_Required, false, BUTTON_OK)
        end
        
    end
    gettingBackgrounds = false

    -- RESCAN ALL AND UPDATE CACHE

    -- -- Scan folders and games
    -- files_table = listDirectory(System.currentDirectory())
    -- -- Import Cached Database
    -- files_table = import_cached_DB(System.currentDirectory())

end

local function DrawCover(x, y, text, icon, sel, apptype)
    rot = 0
    extraz = 0
    extrax = 0
    extray = 0
    zoom = 0
    camX = 0
    Graphics.setImageFilters(icon, FILTER_LINEAR, FILTER_LINEAR)
    if showView == 1 then
        -- flat zoom out view
        space = 1.6
        zoom = 0
        if x > 0.5 then
            extraz = 6
            extrax = 1
        elseif x < -0.5 then
            extraz = 6
            extrax = -1
        end
    elseif showView == 2 then
        -- zoomin view
        space = 1.6
        zoom = -1
        extray = -0.6
        if x > 0.5 then
            rot = -1
            extraz = 0
            extrax = 1
        elseif x < -0.5 then
            rot = 1
            extraz = 0
            extrax = -1
        end
    elseif showView == 3 then
        -- left side view
        space = 1.5
        zoom = -0.6
        extray = -0.3
        camX = 1
        if x > 0.5 then
            rot = -0.5
            extraz = 2 + (x / 2)
            extrax = 0.6
        elseif x < -0.5 then
            rot = 0.5
            extraz = 2
            extrax = -10
        end
    elseif showView == 4 then
        -- scroll around
        space = 1
        zoom = 0
        if x > 0.5 then
            extraz = 2 + (x / 1.5)
            extrax = 1
        elseif x < -0.5 then
            extraz = 2 - (x / 1.5)
            extrax = -1
        end
    else
        -- default view
        space = 1
        zoom = 0
        if x > 0.5 then
            rot = -1
            extraz = 3
            extrax = 1
        elseif x < -0.5 then
            rot = 1
            extraz = 3
            extrax = -1
        end
    end
    
    Render.setCamera(camX, 0, 0, 0.0, 0.0, 0.0)
    
    if hideBoxes <= 0 then
        if apptype==1 then
            -- PSVita Boxes
            if setReflections == 1 then
                Render.useTexture(modCover, icon)
                Render.drawModel(modCover, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBox, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            else
                Render.useTexture(modCoverNoref, icon)
                Render.drawModel(modCoverNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            end
        elseif apptype==2 then
            if setReflections == 1 then
                Render.useTexture(modCoverPSP, icon)
                Render.drawModel(modCoverPSP, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxPSP, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            else
                Render.useTexture(modCoverPSPNoref, icon)
                Render.drawModel(modCoverPSPNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxPSPNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            end
        elseif apptype==3 then
            if setReflections == 1 then
                Render.useTexture(modCoverPSX, icon)
                Render.drawModel(modCoverPSX, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxPSX, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            else
                Render.useTexture(modCoverPSXNoref, icon)
                Render.drawModel(modCoverPSXNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxPSXNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            end
        elseif apptype==5 or apptype==6 then
            if setReflections == 1 then
                Render.useTexture(modCoverN64, icon)
                Render.drawModel(modCoverN64, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxN64, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            else
                Render.useTexture(modCoverN64Noref, icon)
                Render.drawModel(modCoverN64Noref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxN64Noref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            end
        elseif apptype==7 or apptype==11 or apptype==16 or apptype==17 or apptype==18 or apptype==19 or apptype==20 or apptype==22 or apptype==23 or apptype==33 or apptype==34 or apptype==35 or apptype==36 or apptype==37 then
            if setReflections == 1 then
                Render.useTexture(modCoverNES, icon)
                Render.drawModel(modCoverNES, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxNES, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            else
                Render.useTexture(modCoverNESNoref, icon)
                Render.drawModel(modCoverNESNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxNESNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            end
        elseif apptype==8 or apptype==9 or apptype==10 then
            if setReflections == 1 then
                Render.useTexture(modCoverGB, icon)
                Render.drawModel(modCoverGB, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxGB, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            else
                Render.useTexture(modCoverGBNoref, icon)
                Render.drawModel(modCoverGBNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxGBNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            end
        elseif apptype==12 or apptype==13 or apptype==14 or apptype==15 then
            if setReflections == 1 then
                Render.useTexture(modCoverMD, icon)
                Render.drawModel(modCoverMD, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxMD, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            else
                Render.useTexture(modCoverMDNoref, icon)
                Render.drawModel(modCoverMDNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxMDNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            end
        elseif apptype==21 or apptype==24 or apptype==25 or apptype==26 then
            if setReflections == 1 then
                Render.useTexture(modCoverTAPE, icon)
                Render.drawModel(modCoverTAPE, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxTAPE, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            else
                Render.useTexture(modCoverTAPENoref, icon)
                Render.drawModel(modCoverTAPENoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxTAPENoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            end
        elseif apptype==27 or apptype==28 or apptype==29 or apptype==31 or apptype==32 then
            if setReflections == 1 then
                Render.useTexture(modCoverATARI, icon)
                Render.drawModel(modCoverATARI, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxATARI, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            else
                Render.useTexture(modCoverATARINoref, icon)
                Render.drawModel(modCoverATARINoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxATARINoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            end
        elseif apptype==30 then
            if setReflections == 1 then
                Render.useTexture(modCoverLYNX, icon)
                Render.drawModel(modCoverLYNX, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxLYNX, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            else
                Render.useTexture(modCoverLYNXNoref, icon)
                Render.drawModel(modCoverLYNXNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxLYNXNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            end
        else
            -- Homebrew Icon
            if setReflections == 1 then
                Render.useTexture(modCoverHbr, icon)
                Render.drawModel(modCoverHbr, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            else
                Render.useTexture(modCoverHbrNoref, icon)
                Render.drawModel(modCoverHbrNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            end
        end
    else
        hideBoxes = hideBoxes - 0.1
    end
end

local FileLoad = {}

function FreeIcons()
    for k, v in pairs(files_table)              do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(games_table)              do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(psp_table)                do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(psx_table)                do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(n64_table)                do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(snes_table)               do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(nes_table)                do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(gba_table)                do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(gbc_table)                do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(gb_table)                 do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end 
    for k, v in pairs(sega_cd_table)            do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end 
    for k, v in pairs(s32x_table)               do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end 
    for k, v in pairs(md_table)                 do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(sms_table)                do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(gg_table)                 do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(tg16_table)               do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(tgcd_table)               do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(pce_table)                do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(pcecd_table)              do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(amiga_table)              do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(c64_table)                do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(wswan_col_table)          do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(wswan_table)              do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(msx2_table)               do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(msx1_table)               do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(zxs_table)                do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(atari_7800_table)         do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(atari_5200_table)         do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(atari_2600_table)         do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(atari_lynx_table)         do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(colecovision_table)       do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(vectrex_table)            do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(fba_table)                do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(mame_2003_plus_table)     do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(mame_2000_table)          do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(neogeo_table)             do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(ngpc_table)               do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end

    for k, v in pairs(recently_played_table)    do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(homebrews_table)          do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
    for k, v in pairs(search_results_table)     do FileLoad[v] = nil Threads.remove(v) if v.ricon then Graphics.freeImage(v.ricon) v.ricon = nil end end
end

function DownloadSingleCover()
    cvrfound = 0
    app_idx = p
    running = false
    status = System.getMessageState()
    
    local coverspath = ""
    local onlineCoverspath = ""
    
    if Network.isWifiEnabled() then
        if apptype == 1 then
            coverspath = SystemsToScan[1].localCoverPath
            onlineCoverspath = SystemsToScan[1].onlineCoverPathSystem
        elseif apptype == 2 then
            coverspath = SystemsToScan[3].localCoverPath
            onlineCoverspath = SystemsToScan[3].onlineCoverPathSystem
        elseif apptype == 3 then
            coverspath = SystemsToScan[4].localCoverPath
            onlineCoverspath = SystemsToScan[4].onlineCoverPathSystem
        elseif apptype == 4 then
            coverspath = SystemsToScan[1].localCoverPath
            onlineCoverspath = SystemsToScan[1].onlineCoverPathSystem
        else
            coverspath = SystemsToScan[apptype].localCoverPath
            onlineCoverspath = SystemsToScan[apptype].onlineCoverPathSystem
        end

        app_titleid = app_titleid:gsub("\n","")

        Network.downloadFile(onlineCoverspath .. app_titleid:gsub("%s+", '%%20') .. ".png", "ux0:/data/RetroFlow/" .. app_titleid .. ".png")
        
        if System.doesFileExist("ux0:/data/RetroFlow/" .. app_titleid .. ".png") then
            tmpfile = System.openFile("ux0:/data/RetroFlow/" .. app_titleid .. ".png", FREAD)
            size = System.sizeFile(tmpfile)
            System.closeFile(tmpfile)
            if size < 1024 then
                System.deleteFile("ux0:/data/RetroFlow/" .. app_titleid .. ".png")
            else
                System.rename("ux0:/data/RetroFlow/" .. app_titleid .. ".png", coverspath .. app_titleid .. ".png")
                cvrfound = 1
            end
            -- Delete image if not in covers folder
            if System.doesFileExist("ux0:/data/RetroFlow/" .. app_titleid .. ".png") then
                System.deleteFile("ux0:/data/RetroFlow/" .. app_titleid .. ".png")
            end
        end

        function update_cvrfound_showcats(def_table_name, def_user_db_file)
            (def_table_name)[app_idx].icon_path=coverspath .. app_titleid .. ".png"
            if FileLoad[(def_table_name)[app_idx]] == true then
                FileLoad[(def_table_name)[app_idx]] = nil
                Threads.remove((def_table_name)[app_idx])
                update_cached_table((def_user_db_file), (def_table_name))
            end
            if (def_table_name)[app_idx].ricon then
                (def_table_name)[app_idx].ricon = nil
            end
        end

        function update_cvrfound_showcats_recent()
            recently_played_table[app_idx].icon_path=coverspath .. app_titleid .. ".png"
            if FileLoad[recently_played_table[app_idx]] == true then
                FileLoad[recently_played_table[app_idx]] = nil
                Threads.remove(recently_played_table[app_idx])
                update_cached_table_recently_played()
            end
            if recently_played_table[app_idx].ricon then
                recently_played_table[app_idx].ricon = nil
            end
        end

        if cvrfound==1 then
            if showCat == 1 then update_cvrfound_showcats(games_table, "db_games.lua")
            elseif showCat == 2 then --"homebrews_table"
            elseif showCat == 3 then update_cvrfound_showcats(psp_table, "db_psp.lua")
            elseif showCat == 4 then update_cvrfound_showcats(psx_table, "db_psx.lua")
            elseif showCat == 5 then update_cvrfound_showcats(n64_table, "db_n64.lua")
            elseif showCat == 6 then update_cvrfound_showcats(snes_table, "db_snes.lua")
            elseif showCat == 7 then update_cvrfound_showcats(nes_table, "db_nes.lua")
            elseif showCat == 8 then update_cvrfound_showcats(gba_table, "db_gba.lua")
            elseif showCat == 9 then update_cvrfound_showcats(gbc_table, "db_gbc.lua")
            elseif showCat == 10 then update_cvrfound_showcats(gb_table, "db_gb.lua")
            elseif showCat == 11 then update_cvrfound_showcats(sega_cd_table, "db_sega_cd.lua")
            elseif showCat == 12 then update_cvrfound_showcats(s32x_table, "db_32x.lua")
            elseif showCat == 13 then update_cvrfound_showcats(md_table, "db_md.lua")
            elseif showCat == 14 then update_cvrfound_showcats(sms_table, "db_sms.lua")
            elseif showCat == 15 then update_cvrfound_showcats(gg_table, "db_gg.lua")
            elseif showCat == 16 then update_cvrfound_showcats(tg16_table, "db_tg16.lua")
            elseif showCat == 17 then update_cvrfound_showcats(tgcd_table, "db_tgcd.lua")
            elseif showCat == 18 then update_cvrfound_showcats(pce_table, "db_pce.lua")
            elseif showCat == 19 then update_cvrfound_showcats(pcecd_table, "db_pcecd.lua")
            elseif showCat == 20 then update_cvrfound_showcats(amiga_table, "db_amiga.lua")
            elseif showCat == 21 then update_cvrfound_showcats(c64_table, "db_c64.lua")
            elseif showCat == 22 then update_cvrfound_showcats(wswan_col_table, "db_wswan_col.lua")
            elseif showCat == 23 then update_cvrfound_showcats(wswan_table, "db_wswan.lua")
            elseif showCat == 24 then update_cvrfound_showcats(msx2_table, "db_msx2.lua")
            elseif showCat == 25 then update_cvrfound_showcats(msx1_table, "db_msx1.lua")
            elseif showCat == 26 then update_cvrfound_showcats(zxs_table, "db_zxs.lua")
            elseif showCat == 27 then update_cvrfound_showcats(atari_7800_table, "db_atari_7800.lua")
            elseif showCat == 28 then update_cvrfound_showcats(atari_5200_table, "db_atari_5200.lua")
            elseif showCat == 29 then update_cvrfound_showcats(atari_2600_table, "db_atari_2600.lua")
            elseif showCat == 30 then update_cvrfound_showcats(atari_lynx_table, "db_atari_lynx.lua")
            elseif showCat == 31 then update_cvrfound_showcats(colecovision_table, "db_colecovision.lua")
            elseif showCat == 32 then update_cvrfound_showcats(vectrex_table, "db_vectrex.lua")
            elseif showCat == 33 then update_cvrfound_showcats(fba_table, "db_fba.lua")
            elseif showCat == 34 then update_cvrfound_showcats(mame_2003_plus_table, "db_mame_2003_plus.lua")
            elseif showCat == 35 then update_cvrfound_showcats(mame_2000_table, "db_mame_2000.lua")
            elseif showCat == 36 then update_cvrfound_showcats(neogeo_table, "db_neogeo.lua")
            elseif showCat == 37 then update_cvrfound_showcats(ngpc_table, "db_ngpc.lua")
            elseif showCat == 38 then update_cvrfound_showcats(fav_count, "db_files.lua")
            elseif showCat == 39 then update_cvrfound_showcats_recent()
            elseif showCat == 40 then update_cvrfound_showcats(search_results_table, "db_files.lua")
            else update_cvrfound_showcats(files_table, "db_files.lua")
            end

            if status ~= RUNNING then
                System.setMessage(lang_lines.Cover .. " " .. app_titleid .. " " .. lang_lines.found_exclamation, false, BUTTON_OK)
            end
        else
            if status ~= RUNNING then
                System.setMessage(lang_lines.Cover_not_found, false, BUTTON_OK)
            end
        end
        
    else
        if status ~= RUNNING then
            System.setMessage(lang_lines.Internet_Connection_Required, false, BUTTON_OK)
        end
    end
    
    gettingCovers = false
end

function DownloadSingleSnap()
    bgfound = 0
    app_idx = p
    running = false
    status = System.getMessageState()
    
    local snapPath = ""
    local onlineSnapPath = ""
    
    if Network.isWifiEnabled() then
        if apptype == 1 then
            snapPath = SystemsToScan[1].localSnapPath
            onlineSnapPath = SystemsToScan[1].onlineSnapPathSystem
        elseif apptype == 2 then
            snapPath = SystemsToScan[3].localSnapPath
            onlineSnapPath = SystemsToScan[3].onlineSnapPathSystem
        elseif apptype == 3 then
            snapPath = SystemsToScan[4].localSnapPath
            onlineSnapPath = SystemsToScan[4].onlineSnapPathSystem
        elseif apptype == 4 then
            snapPath = SystemsToScan[1].localSnapPath
            onlineSnapPath = SystemsToScan[1].onlineSnapPathSystem
        else
            snapPath = SystemsToScan[apptype].localSnapPath
            onlineSnapPath = SystemsToScan[apptype].onlineSnapPathSystem
        end

        app_titleid = app_titleid:gsub("\n","")

        Network.downloadFile(onlineSnapPath .. app_titleid:gsub("%s+", '%%20') .. ".png", "ux0:/data/RetroFlow/" .. app_titleid .. ".png")
        
        if System.doesFileExist("ux0:/data/RetroFlow/" .. app_titleid .. ".png") then
            tmpfile = System.openFile("ux0:/data/RetroFlow/" .. app_titleid .. ".png", FREAD)
            size = System.sizeFile(tmpfile)
            System.closeFile(tmpfile)
            if size < 1024 then
                System.deleteFile("ux0:/data/RetroFlow/" .. app_titleid .. ".png")
            else
                System.rename("ux0:/data/RetroFlow/" .. app_titleid .. ".png", snapPath .. app_titleid .. ".png")
                bgfound = 1
            end
            -- Delete image if not in covers folder
            if System.doesFileExist("ux0:/data/RetroFlow/" .. app_titleid .. ".png") then
                System.deleteFile("ux0:/data/RetroFlow/" .. app_titleid .. ".png")
            end
        end

        if bgfound==1 then
            if showCat == 1 then pic_path = games_table[p].snap_path_local .. games_table[p].name .. ".png"
            elseif showCat == 2 then --"homebrews_table"
            elseif showCat == 3 then pic_path = psp_table[p].snap_path_local .. psp_table[p].name .. ".png"
            elseif showCat == 4 then pic_path = psx_table[p].snap_path_local .. psx_table[p].name .. ".png"
            elseif showCat == 5 then pic_path = n64_table[p].snap_path_local .. n64_table[p].name .. ".png"
            elseif showCat == 6 then pic_path = snes_table[p].snap_path_local .. snes_table[p].name .. ".png"
            elseif showCat == 7 then pic_path = nes_table[p].snap_path_local .. nes_table[p].name .. ".png"
            elseif showCat == 8 then pic_path = gba_table[p].snap_path_local .. gba_table[p].name .. ".png"
            elseif showCat == 9 then pic_path = gbc_table[p].snap_path_local .. gbc_table[p].name .. ".png"
            elseif showCat == 10 then pic_path = gb_table[p].snap_path_local .. gb_table[p].name .. ".png"
            elseif showCat == 11 then pic_path = sega_cd_table[p].snap_path_local .. sega_cd_table[p].name .. ".png"
            elseif showCat == 12 then pic_path = s32x_table[p].snap_path_local .. s32x_table[p].name .. ".png"
            elseif showCat == 13 then pic_path = md_table[p].snap_path_local .. md_table[p].name .. ".png"
            elseif showCat == 14 then pic_path = sms_table[p].snap_path_local .. sms_table[p].name .. ".png"
            elseif showCat == 15 then pic_path = gg_table[p].snap_path_local .. gg_table[p].name .. ".png"
            elseif showCat == 16 then pic_path = tg16_table[p].snap_path_local .. tg16_table[p].name .. ".png"
            elseif showCat == 17 then pic_path = tgcd_table[p].snap_path_local .. tgcd_table[p].name .. ".png"
            elseif showCat == 18 then pic_path = pce_table[p].snap_path_local .. pce_table[p].name .. ".png"
            elseif showCat == 19 then pic_path = pcecd_table[p].snap_path_local .. pcecd_table[p].name .. ".png"
            elseif showCat == 20 then pic_path = amiga_table[p].snap_path_local .. amiga_table[p].name .. ".png"
            elseif showCat == 21 then pic_path = c64_table[p].snap_path_local .. c64_table[p].name .. ".png"
            elseif showCat == 22 then pic_path = wswan_col_table[p].snap_path_local .. wswan_col_table[p].name .. ".png"
            elseif showCat == 23 then pic_path = wswan_table[p].snap_path_local .. wswan_table[p].name .. ".png"
            elseif showCat == 24 then pic_path = msx2_table[p].snap_path_local .. msx2_table[p].name .. ".png"
            elseif showCat == 25 then pic_path = msx1_table[p].snap_path_local .. msx1_table[p].name .. ".png"
            elseif showCat == 26 then pic_path = zxs_table[p].snap_path_local .. zxs_table[p].name .. ".png"
            elseif showCat == 27 then pic_path = atari_7800_table[p].snap_path_local .. atari_7800_table[p].name .. ".png"
            elseif showCat == 28 then pic_path = atari_5200_table[p].snap_path_local .. atari_5200_table[p].name .. ".png"
            elseif showCat == 29 then pic_path = atari_2600_table[p].snap_path_local .. atari_2600_table[p].name .. ".png"
            elseif showCat == 30 then pic_path = atari_lynx_table[p].snap_path_local .. atari_lynx_table[p].name .. ".png"
            elseif showCat == 31 then pic_path = colecovision_table[p].snap_path_local .. colecovision_table[p].name .. ".png"
            elseif showCat == 32 then pic_path = vectrex_table[p].snap_path_local .. vectrex_table[p].name .. ".png"
            elseif showCat == 33 then pic_path = fba_table[p].snap_path_local .. fba_table[p].name .. ".png"
            elseif showCat == 34 then pic_path = mame_2003_plus_table[p].snap_path_local .. mame_2003_plus_table[p].name .. ".png"
            elseif showCat == 35 then pic_path = mame_2000_table[p].snap_path_local .. mame_2000_table[p].name .. ".png"
            elseif showCat == 36 then pic_path = neogeo_table[p].snap_path_local .. neogeo_table[p].name .. ".png"
            elseif showCat == 37 then pic_path = ngpc_table[p].snap_path_local .. ngpc_table[p].name .. ".png"
            elseif showCat == 38 then pic_path = fav_count[p].snap_path_local .. fav_count[p].name .. ".png"
            elseif showCat == 39 then pic_path = recently_played_table[p].snap_path_local .. recently_played_table[p].name .. ".png"
            elseif showCat == 40 then pic_path = search_results_table[p].snap_path_local .. search_results_table[p].name .. ".png"
            else pic_path = files_table[p].snap_path_local .. files_table[p].name .. ".png"
            end

            if System.doesFileExist(pic_path) and Game_Backgrounds >= 1 then
                Graphics.freeImage(backTmp)
                backTmp = Graphics.loadImage(pic_path)
                Graphics.setImageFilters(backTmp, FILTER_LINEAR, FILTER_LINEAR)
                Render.useTexture(modBackground, backTmp)
            else
                Render.useTexture(modBackground, imgCustomBack)
            end
            

            if status ~= RUNNING then
                System.setMessage(lang_lines.Background .. " " .. app_titleid .. " " .. lang_lines.found_exclamation, false, BUTTON_OK)
            end
        else
            if status ~= RUNNING then
                System.setMessage(lang_lines.Background_not_found, false, BUTTON_OK)
            end
        end
        
    else
        if status ~= RUNNING then
            System.setMessage(lang_lines.Internet_Connection_Required, false, BUTTON_OK)
        end
    end
    
    gettingBackgrounds = false
end

function drawCategory (def)
    for l, file in pairs((def)) do
        if (l >= master_index) then
            base_x = base_x + space
        end

        -- Show fav icon if game if a favourite
        favourite_flag = (def)[p].favourite
        if (def)[p].favourite == true then
            Graphics.drawImage(685, 36, imgFavorite_small_on)
        else
            Graphics.drawImage(685, 36, imgFavorite_small_blank)
        end

        if l > p-8 and base_x < 10 then
            if FileLoad[file] == nil then --add a new check here
                FileLoad[file] = true
                Threads.addTask(file, {
                    Type = "ImageLoad",
                    Path = file.icon_path,
                    Table = file,
                    Index = "ricon"
                })
            end
            if file.ricon ~= nil then
                DrawCover((targetX + l * space) - (#(def) * space + space), -0.6, file.name, file.ricon, base_x, file.app_type)--draw visible covers only
            else
                DrawCover((targetX + l * space) - (#(def) * space + space), -0.6, file.name, file.icon, base_x, file.app_type)--draw visible covers only
            end
        else
            if FileLoad[file] == true then
                FileLoad[file] = nil
                Threads.remove(file)
            end
            if file.ricon then
                Graphics.freeImage(file.ricon)
                file.ricon = nil
            end
        end
        end
        if showView ~= 2 then
        PrintCentered(fnt20, 480, 462, p .. lang_lines.of .. #(def), white, 20)-- Draw total items
        end
end


-- Main loop
while true do
    
    -- Threads update
    Threads.update()
    
    -- Reading input
    pad = Controls.read()
    
    mx, my = Controls.readLeftAnalog()
    
    -- touch input
    x1, y1 = Controls.readTouch()
    
    -- Initializing rendering
    Graphics.initBlend()
    Screen.clear(black)
    
    if delayButton > 0 then
        delayButton = delayButton - 0.1
    else
        delayButton = 0
    end
    

    -- search start - Checking for keyboard state
    state = Keyboard.getState()
    if state ~= RUNNING and hasTyped == true then
        
        
        hasTyped = false

        -- Typed text
        ret = "" .. Keyboard.getInput()

        -- Bug fix, for when enter pressed without text, do nothing
        if string.len(ret) == 0 then
            state = CANCELED
            -- Terminating keyboard
            Keyboard.clear()
        end

        if state == CANCELED then
        else

            search_results_table = {}
            -- If already on search category, move away
            if showCat == 40 then 
                showCat = 0
            end

            -- Typed text
            -- ret = "" .. Keyboard.getInput()
            -- Converted to upper and lower case for broader results
            ret_lc = string.lower(ret)
            ret_uc = string.upper(ret)

            for l, file in pairs(files_table) do
                if string.match(file.apptitle, ret) or string.match(file.apptitle, ret_lc) or string.match(file.apptitle, ret_uc) then
                    table.insert(search_results_table, file)
                    table.sort(search_results_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
                    app_title = search_results_table[1].app_title
                else
                    app_title = lang_lines.Search_No_Results -- Workaround - hides last name shown before searching
                end
            end

            showCat = 40
            p = 1
            master_index = p
            showMenu = 0


        end

        -- Terminating keyboard
        Keyboard.clear()

    end
    -- search end


    -- Graphics
    if setBackground >= 1 then
        Render.drawModel(modBackground, 0, 0, -5, 0, 0, 0)-- Draw Background as model
    else
        Render.drawModel(modDefaultBackground, 0, 0, -5, 0, 0, 0)-- Draw Background as model
    end
    
    Graphics.fillRect(0, 960, 496, 544, themeCol)-- footer bottom


-- MENU 0 - GAMES SCREEN
    if showMenu == 0 then
        -- MAIN VIEW
        -- Header
        h, m, s = System.getTime()
        Font.print(fnt20, 726, 34, string.format("%02d:%02d", h, m), white)-- Draw time
        life = System.getBatteryPercentage()
        Font.print(fnt20, 830, 34, life .. "%", white)-- Draw battery
        Graphics.drawImage(888, 41, imgBattery)
        Graphics.fillRect(891, 891 + (life / 5.2), 45, 53, white)

        -- Footer buttons and icons
        -- Get text widths for positioning
        label1 = Font.getTextWidth(fnt20, lang_lines.Launch)
        label2 = Font.getTextWidth(fnt20, lang_lines.Details)
        label3 = Font.getTextWidth(fnt20, lang_lines.Category)
        label4 = Font.getTextWidth(fnt20, lang_lines.View)

        Graphics.drawImage(900-label1, 510, btnX)
        Font.print(fnt20, 900+28-label1, 508, lang_lines.Launch, white)--Launch

        Graphics.drawImage(900-(btnMargin * 2)-label1-label2, 510, btnT)
        Font.print(fnt20, 900+28-(btnMargin * 2)-label1-label2, 508, lang_lines.Details, white)--Details

        Graphics.drawImage(900-(btnMargin * 4)-label1-label2-label3, 510, btnS)
        Font.print(fnt20, 900+28-(btnMargin * 4)-label1-label2-label3, 508, lang_lines.Category, white)--Category

        Graphics.drawImage(900-(btnMargin * 6)-label1-label2-label3-label4, 510, btnO)
        Font.print(fnt20, 900+28-(btnMargin * 6)-label1-label2-label3-label4, 508, lang_lines.View, white)--View
        
        if showCat == 1 then Font.print(fnt22, 32, 34, lang_lines.PS_Vita, white)
        elseif showCat == 2 then Font.print(fnt22, 32, 34, lang_lines.Homebrews, white)
        elseif showCat == 3 then Font.print(fnt22, 32, 34, lang_lines.PSP, white)
        elseif showCat == 4 then Font.print(fnt22, 32, 34, lang_lines.PlayStation, white)
        elseif showCat == 5 then Font.print(fnt22, 32, 34, lang_lines.Nintendo_64, white)
        elseif showCat == 6 then Font.print(fnt22, 32, 34, lang_lines.Super_Nintendo, white)
        elseif showCat == 7 then Font.print(fnt22, 32, 34, lang_lines.Nintendo_Entertainment_System, white)
        elseif showCat == 8 then Font.print(fnt22, 32, 34, lang_lines.Game_Boy_Advance, white)
        elseif showCat == 9 then Font.print(fnt22, 32, 34, lang_lines.Game_Boy_Color, white)
        elseif showCat == 10 then Font.print(fnt22, 32, 34, lang_lines.Game_Boy, white)
        elseif showCat == 11 then Font.print(fnt22, 32, 34, lang_lines.Sega_CD, white)
        elseif showCat == 12 then Font.print(fnt22, 32, 34, lang_lines.Sega_32X, white)
        elseif showCat == 13 then Font.print(fnt22, 32, 34, lang_lines.Sega_Mega_Drive, white)
        elseif showCat == 14 then Font.print(fnt22, 32, 34, lang_lines.Sega_Master_System, white)
        elseif showCat == 15 then Font.print(fnt22, 32, 34, lang_lines.Sega_Game_Gear, white)        
        elseif showCat == 16 then Font.print(fnt22, 32, 34, lang_lines.TurboGrafx_16, white)
        elseif showCat == 17 then Font.print(fnt22, 32, 34, lang_lines.TurboGrafx_CD, white)
        elseif showCat == 18 then Font.print(fnt22, 32, 34, lang_lines.PC_Engine, white)
        elseif showCat == 19 then Font.print(fnt22, 32, 34, lang_lines.PC_Engine_CD, white)
        elseif showCat == 20 then Font.print(fnt22, 32, 34, lang_lines.Amiga, white)
        elseif showCat == 21 then Font.print(fnt22, 32, 34, lang_lines.Commodore_64, white)
        elseif showCat == 22 then Font.print(fnt22, 32, 34, lang_lines.WonderSwan_Color, white)
        elseif showCat == 23 then Font.print(fnt22, 32, 34, lang_lines.WonderSwan, white)
        elseif showCat == 24 then Font.print(fnt22, 32, 34, lang_lines.MSX2, white)
        elseif showCat == 25 then Font.print(fnt22, 32, 34, lang_lines.MSX, white)
        elseif showCat == 26 then Font.print(fnt22, 32, 34, lang_lines.ZX_Spectrum, white)
        elseif showCat == 27 then Font.print(fnt22, 32, 34, lang_lines.Atari_7800, white)
        elseif showCat == 28 then Font.print(fnt22, 32, 34, lang_lines.Atari_5200, white)
        elseif showCat == 29 then Font.print(fnt22, 32, 34, lang_lines.Atari_2600, white)
        elseif showCat == 30 then Font.print(fnt22, 32, 34, lang_lines.Atari_Lynx, white)
        elseif showCat == 31 then Font.print(fnt22, 32, 34, lang_lines.ColecoVision, white)
        elseif showCat == 32 then Font.print(fnt22, 32, 34, lang_lines.Vectrex, white)
        elseif showCat == 33 then Font.print(fnt22, 32, 34, lang_lines.FBA_2012, white)
        elseif showCat == 34 then Font.print(fnt22, 32, 34, lang_lines.MAME_2003Plus, white)
        elseif showCat == 35 then Font.print(fnt22, 32, 34, lang_lines.MAME_2000, white)
        elseif showCat == 36 then Font.print(fnt22, 32, 34, lang_lines.Neo_Geo, white)
        elseif showCat == 37 then Font.print(fnt22, 32, 34, lang_lines.Neo_Geo_Pocket_Color, white)
        elseif showCat == 38 then Font.print(fnt22, 32, 34, lang_lines.Favorites, white)
        elseif showCat == 39 then Font.print(fnt22, 32, 34, lang_lines.Recently_Played, white)
        elseif showCat == 40 then Font.print(fnt22, 32, 34, lang_lines.Search_Results, white)
        else Font.print(fnt22, 32, 34, lang_lines.All, white)
        end
        if Network.isWifiEnabled() then
            Graphics.drawImage(800, 35, imgWifi)-- wifi icon
        end

    
        if showView ~= 2 then
            Graphics.fillRect(0, 960, 424, 496, black)-- black footer bottom
            PrintCentered(fnt25, 480, 430, app_title, white, 25)-- Draw title
        else
            Font.print(fnt22, 24, 508, app_title, white)
        end
        
        -- Draw Covers
        base_x = 0
        
        if showCat == 1 then drawCategory (games_table)
        elseif showCat == 2 then drawCategory (homebrews_table)
        elseif showCat == 3 then drawCategory (psp_table)
        elseif showCat == 4 then drawCategory (psx_table)
        elseif showCat == 5 then drawCategory (n64_table)
        elseif showCat == 6 then drawCategory (snes_table)
        elseif showCat == 7 then drawCategory (nes_table)
        elseif showCat == 8 then drawCategory (gba_table)
        elseif showCat == 9 then drawCategory (gbc_table)
        elseif showCat == 10 then drawCategory (gb_table)
        elseif showCat == 11 then drawCategory (sega_cd_table)
        elseif showCat == 12 then drawCategory (s32x_table)
        elseif showCat == 13 then drawCategory (md_table)
        elseif showCat == 14 then drawCategory (sms_table)
        elseif showCat == 15 then drawCategory (gg_table)
        elseif showCat == 16 then drawCategory (tg16_table)
        elseif showCat == 17 then drawCategory (tgcd_table)
        elseif showCat == 18 then drawCategory (pce_table)
        elseif showCat == 19 then drawCategory (pcecd_table)
        elseif showCat == 20 then drawCategory (amiga_table)
        elseif showCat == 21 then drawCategory (c64_table)
        elseif showCat == 22 then drawCategory (wswan_col_table)
        elseif showCat == 23 then drawCategory (wswan_table)
        elseif showCat == 24 then drawCategory (msx2_table) 
        elseif showCat == 25 then drawCategory (msx1_table) 
        elseif showCat == 26 then drawCategory (zxs_table)
        elseif showCat == 27 then drawCategory (atari_7800_table)
        elseif showCat == 28 then drawCategory (atari_5200_table)
        elseif showCat == 29 then drawCategory (atari_2600_table)
        elseif showCat == 30 then drawCategory (atari_lynx_table)
        elseif showCat == 31 then drawCategory (colecovision_table)
        elseif showCat == 32 then drawCategory (vectrex_table)
        elseif showCat == 33 then drawCategory (fba_table)
        elseif showCat == 34 then drawCategory (mame_2003_plus_table)
        elseif showCat == 35 then drawCategory (mame_2000_table)
        elseif showCat == 36 then drawCategory (neogeo_table)
        elseif showCat == 37 then drawCategory (ngpc_table)
        elseif showCat == 38 then
            -- count favorites
            fav_count = {}
            for l, file in pairs(files_table) do
                if showHomebrews == 0 then
                    -- ignore homebrew apps
                    if file.app_type > 0 then
                        if file.favourite==true then
                            table.insert(fav_count, file)
                        end
                    else
                    end
                else
                    if file.favourite==true then
                        table.insert(fav_count, file)
                    end
                end
            end
            drawCategory (fav_count)
        elseif showCat == 39 then drawCategory (recently_played_table)
        elseif showCat == 40 then drawCategory (search_results_table)
        else drawCategory (files_table)
        end

        -- Smooth move items horizontally
        if targetX ~= base_x then
            targetX = targetX - ((targetX - base_x) * 0.1)
        end
        
        -- Instantly move to selection
        if startCovers == false then
            targetX = base_x
            startCovers = true
            GetInfoSelected()
        end
        
        if setReflections==1 then
            floorY = 0
            if showView == 2 then
                floorY = -0.6
            elseif showView == 3 then
                floorY = -0.3
            end
            --Draw half transparent floor for reflection effect
            Render.drawModel(modFloor, 0, -0.6+floorY, 0, 0, 0, 0)
        end
        
        prevX = 0
        prevZ = 0
        prevRot = 0
        inPreview = false

-- MENU 1 - GET INFO
    elseif showMenu == 1 then
        
        -- PREVIEW
        -- Footer buttons and icons
        -- Get text widths for positioning
        label1 = Font.getTextWidth(fnt20, lang_lines.Close)--Close
        label2 = Font.getTextWidth(fnt20, lang_lines.Select)--Select
        label3 = Font.getTextWidth(fnt20, lang_lines.Favorite)--Favourite

        Graphics.drawImage(900-label1, 510, btnO)
        Font.print(fnt20, 900+28-label1, 508, lang_lines.Close, white)--Close

        Graphics.drawImage(900-(btnMargin * 2)-label1-label2, 510, btnX)
        Font.print(fnt20, 900+28-(btnMargin * 2)-label1-label2, 508, lang_lines.Select, white)--Select

        Graphics.drawImage(900-(btnMargin * 4)-label1-label2-label3, 510, btnT)
        Font.print(fnt20, 900+28-(btnMargin * 4)-label1-label2-label3, 508, lang_lines.Favorite, white)--Favourite
        
        Graphics.fillRect(24, 470, 24, 470, darkalpha)

        Render.setCamera(0, 0, 0, 0.0, 0.0, 0.0)
        if inPreview == false then
            if not pcall(loadImage, icon_path) then
                iconTmp = imgCoverTmp
            else
                iconTmp = Graphics.loadImage(icon_path)
            end
            -- set pic0 as background
            if System.doesFileExist(pic_path) and Game_Backgrounds >= 1 then
                Graphics.freeImage(backTmp)
                backTmp = Graphics.loadImage(pic_path)
                Graphics.setImageFilters(backTmp, FILTER_LINEAR, FILTER_LINEAR)
                Render.useTexture(modBackground, backTmp)
            else
                Render.useTexture(modBackground, imgCustomBack)
            end
            
            if folder == true then
                app_size = getAppSize(appdir)/1024/1024
                game_size = string.format("%02d", app_size) .. "Mb"
            else
                getRomSize()
            end
            
            menuY=0
            tmpappcat=0
            tmpimagecat=0
            inPreview = true
        end
        
        -- animate cover zoom in
        if prevX < 1.4 then
            prevX = prevX + 0.1
        end
        if prevZ < 1 then
            prevZ = prevZ + 0.06
        end
        if prevRot > -0.6 then
            prevRot = prevRot - 0.04
        end
        
        
        -- Rescale icon images to 128px x 128px

        -- Get sizes
        original_w = Graphics.getImageWidth(iconTmp)
        original_h = Graphics.getImageHeight(iconTmp)

        -- Calculate ratio size to use
        if original_w == 128 then ratio_w = 1.0 else ratio_w = 128 / original_w end
        if original_h == 128 then ratio_h = 1.0 else ratio_h = 128 / original_h end

        -- Draw resized image  
        Graphics.drawScaleImage(50, 50, iconTmp, ratio_w, ratio_h)

        txtname = string.sub(app_title, 1, 32) .. "\n" .. string.sub(app_title, 33)
        
        
        function set_cover_image (def_table_name)
            --Graphics.setImageFilters(games_table[p].icon, FILTER_LINEAR, FILTER_LINEAR)
            if (def_table_name)[p].ricon ~= nil then
                Render.useTexture(modCoverNoref, (def_table_name)[p].ricon) -- games_table
                Render.useTexture(modCoverHbrNoref, (def_table_name)[p].ricon) -- homebrews_table
                Render.useTexture(modCoverPSPNoref, (def_table_name)[p].ricon) -- psp_table
                Render.useTexture(modCoverPSXNoref, (def_table_name)[p].ricon) -- psx_table
                Render.useTexture(modCoverN64Noref, (def_table_name)[p].ricon) -- n64_table
                Render.useTexture(modCoverN64Noref, (def_table_name)[p].ricon) -- snes_table
                Render.useTexture(modCoverNESNoref, (def_table_name)[p].ricon) -- nes_table
                Render.useTexture(modCoverGBNoref, (def_table_name)[p].ricon) -- gba_table
                Render.useTexture(modCoverGBNoref, (def_table_name)[p].ricon) -- gbc_table
                Render.useTexture(modCoverGBNoref, (def_table_name)[p].ricon) -- gb_table
                Render.useTexture(modCoverNESNoref, (def_table_name)[p].ricon) -- sega_cd_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].ricon) -- 32x_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].ricon) -- md_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].ricon) -- sms_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].ricon) -- gg_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].ricon) -- tg16_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].ricon) -- tgcd_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].ricon) -- pce_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].ricon) -- pcecd_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].ricon) -- amiga_table
                Render.useTexture(modCoverTAPENoref, (def_table_name)[p].ricon) -- c64_table
                Render.useTexture(modCoverNESNoref, (def_table_name)[p].ricon) -- wswan_col_table
                Render.useTexture(modCoverNESNoref, (def_table_name)[p].ricon) -- wswan_table
                Render.useTexture(modCoverTAPENoref, (def_table_name)[p].ricon) -- msx2_table
                Render.useTexture(modCoverTAPENoref, (def_table_name)[p].ricon) -- msx1_table
                Render.useTexture(modCoverTAPENoref, (def_table_name)[p].ricon) -- zxs_table
                Render.useTexture(modCoverATARINoref, (def_table_name)[p].ricon) -- atari_7800_table
                Render.useTexture(modCoverATARINoref, (def_table_name)[p].ricon) -- atari_5200_table
                Render.useTexture(modCoverATARINoref, (def_table_name)[p].ricon) -- atari_2600_table
                Render.useTexture(modCoverLYNXNoref, (def_table_name)[p].ricon) -- atari_lynx_table
                Render.useTexture(modCoverATARINoref, (def_table_name)[p].ricon) -- colecovision_table
                Render.useTexture(modCoverATARINoref, (def_table_name)[p].ricon) -- vectrex_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].ricon) -- fba_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].ricon) -- mame_2003_plus_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].ricon) -- mame_2000_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].ricon) -- neogeo_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].ricon) -- ngpc_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].ricon) -- fav_count
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].ricon) -- recently played
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].ricon) -- search

            else 
                Render.useTexture(modCoverNoref, (def_table_name)[p].icon) -- games_table
                Render.useTexture(modCoverHbrNoref, (def_table_name)[p].icon) -- homebrews_table
                Render.useTexture(modCoverPSPNoref, (def_table_name)[p].icon) -- psp_table
                Render.useTexture(modCoverPSXNoref, (def_table_name)[p].icon) -- psx_table
                Render.useTexture(modCoverN64Noref, (def_table_name)[p].icon) -- n64_table
                Render.useTexture(modCoverN64Noref, (def_table_name)[p].icon) -- snes_table
                Render.useTexture(modCoverNESNoref, (def_table_name)[p].icon) -- nes_table
                Render.useTexture(modCoverGBNoref, (def_table_name)[p].icon) -- gba_table
                Render.useTexture(modCoverGBNoref, (def_table_name)[p].icon) -- gbc_table
                Render.useTexture(modCoverGBNoref, (def_table_name)[p].icon) -- gb_table
                Render.useTexture(modCoverNESNoref, (def_table_name)[p].icon) -- sega_cd_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].icon) -- 32x_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].icon) -- md_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].icon) -- sms_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].icon) -- gg_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].icon) -- tg16_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].icon) -- tgcd_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].icon) -- pce_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].icon) -- pcecd_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].icon) -- amiga_table
                Render.useTexture(modCoverTAPENoref, (def_table_name)[p].icon) -- c64_table
                Render.useTexture(modCoverNESNoref, (def_table_name)[p].icon) -- wswan_col_table
                Render.useTexture(modCoverNESNoref, (def_table_name)[p].icon) -- wswan_table
                Render.useTexture(modCoverTAPENoref, (def_table_name)[p].icon) -- msx2_table
                Render.useTexture(modCoverTAPENoref, (def_table_name)[p].icon) -- msx1_table
                Render.useTexture(modCoverTAPENoref, (def_table_name)[p].icon) -- zxs_table
                Render.useTexture(modCoverATARINoref, (def_table_name)[p].icon) -- atari_7800_table
                Render.useTexture(modCoverATARINoref, (def_table_name)[p].icon) -- atari_5200_table
                Render.useTexture(modCoverATARINoref, (def_table_name)[p].icon) -- atari_2600_table
                Render.useTexture(modCoverLYNXNoref, (def_table_name)[p].icon) -- atari_lynx_table
                Render.useTexture(modCoverATARINoref, (def_table_name)[p].icon) -- colecovision_table
                Render.useTexture(modCoverATARINoref, (def_table_name)[p].icon) -- vectrex_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].icon) -- fba_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].icon) -- mame_2003_plus_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].icon) -- mame_2000_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].icon) -- neogeo_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].icon) -- ngpc_table
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].icon) -- fav_count
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].icon) -- recently played
                Render.useTexture(modCoverMDNoref, (def_table_name)[p].icon) -- search

            end
        end
        
        -- Set cover image
        if showCat == 1 then set_cover_image (games_table)
        elseif showCat == 2 then set_cover_image (homebrews_table)
        elseif showCat == 3 then set_cover_image (psp_table)
        elseif showCat == 4 then set_cover_image (psx_table)
        elseif showCat == 5 then set_cover_image (n64_table)
        elseif showCat == 6 then set_cover_image (snes_table)
        elseif showCat == 7 then set_cover_image (nes_table)
        elseif showCat == 8 then set_cover_image (gba_table)
        elseif showCat == 9 then set_cover_image (gbc_table)                
        elseif showCat == 10 then set_cover_image (gb_table)
        elseif showCat == 11 then set_cover_image (sega_cd_table)
        elseif showCat == 12 then set_cover_image (s32x_table)
        elseif showCat == 13 then set_cover_image (md_table)
        elseif showCat == 14 then set_cover_image (sms_table)
        elseif showCat == 15 then set_cover_image (gg_table)
        elseif showCat == 16 then set_cover_image (tg16_table)
        elseif showCat == 17 then set_cover_image (tgcd_table)
        elseif showCat == 18 then set_cover_image (pce_table)
        elseif showCat == 19 then set_cover_image (pcecd_table)
        elseif showCat == 20 then set_cover_image (amiga_table)
        elseif showCat == 21 then set_cover_image (c64_table)
        elseif showCat == 22 then set_cover_image (wswan_col_table)
        elseif showCat == 23 then set_cover_image (wswan_table)
        elseif showCat == 24 then set_cover_image (msx2_table)
        elseif showCat == 25 then set_cover_image (msx1_table)
        elseif showCat == 26 then set_cover_image (zxs_table)
        elseif showCat == 27 then set_cover_image (atari_7800_table)
        elseif showCat == 28 then set_cover_image (atari_5200_table)
        elseif showCat == 29 then set_cover_image (atari_2600_table)
        elseif showCat == 30 then set_cover_image (atari_lynx_table)
        elseif showCat == 31 then set_cover_image (colecovision_table)
        elseif showCat == 32 then set_cover_image (vectrex_table)
        elseif showCat == 33 then set_cover_image (fba_table)
        elseif showCat == 34 then set_cover_image (mame_2003_plus_table)
        elseif showCat == 35 then set_cover_image (mame_2000_table)
        elseif showCat == 36 then set_cover_image (neogeo_table)
        elseif showCat == 37 then set_cover_image (ngpc_table)
        elseif showCat == 38 then set_cover_image (fav_count)
        elseif showCat == 39 then set_cover_image (recently_played_table)
        elseif showCat == 40 then set_cover_image (search_results_table)
        else set_cover_image (files_table)
        end
        
        local tmpapptype=""
        local tmpcatText=""
        local tmpimageText=""
        -- Draw box
        if apptype==1 then
            Render.drawModel(modCoverNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.PS_Vita_Game 
        elseif apptype==2 then
            Render.drawModel(modCoverPSPNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxPSPNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.PSP_Game 
        elseif apptype==3 then
            Render.drawModel(modCoverPSXNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxPSXNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.PS1_Game 
        elseif apptype==5 then
            Render.drawModel(modCoverN64Noref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxN64Noref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.N64_Game 
        elseif apptype==6 then
            Render.drawModel(modCoverN64Noref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxN64Noref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.SNES_Game 
        elseif apptype==7 then
            Render.drawModel(modCoverNESNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxNESNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.NES_Game 
        elseif apptype==8 then
            Render.drawModel(modCoverGBNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxGBNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.GBA_Game 
        elseif apptype==9 then
            Render.drawModel(modCoverGBNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxGBNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.GBC_Game 
        elseif apptype==10 then
            Render.drawModel(modCoverGBNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxGBNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.GB_Game
        elseif apptype==11 then
            Render.drawModel(modCoverNESNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxNESNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.SCD_Game 
        elseif apptype==12 then
            Render.drawModel(modCoverMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.S32X_Game 
        elseif apptype==13 then
            Render.drawModel(modCoverMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.MD_Game 
        elseif apptype==14 then
            Render.drawModel(modCoverMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.SMS_Game 
        elseif apptype==15 then
            Render.drawModel(modCoverMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.GG_Game 
        elseif apptype==16 then
            Render.drawModel(modCoverMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.TurboGrafx_16_Game 
        elseif apptype==17 then
            Render.drawModel(modCoverMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.TurboGrafx_CD_Game 
        elseif apptype==18 then
            Render.drawModel(modCoverMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.PC_Engine_Game 
        elseif apptype==19 then
            Render.drawModel(modCoverMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.PC_Engine_CD_Game
        elseif apptype==20 then
            Render.drawModel(modCoverMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.Amiga_Game
        elseif apptype==21 then
            Render.drawModel(modCoverTAPENoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxTAPENoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.C64_Game
        elseif apptype==22 then
            Render.drawModel(modCoverNESNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxNESNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.WSWANCOL_Game
        elseif apptype==23 then
            Render.drawModel(modCoverNESNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxNESNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.WSWAN_Game
        elseif apptype==24 then
            Render.drawModel(modCoverTAPENoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxTAPENoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.MSX2_Game
        elseif apptype==25 then
            Render.drawModel(modCoverTAPENoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxTAPENoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.MSX_Game
        elseif apptype==26 then
            Render.drawModel(modCoverTAPENoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxTAPENoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.ZXS_Game
        elseif apptype==27 then
            Render.drawModel(modCoverATARINoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxATARINoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.A7800_Game
        elseif apptype==28 then
            Render.drawModel(modCoverATARINoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxATARINoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.A5200_Game
        elseif apptype==29 then
            Render.drawModel(modCoverATARINoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxATARINoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.A600_Game
        elseif apptype==30 then
            Render.drawModel(modCoverLYNXNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxLYNXNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.LYNX_Game
        elseif apptype==31 then
            Render.drawModel(modCoverATARINoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxATARINoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.COLECO_Game
        elseif apptype==32 then
            Render.drawModel(modCoverATARINoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxATARINoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.VECTREX_Game
        elseif apptype==33 then
            Render.drawModel(modCoverMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.FBA2012_Game
        elseif apptype==34 then
            Render.drawModel(modCoverMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.MAME2003_Game 
        elseif apptype==35 then
            Render.drawModel(modCoverMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.MAME_2000_Game 
        elseif apptype==36 then
            Render.drawModel(modCoverMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.Neo_Geo_Game 
        elseif apptype==37 then
            Render.drawModel(modCoverMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.Neo_Geo_Pocket_Color_Game 
        else
            Render.drawModel(modCoverHbrNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = lang_lines.Homebrew 
        end
    
        Font.print(fnt22, 50, 190, txtname, white)-- app name


        -- Show fav icon if game if a favourite
        if favourite_flag == true then
            Graphics.drawImage(420, 50, imgFavorite_large_on)
        else
            Graphics.drawImage(420, 50, imgFavorite_large_off)
        end


        -- 0 Homebrew, 1 vita, 2 psp, 3 psx, 5+ Retro

        if apptype == 0 or apptype == 1 or apptype == 2 or apptype == 3 then
            Font.print(fnt22, 50, 240, tmpapptype .. "\n" .. lang_lines.App_ID_colon .. app_titleid .. "\n" .. lang_lines.Version_colon .. app_version .. "\n" .. lang_lines.Size_colon .. game_size, white)-- Draw info
            --                                               App ID:                                           Version:                                           Size:
        else
            Font.print(fnt22, 50, 240, tmpapptype .. "\n" .. lang_lines.Version_colon .. app_version .. "\n" .. lang_lines.Size_colon .. game_size, white)-- Draw info
            --                                               Version:                                           Size:
        end


        if tmpappcat==1 then
            tmpcatText = "PS Vita"
        elseif tmpappcat==2 then
            tmpcatText = "PSP"
        elseif tmpappcat==3 then
            tmpcatText = "PS1"
        elseif tmpappcat==4 then
            tmpcatText = lang_lines.Homebrew -- "Homebrew"
        else
            tmpcatText = lang_lines.Default -- Default
        end

        -- Download background - don't show on vita or homebrew
        if apptype == 0 or apptype == 1 then
            tmpimageText = lang_lines.Download_Cover
        else
            if tmpimagecat==1 then
                tmpimageText = lang_lines.Download_Background -- Backgrounds
            else
                tmpimageText = lang_lines.Download_Cover -- Covers
            end
        end

        menuItems = 1

        -- 0 Homebrew, 1 Vita, 2 PSP, 3 PSX, 5+ Retro

        -- Vita and Homebrew
        -- if folder == true then -- start Disable category override for retro
        if apptype == 0 or apptype == 1 or apptype == 2 or apptype == 3 then -- start Disable category override for retro
            if menuY==1 then
                Graphics.fillRect(24, 470, 350 + (menuY * 40), 430 + (menuY * 40), themeCol)-- selection two lines
            else
                Graphics.fillRect(24, 470, 350 + (menuY * 40), 390 + (menuY * 40), themeCol)-- selection
            end

            -- Make box wider for German, French, Russian, Portuguese
            if setLanguage == 2 or setLanguage == 3 or setLanguage == 6 or setLanguage == 8 then
                Font.print(fnt22, 50, 352+40, lang_lines.Override_Category_colon.. "\n< " .. tmpcatText .. " >\n( " .. lang_lines.Press_X_to_apply_Category .. ")", white)
            else
                Font.print(fnt22, 50, 352+40, lang_lines.Override_Category_colon.. "< " .. tmpcatText .. " >\n( " .. lang_lines.Press_X_to_apply_Category .. ")", white)
            end


        -- All other systems
        else
            if menuY==1 then
            else
                Graphics.fillRect(24, 470, 350 + (menuY * 40), 390 + (menuY * 40), themeCol)-- selection
            end
            Font.print(fnt22, 50, 352, "< " .. tmpimageText .. " >", white)
        end

        -- Download background - don't show on vita or homebrew
        if apptype == 0 or apptype == 1 then
            Font.print(fnt22, 50, 352, tmpimageText, white)
        else
            Font.print(fnt22, 50, 352, "< " .. tmpimageText .. " >", white)
        end
        

        status = System.getMessageState()
        if status ~= RUNNING then
            
            if (Controls.check(pad, SCE_CTRL_CROSS) and not Controls.check(oldpad, SCE_CTRL_CROSS)) then
                if menuY == 0 then
                    if tmpimagecat==0 then
                        if gettingCovers == false then
                            gettingCovers = true
                            DownloadSingleCover()
                        end
                    else
                        if gettingBackgrounds == false then
                            gettingBackgrounds = true
                            DownloadSingleSnap()
                        end
                    end
                elseif menuY == 1 then
                    OverrideCategory()
                end

            elseif (Controls.check(pad, SCE_CTRL_UP)) and not (Controls.check(oldpad, SCE_CTRL_UP)) then
                if menuY > 0 then
                    menuY = menuY - 1
                    else
                    menuY=menuItems
                end
            elseif (Controls.check(pad, SCE_CTRL_DOWN)) and not (Controls.check(oldpad, SCE_CTRL_DOWN)) then
                if menuY < menuItems then
                    menuY = menuY + 1
                    else
                    menuY=0
                end
            elseif (Controls.check(pad, SCE_CTRL_LEFT)) and not (Controls.check(oldpad, SCE_CTRL_LEFT)) then
                if menuY==0 then
                    -- Image downloads - cover or background
                    if tmpimagecat > 0 then
                        tmpimagecat = tmpimagecat - 1
                    else
                        tmpimagecat=1
                    end
                end

                if menuY==1 then
                    -- Vita and Homebrew override
                    if tmpappcat > 0 then
                        tmpappcat = tmpappcat - 1
                    else
                        tmpappcat=4 -- Limited to 4
                    end
                end
            elseif (Controls.check(pad, SCE_CTRL_RIGHT)) and not (Controls.check(oldpad, SCE_CTRL_RIGHT)) then
                if menuY==0 then
                    -- Image downloads - cover or background
                    if tmpimagecat > 0 then
                        tmpimagecat = tmpimagecat - 1
                    else
                        tmpimagecat=1
                    end
                end

                if menuY==1 then
                    -- Vita and Homebrew override
                    if tmpappcat < 4 then  -- Limited to 4
                        tmpappcat = tmpappcat + 1
                    else
                        tmpappcat=0
                    end
                end
            end
        end

-- MENU 2 - SETTINGS
    elseif showMenu == 2 then
        
        -- SETTINGS
        -- Footer buttons and icons
        -- Get text widths for positioning
        label1 = Font.getTextWidth(fnt20, lang_lines.Close)--Close
        label2 = Font.getTextWidth(fnt20, lang_lines.Select)--Select
        label_lang = Font.getTextWidth(fnt20, lang_lines.Language_colon) + 12 --Language


        Graphics.drawImage(900-label1, 510, btnO)
        Font.print(fnt20, 900+28-label1, 508, lang_lines.Close, white)--Close

        Graphics.drawImage(900-(btnMargin * 2)-label1-label2, 510, btnX)
        Font.print(fnt20, 900+28-(btnMargin * 2)-label1-label2, 508, lang_lines.Select, white)--Select

        Graphics.fillRect(60, 900, 44, 450, darkalpha)

        Font.print(fnt22, setting_x, setting_yh, lang_lines.Settings, white)--SETTINGS
        Graphics.fillRect(60, 900, 97, 100, white)

        Graphics.fillRect(60, 900, 100 + (menuY * 50), 150 + (menuY * 50), themeCol)-- selection

        menuItems = 6
        
        -- MENU 2 / #0 Search
        Graphics.drawImage(setting_x_icon, setting_y0, setting_icon_search)
        Font.print(fnt22, setting_x_icon_offset, setting_y0, lang_lines.Search, white)--Search
        if setLanguage == 10 then -- Chinese language fix
            Font.print(fnt22, setting_x_icon_offset - 8, setting_y0, lang_lines.Search, white)--Search
        else
            Font.print(fnt22, setting_x_icon_offset, setting_y0, lang_lines.Search, white)--Search
        end

        -- MENU 2 / #1 Categories
        Graphics.drawImage(setting_x_icon, setting_y1, setting_icon_categories)
        Font.print(fnt22, setting_x_icon_offset, setting_y1, lang_lines.Categories, white)--Categories

        -- MENU 2 / #2 Appearance
        Graphics.drawImage(setting_x_icon, setting_y2, setting_icon_theme)
        Font.print(fnt22, setting_x_icon_offset, setting_y2, lang_lines.Theme, white)--Theme

        -- MENU 2 / #3 Artwork
        Graphics.drawImage(setting_x_icon, setting_y3, setting_icon_artwork)
        Font.print(fnt22, setting_x_icon_offset, setting_y3, lang_lines.Artwork, white)--Artwork
        if setLanguage == 10 then -- Chinese language fix
            Font.print(fnt22, setting_x_icon_offset - 8, setting_y3, lang_lines.Artwork, white)--Artwork
        else
            Font.print(fnt22, setting_x_icon_offset, setting_y3, lang_lines.Artwork, white)--Artwork
        end

        -- MENU 2 / #4 Scanning
        Graphics.drawImage(setting_x_icon, setting_y4, setting_icon_scanning)
        Font.print(fnt22, setting_x_icon_offset, setting_y4, lang_lines.Scan_Settings, white)--Scanning

        -- MENU 2 / #5 Language
        Graphics.drawImage(setting_x_icon, setting_y5, setting_icon_language)
        Font.print(fnt22, setting_x_icon_offset, setting_y5, lang_lines.Language_colon, white)--Language

        -- MENU 2 / #5 Language
        if setLanguage == 1 then
            Font.print(fnt22, setting_x_icon_offset + label_lang, setting_y5, "English - American", white) -- English - American
            -- Megadrive, update regional missing cover
            for k, v in pairs(md_table) do
                  if v.icon_path=="ux0:/app/RETROFLOW/DATA/missing_cover_md.png" then
                      v.icon_path="ux0:/app/RETROFLOW/DATA/missing_cover_md_usa.png"
                  end
            end
        elseif setLanguage == 2 then
            Font.print(fnt22, setting_x_icon_offset + label_lang, setting_y5, "Deutsch", white) -- German
        elseif setLanguage == 3 then
            Font.print(fnt22, setting_x_icon_offset + label_lang, setting_y5, " Français", white) -- French
        elseif setLanguage == 4 then
            Font.print(fnt22, setting_x_icon_offset + label_lang, setting_y5, "Italiano", white) -- Italian
        elseif setLanguage == 5 then
            Font.print(fnt22, setting_x_icon_offset + label_lang, setting_y5, "Español", white) -- Spanish
        elseif setLanguage == 6 then
            Font.print(fnt22, setting_x_icon_offset + label_lang, setting_y5, "Português", white) -- Portuguese
        elseif setLanguage == 7 then
            Font.print(fnt22, setting_x_icon_offset + label_lang, setting_y5, "Svenska", white) -- Swedish
        elseif setLanguage == 8 then
            Font.print(fnt22, setting_x_icon_offset + label_lang, setting_y5, "Pусский", white) -- Russian
        elseif setLanguage == 9 then
            Font.print(fnt22, setting_x_icon_offset + label_lang, setting_y5, "日本語", white) -- Japanese
        elseif setLanguage == 10 then
            Font.print(fnt22, setting_x_icon_offset + label_lang, setting_y5, "繁體中文", white) -- Japanese
        elseif setLanguage == 11 then
            Font.print(fnt22, setting_x_icon_offset + label_lang, setting_y5, "Polski", white) -- Polish
        else
            Font.print(fnt22, setting_x_icon_offset + label_lang, setting_y5, "English", white) -- English
        end

        -- MENU 2 / #6 About
        Graphics.drawImage(setting_x_icon, setting_y6, setting_icon_about)        
        if setLanguage == 10 then -- Chinese language fix
            Font.print(fnt22, setting_x_icon_offset - 8, setting_y6, lang_lines.About, white)--About
        else
            Font.print(fnt22, setting_x_icon_offset, setting_y6, lang_lines.About, white)--About
        end
        
        -- MENU 2 - FUNCTIONS
        status = System.getMessageState()
        if status ~= RUNNING then
            
            if (Controls.check(pad, SCE_CTRL_CROSS) and not Controls.check(oldpad, SCE_CTRL_CROSS)) then

                -- MENU 2 / #0 Search
                if menuY == 0 then
                    -- Search
                    if hasTyped==false then
                        Keyboard.start(lang_lines.Search, "", 512, TYPE_DEFAULT, MODE_TEXT)
                        hasTyped=true
                    end
                elseif menuY == 1 then -- Categories
                    showMenu = 3 
                    menuY = 0
                elseif menuY == 2 then -- Theme
                    showMenu = 4 
                    menuY = 0
                elseif menuY == 3 then -- Artwork
                    showMenu = 5 
                    menuY = 0
                elseif menuY == 4 then -- Scan Settings
                    showMenu = 6 
                    menuY = 0
                elseif menuY == 5 then -- Language
                    if setLanguage < 11 then
                        setLanguage = setLanguage + 1
                    else
                        setLanguage = 0
                    end
                    ChangeLanguage()
                elseif menuY == 6 then -- About
                    showMenu = 7 
                    menuY = 0
                else
                end

                --Save settings
                SaveSettings()

            elseif (Controls.check(pad, SCE_CTRL_UP)) and not (Controls.check(oldpad, SCE_CTRL_UP)) then
                if menuY > 0 then
                    menuY = menuY - 1
                    else
                    menuY=menuItems
                end
            elseif (Controls.check(pad, SCE_CTRL_DOWN)) and not (Controls.check(oldpad, SCE_CTRL_DOWN)) then
                if menuY < menuItems then
                    menuY = menuY + 1
                    else
                    menuY=0
                end
            end
        end

-- MENU 3 - CATEGORIES
    elseif showMenu == 3 then
        
        -- SETTINGS
        -- Footer buttons and icons
        -- Get text widths for positioning
        label1 = Font.getTextWidth(fnt20, lang_lines.Close)--Close
        label2 = Font.getTextWidth(fnt20, lang_lines.Select)--Select

        Graphics.drawImage(900-label1, 510, btnO)
        Font.print(fnt20, 900+28-label1, 508, lang_lines.Close, white)--Close

        Graphics.drawImage(900-(btnMargin * 2)-label1-label2, 510, btnX)
        Font.print(fnt20, 900+28-(btnMargin * 2)-label1-label2, 508, lang_lines.Select, white)--Select

        Graphics.fillRect(60, 900, 44, 450, darkalpha)

        Font.print(fnt22, setting_x, setting_yh, lang_lines.Categories, white)--Categories
        Graphics.fillRect(60, 900, 97, 100, white)

        Graphics.fillRect(60, 900, 100 + (menuY * 50), 150 + (menuY * 50), themeCol)-- selection

        menuItems = 4

        -- MENU 3 / #0 Back
        Font.print(fnt22, setting_x, setting_y0, lang_lines.Back_Chevron, white)--Back

        -- MENU 4 / #1 Startup Category
        if setLanguage == 10 then -- Chinese language fix
            Font.print(fnt22, setting_x - 5, setting_y1, lang_lines.Startup_Category_colon, white)--Startup Category
        else
            Font.print(fnt22, setting_x, setting_y1, lang_lines.Startup_Category_colon, white)--Startup Category
        end
        if startCategory == 0 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.All, white)--ALL
        elseif startCategory == 1 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.PS_Vita, white)--GAMES
        elseif startCategory == 2 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Homebrews, white)--HOMEBREWS
        elseif startCategory == 3 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.PSP, white)--PSP
        elseif startCategory == 4 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.PlayStation, white)--PSX
        elseif startCategory == 5 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Nintendo_64, white)--N64
        elseif startCategory == 6 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Super_Nintendo, white)--SNES
        elseif startCategory == 7 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Nintendo_Entertainment_System, white)--NES
        elseif startCategory == 8 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Game_Boy_Advance, white)--GBA
        elseif startCategory == 9 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Game_Boy_Color, white)--GBC
        elseif startCategory == 10 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Game_Boy, white)--GB
        elseif startCategory == 11 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Sega_CD, white)--Sega_CD
        elseif startCategory == 12 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Sega_32X, white)--Sega_32X
        elseif startCategory == 13 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Sega_Mega_Drive, white)--MD
        elseif startCategory == 14 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Sega_Master_System, white)--SMS
        elseif startCategory == 15 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Sega_Game_Gear, white)--GG
        elseif startCategory == 16 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.TurboGrafx_16, white)--TG16
        elseif startCategory == 17 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.TurboGrafx_CD, white)--TGCD
        elseif startCategory == 18 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.PC_Engine, white)--PCE
        elseif startCategory == 19 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.PC_Engine_CD, white)--PCECD
        elseif startCategory == 20 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Amiga, white)--AMIGA
        elseif startCategory == 21 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Commodore_64, white)--Commodore_64
        elseif startCategory == 22 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.WonderSwan_Color, white)--WonderSwan_Color
        elseif startCategory == 23 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.WonderSwan, white)--WonderSwan
        elseif startCategory == 24 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.MSX2, white)--MSX2
        elseif startCategory == 25 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.MSX, white)--MSX
        elseif startCategory == 26 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.ZX_Spectrum, white)--ZX_Spectrum
        elseif startCategory == 27 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Atari_7800, white)--Atari_7800
        elseif startCategory == 28 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Atari_5200, white)--Atari_5200
        elseif startCategory == 29 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Atari_2600, white)--Atari_2600
        elseif startCategory == 30 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Atari_Lynx, white)--Atari_Lynx
        elseif startCategory == 31 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.ColecoVision, white)--ColecoVision
        elseif startCategory == 32 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Vectrex, white)--Vectrex
        elseif startCategory == 33 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.FBA_2012, white)--FBA_2012
        elseif startCategory == 34 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.MAME_2003Plus, white)--MAME_2003Plus
        elseif startCategory == 35 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.MAME_2000, white)--MAME_2000
        elseif startCategory == 36 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Neo_Geo, white)--Neo_Geo
        elseif startCategory == 37 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Neo_Geo_Pocket_Color, white)--Neo_Geo_Pocket_Color
        elseif startCategory == 38 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Favorites, white)--Favorite
        elseif startCategory == 39 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Recently_Played, white)--Recently Played
        end

        -- MENU 4 / #2 Show Homebews
        Font.print(fnt22, setting_x, setting_y2, lang_lines.Homebrews_Category_colon, white)--Show Homebrews
        if showHomebrews == 1 then
            Font.print(fnt22, setting_x_offset, setting_y2, lang_lines.On, white)--ON
        else
            -- Chinese language fix
            if setLanguage == 10 then
                Font.print(fnt22, setting_x_offset - 8, setting_y2, lang_lines.Off, white)--OFF
            else
                Font.print(fnt22, setting_x_offset, setting_y2, lang_lines.Off, white)--OFF
            end
        end

        -- MENU 4 / #3 Recently Played
        Font.print(fnt22, setting_x, setting_y3, lang_lines.Recently_Played_colon, white)--Recently Played
        if showRecentlyPlayed == 1 then
            Font.print(fnt22, setting_x_offset, setting_y3, lang_lines.On, white)--ON
        else
            -- Chinese language fix
            if setLanguage == 10 then
                Font.print(fnt22, setting_x_offset - 8, setting_y3, lang_lines.Off, white)--OFF
            else
                Font.print(fnt22, setting_x_offset, setting_y3, lang_lines.Off, white)--OFF
            end
        end

        -- MENU 4 / #4 All Category
        Font.print(fnt22, setting_x, setting_y4, lang_lines.All_Category, white)--All Category
        if showAll == 1 then
            Font.print(fnt22, setting_x_offset, setting_y4, lang_lines.On, white)--ON
        else
            -- Chinese language fix
            if setLanguage == 10 then
                Font.print(fnt22, setting_x_offset - 8, setting_y4, lang_lines.Off, white)--OFF
            else
                Font.print(fnt22, setting_x_offset, setting_y4, lang_lines.Off, white)--OFF
            end
        end

        -- MENU 2 - FUNCTIONS
        status = System.getMessageState()
        if status ~= RUNNING then
            
            if (Controls.check(pad, SCE_CTRL_CROSS) and not Controls.check(oldpad, SCE_CTRL_CROSS)) then

                -- count favorites
                local fav_count_3 = {}
                for l, file in pairs(files_table) do
                    if file.favourite==true then
                        table.insert(fav_count_3, file)
                    end
                end

                if menuY == 0 then -- #0 Back
                    showMenu = 2
                    menuY = 0

                elseif menuY == 1 then -- #1 Startup Category
                    if startCategory < count_of_start_categories then
                        startCategory = startCategory + 1
                    else
                        startCategory = 0
                    end
                    -- Skip empty categories
                    if startCategory == 1 then if #games_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 2 then if #homebrews_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 3 then if #psp_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 4 then if #psx_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 5 then if #n64_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 6 then if #snes_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 7 then if #nes_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 8 then if #gba_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 9 then if #gbc_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 10 then if #gb_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 11 then if #sega_cd_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 12 then if #s32x_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 13 then if #md_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 14 then if #sms_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 15 then if #gg_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 16 then if #tg16_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 17 then if #tgcd_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 18 then if #pce_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 19 then if #pcecd_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 20 then if #amiga_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 21 then if #c64_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 22 then if #wswan_col_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 23 then if #wswan_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 24 then if #msx2_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 25 then if #msx1_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 26 then if #zxs_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 27 then if #atari_7800_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 28 then if #atari_5200_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 29 then if #atari_2600_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 30 then if #atari_lynx_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 31 then if #colecovision_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 32 then if #vectrex_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 33 then if #fba_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 34 then if #mame_2003_plus_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 35 then if #mame_2000_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 36 then if #neogeo_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 37 then if #ngpc_table == 0 then startCategory = startCategory + 1 end end
                    if startCategory == 38 then if #fav_count_3 == 0 then startCategory = startCategory + 1 end end
                    -- if startCategory == 39 then if #recently_played_table == 0 then startCategory = startCategory + 1 end end

                elseif menuY == 2 then -- #2 Show Homebews
                    if showHomebrews == 1 then
                        showHomebrews = 0
                        -- Import cache to update All games category
                        count_cache_and_reload()
                        -- If currently on homebrew category view, move to Vita category to hide empty homebrew category
                        if showCat == 2 then
                            showCat = 1
                        end
                    else
                        showHomebrews = 1
                        -- Import cache to update All games category
                        count_cache_and_reload()
                    end

                elseif menuY == 3 then -- #3 Recently Played
                    if showRecentlyPlayed == 1 then -- 0 Off, 1 On
                        showRecentlyPlayed = 0
                        -- Import cache to update All games category
                        count_cache_and_reload()
                        -- If currently on recent category view, move to Vita category to hide empty recent category
                        if showCat == 39 then
                            curTotal = #recently_played_table
                            if #recently_played_table == 0 then
                                showCat = 1
                            end
                        end
                    else
                        showRecentlyPlayed = 1
                        -- Import cache to update All games category
                        count_cache_and_reload()
                    end
                elseif menuY == 4 then -- #4 All Category
                    if showAll == 1 then -- 0 Off, 1 On
                        showAll = 0
                        -- Import cache to update All games category
                        count_cache_and_reload()
                        -- If currently on recent category view, move to Vita category to hide empty recent category
                        if showCat == 0 then
                            showCat = 1
                        end
                    else
                        showAll = 1
                    end
                end

                --Save settings
                SaveSettings()
                
            elseif (Controls.check(pad, SCE_CTRL_UP)) and not (Controls.check(oldpad, SCE_CTRL_UP)) then
                if menuY > 0 then
                    menuY = menuY - 1
                    else
                    menuY=menuItems
                end
            elseif (Controls.check(pad, SCE_CTRL_DOWN)) and not (Controls.check(oldpad, SCE_CTRL_DOWN)) then
                if menuY < menuItems then
                    menuY = menuY + 1
                    else
                    menuY=0
                end
            end
        end

-- MENU 4 - THEME
    elseif showMenu == 4 then
        
        -- SETTINGS
        -- Footer buttons and icons
        -- Get text widths for positioning
        label1 = Font.getTextWidth(fnt20, lang_lines.Close)--Close
        label2 = Font.getTextWidth(fnt20, lang_lines.Select)--Select

        Graphics.drawImage(900-label1, 510, btnO)
        Font.print(fnt20, 900+28-label1, 508, lang_lines.Close, white)--Close

        Graphics.drawImage(900-(btnMargin * 2)-label1-label2, 510, btnX)
        Font.print(fnt20, 900+28-(btnMargin * 2)-label1-label2, 508, lang_lines.Select, white)--Select

        Graphics.fillRect(60, 900, 44, 450, darkalpha)

        Font.print(fnt22, setting_x, setting_yh, lang_lines.Theme, white)--Theme
        Graphics.fillRect(60, 900, 97, 100, white)

        Graphics.fillRect(60, 900, 100 + (menuY * 50), 150 + (menuY * 50), themeCol)-- selection


        menuItems = 4

        -- MENU 4 / #0 Back
        Font.print(fnt22, setting_x, setting_y0, lang_lines.Back_Chevron, white)--Back

        -- MENU 4 / #1 Theme Color
        Font.print(fnt22, setting_x, setting_y1,  lang_lines.Theme_Color_colon, white)
        if themeColor == 1 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Red, white)--Red
        elseif themeColor == 2 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Yellow, white)--Yellow
        elseif themeColor == 3 then
            if setLanguage == 10 then -- Chinese language fix
                Font.print(fnt22, setting_x_offset - 8, setting_y1, lang_lines.Green, white)--Green
            else
                Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Green, white)--Green
            end
        elseif themeColor == 4 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Grey, white)--Grey
        elseif themeColor == 5 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Black, white)--Black
        elseif themeColor == 6 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Purple, white)--Purple
        elseif themeColor == 7 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Dark_Purple, white)--Dark Purple
        elseif themeColor == 8 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Orange, white)--Orange
        else
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Blue, white)--Blue
        end

        -- MENU 4 / #2 Reflections
        Font.print(fnt22, setting_x, setting_y2, lang_lines.Reflection_Effect_colon, white) -- REFLECTION
        if setReflections == 1 then
            Font.print(fnt22, setting_x_offset, setting_y2, lang_lines.On, white)--ON
        else
            -- Chinese language fix
            if setLanguage == 10 then
                Font.print(fnt22, setting_x_offset - 8, setting_y2, lang_lines.Off, white)--OFF
            else
                Font.print(fnt22, setting_x_offset, setting_y2, lang_lines.Off, white)--OFF
            end
        end

        -- MENU 4 / #3 Custom Background
        Font.print(fnt22, setting_x, setting_y3,  lang_lines.Custom_Background_colon, white)

        function wallpaper_print_string (def)
            if setBackground == (def) then
                Font.print(fnt22, setting_x_offset, setting_y3, wallpaper_table_settings[(def)].wallpaper_string, white) --FILENAME
            end
        end

        if setBackground == 0 then 
            Font.print(fnt22, setting_x_offset, setting_y3, lang_lines.Off, white) --OFF
        else
            wallpaper_print_string (setBackground)
        end

        -- MENU 4 / #4 SOUNDS
        Font.print(fnt22, setting_x, setting_y4, lang_lines.Sounds_colon, white)--SOUNDS
        if setSounds == 1 then
            Font.print(fnt22, setting_x_offset, setting_y4, lang_lines.On, white)--ON
        else
            if setLanguage == 10 then -- Chinese language fix
                Font.print(fnt22, setting_x_offset - 8, setting_y4, lang_lines.Off, white)--OFF
            else
                Font.print(fnt22, setting_x_offset, setting_y4, lang_lines.Off, white)--OFF
            end
        end

        -- MENU 4 - FUNCTIONS
        status = System.getMessageState()
        if status ~= RUNNING then
    
            if (Controls.check(pad, SCE_CTRL_CROSS) and not Controls.check(oldpad, SCE_CTRL_CROSS)) then
                if menuY == 0 then -- #0 Back
                    showMenu = 2
                    menuY = 0
                elseif menuY == 1 then -- #1 Theme Color
                    if themeColor < 7 then
                        themeColor = themeColor + 1
                    else
                        themeColor = 0
                    end
                    SetThemeColor()
                elseif menuY == 2 then -- #2 Reflections
                    if setReflections == 1 then
                        setReflections = 0
                    else
                        setReflections = 1
                    end
                elseif menuY == 3 then -- #3 Custom Background
                    bgtotal = #wallpaper_table_settings
                    if setBackground < bgtotal then
                        setBackground = setBackground + 1
                        -- Graphics.freeImage(imgBack)
                        imgBack = Graphics.loadImage(wallpaper_table_settings[setBackground].wallpaper_path)
                        imgCustomBack = imgBack
                        imgCustomBack = Graphics.loadImage(wallpaper_table_settings[setBackground].wallpaper_path)
                        Graphics.loadImage(wallpaper_table_settings[setBackground].wallpaper_path)
                        Render.useTexture(modBackground, imgCustomBack)
                    else
                        setBackground = 1 -- workaround hack as game backgrounds only show if setBackground is not 0
                        -- Graphics.freeImage(imgBack)
                        imgBack = Graphics.loadImage(wallpaper_table_settings[setBackground].wallpaper_path)
                        imgCustomBack = imgBack
                        imgCustomBack = Graphics.loadImage(wallpaper_table_settings[setBackground].wallpaper_path)
                        Graphics.loadImage(wallpaper_table_settings[setBackground].wallpaper_path)
                        Render.useTexture(modBackground, imgCustomBack)
                    end
                elseif menuY == 4 then -- #4 Sounds
                    if setSounds == 1 then
                        setSounds = 0
                        if System.doesFileExist(cur_dir .. "/Music.mp3") then
                            if Sound.isPlaying(sndMusic) then
                                Sound.pause(sndMusic)
                            end
                        end
                    else
                        setSounds = 1
                        if System.doesFileExist(cur_dir .. "/Music.mp3") then
                            if not Sound.isPlaying(sndMusic) then
                                Sound.play(sndMusic, LOOP)
                            end
                        end
                    end            
                end

                --Save settings
                SaveSettings()
                
            elseif (Controls.check(pad, SCE_CTRL_UP)) and not (Controls.check(oldpad, SCE_CTRL_UP)) then
                if menuY > 0 then
                    menuY = menuY - 1
                    else
                    menuY=menuItems
                end
            elseif (Controls.check(pad, SCE_CTRL_DOWN)) and not (Controls.check(oldpad, SCE_CTRL_DOWN)) then
                if menuY < menuItems then
                    menuY = menuY + 1
                    else
                    menuY=0
                end
            end
        end

-- MENU 5 - ARTWORK
    elseif showMenu == 5 then
        
        -- SETTINGS
        -- Footer buttons and icons
        -- Get text widths for positioning
        label1 = Font.getTextWidth(fnt20, lang_lines.Close)--Close
        label2 = Font.getTextWidth(fnt20, lang_lines.Select)--Select

        Graphics.drawImage(900-label1, 510, btnO)
        Font.print(fnt20, 900+28-label1, 508, lang_lines.Close, white)--Close

        Graphics.drawImage(900-(btnMargin * 2)-label1-label2, 510, btnX)
        Font.print(fnt20, 900+28-(btnMargin * 2)-label1-label2, 508, lang_lines.Select, white)--Select

        Graphics.fillRect(60, 900, 44, 450, darkalpha)

        Font.print(fnt22, setting_x, setting_yh, lang_lines.Artwork, white)--Artwork
        Graphics.fillRect(60, 900, 97, 100, white)

        Graphics.fillRect(60, 900, 100 + (menuY * 50), 150 + (menuY * 50), themeCol)-- selection

        menuItems = 3

        -- MENU 5 / #0 Back
        Font.print(fnt22, setting_x, setting_y0, lang_lines.Back_Chevron, white)--Back


        -- MENU 5 / #1 Download Covers
        if scanComplete == false then
            Font.print(fnt22, setting_x, setting_y1, lang_lines.Download_Covers_colon, white)
            if getCovers == 1 then
            Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.PS_Vita .. "  >", white)
            elseif getCovers == 2 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.PSP .. "  >", white)
            elseif getCovers == 3 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.PlayStation .."  >", white)
            elseif getCovers == 4 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.Nintendo_64 .. "  >", white)
            elseif getCovers == 5 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.Super_Nintendo .. "  >", white)
            elseif getCovers == 6 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.Nintendo_Entertainment_System .. "  >", white)
            elseif getCovers == 7 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.Game_Boy_Advance .. "  >", white)
            elseif getCovers == 8 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.Game_Boy_Color .. "  >", white)
            elseif getCovers == 9 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.Game_Boy .. "  >", white)
            elseif getCovers == 10 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.Sega_CD .. "  >", white)
            elseif getCovers == 11 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.Sega_32X .. "  >", white)
            elseif getCovers == 12 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.Sega_Mega_Drive .. "  >", white)
            elseif getCovers == 13 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.Sega_Master_System .. "  >", white)
            elseif getCovers == 14 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.Sega_Game_Gear .. "  >", white)
            elseif getCovers == 15 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.TurboGrafx_16 .. "  >", white)
            elseif getCovers == 16 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.TurboGrafx_CD .. "  >", white)
            elseif getCovers == 17 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.PC_Engine .. "  >", white)
            elseif getCovers == 18 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.PC_Engine_CD .. "  >", white)
            elseif getCovers == 19 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.Amiga .. "  >", white)
            elseif getCovers == 20 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.Commodore_64 .. "  >", white)
            elseif getCovers == 21 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.WonderSwan_Color .. "  >", white)
            elseif getCovers == 22 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.WonderSwan .. "  >", white)
            elseif getCovers == 23 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.MSX2 .. "  >", white)
            elseif getCovers == 24 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.MSX .. "  >", white)
            elseif getCovers == 25 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.ZX_Spectrum .. "  >", white)
            elseif getCovers == 26 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.Atari_7800 .. "  >", white)
            elseif getCovers == 27 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.Atari_5200 .. "  >", white)
            elseif getCovers == 28 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.Atari_2600 .. "  >", white)
            elseif getCovers == 29 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.Atari_Lynx .. "  >", white)
            elseif getCovers == 30 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.ColecoVision .. "  >", white)
            elseif getCovers == 31 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.Vectrex .. "  >", white)
            elseif getCovers == 32 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.FBA_2012 .. "  >", white)
            elseif getCovers == 33 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.MAME_2003Plus .. "  >", white)
            elseif getCovers == 34 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.MAME_2000 .. "  >", white)
            elseif getCovers == 35 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.Neo_Geo .. "  >", white)
            elseif getCovers == 36 then
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.Neo_Geo_Pocket_Color .. "  >", white)
            else
                Font.print(fnt22, setting_x_offset, setting_y1, "<  " .. lang_lines.All .. "  >", white)
            end
        else
            Font.print(fnt22, setting_x, setting_y1,  lang_lines.Reload_Covers_Database, white)--Reload Covers Database
        end


        -- MENU 5 / #2 Download Backgrounds
        if bgscanComplete == false then
            Font.print(fnt22, setting_x, setting_y2, lang_lines.Download_Backgrounds_colon, white)
            if getSnaps == 1 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.PSP .. "  >", white)
            elseif getSnaps == 2 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.PlayStation .."  >", white)
            elseif getSnaps == 3 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.Nintendo_64 .. "  >", white)
            elseif getSnaps == 4 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.Super_Nintendo .. "  >", white)
            elseif getSnaps == 5 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.Nintendo_Entertainment_System .. "  >", white)
            elseif getSnaps == 6 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.Game_Boy_Advance .. "  >", white)
            elseif getSnaps == 7 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.Game_Boy_Color .. "  >", white)
            elseif getSnaps == 8 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.Game_Boy .. "  >", white)
            elseif getSnaps == 9 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.Sega_CD .. "  >", white)
            elseif getSnaps == 10 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.Sega_32X .. "  >", white)
            elseif getSnaps == 11 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.Sega_Mega_Drive .. "  >", white)
            elseif getSnaps == 12 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.Sega_Master_System .. "  >", white)
            elseif getSnaps == 13 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.Sega_Game_Gear .. "  >", white)
            elseif getSnaps == 14 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.TurboGrafx_16 .. "  >", white)
            elseif getSnaps == 15 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.TurboGrafx_CD .. "  >", white)
            elseif getSnaps == 16 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.PC_Engine .. "  >", white)
            elseif getSnaps == 17 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.PC_Engine_CD .. "  >", white)
            elseif getSnaps == 18 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.Amiga .. "  >", white)
            elseif getSnaps == 19 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.Commodore_64 .. "  >", white)
            elseif getSnaps == 20 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.WonderSwan_Color .. "  >", white)
            elseif getSnaps == 21 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.WonderSwan .. "  >", white)
            elseif getSnaps == 22 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.MSX2 .. "  >", white)
            elseif getSnaps == 23 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.MSX .. "  >", white)
            elseif getSnaps == 24 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.ZX_Spectrum .. "  >", white)
            elseif getSnaps == 25 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.Atari_7800 .. "  >", white)
            elseif getSnaps == 26 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.Atari_5200 .. "  >", white)
            elseif getSnaps == 27 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.Atari_2600 .. "  >", white)
            elseif getSnaps == 28 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.Atari_Lynx .. "  >", white)
            elseif getSnaps == 29 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.ColecoVision .. "  >", white)
            elseif getSnaps == 30 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.Vectrex .. "  >", white)
            elseif getSnaps == 31 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.FBA_2012 .. "  >", white)
            elseif getSnaps == 32 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.MAME_2003Plus .. "  >", white)
            elseif getSnaps == 33 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.MAME_2000 .. "  >", white)
            elseif getSnaps == 34 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.Neo_Geo .. "  >", white)
            elseif getSnaps == 35 then
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.Neo_Geo_Pocket_Color .. "  >", white)
            else
                Font.print(fnt22, setting_x_offset, setting_y2, "<  " .. lang_lines.All .. "  >", white)
            end
        else
            Font.print(fnt22, setting_x, setting_y2,  lang_lines.Reload_Backgound_Database, white)--Reload Backgound Database            
        end


        -- MENU 5 / #3 Game Backgrounds
        Font.print(fnt22, setting_x, setting_y3, lang_lines.Game_backgounds_colon, white) -- Game backgounds
        if Game_Backgrounds == 1 then
            Font.print(fnt22, setting_x_offset, setting_y3, lang_lines.On, white)--ON
        else
            -- Chinese language fix
            if setLanguage == 10 then
                Font.print(fnt22, setting_x_offset - 8, setting_y3, lang_lines.Off, white)--OFF
            else
                Font.print(fnt22, setting_x_offset, setting_y3, lang_lines.Off, white)--OFF
            end
        end

        -- MENU 5 - FUNCTIONS
        status = System.getMessageState()
        if status ~= RUNNING then
            
            if (Controls.check(pad, SCE_CTRL_CROSS) and not Controls.check(oldpad, SCE_CTRL_CROSS)) then

                -- MENU 5
                if menuY == 0 then -- #0 Back
                    showMenu = 2
                    menuY = 0
                elseif menuY == 1 then -- #1 Download Covers
                    if gettingCovers == false then
                        gettingCovers = true
                        DownloadCovers()
                    end
                elseif menuY == 2 then -- #2 Download Backgrounds
                    if gettingBackgrounds == false then
                        gettingBackgrounds = true

                        if getSnaps == 0 then
                            if bg_table == nil then
                                bg_table = {}
                                for k, v in pairs(return_table) do
                                    if v.app_type == 0 then
                                            -- ignore homebrew
                                        elseif v.app_type == 1 then
                                            -- ignore vita
                                        else
                                        table.insert(bg_table, v)
                                    end
                                end
                                table.sort(bg_table, function(a, b) return (a.app_type < b.app_type) end)
                            end
                        end

                        DownloadSnaps()
                    end
                elseif menuY == 3 then -- #3 Game Backgrounds
                    if Game_Backgrounds == 1 then
                        Game_Backgrounds = 0
                    else
                        Game_Backgrounds = 1
                    end
                end
                
            elseif (Controls.check(pad, SCE_CTRL_UP)) and not (Controls.check(oldpad, SCE_CTRL_UP)) then
                if menuY > 0 then
                    menuY = menuY - 1
                    else
                    menuY=menuItems
                end
            elseif (Controls.check(pad, SCE_CTRL_DOWN)) and not (Controls.check(oldpad, SCE_CTRL_DOWN)) then
                if menuY < menuItems then
                    menuY = menuY + 1
                    else
                    menuY=0
                end
            elseif (Controls.check(pad, SCE_CTRL_LEFT)) and not (Controls.check(oldpad, SCE_CTRL_LEFT)) then
                --covers download selection
                
                if menuY==1 then -- #1 Download Covers
                    if getCovers > 0 then
                        getCovers = getCovers - 1
                    else
                        getCovers = count_of_get_covers -- Check getcover number against sytem
                    end

                    -- Skip empty categories
                    if getCovers == 36 then if #ngpc_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 35 then if #neogeo_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 34 then if #mame_2000_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 33 then if #mame_2003_plus_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 32 then if #fba_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 31 then if #vectrex_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 30 then if #colecovision_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 29 then if #atari_lynx_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 28 then if #atari_2600_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 27 then if #atari_5200_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 26 then if #atari_7800_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 25 then if #zxs_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 24 then if #msx1_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 23 then if #msx2_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 22 then if #wswan_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 21 then if #wswan_col_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 20 then if #c64_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 19 then if #amiga_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 18 then if #pcecd_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 17 then if #pce_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 16 then if #tgcd_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 15 then if #tg16_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 14 then if #gg_table == 0 then getCovers = getCovers - 1 end end                
                    if getCovers == 13 then if #sms_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 12 then if #md_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 11 then if #s32x_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 10 then if #sega_cd_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 9 then if #gb_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 8 then if #gbc_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 7 then if #gba_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 6 then if #nes_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 5 then if #snes_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 4 then if #n64_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 3 then if #psx_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 2 then if #psp_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 1 then if #games_table == 0 then getCovers = getCovers - 1 end end
                    if getCovers == 0 then if #return_table == 0 then getCovers = 36 end end

                elseif menuY==2 then -- #1 Download Backgrounds
                    if getSnaps > 0 then
                        getSnaps = getSnaps - 1
                    else
                        getSnaps = count_of_get_snaps -- Check getcover number against sytem
                    end

                    -- Skip empty categories
                    if getSnaps == 35 then if #ngpc_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 34 then if #neogeo_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 33 then if #mame_2000_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 32 then if #mame_2003_plus_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 31 then if #fba_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 30 then if #vectrex_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 29 then if #colecovision_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 28 then if #atari_lynx_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 27 then if #atari_2600_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 26 then if #atari_5200_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 25 then if #atari_7800_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 24 then if #zxs_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 23 then if #msx1_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 22 then if #msx2_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 21 then if #wswan_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 20 then if #wswan_col_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 19 then if #c64_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 18 then if #amiga_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 17 then if #pcecd_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 16 then if #pce_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 15 then if #tgcd_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 14 then if #tg16_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 13 then if #gg_table == 0 then getSnaps = getSnaps - 1 end end                
                    if getSnaps == 12 then if #sms_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 11 then if #md_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 10 then if #s32x_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 9 then if #sega_cd_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 8 then if #gb_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 7 then if #gbc_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 6 then if #gba_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 5 then if #nes_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 4 then if #snes_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 3 then if #n64_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 2 then if #psx_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 1 then if #psp_table == 0 then getSnaps = getSnaps - 1 end end
                    if getSnaps == 0 then if #return_table == 0 then getSnaps = 35 end end

                end
            elseif (Controls.check(pad, SCE_CTRL_RIGHT)) and not (Controls.check(oldpad, SCE_CTRL_RIGHT)) then
                --covers download selection
                if menuY==1 then -- #1 Download Covers
                    if getCovers < count_of_get_covers then -- Check getcover number against sytem
                        getCovers = getCovers + 1
                    else
                        getCovers=0
                    end

                    -- Skip empty categories
                    if getCovers == 0 then if #return_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 1 then if #games_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 2 then if #psp_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 3 then if #psx_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 4 then if #n64_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 5 then if #snes_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 6 then if #nes_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 7 then if #gba_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 8 then if #gbc_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 9 then if #gb_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 10 then if #sega_cd_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 11 then if #s32x_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 12 then if #md_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 13 then if #sms_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 14 then if #gg_table == 0 then getCovers = getCovers + 1 end end                
                    if getCovers == 15 then if #tg16_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 16 then if #tgcd_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 17 then if #pce_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 18 then if #pcecd_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 19 then if #amiga_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 20 then if #c64_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 21 then if #wswan_col_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 22 then if #wswan_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 23 then if #msx2_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 24 then if #msx1_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 25 then if #zxs_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 26 then if #atari_7800_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 27 then if #atari_5200_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 28 then if #atari_2600_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 29 then if #atari_lynx_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 30 then if #colecovision_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 31 then if #vectrex_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 32 then if #fba_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 33 then if #mame_2003_plus_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 34 then if #mame_2000_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 35 then if #neogeo_table == 0 then getCovers = getCovers + 1 end end
                    if getCovers == 36 then if #ngpc_table == 0 then getCovers = 0 end end

                elseif menuY==2 then -- #1 Download Backgrounds
                    if getSnaps < count_of_get_snaps then -- Check getcover number against sytem
                        getSnaps = getSnaps + 1
                    else
                        getSnaps=0
                    end

                    -- Skip empty categories
                    if getSnaps == 0 then if #return_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 1 then if #psp_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 2 then if #psx_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 3 then if #n64_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 4 then if #snes_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 5 then if #nes_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 6 then if #gba_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 7 then if #gbc_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 8 then if #gb_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 9 then if #sega_cd_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 10 then if #s32x_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 11 then if #md_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 12 then if #sms_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 13 then if #gg_table == 0 then getSnaps = getSnaps + 1 end end                
                    if getSnaps == 14 then if #tg16_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 15 then if #tgcd_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 16 then if #pce_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 17 then if #pcecd_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 18 then if #amiga_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 19 then if #c64_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 20 then if #wswan_col_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 21 then if #wswan_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 22 then if #msx2_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 23 then if #msx1_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 24 then if #zxs_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 25 then if #atari_7800_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 26 then if #atari_5200_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 27 then if #atari_2600_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 28 then if #atari_lynx_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 29 then if #colecovision_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 30 then if #vectrex_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 31 then if #fba_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 32 then if #mame_2003_plus_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 33 then if #mame_2000_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 34 then if #neogeo_table == 0 then getSnaps = getSnaps + 1 end end
                    if getSnaps == 35 then if #ngpc_table == 0 then getSnaps = 0 end end

                end
            end
        end

-- MENU 6 - SCAN SETTINGS
    elseif showMenu == 6 then
        
        -- SETTINGS
        -- Footer buttons and icons
        -- Get text widths for positioning
        label1 = Font.getTextWidth(fnt20, lang_lines.Close)--Close
        label2 = Font.getTextWidth(fnt20, lang_lines.Select)--Select

        Graphics.drawImage(900-label1, 510, btnO)
        Font.print(fnt20, 900+28-label1, 508, lang_lines.Close, white)--Close

        Graphics.drawImage(900-(btnMargin * 2)-label1-label2, 510, btnX)
        Font.print(fnt20, 900+28-(btnMargin * 2)-label1-label2, 508, lang_lines.Select, white)--Select

        Graphics.fillRect(60, 900, 44, 450, darkalpha)

        Font.print(fnt22, setting_x, setting_yh, lang_lines.Scan_Settings, white)--Scan_Settings
        Graphics.fillRect(60, 900, 97, 100, white)

        Graphics.fillRect(60, 900, 100 + (menuY * 50), 150 + (menuY * 50), themeCol)-- selection

        menuItems = 2

        -- MENU 6 / #0 Back
        Font.print(fnt22, setting_x, setting_y0, lang_lines.Back_Chevron, white)--Back

        -- MENU 6 / #1 Scan on Startup 
        if setLanguage == 10 then -- Chinese language fix
            Font.print(fnt22, setting_x - 7, setting_y1, lang_lines.Startup_scan_colon, white)--Scan on startup
        else
            Font.print(fnt22, setting_x, setting_y1, lang_lines.Startup_scan_colon, white)--Scan on startup
        end

        if startupScan == 1 then
            Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.On, white)--ON
        else
            if setLanguage == 10 then -- Chinese language fix
                Font.print(fnt22, setting_x_offset - 8, setting_y1, lang_lines.Off, white)--OFF
            else
                Font.print(fnt22, setting_x_offset, setting_y1, lang_lines.Off, white)--OFF
            end
        end


        -- MENU 6 / #2 Adrenaline_roms
        Font.print(fnt22, setting_x, setting_y2, lang_lines.Adrenaline_roms, white)--Adrenaline_roms 

        if Adrenaline_roms == 1 then
            Font.print(fnt22, setting_x_offset, setting_y2, "ux0:/pspemu", white)--ux0
        else
            if setLanguage == 10 then -- Chinese language fix
                Font.print(fnt22, setting_x_offset - 8, setting_y2, "ux0:/pspemu", white)--ux0
            else
                Font.print(fnt22, setting_x_offset, setting_y2, "uma0:/pspemu", white)--uma0
            end
        end


        -- MENU 6 - FUNCTIONS
        status = System.getMessageState()
        if status ~= RUNNING then
            
            if (Controls.check(pad, SCE_CTRL_CROSS) and not Controls.check(oldpad, SCE_CTRL_CROSS)) then

                -- MENU 2
                if menuY == 0 then -- #0 Back
                    showMenu = 2
                    menuY = 0
                elseif menuY == 1 then -- #1 Scan on Startup 
                    if startupScan == 1 then -- 0 Off, 1 On
                        startupScan = 0
                        --Save settings
                        SaveSettings()
                        -- Print to Cache folder
                        count_cache_and_reload()
                    else
                        startupScan = 1
                        --Save settings
                        SaveSettings()
                        count_cache_and_reload()
                    end
                elseif menuY == 2 then -- #2
                    if Adrenaline_roms == 1 then
                        Adrenaline_roms = 0 -- Scan uma0
                        --Save settings
                        SaveSettings()
                        ScanAdrenalineDirectoryOnly()
                        count_cache_and_reload()
                    else
                        Adrenaline_roms = 1 -- Scan ux0
                        --Save settings
                        SaveSettings()
                        ScanAdrenalineDirectoryOnly()
                        count_cache_and_reload()
                    end
                end

            elseif (Controls.check(pad, SCE_CTRL_UP)) and not (Controls.check(oldpad, SCE_CTRL_UP)) then
                if menuY > 0 then
                    menuY = menuY - 1
                    else
                    menuY=menuItems
                end
            elseif (Controls.check(pad, SCE_CTRL_DOWN)) and not (Controls.check(oldpad, SCE_CTRL_DOWN)) then
                if menuY < menuItems then
                    menuY = menuY + 1
                    else
                    menuY=0
                end
            end



        end
  
-- MENU 7 - ABOUT
    elseif showMenu == 7 then
        
        -- ABOUT
        -- Footer buttons and icons
        local label1 = Font.getTextWidth(fnt20, lang_lines.Close)--Close

        Graphics.drawImage(900-label1, 510, btnO)
        Font.print(fnt20, 900+28-label1, 508, lang_lines.Close, white)--Close
        
        Graphics.fillRect(30, 930, 24, 496, darkalpha)-- bg
        
        Font.print(fnt20, 54, 42, "RetroFlow Launcher - ver." .. appversion 
            .. "\n"
            .. "\nRetroFlow (Hexflow mod) by jimbob4000. Original HexFlow app by VitaHex."
            .. "\nSupport his projects on patreon.com/vitahex", white)-- Draw info

        Font.print(fnt20, 54, 132, "Adding Retro Games:"
            .. "\nPlace your game roms in the pre-made folders here 'ux0:/data/RetroFlow/ROMS'"
            .. "\n"
            .. "\nAdding PSP Games:"
            .. "\nPlease rename ISO files using Leecherman's 'PSP ISO Renamer tool'."
            .. "\nTool Parameters: %NAME% (%REGION%) [%ID%]."
            .. "\nSample: Cars 2 (US) [UCUS-98766].iso"
            .. "\n"
            .. "\nFor updates & more info visit: https://github.com/jimbob4000/RetroFlow-Launcher"
            .. "\n"
            .. "\nCREDITS"
            .. "\n"
            .. "\nOriginal app by VitHex. Programming/UI by Sakis RG. Developed with Lua Player"
            .. "\nPlus by Rinnegatamante. Special Thanks: VitaHex, Creckeryop, Rinnegatamante,"
            .. "\nAndreas Stürmer, Roc6d, Badmanwazzy37, Leecherman. Translations: TheheroGAC,"
            .. "\nchronoss, stuermerandreas, kodyna91, _novff, Spoxnus86, nighto, iGlitch, SK00RUPA.", white)-- Draw info"

-- END OF MENUS
    end

    
    -- Terminating rendering phase
    Graphics.termBlend()
    if showMenu == 1 then
        --Left Analog rotate preview box
        if mx < 64 then
            if prvRotY>-0.5 then
                prvRotY=prvRotY-0.02
            end
        elseif mx > 180 then
            if prvRotY<0.6 then
                prvRotY=prvRotY+0.02
            end
        end
    end
    --Controls Start
    if showMenu == 0 then
        --Navigation Left Analog
        if mx < 64 then
            if delayButton < 0.5 then
                delayButton = 1
                if setSounds == 1 then
                    Sound.play(click, NO_LOOP)
                end
                p = p - 1
                
                if p > 0 then
                    GetInfoSelected()
                end
                
                if (p <= master_index) then
                    master_index = p
                end
            end
        elseif mx > 180 then
            if delayButton < 0.5 then
                delayButton = 1
                if setSounds == 1 then
                    Sound.play(click, NO_LOOP)
                end
                p = p + 1
                
                if p <= curTotal then
                    GetInfoSelected()
                end
                
                if (p >= master_index) then
                    master_index = p
                end
            end
        end
        
        -- Navigation Buttons
        if (Controls.check(pad, SCE_CTRL_CROSS) and not Controls.check(oldpad, SCE_CTRL_CROSS)) then
            if gettingCovers == false and app_title~="-" then
                FreeMemory()
                AddtoRecentlyPlayed()
                update_cached_table_recently_played_pre_launch()

                if showCat == 1 then
                    if string.match (games_table[p].game_path, "pspemu") then
                        rom_location = tostring(games_table[p].launch_argument)
                        launch_Adrenaline()
                    else
                        System.launchApp(games_table[p].name)
                    end

                elseif showCat == 2 then
                    if string.match (homebrews_table[p].game_path, "pspemu") then
                        rom_location = tostring(homebrews_table[p].launch_argument)
                        launch_Adrenaline()
                    else
                        System.launchApp(homebrews_table[p].name)
                    end

                    -- launch command for system apps
                    -- System.executeUri(homebrews_table[p].uri_scheme)

                elseif showCat == 3 then
                    if string.match (psp_table[p].game_path, "pspemu") then
                        rom_location = tostring(psp_table[p].launch_argument)
                        launch_Adrenaline()
                    else
                        System.launchApp(psp_table[p].name)
                    end

                elseif showCat == 4 then
                    if string.match (psx_table[p].game_path, "pspemu") then
                        rom_location = tostring(psx_table[p].launch_argument)
                        launch_Adrenaline()
                    else
                        System.launchApp(psx_table[p].name)
                    end

                -- Start Retro    
                elseif showCat == 5 then rom_location = (n64_table[p].game_path) launch_DaedalusX64()
                elseif showCat == 6 then rom_location = (snes_table[p].game_path) launch_retroarch(core.SNES)
                elseif showCat == 7 then rom_location = (nes_table[p].game_path) launch_retroarch(core.NES)
                elseif showCat == 8 then rom_location = (gba_table[p].game_path) launch_retroarch(core.GBA)
                elseif showCat == 9 then rom_location = (gbc_table[p].game_path) launch_retroarch(core.GBC)
                elseif showCat == 10 then rom_location = (gb_table[p].game_path) launch_retroarch(core.GB)
                elseif showCat == 11 then rom_location = (sega_cd_table[p].game_path) launch_retroarch(core.SEGA_CD) 
                elseif showCat == 12 then rom_location = (s32x_table[p].game_path) launch_retroarch(core.s32X) 
                elseif showCat == 13 then rom_location = (md_table[p].game_path) launch_retroarch(core.MD)
                elseif showCat == 14 then rom_location = (sms_table[p].game_path) launch_retroarch(core.SMS)
                elseif showCat == 15 then rom_location = (gg_table[p].game_path) launch_retroarch(core.GG)
                elseif showCat == 16 then rom_location = (tg16_table[p].game_path) launch_retroarch(core.TG16)
                elseif showCat == 17 then rom_location = (tgcd_table[p].game_path) launch_retroarch(core.TGCD)
                elseif showCat == 18 then rom_location = (pce_table[p].game_path) launch_retroarch(core.PCE)
                elseif showCat == 19 then rom_location = (pcecd_table[p].game_path) launch_retroarch(core.PCECD)
                elseif showCat == 20 then rom_location = (amiga_table[p].game_path) launch_retroarch(core.AMIGA)
                elseif showCat == 21 then rom_location = (c64_table[p].game_path) launch_retroarch(core.C64)
                elseif showCat == 22 then rom_location = (wswan_col_table[p].game_path) launch_retroarch(core.WSWAN_COL)
                elseif showCat == 23 then rom_location = (wswan_table[p].game_path) launch_retroarch(core.WSWAN)
                elseif showCat == 24 then rom_location = (msx2_table[p].game_path) launch_retroarch(core.MSX2)
                elseif showCat == 25 then rom_location = (msx1_table[p].game_path) launch_retroarch(core.MSX1)
                elseif showCat == 26 then rom_location = (zxs_table[p].game_path) launch_retroarch(core.ZXS)
                elseif showCat == 27 then rom_location = (atari_7800_table[p].game_path) launch_retroarch(core.ATARI_7800)
                elseif showCat == 28 then rom_location = (atari_5200_table[p].game_path) launch_retroarch(core.ATARI_5200)
                elseif showCat == 29 then rom_location = (atari_2600_table[p].game_path) launch_retroarch(core.ATARI_2600)
                elseif showCat == 30 then rom_location = (atari_lynx_table[p].game_path) launch_retroarch(core.ATARI_LYNX)
                elseif showCat == 31 then rom_location = (colecovision_table[p].game_path) launch_retroarch(core.COLECOVISION)
                elseif showCat == 32 then rom_location = (vectrex_table[p].game_path) launch_retroarch(core.VECTREX)
                elseif showCat == 33 then rom_location = (fba_table[p].game_path) launch_retroarch(core.FBA)
                elseif showCat == 34 then rom_location = (mame_2003_plus_table[p].game_path) launch_retroarch(core.MAME_2003_PLUS)
                elseif showCat == 35 then rom_location = (mame_2000_table[p].game_path) launch_retroarch(core.MAME_2000)
                elseif showCat == 36 then rom_location = (neogeo_table[p].game_path) launch_retroarch(core.NEOGEO)
                elseif showCat == 37 then rom_location = (ngpc_table[p].game_path) launch_retroarch(core.NGPC)

                elseif showCat == 38 then
                    if apptype == 1 or apptype == 2 or apptype == 3 or apptype == 4 then
                        if string.match (fav_count[p].game_path, "pspemu") then
                            rom_location = tostring(fav_count[p].launch_argument)
                            launch_Adrenaline()
                        else
                            System.launchApp(fav_count[p].name)
                        end

                    -- Start Retro    
                    elseif apptype == 5 then rom_location = (fav_count[p].game_path) launch_DaedalusX64()
                    elseif apptype == 6 then rom_location = (fav_count[p].game_path) launch_retroarch(core.SNES)
                    elseif apptype == 7 then rom_location = (fav_count[p].game_path) launch_retroarch(core.NES)
                    elseif apptype == 8 then rom_location = (fav_count[p].game_path) launch_retroarch(core.GBA)
                    elseif apptype == 9 then rom_location = (fav_count[p].game_path) launch_retroarch(core.GBC)
                    elseif apptype == 10 then rom_location = (fav_count[p].game_path) launch_retroarch(core.GB)
                    elseif apptype == 11 then rom_location = (fav_count[p].game_path) launch_retroarch(core.SEGA_CD) 
                    elseif apptype == 12 then rom_location = (fav_count[p].game_path) launch_retroarch(core.s32X) 
                    elseif apptype == 13 then rom_location = (fav_count[p].game_path) launch_retroarch(core.MD)
                    elseif apptype == 14 then rom_location = (fav_count[p].game_path) launch_retroarch(core.SMS)
                    elseif apptype == 15 then rom_location = (fav_count[p].game_path) launch_retroarch(core.GG)
                    elseif apptype == 16 then rom_location = (fav_count[p].game_path) launch_retroarch(core.TG16)
                    elseif apptype == 17 then rom_location = (fav_count[p].game_path) launch_retroarch(core.TGCD)
                    elseif apptype == 18 then rom_location = (fav_count[p].game_path) launch_retroarch(core.PCE)
                    elseif apptype == 19 then rom_location = (fav_count[p].game_path) launch_retroarch(core.PCECD)
                    elseif apptype == 20 then rom_location = (fav_count[p].game_path) launch_retroarch(core.AMIGA)
                    elseif apptype == 21 then rom_location = (fav_count[p].game_path) launch_retroarch(core.C64)
                    elseif apptype == 22 then rom_location = (fav_count[p].game_path) launch_retroarch(core.WSWAN_COL)
                    elseif apptype == 23 then rom_location = (fav_count[p].game_path) launch_retroarch(core.WSWAN)
                    elseif apptype == 24 then rom_location = (fav_count[p].game_path) launch_retroarch(core.MSX2)
                    elseif apptype == 25 then rom_location = (fav_count[p].game_path) launch_retroarch(core.MSX1)
                    elseif apptype == 26 then rom_location = (fav_count[p].game_path) launch_retroarch(core.ZXS)
                    elseif apptype == 27 then rom_location = (fav_count[p].game_path) launch_retroarch(core.ATARI_7800)
                    elseif apptype == 28 then rom_location = (fav_count[p].game_path) launch_retroarch(core.ATARI_5200)
                    elseif apptype == 29 then rom_location = (fav_count[p].game_path) launch_retroarch(core.ATARI_2600)
                    elseif apptype == 30 then rom_location = (fav_count[p].game_path) launch_retroarch(core.ATARI_LYNX)
                    elseif apptype == 31 then rom_location = (fav_count[p].game_path) launch_retroarch(core.COLECOVISION)
                    elseif apptype == 32 then rom_location = (fav_count[p].game_path) launch_retroarch(core.VECTREX)
                    elseif apptype == 33 then rom_location = (fav_count[p].game_path) launch_retroarch(core.FBA)
                    elseif apptype == 34 then rom_location = (fav_count[p].game_path) launch_retroarch(core.MAME_2003_PLUS)
                    elseif apptype == 35 then rom_location = (fav_count[p].game_path) launch_retroarch(core.MAME_2000)
                    elseif apptype == 36 then rom_location = (fav_count[p].game_path) launch_retroarch(core.NEOGEO)
                    elseif apptype == 37 then rom_location = (fav_count[p].game_path) launch_retroarch(core.NGPC)
                    else
                        -- Homebrew
                        if string.match (fav_count[p].game_path, "pspemu") then
                            rom_location = (fav_count[p].launch_argument)
                            launch_Adrenaline()
                        else
                            System.launchApp(fav_count[p].name)
                        end

                        appdir=working_dir .. "/" .. fav_count[p].name
                    end

                elseif showCat == 39 then
                    if apptype == 1 or apptype == 2 or apptype == 3 or apptype == 4 then
                        if string.match (recently_played_table[p].game_path, "pspemu") then
                            rom_location = tostring(recently_played_table[p].launch_argument)
                            launch_Adrenaline()
                        else
                            System.launchApp(recently_played_table[p].name)
                        end

                    -- Start Retro    
                    elseif apptype == 5 then rom_location = (recently_played_table[p].game_path) launch_DaedalusX64()
                    elseif apptype == 6 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.SNES)
                    elseif apptype == 7 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.NES)
                    elseif apptype == 8 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.GBA)
                    elseif apptype == 9 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.GBC)
                    elseif apptype == 10 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.GB)
                    elseif apptype == 11 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.SEGA_CD) 
                    elseif apptype == 12 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.s32X) 
                    elseif apptype == 13 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.MD)
                    elseif apptype == 14 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.SMS)
                    elseif apptype == 15 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.GG)
                    elseif apptype == 16 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.TG16)
                    elseif apptype == 17 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.TGCD)
                    elseif apptype == 18 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.PCE)
                    elseif apptype == 19 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.PCECD)
                    elseif apptype == 20 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.AMIGA)
                    elseif apptype == 21 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.C64)
                    elseif apptype == 22 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.WSWAN_COL)
                    elseif apptype == 23 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.WSWAN)
                    elseif apptype == 24 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.MSX2)
                    elseif apptype == 25 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.MSX1)
                    elseif apptype == 26 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.ZXS)
                    elseif apptype == 27 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.ATARI_7800)
                    elseif apptype == 28 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.ATARI_5200)
                    elseif apptype == 29 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.ATARI_2600)
                    elseif apptype == 30 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.ATARI_LYNX)
                    elseif apptype == 31 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.COLECOVISION)
                    elseif apptype == 32 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.VECTREX)
                    elseif apptype == 33 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.FBA)
                    elseif apptype == 34 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.MAME_2003_PLUS)
                    elseif apptype == 35 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.MAME_2000)
                    elseif apptype == 36 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.NEOGEO)
                    elseif apptype == 37 then rom_location = (recently_played_table[p].game_path) launch_retroarch(core.NGPC)
                    else
                        -- Homebrew
                        if string.match (recently_played_table[p].game_path, "pspemu") then
                            rom_location = (recently_played_table[p].launch_argument)
                            launch_Adrenaline()
                        else
                            System.launchApp(recently_played_table[p].name)
                        end

                        appdir=working_dir .. "/" .. recently_played_table[p].name
                    end

                
                elseif showCat == 40 then
                    if apptype == 1 or apptype == 2 or apptype == 3 or apptype == 4 then
                        if string.match (search_results_table[p].game_path, "pspemu") then
                            rom_location = tostring(search_results_table[p].launch_argument)
                            launch_Adrenaline()
                        else
                            System.launchApp(search_results_table[p].name)
                        end

                    -- Start Retro    
                    elseif apptype == 5 then rom_location = (search_results_table[p].game_path) launch_DaedalusX64()
                    elseif apptype == 6 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.SNES)
                    elseif apptype == 7 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.NES)
                    elseif apptype == 8 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.GBA)
                    elseif apptype == 9 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.GBC)
                    elseif apptype == 10 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.GB)
                    elseif apptype == 11 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.SEGA_CD) 
                    elseif apptype == 12 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.s32X) 
                    elseif apptype == 13 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.MD)
                    elseif apptype == 14 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.SMS)
                    elseif apptype == 15 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.GG)
                    elseif apptype == 16 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.TG16)
                    elseif apptype == 17 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.TGCD)
                    elseif apptype == 18 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.PCE)
                    elseif apptype == 19 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.PCECD)
                    elseif apptype == 20 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.AMIGA)
                    elseif apptype == 21 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.C64)
                    elseif apptype == 22 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.WSWAN_COL)
                    elseif apptype == 23 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.WSWAN)
                    elseif apptype == 24 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.MSX2)
                    elseif apptype == 25 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.MSX1)
                    elseif apptype == 26 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.ZXS)
                    elseif apptype == 27 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.ATARI_7800)
                    elseif apptype == 28 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.ATARI_5200)
                    elseif apptype == 29 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.ATARI_2600)
                    elseif apptype == 30 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.ATARI_LYNX)
                    elseif apptype == 31 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.COLECOVISION)
                    elseif apptype == 32 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.VECTREX)
                    elseif apptype == 33 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.FBA)
                    elseif apptype == 34 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.MAME_2003_PLUS)
                    elseif apptype == 35 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.MAME_2000)
                    elseif apptype == 36 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.NEOGEO)
                    elseif apptype == 37 then rom_location = (search_results_table[p].game_path) launch_retroarch(core.NGPC)
                    else
                        -- Homebrew
                        if string.match (search_results_table[p].game_path, "pspemu") then
                            rom_location = (search_results_table[p].launch_argument)
                            launch_Adrenaline()
                        else
                            System.launchApp(search_results_table[p].name)
                        end

                        appdir=working_dir .. "/" .. search_results_table[p].name
                    end

                -- End Retro 
                else

                    if apptype == 1 or apptype == 2 or apptype == 3 or apptype == 4 then
                        if string.match (files_table[p].game_path, "pspemu") then
                            rom_location = tostring(files_table[p].launch_argument)
                            launch_Adrenaline()
                        else
                            System.launchApp(files_table[p].name)
                        end

                    -- Start Retro    
                    elseif apptype == 5 then rom_location = (files_table[p].game_path) launch_DaedalusX64()
                    elseif apptype == 6 then rom_location = (files_table[p].game_path) launch_retroarch(core.SNES)
                    elseif apptype == 7 then rom_location = (files_table[p].game_path) launch_retroarch(core.NES)
                    elseif apptype == 8 then rom_location = (files_table[p].game_path) launch_retroarch(core.GBA)
                    elseif apptype == 9 then rom_location = (files_table[p].game_path) launch_retroarch(core.GBC)
                    elseif apptype == 10 then rom_location = (files_table[p].game_path) launch_retroarch(core.GB)
                    elseif apptype == 11 then rom_location = (files_table[p].game_path) launch_retroarch(core.SEGA_CD) 
                    elseif apptype == 12 then rom_location = (files_table[p].game_path) launch_retroarch(core.s32X) 
                    elseif apptype == 13 then rom_location = (files_table[p].game_path) launch_retroarch(core.MD)
                    elseif apptype == 14 then rom_location = (files_table[p].game_path) launch_retroarch(core.SMS)
                    elseif apptype == 15 then rom_location = (files_table[p].game_path) launch_retroarch(core.GG)
                    elseif apptype == 16 then rom_location = (files_table[p].game_path) launch_retroarch(core.TG16)
                    elseif apptype == 17 then rom_location = (files_table[p].game_path) launch_retroarch(core.TGCD)
                    elseif apptype == 18 then rom_location = (files_table[p].game_path) launch_retroarch(core.PCE)
                    elseif apptype == 19 then rom_location = (files_table[p].game_path) launch_retroarch(core.PCECD)
                    elseif apptype == 20 then rom_location = (files_table[p].game_path) launch_retroarch(core.AMIGA)
                    elseif apptype == 21 then rom_location = (files_table[p].game_path) launch_retroarch(core.C64)
                    elseif apptype == 22 then rom_location = (files_table[p].game_path) launch_retroarch(core.WSWAN_COL)
                    elseif apptype == 23 then rom_location = (files_table[p].game_path) launch_retroarch(core.WSWAN)
                    elseif apptype == 24 then rom_location = (files_table[p].game_path) launch_retroarch(core.MSX2)
                    elseif apptype == 25 then rom_location = (files_table[p].game_path) launch_retroarch(core.MSX1)
                    elseif apptype == 26 then rom_location = (files_table[p].game_path) launch_retroarch(core.ZXS)
                    elseif apptype == 27 then rom_location = (files_table[p].game_path) launch_retroarch(core.ATARI_7800)
                    elseif apptype == 28 then rom_location = (files_table[p].game_path) launch_retroarch(core.ATARI_5200)
                    elseif apptype == 29 then rom_location = (files_table[p].game_path) launch_retroarch(core.ATARI_2600)
                    elseif apptype == 30 then rom_location = (files_table[p].game_path) launch_retroarch(core.ATARI_LYNX)
                    elseif apptype == 31 then rom_location = (files_table[p].game_path) launch_retroarch(core.COLECOVISION)
                    elseif apptype == 32 then rom_location = (files_table[p].game_path) launch_retroarch(core.VECTREX)
                    elseif apptype == 33 then rom_location = (files_table[p].game_path) launch_retroarch(core.FBA)
                    elseif apptype == 34 then rom_location = (files_table[p].game_path) launch_retroarch(core.MAME_2003_PLUS)
                    elseif apptype == 35 then rom_location = (files_table[p].game_path) launch_retroarch(core.MAME_2000)
                    elseif apptype == 36 then rom_location = (files_table[p].game_path) launch_retroarch(core.NEOGEO)
                    elseif apptype == 37 then rom_location = (files_table[p].game_path) launch_retroarch(core.NGPC)
                    else
                        -- Homebrew
                        if string.match (files_table[p].game_path, "pspemu") then
                            rom_location = (files_table[p].launch_argument)
                            launch_Adrenaline()
                        else
                            System.launchApp(files_table[p].name)
                        end

                        appdir=working_dir .. "/" .. files_table[p].name
                    end
                end
                System.exit()
            end
        elseif (Controls.check(pad, SCE_CTRL_TRIANGLE) and not Controls.check(oldpad, SCE_CTRL_TRIANGLE)) then
            if showMenu == 0 and app_title~="-" then
                prvRotY = 0
                showMenu = 1
            end
        elseif (Controls.check(pad, SCE_CTRL_START) and not Controls.check(oldpad, SCE_CTRL_START)) then
            if showMenu == 0 then
                showMenu = 2
            end
        -- Select button - Games screen
        elseif (Controls.check(pad, SCE_CTRL_SELECT) and not Controls.check(oldpad, SCE_CTRL_SELECT)) then
            -- Search
            if hasTyped==false then
                Keyboard.start(lang_lines.Search, "", 512, TYPE_DEFAULT, MODE_TEXT)
                hasTyped=true
            end
        elseif (Controls.check(pad, SCE_CTRL_SQUARE) and not Controls.check(oldpad, SCE_CTRL_SQUARE)) then
            -- CATEGORY

            if showCat < count_of_categories then
                -- Skip All category if disabled
                if showCat==0 and showAll==0 then 
                    showCat = 1
                -- Skip Homebrews category if disabled
                elseif showCat==1 and showHomebrews==0 then
                    showCat = 3
                else
                    showCat = showCat + 1
                end

            -- Commented out as all category skipping wasn't being honored after searching 
            -- else
            --     showCat = 0 
            end

            -- Start skip empty categories
            if showCat == 3 then curTotal =     #psp_table              if #psp_table == 0 then             showCat = 4 end end
            if showCat == 4 then curTotal =     #psx_table              if #psx_table == 0 then             showCat = 5 end end
            if showCat == 5 then curTotal =     #n64_table              if #n64_table == 0 then             showCat = 6 end end
            if showCat == 6 then curTotal =     #snes_table             if #snes_table == 0 then            showCat = 7 end end
            if showCat == 7 then curTotal =     #nes_table              if #nes_table == 0 then             showCat = 8 end end
            if showCat == 8 then curTotal =     #gba_table              if #gba_table == 0 then             showCat = 9 end end
            if showCat == 9 then curTotal =     #gbc_table              if #gbc_table == 0 then             showCat = 10 end end
            if showCat == 10 then curTotal =    #gb_table               if #gb_table == 0 then              showCat = 11 end end
            if showCat == 11 then curTotal =    #sega_cd_table          if #sega_cd_table == 0 then         showCat = 12 end end
            if showCat == 12 then curTotal =    #s32x_table             if #s32x_table == 0 then            showCat = 13 end end
            if showCat == 13 then curTotal =    #md_table               if #md_table == 0 then              showCat = 14 end end
            if showCat == 14 then curTotal =    #sms_table              if #sms_table == 0 then             showCat = 15 end end
            if showCat == 15 then curTotal =    #gg_table               if #gg_table == 0 then              showCat = 16 end end
            if showCat == 16 then curTotal =    #tg16_table             if #tg16_table == 0 then            showCat = 17 end end
            if showCat == 17 then curTotal =    #tgcd_table             if #tgcd_table == 0 then            showCat = 18 end end
            if showCat == 18 then curTotal =    #pce_table              if #pce_table == 0 then             showCat = 19 end end
            if showCat == 19 then curTotal =    #pcecd_table            if #pcecd_table == 0 then           showCat = 20 end end
            if showCat == 20 then curTotal =    #amiga_table            if #amiga_table == 0 then           showCat = 21 end end
            if showCat == 21 then curTotal =    #c64_table              if #c64_table == 0 then             showCat = 22 end end
            if showCat == 22 then curTotal =    #wswan_col_table        if #wswan_col_table == 0 then       showCat = 23 end end
            if showCat == 23 then curTotal =    #wswan_table            if #wswan_table == 0 then           showCat = 24 end end
            if showCat == 24 then curTotal =    #msx2_table             if #msx2_table == 0 then            showCat = 25 end end
            if showCat == 25 then curTotal =    #msx1_table             if #msx1_table == 0 then            showCat = 26 end end
            if showCat == 26 then curTotal =    #zxs_table              if #zxs_table == 0 then             showCat = 27 end end
            if showCat == 27 then curTotal =    #atari_7800_table       if #atari_7800_table == 0 then      showCat = 28 end end
            if showCat == 28 then curTotal =    #atari_5200_table       if #atari_5200_table == 0 then      showCat = 29 end end
            if showCat == 29 then curTotal =    #atari_2600_table       if #atari_2600_table == 0 then      showCat = 30 end end
            if showCat == 30 then curTotal =    #atari_lynx_table       if #atari_lynx_table == 0 then      showCat = 31 end end
            if showCat == 31 then curTotal =    #colecovision_table     if #colecovision_table == 0 then    showCat = 32 end end
            if showCat == 32 then curTotal =    #vectrex_table          if #vectrex_table == 0 then         showCat = 33 end end
            if showCat == 33 then curTotal =    #fba_table              if #fba_table == 0 then             showCat = 34 end end
            if showCat == 34 then curTotal =    #mame_2003_plus_table   if #mame_2003_plus_table == 0 then  showCat = 35 end end
            if showCat == 35 then curTotal =    #mame_2000_table        if #mame_2000_table == 0 then       showCat = 36 end end
            if showCat == 36 then curTotal =    #neogeo_table           if #neogeo_table == 0 then          showCat = 37 end end
            if showCat == 37 then curTotal =    #ngpc_table             if #ngpc_table == 0 then            showCat = 38 end end
            if showCat == 38 then
                -- count favorites
                local fav_count = {}
                for l, file in pairs(files_table) do
                    if showHomebrews == 0 then
                        -- ignore homebrew apps
                        if file.app_type > 0 then
                            if file.favourite==true then
                                table.insert(fav_count, file)
                            end
                        else
                        end
                    else
                        if file.favourite==true then
                            table.insert(fav_count, file)
                        end
                    end
                end
                curTotal = #fav_count
                if #fav_count == 0 then showCat = 39
                end
            end
            if showCat == 39 then 
                curTotal = #recently_played_table
                if #recently_played_table == 0 then showCat = 40
                end
            end
            
            if showCat == 40 then
                curTotal = #search_results_table   
                if #search_results_table == 0 and showAll==1 then 
                    showCat = 0
                elseif #search_results_table == 0 and showAll==0 then
                    showCat = 1
                elseif #search_results_table > 0 and showAll==1 then
                    showCat = 0
                elseif #search_results_table > 0 and showAll==0 then
                    showCat = 1
                else
                    showCat = 0
                end
            end

            hideBoxes = 8
            p = 1
            master_index = p
            startCovers = false
            GetInfoSelected()
            FreeIcons()
        elseif (Controls.check(pad, SCE_CTRL_CIRCLE) and not Controls.check(oldpad, SCE_CTRL_CIRCLE)) then
            -- VIEW
            
            state = Keyboard.getState()
            if state ~= RUNNING then
                -- don't change view if cancel search
                if showView < 4 then
                    showView = showView + 1
                else
                    showView = 0
                end
                menuY = 0
                startCovers = false

                --Save settings
                SaveSettings()
            else
            end

        elseif (Controls.check(pad, SCE_CTRL_LEFT)) and not (Controls.check(oldpad, SCE_CTRL_LEFT)) then
            if setSounds == 1 then
                Sound.play(click, NO_LOOP)
            end
            p = p - 1
            
            if p > 0 then
                GetInfoSelected()
            end
            
            if (p <= master_index) then
                master_index = p
            end
        elseif (Controls.check(pad, SCE_CTRL_RIGHT)) and not (Controls.check(oldpad, SCE_CTRL_RIGHT)) then
            if setSounds == 1 then
                Sound.play(click, NO_LOOP)
            end
            p = p + 1
            
            if p <= curTotal then
                GetInfoSelected()
            end
            
            if (p >= master_index) then
                master_index = p
            end
        elseif (Controls.check(pad, SCE_CTRL_LTRIGGER)) and not (Controls.check(oldpad, SCE_CTRL_LTRIGGER)) then
            if setSounds == 1 then
                Sound.play(click, NO_LOOP)
            end
            p = p - 5 
            
            if p > 0 then
                GetInfoSelected()
            end
            
            if (p <= master_index) then
                master_index = p
            end
        elseif (Controls.check(pad, SCE_CTRL_RTRIGGER)) and not (Controls.check(oldpad, SCE_CTRL_RTRIGGER)) then
            if setSounds == 1 then
                Sound.play(click, NO_LOOP)
            end
            p = p + 5 
            
            if p <= curTotal then
                GetInfoSelected()
            end
            
            if (p >= master_index) then
                master_index = p
            end
        elseif (Controls.check(pad, SCE_CTRL_UP)) and not (Controls.check(oldpad, SCE_CTRL_UP)) then
            -- Skip to favorites
            if showCat == 38 then
            else
                showCat = 38
                p = 1
                master_index = p
            end
        end
        
        -- Touch Input
        if x1 ~= nil then
            if touchdown == 0 and delayTouch < 0.5 then
                touchdown = 1
                xstart = x1
                delayTouch = 5
            end
            if touchdown > 0 and delayTouch > 0.5 then
                if x1 > xstart + 60 then
                    touchdown = 2
                    xstart = x1
                    p = p - 1
                    if p > 0 then
                        GetInfoSelected()
                    end
                    if (p <= master_index) then
                        master_index = p
                    end
                elseif x1 < xstart - 60 then
                    touchdown = 2
                    xstart = x1
                    p = p + 1
                    if p <= curTotal then
                        GetInfoSelected()
                    end
                    if (p >= master_index) then
                        master_index = p
                    end
                
                end
            end
        end
    elseif showMenu > 0 then
        if (Controls.check(pad, SCE_CTRL_CIRCLE) and not Controls.check(oldpad, SCE_CTRL_CIRCLE)) then
            status = System.getMessageState()
            if status ~= RUNNING then

                if showMenu == 3 then -- Categories
                    showMenu = 2
                    menuY = 1
                elseif showMenu == 4 then -- Theme
                    showMenu = 2
                    menuY = 2
                elseif showMenu == 5 then -- Artwork
                    showMenu = 2
                    menuY = 3
                elseif showMenu == 6 then -- Scan Settings
                    showMenu = 2
                    menuY = 4
                elseif showMenu == 7 then -- About
                    showMenu = 2
                    menuY = 6
                elseif showMenu == 2 then
                    -- If search cancelled with circle, return to settings menu
                    state = Keyboard.getState()
                    if state == RUNNING then
                        showMenu = 2
                    else
                        showMenu = 0
                    end
                else
                    showMenu = 0
                end

                prvRotY = 0
                if setBackground >= 1 then
                    Render.useTexture(modBackground, imgCustomBack)
                end
            end
        end

        -- Triangle button - Game info screen
        if (Controls.check(pad, SCE_CTRL_TRIANGLE) and not Controls.check(oldpad, SCE_CTRL_TRIANGLE)) and showMenu == 1 then
            -- Favourites
            AddOrRemoveFavorite()
            status = System.getMessageState()
            if status ~= RUNNING then
                showMenu = 0
                prvRotY = 0
                if setBackground >= 1 then
                    Render.useTexture(modBackground, imgCustomBack)
                end
            end
        end

    end
    
    if delayTouch > 0 then
        delayTouch = delayTouch - 0.1
    else
        delayTouch = 0
        touchdown = 0
    end
    -- End Touch
    -- End Controls
    if showCat == 1 then
        curTotal = #games_table
        if #games_table == 0 then
            p = 0
            master_index = p
        end
    elseif showCat == 2 then curTotal = #homebrews_table        if #homebrews_table == 0        then p = 0 master_index = p end
    elseif showCat == 3 then curTotal = #psp_table              if #psp_table == 0              then p = 0 master_index = p end
    elseif showCat == 4 then curTotal = #psx_table              if #psx_table == 0              then p = 0 master_index = p end
    elseif showCat == 5 then curTotal = #n64_table              if #n64_table == 0              then p = 0 master_index = p end
    elseif showCat == 6 then curTotal = #snes_table             if #snes_table == 0             then p = 0 master_index = p end
    elseif showCat == 7 then curTotal = #nes_table              if #nes_table == 0              then p = 0 master_index = p end
    elseif showCat == 8 then curTotal = #gba_table              if #gba_table == 0              then p = 0 master_index = p end
    elseif showCat == 9 then curTotal = #gbc_table              if #gbc_table == 0              then p = 0 master_index = p end
    elseif showCat == 10 then curTotal = #gb_table              if #gb_table == 0               then p = 0 master_index = p end
    elseif showCat == 11 then curTotal = #sega_cd_table         if #sega_cd_table == 0          then p = 0 master_index = p end
    elseif showCat == 12 then curTotal = #s32x_table            if #s32x_table == 0             then p = 0 master_index = p end
    elseif showCat == 13 then curTotal = #md_table              if #md_table == 0               then p = 0 master_index = p end
    elseif showCat == 14 then curTotal = #sms_table             if #sms_table == 0              then p = 0 master_index = p end
    elseif showCat == 15 then curTotal = #gg_table              if #gg_table == 0               then p = 0 master_index = p end
    elseif showCat == 16 then curTotal = #tg16_table            if #tg16_table == 0             then p = 0 master_index = p end
    elseif showCat == 17 then curTotal = #tgcd_table            if #tgcd_table == 0             then p = 0 master_index = p end
    elseif showCat == 18 then curTotal = #pce_table             if #pce_table == 0              then p = 0 master_index = p end
    elseif showCat == 19 then curTotal = #pcecd_table           if #pcecd_table == 0            then p = 0 master_index = p end
    elseif showCat == 20 then curTotal = #amiga_table           if #amiga_table == 0            then p = 0 master_index = p end
    elseif showCat == 21 then curTotal = #c64_table             if #c64_table == 0              then p = 0 master_index = p end
    elseif showCat == 22 then curTotal = #wswan_col_table       if #wswan_col_table == 0        then p = 0 master_index = p end
    elseif showCat == 23 then curTotal = #wswan_table           if #wswan_table == 0            then p = 0 master_index = p end
    elseif showCat == 24 then curTotal = #msx2_table            if #msx2_table == 0             then p = 0 master_index = p end
    elseif showCat == 25 then curTotal = #msx1_table            if #msx1_table == 0             then p = 0 master_index = p end
    elseif showCat == 26 then curTotal = #zxs_table             if #zxs_table == 0              then p = 0 master_index = p end
    elseif showCat == 27 then curTotal = #atari_7800_table      if #atari_7800_table == 0       then p = 0 master_index = p end
    elseif showCat == 28 then curTotal = #atari_5200_table      if #atari_5200_table == 0       then p = 0 master_index = p end
    elseif showCat == 29 then curTotal = #atari_2600_table      if #atari_2600_table == 0       then p = 0 master_index = p end
    elseif showCat == 30 then curTotal = #atari_lynx_table      if #atari_lynx_table == 0       then p = 0 master_index = p end
    elseif showCat == 31 then curTotal = #colecovision_table    if #colecovision_table == 0     then p = 0 master_index = p end
    elseif showCat == 32 then curTotal = #vectrex_table         if #vectrex_table == 0          then p = 0 master_index = p end
    elseif showCat == 33 then curTotal = #fba_table             if #fba_table == 0              then p = 0 master_index = p end
    elseif showCat == 34 then curTotal = #mame_2003_plus_table  if #mame_2003_plus_table == 0   then p = 0 master_index = p end
    elseif showCat == 35 then curTotal = #mame_2000_table       if #mame_2000_table == 0        then p = 0 master_index = p end
    elseif showCat == 36 then curTotal = #neogeo_table          if #neogeo_table == 0           then p = 0 master_index = p end
    elseif showCat == 37 then curTotal = #ngpc_table            if #ngpc_table == 0             then p = 0 master_index = p end    
    elseif showCat == 38 then
        -- count favorites
        local fav_count_2 = {}
        for l, file in pairs(files_table) do
            if file.favourite==true then
                table.insert(fav_count_2, file)
            end
        end
        curTotal = #fav_count_2
        if #fav_count_2 == 0 then
            p = 0
            master_index = p
        end
    elseif showCat == 39 then
        curTotal = #recently_played_table
        if #recently_played_table == 0 then
            p = 0
            master_index = p
        end
    elseif showCat == 40 then
        curTotal = #search_results_table
        if #search_results_table == 0 then
            p = 0
            master_index = p
        end

    else
        curTotal = #files_table
        if #files_table == 0 then
            p = 0
            master_index = p
        end
    end
    
    -- Check for out of bounds in menu 
    if p < 1 then
        p = curTotal
        if p >= 1 then
            master_index = p -- 0
        end
        startCovers = false
        GetInfoSelected()
    elseif p > curTotal then
        p = 1
        master_index = p
        startCovers = false
        GetInfoSelected()
    end
    
    -- Refreshing screen and oldpad
    Screen.waitVblankStart()
    Screen.flip()
    oldpad = pad
end
