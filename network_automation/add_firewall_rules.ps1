# Create a new firewall rule to allow incoming traffic on a specific port
$rulename = Read-Host "Enter the new RuleName"
$ruledirection = Read-Host "Enter the rule type (Inbound/Outbound) :"
$protocol = Read-Host " Enter the protocol type (TCP/ICMP/UDP) :"
$port = Read-Host " Enter the port number :"
$action = Read-Host "Confirm Action (Allow/Deny) : "

New-NetFirewallRule -DisplayName $rulename -Direction $ruledirection -Protocol $protocol -LocalPort $port -Action $action
