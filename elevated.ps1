# Elevated
## Remove Network from explorer
reg add 'HKCR\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder' /v Attributes /t REG_DWORD /d 0xb0940064 /f