# Reference: https://docs.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4799

param(
[Parameter(Mandatory=$False)]
[String]$server="localhost"
)

Get-WinEvent -ComputerName $server -Filterhashtable @{
	LogName='Security'
	id='4799'} | ForEach-Object -Process {
	New-Object -TypeName PSObject -Property @{
		'Time Created' = $_.TimeCreated
		'Enumerated Group' = $_.properties[0].Value
		'Enumerated Domain' = $_.properties[1].Value
		'Attacking User' = $_.properties[4].Value
		}	
} | Format-Table -Autosize -Property 'Time Created', 'Enumerated Group', 'Enumerated Domain', 'Attacking User'
