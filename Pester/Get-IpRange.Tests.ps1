$ModuleName = "PSMyAdminFunction"

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path).Replace('Pester', '')

$modulePath = Join-Path -Path $here -ChildPath \
$moduleName = (Get-Item -Path "$here\*.psd1").BaseName
$moduleManifest = Join-Path -Path $modulePath -ChildPath "$ModuleName.psd1"

Import-Module $ModuleName

Describe "Get-Iprange" {
    Context "Get-IpRange" {
        $result = Get-IPrange -ip 192.168.0.0 -cidr 24
        It "Not null" {
            $result | Should Not BeNullOrEmpty
        }
        It "first should be 192.168.0.0" {
            $result[0] | Should MatchExactly "192.168.0.0"
        }
        It "last should be 192.168.0.255" {
            $result[-1] | Should MatchExactly "192.168.0.255"
        }
        It "Should Contain 256" {
            $result.Count | Should Be 256
        }
    }

}