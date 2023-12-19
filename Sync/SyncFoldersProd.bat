@echo off

Powershell.exe -executionpolicy bypass -File SyncFoldersUIFilesStageProd.ps1 -logFilePath "D:\Ops\PublishedData\ContentTeam\ContentDevelopment\ReleaseImprovements\SyncFoldersUIFiles\PSScriptLog.txt" -folderOrigen "\\ENV005UT001.srsplatform.com\IOLDocuments\OEDocs" -folderDest "\\ENV005UT001.srsplatform.com\IOLDocumentsSTAGE\OEDocs"

