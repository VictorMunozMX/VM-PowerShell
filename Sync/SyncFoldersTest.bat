@echo off

Powershell.exe -executionpolicy bypass -File SyncFoldersUIFilesStageProd.ps1 -logFilePath "C:\Users\Enrique.Munoz\OneDrive - Solera Holdings, Inc\Documents\Releases\CopyFoldersUIFiles\PSScriptLog.txt" -folderOrigen "C:\Users\Enrique.Munoz\OneDrive - Solera Holdings, Inc\Documents\Releases\CopyFoldersUIFiles\iol" -folderDest "C:\Users\Enrique.Munoz\OneDrive - Solera Holdings, Inc\Documents\Releases\CopyFoldersUIFiles\stage"

