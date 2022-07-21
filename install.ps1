# Windows configuration
## Rename computer
Rename-Computer -NewName 'BENJAMIN-PC'

## Set time and zone
Set-TimeZone -Id 'Romance Standard Time'
Set-WinHomeLocation 0x15
Set-Culture en-BE
net start w32time
w32tm /resync
net stop w32time

## Disable system logs
wmic recoveros set WriteToSystemLog = False
wmic recoveros set SendAdminAlert = False
wmic recoveros set AutoReboot = False
wmic recoveros set DebugInfoType = 0
wmic recoveros set OverwriteExistingDebugFile = 0
Get-EventLog -LogName * | ForEach { Clear-EventLog $_.Log }

## Disable Remote Assistance
reg add 'HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance' /v MaxTicketExpiry /t REG_DWORD /d 1 /f
reg add 'HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance' /v MaxTicketExpiryUnits /t REG_DWORD /d 0 /f
reg add 'HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance' /v fEnableChatControl /t REG_DWORD /d 0 /f
reg add 'HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance' /v fAllowFullControl /t REG_DWORD /d 0 /f
reg add 'HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance' /v fAllowToGetHelp /t REG_DWORD /d 0 /f

## Disable Remote Desktop
reg add 'HKLM\SYSTEM\CurrentControlSet\CurrentControlSet\Control\Terminal Server' /v updateRDStatus /t REG_DWORD /d 0 /f
reg add 'HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' /v UserAuthentication /t REG_DWORD /d 0 /f

## BCDEdit
bcdedit /timeout 0
bcdedit /set bootuxdisabled on

## Remove lock and sleep option in start menu
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings /v ShowLockOption /t REG_DWORD /d 0 /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings /v ShowSleepOption /t REG_DWORD /d 0 /f

## Disable scheduled defragmentation
schtasks /Change /DISABLE /TN \Microsoft\Windows\Defrag\ScheduledDefrag

## Reduce number of svchost.exe processes
reg add HKLM\SYSTEM\CurrentControlSet\Control /v SvcHostSplitThresholdInKB /t REG_DWORD /d 0x33554432 /f

## Disable BitLocker
reg add HKCR\Drive\shell\change-passphrase /v ProgrammaticAccessOnly /t REG_SZ
reg add HKCR\Drive\shell\change-pin /v ProgrammaticAccessOnly /t REG_SZ
reg add HKCR\Drive\shell\encrypt-bde /v ProgrammaticAccessOnly /t REG_SZ
reg add HKCR\Drive\shell\encrypt-bde-elev /v ProgrammaticAccessOnly /t REG_SZ
reg add HKCR\Drive\shell\manage-bde /v ProgrammaticAccessOnly /t REG_SZ
reg add HKCR\Drive\shell\resume-bde /v ProgrammaticAccessOnly /t REG_SZ
reg add HKCR\Drive\shell\resume-bde-elev /v ProgrammaticAccessOnly /t REG_SZ
reg add HKCR\Drive\shell\unlock-bde /v ProgrammaticAccessOnly /t REG_SZ
reg add HKLM\SYSTEM\CurrentControlSet\Control\BitLocker /v PreventDeviceEncryption /t REG_DWORD /d 1 /f

## Remove bloatwares
winget uninstall 'Gaming App'
winget uninstall 'Xbox TCUI'
winget uninstall 'Xbox Game Bar Plugin'
winget uninstall 'Xbox Game Bar'
winget uninstall 'Xbox Identity Provider'
winget uninstall 'Xbox Game Speech Window'
winget uninstall 'Paint'
winget uninstall 'Your Phone'

## Disable optional features
Disable-WindowsOptionalFeature -Online -FeatureName MediaPlayback
Disable-WindowsOptionalFeature -Online -FeatureName LegacyComponents
Disable-WindowsOptionalFeature -Online -FeatureName Windows-Defender-Default-Definitions
Disable-WindowsOptionalFeature -Online -FeatureName SearchEngine-Client-Package
Disable-WindowsOptionalFeature -Online -FeatureName NetFx4-AdvSrvs

## Enable optional features
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform

## Explorer
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer /v ShowFrequent /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer /v ShowRecent /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer /v ShowCloudFilesInQuickAccess /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v ShowStatusBar /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v IconsOnly /t REG_DWORD /d 1 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v SeparateProcess /t REG_DWORD /d 1 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v ShowTypeOverlay /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v Hidden /t REG_DWORD /d 1 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v UseCompactMode /t REG_DWORD /d 1 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v SharingWizardOn /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v ShowPreviewHandlers /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v LaunchTo /t REG_DWORD /d 1 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoDesktop /t REG_DWORD /d 1 /f

## Disable lockscreen
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization /v NoLockScreen /t REG_DWORD /d 1 /f
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\System /v DisableLogonBackgroundImage /t REG_DWORD /d 1 /f

