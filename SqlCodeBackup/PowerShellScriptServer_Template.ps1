# Load needed assemblies 
param([string]$sql_server = "localhost")

[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SMO") | out-null
[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SMOExtended")| Out-Null; 

### Write-Host $sql_server
### exit


#Specify target server and databases.
$SMOserver = New-Object -TypeName Microsoft.SqlServer.Management.Smo.Server -ArgumentList "$sql_server"
$databases = $SMOserver.Databases
$BaseSavePath = "C:\_car\CarilionCube\SqlCodeBackup\PowerShell_" + $sql_server + "\"
### $BaseSavePath = "C:\Backup\PowerShell_Results\"
$dbs = "CubeMetaData"


#Remove existing objects.
Remove-Item $BaseSavePath -Recurse

#Script server-level objects.
$ServerSavePath = $BaseSavePath
#$ServerObjects  = $SMOserver.BackupDevices
#$ServerObjects += $SMOserver.Endpoints
#$ServerObjects += $SMOserver.JobServer.Jobs
$ServerObjects += $SMOserver.LinkedServers
$ServerObjects += $SMOserver.Triggers
#$ServerObjects += $SMOserver.Logins

foreach ($ScriptThis in $ServerObjects | where {!($_.IsSystemObject)}) 
{
    #Need to Add Some mkDirs for the different $Fldr=$ScriptThis.GetType().Name 
    $scriptr = new-object ('Microsoft.SqlServer.Management.Smo.Scripter') ($SMOserver)
    $scriptr.Options.AppendToFile = $True
    $scriptr.Options.AllowSystemObjects = $False
    $scriptr.Options.ClusteredIndexes = $True
    $scriptr.Options.DriAll = $True
    $scriptr.Options.ScriptDrops = $True
    $scriptr.Options.IncludeHeaders = $False
    $scriptr.Options.ToFileOnly = $True
    $scriptr.Options.Indexes = $True
    $scriptr.Options.Permissions = $True
    $scriptr.Options.WithDependencies = $False
    $scriptr.Options.ScriptOwner = $False
    $scriptr.Options.NoCollation = $True

    <#Script the Drop too#>
    $ScriptDrop = new-object ('Microsoft.SqlServer.Management.Smo.Scripter') ($SMOserver)
    $ScriptDrop.Options.AppendToFile = $True
    $ScriptDrop.Options.AllowSystemObjects = $False
    $ScriptDrop.Options.ClusteredIndexes = $True
    $ScriptDrop.Options.DriAll = $True
    $ScriptDrop.Options.ScriptDrops = $True
    $ScriptDrop.Options.IncludeHeaders = $False
    $ScriptDrop.Options.ToFileOnly = $True
    $ScriptDrop.Options.Indexes = $True
    $ScriptDrop.Options.WithDependencies = $False
    $ScriptDrop.Options.ScriptOwner = $False
    $scriptDrop.Options.NoCollation = $True

    <#This section builds folder structures.  Remove the date folder if you want to overwrite#>
    $TypeFolder=$ScriptThis.GetType().Name
    $TypeFolder=$TypeFolder.Replace("Job", "Jobs").Replace("LinkedServer", "LinkedServers")
    if ((Test-Path -Path "$ServerSavePath\$TypeFolder") -eq "true") `
            {"Scripting Out $TypeFolder $ScriptThis"} `
        else {new-item -type directory -name "$TypeFolder"-path "$ServerSavePath"}
    
	$ScriptFile = $ScriptThis -replace "\[|\]", "" -replace "[^a-zA-Z0-9 _\-]", "-"
	
    $ScriptDrop.Options.FileName = $ServerSavePath + "\" + $TypeFolder + "\" + $ScriptFile + ".sql"
    $scriptr.Options.FileName = $ServerSavePath + "\" + $TypeFolder + "\" + $ScriptFile + ".sql"

    #This is where each object actually gets scripted one at a time.
    ###$ScriptDrop.Script($ScriptThis)
    $scriptr.Script($ScriptThis)
} #This ends the object scripting loop at the server level.


### Script database-level objects.
### Filter databases 
foreach ($db in $databases | where-object {$dbs -contains $_.name  })
### NO Filter
###foreach ($db in $databases)
{
    $DatabaseObjects = $db.ApplicationRoles
    $DatabaseObjects += $db.Assemblies
    $DatabaseObjects += $db.ExtendedStoredProcedures
    $DatabaseObjects += $db.ExtendedProperties
    $DatabaseObjects += $db.PartitionFunctions
    $DatabaseObjects += $db.PartitionSchemes
    $DatabaseObjects += $db.Roles
    $DatabaseObjects += $db.Rules
    $DatabaseObjects += $db.Schemas
    $DatabaseObjects += $db.StoredProcedures
    $DatabaseObjects += $db.Synonyms
    $DatabaseObjects += $db.Tables
    $DatabaseObjects += $db.Triggers
    $DatabaseObjects += $db.UserDefinedAggregates
    $DatabaseObjects += $db.UserDefinedDataTypes
    $DatabaseObjects += $db.UserDefinedFunctions
    $DatabaseObjects += $db.UserDefinedTableTypes
    $DatabaseObjects += $db.UserDefinedTypes
    $DatabaseObjects += $db.Users
    $DatabaseObjects += $db.Views


    #Build this portion of the directory structure out here.  Remove the existing directory and its contents first.
    $DatabaseSavePath = $BaseSavePath + "Databases\" + $db.Name

    new-item -type directory -path "$DatabaseSavePath"

    foreach ($ScriptThis in $DatabaseObjects | where {!($_.IsSystemObject)}) 
    {
        #Need to Add Some mkDirs for the different $Fldr=$ScriptThis.GetType().Name 
        $scriptr = new-object ('Microsoft.SqlServer.Management.Smo.Scripter') ($SMOserver)
        $scriptr.Options.AppendToFile = $True
        $scriptr.Options.AllowSystemObjects = $False
        $scriptr.Options.ClusteredIndexes = $True
        $scriptr.Options.DriAll = $True
        $scriptr.Options.ScriptDrops = $False
        $scriptr.Options.IncludeHeaders = $False
        $scriptr.Options.ToFileOnly = $True
        $scriptr.Options.Indexes = $True
        $scriptr.Options.Permissions = $True
        $scriptr.Options.WithDependencies = $False
        $scriptr.Options.ScriptOwner = $False
        $scriptr.Options.NoCollation = $True

        <#Script the Drop too#>
        $ScriptDrop = new-object ('Microsoft.SqlServer.Management.Smo.Scripter') ($SMOserver)
        $ScriptDrop.Options.AppendToFile = $True
        $ScriptDrop.Options.AllowSystemObjects = $False
        $ScriptDrop.Options.ClusteredIndexes = $True
        $ScriptDrop.Options.DriAll = $True
        $ScriptDrop.Options.ScriptDrops = $True
        $ScriptDrop.Options.IncludeHeaders = $False
        $ScriptDrop.Options.ToFileOnly = $True
        $ScriptDrop.Options.Indexes = $True
        $ScriptDrop.Options.WithDependencies = $False
        $scriptDrop.Options.ScriptOwner = $False
        $scriptDrop.Options.NoCollation = $True

        <#This section builds folder structures.  Remove the date folder if you want to overwrite#>
        $TypeFolder=$ScriptThis.GetType().Name
        $TypeFolder=$TypeFolder + "s"
        $TypeFolder=$TypeFolder.Replace("StoredProcedures", "StoredProcs").Replace("UserDefinedFunctions", "Functions").Replace("SqlAssemblys", "SqlAssemblies")

        if ((Test-Path -Path "$DatabaseSavePath\$TypeFolder") -eq "true") `
                {"Scripting Out $TypeFolder $ScriptThis"} `
            else {new-item -type directory -name "$TypeFolder"-path "$DatabaseSavePath"}
        
		$ScriptFile = $ScriptThis -replace "\[|\]", "" -replace "[^a-zA-Z0-9 _\-]", "-"
		
        $ScriptDrop.Options.FileName = $DatabaseSavePath + "\" + $TypeFolder + "\" + $ScriptFile + ".sql"
        $scriptr.Options.FileName = $DatabaseSavePath + "\" + $TypeFolder + "\" + $ScriptFile + ".sql"

        #This is where each object actually gets scripted one at a time.
        ###$ScriptDrop.Script($ScriptThis)
        $scriptr.Script($ScriptThis)

    } #This ends the object scripting loop.
} #This ends the database loop.
