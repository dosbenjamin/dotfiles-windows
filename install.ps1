# Give permission needed to install Scoop.
Set-ExecutionPolicy RemoteSigned -scope CurrentUser

# Install Scoop.
iwr -useb get.scoop.sh | iex

# Update Scoop.
scoop update

# Add additionnal buckets to Scoop.
scoop bucket add Ash258 https://github.com/Ash258/Scoop-Ash258.git
scoop bucket add dorado https://github.com/chawyehsu/dorado
scoop bucket add extras
scoop bucket add nerd-fonts
scoop bucket add spotify https://github.com/TheRandomLabs/Scoop-Spotify.git

# Install binaries with Scoop.
scoop install composer
scoop install git
scoop install nvs

# Install softwares with Scoop.
scoop install 7zip
scoop install brave
scoop install ddu
scoop install discord
scoop install FacebookMessenger
scoop install figma
scoop install hwinfo
scoop install msiafterburner
scoop install qbittorrent
scoop install slack
scoop install spotify-latest
scoop install steam
scoop install vlc
scoop install vscode
scoop install windows-terminal
scoop install winscp
scoop install whatsapp

# Install Jet Brains Mono font with scoop.
scoop install jetbrainsmono-nf-mono

# Install Node LTS with nvs.
nvs add lts
nvs use lts
nvs link lts

# Install binaries with npm.
npm i -g yarn

# Install oh-my-posh and posh-git.
Install-Module oh-my-posh -Scope CurrentUser
Install-Module posh-git -Scope CurrentUser

# Create symlink for PowerShell profile.
New-Item -Path C:\Users\Benjamin\Documents\WindowsPowerShell\profile.ps1 -ItemType SymbolicLink -Value C:\Users\Benjamin\Workspace\dotfiles\profile.ps1

# Create symlink for Windows Terminal settings.
cd C:\Users\Benjamin\AppData\Local\Microsoft\Windows` Terminal; rm settings.json
New-Item -Path C:\Users\Benjamin\AppData\Local\Microsoft\Windows` Terminal\settings.json -ItemType SymbolicLink -Value C:\Users\Benjamin\Workspace\dotfiles\terminal-settings.json
