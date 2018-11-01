$source = ""
$destination_dev =""
$ModuleName = "PSMyAdminFunction"

$source = split-path $PSScriptRoot
$destination_dev = $env:PSModulePath.split(";")[0] + "\" + $ModuleName


Deploy ExampleDeployment {

    By FileSystem Scripts {

        FromSource $source
        To $destination_dev
        Tagged Dev
        WithOptions @{
            Mirror = $true
        }
    }
}


