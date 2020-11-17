param(
[Parameter(Mandatory=$False)]
[String]$server="localhost"
)

#$Event = Get-WinEvent -LogName Security -ComputerName $server 
#$Event | where {($_.Id -eq '5719')}
#Get-WinEvent -FilterHashtable @{LogName = 'System';ID='5719'} | select -First 1 -ExpandProperty Properties
# | select -First 1 -Property *

Get-WinEvent -ComputerName $server -Filterhashtable @{
	LogName='Security'
	id='4624'} | ForEach-Object -Process {
	New-Object -TypeName PSObject -Property @{
		'Account Name' = $_.properties[1].Value
		'Time Created' = $_.TimeCreated
		}
		
} | Format-Table -Autosize

#Get-WinEvent -ComputerName $server -Filterhashtable @{LogName='Security'; id='4624'} |
#	Group-Object -Property ProcessId, ThreadId, MachineName | Select Name

#https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/plan/appendix-l--events-to-monitor

#Get-WinEvent -FilterHashtable @{LogName = 'Security';ID='4624'} | select -First 1 -Property *

