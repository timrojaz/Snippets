Function Select-FromList {
    Param(
        $Items
    )
    $PickList = @()
    $Count = 1
    ForEach ($Item in $Items) {
        $PickItem = ""  | Select-Object Number, Name, Item
        $PickItem.Number = $Count++
        $PickItem.Name = $Item.Name
        $PickItem.Item = $Item.Item
        $PickList += $PickItem
    }
    $PickList | Format-Table Number, Name, Item -AutoSize | Out-Host    
    $Length = ([string]$PickList.Count).Length
    If ($Length -eq 1) {$Length = 2}
    Do {
        $PickNum = Read-Host "Please select the number of the item to use"
        If ($PickNum -ne "x") {If ($Picknum.length -ne $Length) {Do {$PickNum = "0$PickNum"}Until($Picknum.Length -eq $Length)}}
    }
    Until(($PickList | Where-Object {$_.Number -eq $PickNum}) -ne $null -or $picknum -eq "x")
    $Pick = $PickList | Where-Object {$_.Number -eq $PickNum}
    Return $Pick.Item
}#End Select-FromList

#Test function with items:
$lt10items = @(
    [pscustomobject]@{Name = "Windows 2008"; Item = "windows2008.iso"},
    [pscustomobject]@{Name = "Windows 2008 R2"; Item = "windows2008R2.iso"},
    [pscustomobject]@{Name = "Windows 2012"; Item = "windows2012.iso"},
    [pscustomobject]@{Name = "Windows 2012 R2"; Item = "windows2012R2.iso"},
    [pscustomobject]@{Name = "Windows 2016"; Item = "windows2016.iso"},
    [pscustomobject]@{Name = "SLES11"; Item = "SLES11.iso"},
    [pscustomobject]@{Name = "SLES12"; Item = "SLES12.iso"},
    [pscustomobject]@{Name = "RHEL6"; Item = "RHEL6.iso"},
    [pscustomobject]@{Name = "RHEL7"; Item = "RHEL7.iso"}
)
$ge10items = @(
    [pscustomobject]@{Name = "Windows 2008"; Item = "windows2008.iso"},
    [pscustomobject]@{Name = "Windows 2008 R2"; Item = "windows2008R2.iso"},
    [pscustomobject]@{Name = "Windows 2012"; Item = "windows2012.iso"},
    [pscustomobject]@{Name = "Windows 2012 R2"; Item = "windows2012R2.iso"},
    [pscustomobject]@{Name = "Windows 2016"; Item = "windows2016.iso"},
    [pscustomobject]@{Name = "SLES11"; Item = "SLES11.iso"},
    [pscustomobject]@{Name = "SLES12"; Item = "SLES12.iso"},
    [pscustomobject]@{Name = "RHEL6"; Item = "RHEL6.iso"},
    [pscustomobject]@{Name = "RHEL7"; Item = "RHEL7.iso"},
    [pscustomobject]@{Name = "VMWARE 5.5"; Item = "ESX55.iso"},
    [pscustomobject]@{Name = "VMWARE 6"; Item = "ESX6.iso"},
    [pscustomobject]@{Name = "VMWARE 6.5"; Item = "ESX65.iso"}
)

