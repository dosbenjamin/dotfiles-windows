# Scoop
## Install Scoop
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
iex "& {$(irm get.scoop.sh)} -RunAsAdmin"

## Install git for update and buckets
scoop install git

## Update
scoop update

## Add additionnal buckets
scoop bucket add extras
scoop bucket add nerd-fonts

## Install fonts
scoop install JetBrains-Mono

## Install software
scoop install capframex
scoop install ddu
scoop install islc
scoop install rtss
scoop install msiafterburner
scoop install nsudo

## Clean
scoop cleanup *
scoop cache rm *

# Winget
## Update
winget source update
winget upgrade

## Install DirectX & VCRedist AIO
winget install -e --id Microsoft.DirectX
winget install -e --id Microsoft.VC++2005Redist-x86
winget install -e --id Microsoft.VC++2005Redist-x64
winget install -e --id Microsoft.VC++2008Redist-x86
winget install -e --id Microsoft.VC++2008Redist-x64
winget install -e --id Microsoft.VC++2010Redist-x86
winget install -e --id Microsoft.VC++2010Redist-x64
winget install -e --id Microsoft.VC++2012Redist-x86
winget install -e --id Microsoft.VC++2012Redist-x64
winget install -e --id Microsoft.VC++2013Redist-x86
winget install -e --id Microsoft.VC++2013Redist-x64
winget install -e --id Microsoft.VC++2015-2022Redist-x86
winget install -e --id Microsoft.VC++2015-2022Redist-x64

## Install software
winget install -e --id 9WZDNCRF0083
winget install -e --id XP8BT8DW290MPQ
winget install -e --id XPFFTQ037JWMHS
winget install -e --id AgileBits.1Password
winget install -e --id ALCPU.CoreTemp
winget install -e --id BleachBit.BleachBit
winget install -e --id Discord.Discord
winget install -e --id Docker.DockerDesktop
winget install -e --id ElectronicArts.EADesktop
winget install -e --id Figma.Figma
winget install -e --id Axosoft.GitKraken
winget install -e --id Google.Drive
winget install -e --id Logitech.GHUB
winget install -e --id Microsoft.PowerToys
winget install -e --id Microsoft.VisualStudioCode
winget install -e --id Mozilla.Firefox
winget install -e --id qBittorrent.qBittorrent
winget install -e --id Resplendence.LatencyMon
winget install -e -i --id RiotGames.LeagueOfLegends.EUW
winget install -e --id Spotify.Spotify
winget install -e --id TablePlus.TablePlus
winget install -e --id Valve.Steam
winget install -e --id VideoLAN.VLC
winget install -e --id WhatsApp.WhatsApp
