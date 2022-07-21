# dotfiles Windows
Personal configuration for ReviOS-based installation.

## 1. Install
1. Setup drives, configure bin, disable indexing on them and move user folders
2. Enable internet
3. Start PowerShell and run `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`
4. Run `install.ps1` for default installation
5. Run `software.ps1` to install software using Scoop and Winget
6. Restart
7. Run `wsl.ps1` to install WSL (Ubuntu)
8. Start PowerShell with Nsudo and run `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`
9. Run `elevated.ps1`
10. Restart in safe mode
11. Use DDU
12. Restart in normal mode
13. Download and install (minimal preset) AMD drivers
14. Start PowerShell
15. Run `post-install.ps1`

## 2. Post-install / Manual manipulation
1. Add a profile picture
2. Add QWERTY International
3. Set up audio
4. Configure network card
5. Configure ISLC
6. Disable unused devices and disable power saving in Device Manager

## ISLC configuration
- 1024/16384
- Minimized
- 0.5 - Enable
- Polling 10000

Clean %AppData%\Microsoft\windows\recent\customdestinations

## 3. Resources
- https://www.revi.cc

TODO:
- Control panel :
    - Disable Security and Maintenance messages
    - Disable `Notify me when Windows Defender Firewall blocks a new app`
    - Disable defragmentation `Increase task priority`
    - Disable `Ease of access` automatic reading
    - Disable mouse hiding when typing
- Settings :
    - Disable do not disturb
    - Disable priority notifications
    - Disable focus
    - Disable Windows backup language preferences + other windows settings
    - Set AutoPlay defaults
    - Disable Airplane mode Bluetooth
    - Disable magnifier
    - Disable narator Outlook
    - Disable location override
