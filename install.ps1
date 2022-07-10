# Scoop
# 1. Install Scoop
irm get.scoop.sh | iex

# 2. Install git for update and buckets
scoop install git

# 3. Update
scoop update

# 4. Add additionnal buckets
scoop bucket add extras
scoop bucket add nerd-fonts

# 5. Install fonts
scoop install JetBrains-Mono

# 6. Install software
scoop install capframex
scoop install ddu
scoop install islc
scoop install rtss
scoop install winget

# 7. Clean
scoop cleanup *
scoop cache rm *

# Winget
# 1. Update
winget source update
winget upgrade

# 2. Install DirectX & VCRedist AIO
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

# 3. Install software
winget install -e --id 7zip.7zip
winget install -e --id AgileBits.1Password
winget install -e --id ALCPU.CoreTemp
winget install -e --id BraveSoftware.BraveBrowser
winget install -e --id Discord.Discord
winget install -e --id ElectronicArts.EADesktop
winget install -e --id Figma.Figma
winget install -e --id Google.Drive
winget install -e --id Microsoft.VisualStudioCode
winget install -e --id Microsoft.WindowsTerminal
winget install -e --id qBittorrent.qBittorrent
winget install -e --id Resplendence.LatencyMon
winget install -e -i --id RiotGames.LeagueOfLegends.EUW
winget install -e --id SlackTechnologies.Slack
winget install -e --id Spotify.Spotify
winget install -e --id TablePlus.TablePlus
winget install -e --id Valve.Steam
winget install -e --id VideoLAN.VLC
winget install -e --id WhatsApp.WhatsApp

# WSL
# 1. Enable Windows features
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform

# 2. Install
wsl --install
wsl --set-default-version 2
wsl --install -d Ubuntu-20.04

# Windows Terminal
Remove-Item 'C:\Users\Benjamin\AppData\Local\Microsoft\Windows Terminal\settings.json'
New-Item -ItemType SymbolicLink -Path 'C:\Users\Benjamin\AppData\Local\Microsoft\Windows Terminal\settings.json' -Value 'terminal-settings.json'