$ge100items = @(
    [pscustomobject]@{Name = "Windows 2008"; Item = "windows2008.iso"},
    [pscustomobject]@{Name = "Windows 2008 R2"; Item = "windows2008R2.iso"},
    [pscustomobject]@{Name = "Windows 2012"; Item = "windows2012.iso"},
    [pscustomobject]@{Name = "Windows 2012 R2"; Item = "windows2012R2.iso"},
    [pscustomobject]@{Name = "Windows 2016"; Item = "windows2016.iso"},
    [pscustomobject]@{Name = "SLES11"; Item = "SLES11.iso"},
    [pscustomobject]@{Name = "SLES12"; Item = "SLES12.iso"},
    [pscustomobject]@{Name = "RHEL6"; Item = "RHEL6.iso"},
    [pscustomobject]@{Name = "RHEL7"; Item = "RHEL7.iso"},
    [pscustomobject]@{Name = "VMWARE 5.5"; Item = "ESX55.iso"},
    [pscustomobject]@{Name = "VMWARE 6"; Item = "ESX6.iso"},
    [pscustomobject]@{Name = "VMWARE 6.5"; Item = "ESX65.iso"},
    [pscustomobject]@{Name = "Windows 2008"; Item = "windows2008.iso"},
    [pscustomobject]@{Name = "Windows 2008 R2"; Item = "windows2008R2.iso"},
    [pscustomobject]@{Name = "Windows 2012"; Item = "windows2012.iso"},
    [pscustomobject]@{Name = "Windows 2012 R2"; Item = "windows2012R2.iso"},
    [pscustomobject]@{Name = "Windows 2016"; Item = "windows2016.iso"},
    [pscustomobject]@{Name = "SLES11"; Item = "SLES11.iso"},
    [pscustomobject]@{Name = "SLES12"; Item = "SLES12.iso"},
    [pscustomobject]@{Name = "RHEL6"; Item = "RHEL6.iso"},
    [pscustomobject]@{Name = "RHEL7"; Item = "RHEL7.iso"},
    [pscustomobject]@{Name = "VMWARE 5.5"; Item = "ESX55.iso"},
    [pscustomobject]@{Name = "VMWARE 6"; Item = "ESX6.iso"},
    [pscustomobject]@{Name = "VMWARE 6.5"; Item = "ESX65.iso"},
    [pscustomobject]@{Name = "Windows 2008"; Item = "windows2008.iso"},
    [pscustomobject]@{Name = "Windows 2008 R2"; Item = "windows2008R2.iso"},
    [pscustomobject]@{Name = "Windows 2012"; Item = "windows2012.iso"},
    [pscustomobject]@{Name = "Windows 2012 R2"; Item = "windows2012R2.iso"},
    [pscustomobject]@{Name = "Windows 2016"; Item = "windows2016.iso"},
    [pscustomobject]@{Name = "SLES11"; Item = "SLES11.iso"},
    [pscustomobject]@{Name = "SLES12"; Item = "SLES12.iso"},
    [pscustomobject]@{Name = "RHEL6"; Item = "RHEL6.iso"},
    [pscustomobject]@{Name = "RHEL7"; Item = "RHEL7.iso"},
    [pscustomobject]@{Name = "VMWARE 5.5"; Item = "ESX55.iso"},
    [pscustomobject]@{Name = "VMWARE 6"; Item = "ESX6.iso"},
    [pscustomobject]@{Name = "VMWARE 6.5"; Item = "ESX65.iso"},
    [pscustomobject]@{Name = "Windows 2008"; Item = "windows2008.iso"},
    [pscustomobject]@{Name = "Windows 2008 R2"; Item = "windows2008R2.iso"},
    [pscustomobject]@{Name = "Windows 2012"; Item = "windows2012.iso"},
    [pscustomobject]@{Name = "Windows 2012 R2"; Item = "windows2012R2.iso"},
    [pscustomobject]@{Name = "Windows 2016"; Item = "windows2016.iso"},
    [pscustomobject]@{Name = "SLES11"; Item = "SLES11.iso"},
    [pscustomobject]@{Name = "SLES12"; Item = "SLES12.iso"},
    [pscustomobject]@{Name = "RHEL6"; Item = "RHEL6.iso"},
    [pscustomobject]@{Name = "RHEL7"; Item = "RHEL7.iso"},
    [pscustomobject]@{Name = "VMWARE 5.5"; Item = "ESX55.iso"},
    [pscustomobject]@{Name = "VMWARE 6"; Item = "ESX6.iso"},
    [pscustomobject]@{Name = "VMWARE 6.5"; Item = "ESX65.iso"},
    [pscustomobject]@{Name = "Windows 2008"; Item = "windows2008.iso"},
    [pscustomobject]@{Name = "Windows 2008 R2"; Item = "windows2008R2.iso"},
    [pscustomobject]@{Name = "Windows 2012"; Item = "windows2012.iso"},
    [pscustomobject]@{Name = "Windows 2012 R2"; Item = "windows2012R2.iso"},
    [pscustomobject]@{Name = "Windows 2016"; Item = "windows2016.iso"},
    [pscustomobject]@{Name = "SLES11"; Item = "SLES11.iso"},
    [pscustomobject]@{Name = "SLES12"; Item = "SLES12.iso"},
    [pscustomobject]@{Name = "RHEL6"; Item = "RHEL6.iso"},
    [pscustomobject]@{Name = "RHEL7"; Item = "RHEL7.iso"},
    [pscustomobject]@{Name = "VMWARE 5.5"; Item = "ESX55.iso"},
    [pscustomobject]@{Name = "VMWARE 6"; Item = "ESX6.iso"},
    [pscustomobject]@{Name = "VMWARE 6.5"; Item = "ESX65.iso"},
    [pscustomobject]@{Name = "Windows 2008"; Item = "windows2008.iso"},
    [pscustomobject]@{Name = "Windows 2008 R2"; Item = "windows2008R2.iso"},
    [pscustomobject]@{Name = "Windows 2012"; Item = "windows2012.iso"},
    [pscustomobject]@{Name = "Windows 2012 R2"; Item = "windows2012R2.iso"},
    [pscustomobject]@{Name = "Windows 2016"; Item = "windows2016.iso"},
    [pscustomobject]@{Name = "SLES11"; Item = "SLES11.iso"},
    [pscustomobject]@{Name = "SLES12"; Item = "SLES12.iso"},
    [pscustomobject]@{Name = "RHEL6"; Item = "RHEL6.iso"},
    [pscustomobject]@{Name = "RHEL7"; Item = "RHEL7.iso"},
    [pscustomobject]@{Name = "VMWARE 5.5"; Item = "ESX55.iso"},
    [pscustomobject]@{Name = "VMWARE 6"; Item = "ESX6.iso"},
    [pscustomobject]@{Name = "VMWARE 6.5"; Item = "ESX65.iso"},
    [pscustomobject]@{Name = "Windows 2008"; Item = "windows2008.iso"},
    [pscustomobject]@{Name = "Windows 2008 R2"; Item = "windows2008R2.iso"},
    [pscustomobject]@{Name = "Windows 2012"; Item = "windows2012.iso"},
    [pscustomobject]@{Name = "Windows 2012 R2"; Item = "windows2012R2.iso"},
    [pscustomobject]@{Name = "Windows 2016"; Item = "windows2016.iso"},
    [pscustomobject]@{Name = "SLES11"; Item = "SLES11.iso"},
    [pscustomobject]@{Name = "SLES12"; Item = "SLES12.iso"},
    [pscustomobject]@{Name = "RHEL6"; Item = "RHEL6.iso"},
    [pscustomobject]@{Name = "RHEL7"; Item = "RHEL7.iso"},
    [pscustomobject]@{Name = "VMWARE 5.5"; Item = "ESX55.iso"},
    [pscustomobject]@{Name = "VMWARE 6"; Item = "ESX6.iso"},
    [pscustomobject]@{Name = "VMWARE 6.5"; Item = "ESX65.iso"},
    [pscustomobject]@{Name = "Windows 2008"; Item = "windows2008.iso"},
    [pscustomobject]@{Name = "Windows 2008 R2"; Item = "windows2008R2.iso"},
    [pscustomobject]@{Name = "Windows 2012"; Item = "windows2012.iso"},
    [pscustomobject]@{Name = "Windows 2012 R2"; Item = "windows2012R2.iso"},
    [pscustomobject]@{Name = "Windows 2016"; Item = "windows2016.iso"},
    [pscustomobject]@{Name = "SLES11"; Item = "SLES11.iso"},
    [pscustomobject]@{Name = "SLES12"; Item = "SLES12.iso"},
    [pscustomobject]@{Name = "RHEL6"; Item = "RHEL6.iso"},
    [pscustomobject]@{Name = "RHEL7"; Item = "RHEL7.iso"},
    [pscustomobject]@{Name = "VMWARE 5.5"; Item = "ESX55.iso"},
    [pscustomobject]@{Name = "VMWARE 6"; Item = "ESX6.iso"},
    [pscustomobject]@{Name = "VMWARE 6.5"; Item = "ESX65.iso"},
    [pscustomobject]@{Name = "Windows 2008"; Item = "windows2008.iso"},
    [pscustomobject]@{Name = "Windows 2008 R2"; Item = "windows2008R2.iso"},
    [pscustomobject]@{Name = "Windows 2012"; Item = "windows2012.iso"},
    [pscustomobject]@{Name = "Windows 2012 R2"; Item = "windows2012R2.iso"},
    [pscustomobject]@{Name = "Windows 2016"; Item = "windows2016.iso"},
    [pscustomobject]@{Name = "SLES11"; Item = "SLES11.iso"},
    [pscustomobject]@{Name = "SLES12"; Item = "SLES12.iso"},
    [pscustomobject]@{Name = "RHEL6"; Item = "RHEL6.iso"},
    [pscustomobject]@{Name = "RHEL7"; Item = "RHEL7.iso"},
    [pscustomobject]@{Name = "VMWARE 5.5"; Item = "ESX55.iso"},
    [pscustomobject]@{Name = "VMWARE 6"; Item = "ESX6.iso"},
    [pscustomobject]@{Name = "VMWARE 6.5"; Item = "ESX65.iso"}
)

$Pick = Select-FromList -Items $ge100items
Write-Host "Item picked: " -NoNewLine -Foregroundcolor White
Write-Host $Pick -ForegroundColor Cyan
