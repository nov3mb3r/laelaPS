#https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/plan/appendix-l--events-to-monitor
# 

param(
[Parameter(Mandatory=$False)]
[String]$server="localhost"
)

#Get-WinEvent -FilterHashtable @{LogName = 'Security';ID='4624'} | select -First 1 -Property *
#Get-WinEvent -FilterHashtable @{LogName = 'System';ID='5719'} | select -First 1 -ExpandProperty Properties 
# | select -First 1 -Property *

Get-WinEvent -ComputerName $server -Filterhashtable @{
	LogName='Security'
	id='4799'} | ForEach-Object -Process {
	New-Object -TypeName PSObject -Property @{
		'Time Created' = $_.TimeCreated
		'Enumerated Group' = $_.properties[0].Value
		'Enumerated Domain' = $_.properties[1].Value
		'Attacking User' = $_.properties[4].Value
		
		}
		
} | Format-Table -Autosize