## Accessibility
reg add 'HKCU\Control Panel\Accessibility' /v 'Sound on Activation' /t REG_DWORD /d 0 /f
reg add 'HKCU\Control Panel\Accessibility' /v 'Warning Sounds' /t REG_DWORD /d 0 /f
reg add 'HKCU\Control Panel\Accessibility\MouseKeys' /v Flags /t REG_SZ /d 128 /f
reg add 'HKCU\Control Panel\Accessibility\MouseKeys' /v MaximumSpeed /t REG_SZ /d 10 /f
reg add 'HKCU\Control Panel\Accessibility\MouseKeys' /v TimeToMaximumSpeed /t REG_SZ /d 5000 /f
reg add 'HKCU\Control Panel\Accessibility\Keyboard Response' /v AutoRepeatDelay /t REG_SZ /d 0 /f
reg add 'HKCU\Control Panel\Accessibility\Keyboard Response' /v AutoRepeatRate /t REG_SZ /d 0 /f
reg add 'HKCU\Control Panel\Accessibility\Keyboard Response' /v DelayBeforeAcceptance /t REG_SZ /d 0 /f
reg add 'HKCU\Control Panel\Accessibility\Keyboard Response' /v 'Last Valid Delay' /t REG_DWORD /d 0 /f
reg add 'HKCU\Control Panel\Accessibility\Keyboard Response' /v 'Last Valid Repeat' /t REG_DWORD /d 0 /f
reg add 'HKCU\Control Panel\Accessibility\Keyboard Response' /v 'Last Valid Wait' /t REG_DWORD /d 0 /f
reg add 'HKCU\Control Panel\Cursors' /v ContactVisualization /t REG_DWORD /d 0 /f
reg add 'HKCU\Control Panel\Cursors' /v GestureVisualization /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Narrator\NoRoam /v WinEnterLaunchEnabled /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Narrator\NarratorHome /v AutoStart /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Narrator\NoRoam /v DuckAudio /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Narrator\NoRoam /v UserVerbosityLevel /t REG_DWORD /d 1 /f
reg add HKCU\SOFTWARE\Microsoft\Narrator /v IntonationPause /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Narrator\NoRoam /v ContextVerbosityLevel /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Narrator\NoRoam /v ContextVerbosityLevelV2 /t REG_DWORD /d 1 /f
reg add HKCU\SOFTWARE\Microsoft\Narrator /v ReadHints /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Narrator /v ErrorNotificationType /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Narrator /v EchoChars /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Narrator /v EchoWords /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Narrator\NoRoam /v EchoToggleKeys /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Narrator\NoRoam /v NarratorModifiers /t REG_DWORD /d 2 /f
reg add HKCU\Software\Microsoft\Narrator /v NarratorCursorHighlight /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Narrator /v CoupleNarratorCursorKeyboard /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Narrator\NoRoam /v OnlineServicesEnabled /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\ScreenMagnifier /v Magnification /t REG_DWORD /d 100 /f
reg add HKCU\Software\Microsoft\ScreenMagnifier /v ZoomIncrement /t REG_DWORD /d 5 /f

## Disable time change notification
reg add 'HKCU\Control Panel\TimeDate' /v DstNotification /t REG_DWORD /d 0 /f

## Keyboard and mouse
reg add 'HKCU\Control Panel\Keyboard' /v KeyboardDelay /t REG_SZ /d 0 /f
reg add 'HKCU\Control Panel\Mouse' /v MouseSensitivity /t REG_SZ /d 10 /f
reg import mouse.reg

## Network
Set-NetConnectionProfile -Name Network -NetworkCategory Private
netsh advfirewall firewall set rule group='Network Discovery' new enable=No
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\NcdAutoSetup\Private /v AutoSetup /t REG_SZ /d 0 /f

## Disable system sounds
reg add HKCU\AppEvents\Schemes\Names\.Default /ve /d None /f

## Disable notifications
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings /v NOC_GLOBAL_SETTING_ALLOW_NOTIFICATION_SOUND /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings /v NOC_GLOBAL_SETTING_ALLOW_CRITICAL_TOASTS_ABOVE_LOCK /t REG_DWORD /d 0 /f
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.StartupApp /f

## Disable Virtualization-based security
reg add HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity /v Enabled /t REG_DWORD /d 0 /f
reg add HKLM\System\CurrentControlSet\Control\DeviceGuard /v EnableVirtualizationBasedSecurity /t REG_DWORD /d 0 /f

## Don't run any troubleshooter
reg add HKLM\SOFTWARE\Microsoft\WindowsMitigation /v UserPreference /t REG_DWORD /d 1 /f

