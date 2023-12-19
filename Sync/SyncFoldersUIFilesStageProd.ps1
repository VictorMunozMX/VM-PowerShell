# Created by Victor Munoz
# Date: November 30, 2022
# v1. Sincronize two folders with the same folders and generate the log file

# Test 
#$folderOrigen = "C:\Users\Enrique.Munoz\OneDrive - Solera Holdings, Inc\Documents\Releases\CopyFoldersUIFiles\iol" 
#$folderDest   = "C:\Users\Enrique.Munoz\OneDrive - Solera Holdings, Inc\Documents\Releases\CopyFoldersUIFiles\stage" 
#$logFilePath  = "C:\Users\Enrique.Munoz\OneDrive - Solera Holdings, Inc\Documents\Releases\CopyFoldersUIFiles\PSScriptLog.txt"

# Prod
#$folderOrigen = "\\ENV005UT001.srsplatform.com\IOLDocuments\OEDocs" 
#$folderDest   = "\\ENV005UT001.srsplatform.com\IOLDocumentsSTAGE\OEDocs" 
#$logFilePath  = "D:\Ops\PublishedData\ContentTeam\ContentDevelopment\ReleaseImprovements\SyncFoldersUIFiles\PSScriptLog.txt"

# Stage
#$folderOrigen = "\\filesrsut02\IOLDocuments\OEDocs" 
#$folderDest   = "\\filesrsut02\IOLDocumentsSTAGE\OEDocs" 
#$logFilePath  = "D:\Ops\PublishedData\ContentTeam\ContentDevelopment\ReleaseImprovements\SyncFoldersUIFiles\PSScriptLog.txt"

param([string]$logFilePath,[string]$folderOrigen,[string]$folderDest)

$source1 = (Get-ChildItem -path $folderOrigen)
$dest1   = (Get-ChildItem -path $folderDest)
$cant    = 0

function WriteLog
{
    Param ([string]$LogString)
    $LogFile    = $LogFilePath
    $DateTime   = "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)
    $LogMessage = "$Datetime $LogString"
    Add-content $LogFile -value $LogMessage
}

write-host "This script syncronize the folders between $($folderOrigen) and $($folderDest)"
Write-Host "`n"
write-host "Starting..."

Try {
    WriteLog "Beginning exeuction of the script:"

    Compare-Object -ReferenceObject $dest1 -DifferenceObject $source1 -Property Name, SideIndicator | Where-Object {$_.SideIndicator -eq "=>"} | 
    ForEach-Object {        
       
        #WriteLog $_.Name
        $cant++ 
    
        $DateTime   = "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)
        WriteLog $DateTime
        
        WriteLog "Copying folder from $($folderOrigen) to $($folderDest): $($_.Name)"   
        
        write-host "Copying folder: $($_.Name) - Ok"

        Copy-Item "$folderOrigen\$($_.Name)" -Destination "$folderDest" -Recurse -Force     

    }
    WriteLog "Total of folders copied: $($cant)"
    WriteLog "Completed exeuction of the script!"
    
    write-host "Folders copied: $($cant)"
    Write-Host "`n"
    write-host "Completed script!"    
    read-host “Press ENTER to continue...”
    }
Catch
    {        
        WriteLog -f Red "Error:" $_.Exception.Message
    }