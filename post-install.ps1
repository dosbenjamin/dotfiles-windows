# Post-install
## Disable services
Set-Service -Name 'AMD Crash Defender Service' -StartupType Disable
Set-Service -Name 'AMD External Events Utility' -StartupType Disable

## Disable system restore
vssadmin delete shadows /for=C: /all
Disable-ComputerRestore -Drive 'C:\'
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore" /v DisableSR /t REG_DWORD /d 1 /f

## Remove apps from startup
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v 'BraveSoftware Update'
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v Discord /f
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v Steam /f
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v Spotify /f
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v ctfmon /f
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v 'com.squirrel.slack.slack' /f

## Add apps to startup
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v ISLC /t REG_SZ /d 'C:\Users\Benjamin\scoop\apps\islc\current\Intelligent standby list cleaner ISLC.exe' /f