## Remove capabilities
dism /Online /Remove-Capability /CapabilityName:App.StepsRecorder~~~~0.0.1.0
dism /Online /Remove-Capability /CapabilityName:Browser.InternetExplorer~~~~0.0.11.0
dism /Online /Remove-Capability /CapabilityName:MathRecognizer~~~~0.0.1.0
dism /Online /Remove-Capability /CapabilityName:Media.WindowsMediaPlayer~~~~0.0.12.0
dism /Online /Remove-Capability /CapabilityName:Microsoft.Windows.PowerShell.ISE~~~~0.0.1.0
dism /Online /Remove-Capability /CapabilityName:Microsoft.Windows.WordPad~~~~0.0.1.0
dism /Online /Remove-Capability /CapabilityName:OpenSSH.Client~~~~0.0.1.0
dism /Online /Remove-Capability /CapabilityName:Print.Management.Console~~~~0.0.1.0
dism /Online /Remove-Capability /CapabilityName:WMIC~~~~
dism /Online /Remove-Capability /CapabilityName:Hello.Face.20134~~~~0.0.1.0
dism /Online /Remove-Capability /CapabilityName:Microsoft.Windows.Notepad.System~~~~0.0.1.0
dism /Online /Remove-Capability /CapabilityName:Microsoft.Wallpapers.Extended~~~~0.0.1.0

## Disable automatically detect proxy settings
reg add 'HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings' /v AutoDetect /t REG_DWORD /d 0 /f

## Unpin everything from quick settings
reg add 'HKCU\Control Panel\Quick Actions\Control Center\Unpinned' /v Microsoft.QuickAction.Accessibility /t REG_NONE
reg add 'HKCU\Control Panel\Quick Actions\Control Center\Unpinned' /v Microsoft.QuickAction.AirplaneMode /t REG_NONE
reg add 'HKCU\Control Panel\Quick Actions\Control Center\Unpinned' /v Microsoft.QuickAction.BlueLightReduction /t REG_NONE
reg add 'HKCU\Control Panel\Quick Actions\Control Center\Unpinned' /v Microsoft.QuickAction.Bluetooth /t REG_NONE
reg add 'HKCU\Control Panel\Quick Actions\Control Center\Unpinned' /v Microsoft.QuickAction.Cast /t REG_NONE
reg add 'HKCU\Control Panel\Quick Actions\Control Center\Unpinned' /v Microsoft.QuickAction.ColorProfile /t REG_NONE
reg add 'HKCU\Control Panel\Quick Actions\Control Center\Unpinned' /v Microsoft.QuickAction.NearShare /t REG_NONE
reg add 'HKCU\Control Panel\Quick Actions\Control Center\Unpinned' /v Microsoft.QuickAction.ProjectL2 /t REG_NONE

## Start
reg add HKCU\Software\Policies\Microsoft\Windows\Explorer /v HideRecentlyAddedApps /t REG_DWORD /d 1 /f
reg add HKLM\Software\Policies\Microsoft\Windows\Explorer /v HideRecentlyAddedApps /t REG_DWORD /d 1 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v Start_TrackDocs /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v Start_TrackProgs /t REG_DWORD /d 0 /f

## Taskbar
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Search /v SearchboxTaskbar /t REG_DWORD /d 0 /f 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Search /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v ShowTaskViewButton /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v TaskbarSh /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v TaskbarSd /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v TaskbarSn /t REG_DWORD /d 0 /f

## Unpin everything from taskbar
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband /f

## Privacy
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings /v SafeSearchMode /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings /v IsMSACloudSearchEnabled /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings /v IsAADCloudSearchEnabled /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings /v IsDeviceSearchHistoryEnabled /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings /v IsDynamicSearchBoxEnabled /t REG_DWORD /d 0 /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam /v Value /t REG_SZ /d Deny /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phonecall /v Value /t REG_SZ /d Deny /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\downloadsFolder /v Value /t REG_SZ /d Deny /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\musicLibrary /v Value /t REG_SZ /d Deny /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\graphicsCaptureProgrammatic /v Value /t REG_SZ /d Deny /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\graphicsCaptureWithoutBorder /v Value /t REG_SZ /d Deny /f

## Touch keyboard
reg add 'HKCU\Software\Microsoft\TabletTip\1.7' /v EnableKeyAudioFeedback /t REG_DWORD /d 0 /f
reg add 'HKCU\Software\Microsoft\TabletTip\1.7' /v EnableAutoShiftEngage /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Input\Settings /v IsVoiceTypingKeyEnabled /t REG_DWORD /d 0 /f

## Captures
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR /v MaximumRecordLength /t REG_QWORD /d 18000000000 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR /v AudioCaptureEnabled /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR /v CursorCaptureEnabled /t REG_DWORD /d 0 /f

## Account
powercfg /SETACVALUEINDEX SCHEME_CURRENT SUB_NONE CONSOLELOCK 0

