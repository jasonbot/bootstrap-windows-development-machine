#Requires -RunAsAdministrator

Write-Host "Debloating OS"

& ([scriptblock]::Create((Invoke-RestMethod "https://debloat.raphi.re/"))) -Silent -RunDefaults	-ClearStart	-HideSearchTb -DisableWidgets -TaskbarAlignLeft -ExplorerToThisPC  -DisableLockscreenTips -DisableDesktopSpotlight