# Created by Victor Munoz
# Date: December 09, 2022
# v1. Folders y archivos en una carpeta

# Test 
$PahtFolders = "C:\Users\Enrique.Munoz\OneDrive - Solera Holdings, Inc\Documents\Releases\CopyFoldersUIFiles\iol\"
$PahtCSV = "C:\Users\Enrique.Munoz\OneDrive - Solera Holdings, Inc\Documents\Releases\CopyFoldersUIFiles\Content_test.csv"

# Prod
#$PahtFolders = "\\ENV005UT001.srsplatform.com\IOLDocuments\OEDocs"
#$PahtCSV = "D:\Ops\PublishedData\ContentTeam\ContentDevelopment\ReleaseImprovements\SyncFoldersUIFiles\Content_02.csv"

# Stage
#$PahtFolders = "\\ENV005UT001.srsplatform.com\IOLDocumentsSTAGE\OEDocs" 
#$PahtCSV = "D:\Ops\PublishedData\ContentTeam\ContentDevelopment\ReleaseImprovements\SyncFoldersUIFiles\Content_05.csv"

Get-ChildItem -path $PahtFolders | 
Foreach {
    $Files = Get-ChildItem $_.FullName -Recurse -File
    $Size = '{0:N2}' -f (( $Files | Measure-Object -Property Length -Sum).Sum /1KB)
    [PSCustomObject]@{Name = $_.FullName ; Content = "$($Files.Count)" ; SizeKB = $Size}
}| Export-CSV "$PahtCSV" -NoTypeInformation
