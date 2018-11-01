function Search-FreeIp {
<#
.SYNOPSIS
    Search a free IP in a range
.DESCRIPTION
    Search a free IP in a range
.PARAMETER IpRange
    List IP address
.EXAMPLE
    Search-FreeIp -IpRange 192.168.0.1,192.168.0.2
.EXAMPLE
    Search-FreeIp -IpRange 192.168.0.1
.EXAMPLE
    @("192.168.0.1","192.168.0.2") | Search-FreeIp
#>
    [CmdletBinding()]
    param(
        [parameter(ValueFromPipeline=$True,Mandatory=$True)][string[]]$IpRange
    )
    
    begin {
    }
    
    process {
        foreach ($Ip in $IpRange) {
            $queryString  = "SELECT * FROM Win32_PingStatus"
            $queryString += " WHERE Address = '$IP' "
            $results = Get-WmiObject -query $queryString

            if (!($results.StatusCode -eq 0)) {
                $IP
                break
            }
        }
        
    }
    
    end {
    }
}