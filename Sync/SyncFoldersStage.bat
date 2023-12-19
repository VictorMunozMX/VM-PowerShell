@echo off

Powershell.exe -executionpolicy bypass -File SyncFoldersUIFilesStageProd.ps1 -logFilePath "D:\Ops\PublishedData\ContentTeam\ContentDevelopment\ReleaseImprovements\SyncFoldersUIFiles\PSScriptLog.txt" -folderOrigen "\\filesrsut02.identifix.com\UIFilesQueue\Release-20230829\ColorWiringDiagrams\SVG" -folderDest "\\filesrsut02\IOLDocumentsSTAGE\ColorWiringDiagrams\SVG"
