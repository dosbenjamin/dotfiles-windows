# Give permission needed to install Scoop.
Set-ExecutionPolicy RemoteSigned -scope CurrentUser

# Install Scoop.
iwr -useb get.scoop.sh | iex

# Update Scoop.
scoop update

# Add additionnal buckets to Scoop.
scoop bucket add dorado https://github.com/chawyehsu/dorado
scoop bucket add extras
scoop bucket add nerd-fonts
scoop bucket add versions

# Install binaries with Scoop.
scoop install composer
scoop install git
scoop install nvm
scoop install php74

# Create symlink for php.ini file.
New-Item -Path C:\Users\Benjamin\php.ini -ItemType SymbolicLink -Value C:\Users\Benjamin\dotfiles\php.ini

# Install softwares with Scoop.
scoop install brave
scoop install discord
scoop install figma
scoop install firefox
scoop install slack
scoop install steam
scoop install vscode
scoop install windows-terminal
scoop install whatsapp

# Install Jet Brains Mono font with scoop.
scoop install jetbrainsmono-nf-mono

# Install Node 14 with nvm.
nvm install 14.15.4
nvm use 14.15.4

# Update php.ini scan folder.
$env:PHP_INI_SCAN_DIR = "C:\Users\Benjamin;"

# Install Valet with composer.
composer global require cretueusebiu/valet-windows
valet install

# Install Adminer.
mkdir C:\Users\Benjamin\Adminer
Invoke-WebRequest -Uri "https://github.com/vrana/adminer/releases/download/v4.7.8/adminer-4.7.8-en.php" -OutFile "C:\Users\Benjamin\Adminer\index.php"
cd C:\Users\Benjamin\Adminer
valet link adminer
valet secure

# Install oh-my-posh and posh-git.
Install-Module oh-my-posh -Scope CurrentUser
Install-Module posh-git -Scope CurrentUser

# Create symlink for PowerShell profile.
New-Item -Path C:\Users\Benjamin\Documents\WindowsPowerShell\profile.ps1 -ItemType SymbolicLink -Value C:\Users\Benjamin\dotfiles\profile.ps1

# Create symlink for Windows Terminal settings. 
cd C:\Users\Benjamin\AppData\Local\Microsoft\Windows` Terminal; rm settings.json
New-Item -Path C:\Users\Benjamin\AppData\Local\Microsoft\Windows` Terminal\settings.json -ItemType SymbolicLink -Value C:\Users\Benjamin\dotfiles\terminal-settings.json