## Disable share accross devices
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\CDP /v RomeSdkChannelUserAuthzPolicy /t REG_DWORD /d 0 /f

## Disable archive apps
function Disable-Archive-Apps {
    $user = Get-WmiObject win32_useraccount | Where-Object -Property Name -EQ Benjamin | Select SID
    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\InstallService\Stubification\$($user.SID)" /v EnableAppOffloading /t REG_DWORD /d 0 /f
}

Disable-Archive-Apps

## Storage Sense
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\StorageSense /v ConfigStorageSenseGlobalCadence /t REG_DWORD /d 30 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy /v 04 /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy /v 08 /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy /v 256 /t REG_DWORD /d 0 /f

## Disable file history
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\FileHistory /v Disabled /t REG_DWORD /d 0 /f

## Disable print managed by Windows
reg add 'HKCU\Software\Microsoft\Windows NT\CurrentVersion\Windows' /v LegacyDefaultPrinterMode /t REG_DWORD /d 1 /f

## Disable fingertip in Windows Ink
reg add HKCU\SOFTWARE\Microsoft\TabletTip\EmbeddedInkControl /v EnableInkingWithTouch /t REG_DWORD /d 0 /f

## Disable autoplay
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers /v DisableAutoplay /t REG_DWORD /d 1 /f

## Disable usb notifications
reg add HKCU\SOFTWARE\Microsoft\Shell\USB /v NotifyOnUsbErrors /t REG_DWORD /d 0 /f

## Disable minimize windows when a monitor is disconnected
reg add 'HKCU\Control Panel\Desktop' /v MonitorRemovalRecalcBehavior /t REG_DWORD /d 1 /f

## Add recycle bin to navigation pane
reg add 'HKCU\Software\Classes\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}' /v 'System.IsPinnedToNameSpaceTree' /t REG_DWORD /d 1 /f

## Disable vpn settings
reg add HKLM\SYSTEM\CurrentControlSet\Services\RasMan\Parameters\Config\VpnCostedNetworkSettings /v NoRoamingNetwork /t REG_DWORD /d 1 /f
reg add HKLM\SYSTEM\CurrentControlSet\Services\RasMan\Parameters\Config\VpnCostedNetworkSettings /v NoCostedNetwork /t REG_DWORD /d 1 /f

## Internet options
reg add 'HKCU\Software\Microsoft\Internet Explorer\BrowserStorage\AppCache' /v AllowWebsiteCaches /t REG_DWORD /d 0 /f
reg import internet-options.reg
reg import internet-explorer.reg

## Remove Home from explorer
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer /v HubMode /t REG_DWORD /d 1 /f

## Disable background image
reg add 'HKCU\Control Panel\Desktop' /v UserPreferencesMask /t REG_BINARY /d 9E1E038013000000 /f

## Configure multitasking
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v SnapAssist /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v EnableSnapAssistFlyout /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v EnableSnapBar /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v EnableTaskGroups /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v DITest /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v MultiTaskingAltTabFilter /t REG_DWORD /d 3 /f

## Visual effects
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects /v VisualFXSetting /t REG_DWORD /d 3 /f
reg add HKCU\Software\Microsoft\Windows\DWM /v EnableAeroPeek /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v IconsOnly /t REG_DWORD /d 1 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v ListviewShadow /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\DWM /v AlwaysHibernateThumbnails /t REG_DWORD /d 0 /f
reg add 'HKCU\Control Panel\Desktop' /v UserPreferencesMask /t REG_BINARY /d 9E16078013000000 /f

## Delete power plans
powercfg /D a1841308-3541-4fab-bc81-f71556f20b4a
powercfg /D 381b4222-f694-41f0-9685-ff5bb260df2e
powercfg /D 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

## Set power plan
powercfg /import C:\Users\Benjamin\dotfiles-windows\power-plan.pow
powercfg /list
echo 'powercfg /setactive ...'
echo 'delete: 3ff9831b - powercfg /D ...'

## Disable Xbox controller button
reg add HKCU\SOFTWARE\Microsoft\GameBar /v UseNexusForGameBarEnabled /t REG_DWORD /d 0 /f

## Disable services
Set-Service -Name Spooler -StartupType Disable
Set-Service -Name FontCache -StartupType Disable
Set-Service -Name iphlpsvc -StartupType Disable
Set-Service -Name lmhosts -StartupType Disable
Set-Service -Name PhoneSvc -StartupType Disable
Set-Service -Name SharedAccess -StartupType Disable
Set-Service -Name TrkWks -StartupType Disable
Set-Service -Name WpnService -StartupType Disable
reg add HKLM\SYSTEM\CurrentControlSet\Services\WinHttpAutoProxySvc /v Start /t REG_DWORD /d 4 /f
