# laelaPS
Similar to the mythological dog that never failed to catch what he was hunting, laelaPS is a tool designed to identify [MITRE ATT&CK](https://attack.mitre.org/matrices/enterprise/) techniques that are used in attacks against Active Directory, based on events recorded on Domain Controller:
- Permission Groups Discovery ([T1069](https://attack.mitre.org/techniques/T1069/))
- Account Discovery ([T1087](https://attack.mitre.org/techniques/T1087/))

Common tools that are used to enumeratate users and groups inside a domain are:
- [Bloodhound](https://github.com/BloodHoundAD/BloodHound)
- `net.exe`

# Usage
Using administrative privileges, run the laelaPS on the Domain Controller </p>
`PS >.\laelaPS.ps1`

The report will include the enumerated groups, along with the timestamp of the attack and the user that requested the enumeration

![](https://github.com/nov3mb3r/laelaPS/blob/main/report.PNG)
## Remote usage
Using administrative privileges, specify the remote Domain Controller server </p>
`PS >.\laelaPS.ps1 -server <DC_IP_addr>`

# Note
Enumeration is not reported when group members are enumerated using Active Directory Users and Computers snap-in
