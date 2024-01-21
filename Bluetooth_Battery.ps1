$XboxConnect = Get-PnpDevice -Class "Bluetooth" -FriendlyName "Xbox Wireless Controller" | Get-PnpDeviceProperty -KeyName "{83DA6326-97A6-4088-9453-A1923F573B29} 15" | % Data ;

$XboxBattery = Get-PnpDevice -Class 'Bluetooth' -FriendlyName 'Xbox Wireless Controller' | Get-PnpDeviceProperty -KeyName '{104EA319-6EE2-4701-BD47-8DDBF425BBE5} 2' | % Data ;

$TimeStamp = Get-Date;

$BatteryStatus = "OK";

$BatteryStatusNew = "OK";

if ($XboxConnect) {
    "Xbox Controller Connected!!";
    }
else {
    "Xbox Controller Disconnected!!";
    "Disconnected|$($TimeStamp)" | Out-File -Append -FilePath C:\Users\vivek\OneDrive\Documents\BluetoothBatteryLog.txt;
    Start-Sleep 4;
    break;
    }

$XboxBatteryNew = ($XboxBattery - 50) * 2;

if ($XboxBattery -le 15) {
    "Xbox Controller Battery     : $($XboxBattery)%";
    $BatteryStatus = "Replace";
    "=======================================";
    "============REPLACE BATTERY============";
    "=======================================";
    }
else {
    "Xbox Controller Battery     : $($XboxBattery)%";
    }
;

if ($XboxBatteryNew -le 0) {
    "Xbox Controller Battery NEW : $($XboxBatteryNew)%";
    $BatteryStatusNew = "Replace";
    "=======================================";
    "==========REPLACE BATTERY NEW==========";
    "=======================================";
    }
else {
    "Xbox Controller Battery NEW : $($XboxBatteryNew)%";
    }
;

"Connected|$($TimeStamp)|$($XboxBattery)|$($XboxBatteryNew)|$($BatteryStatus)|$($BatteryStatusNew)" | Out-File -Append -FilePath C:\Users\vivek\OneDrive\Documents\BluetoothBatteryLog.txt;
Start-Sleep 4;