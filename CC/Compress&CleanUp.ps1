# Ruta del exe de 7Zip
$7zipPath = "C:\Program Files\7-Zip\7z.exe"

# Ruta de la carpeta principal que contiene subcarpetas
$carpetaPrincipal = "C:\Archive\Beta\Logger\BETAWEBSRSUT12"

# Ruta de la carpeta de respaldo
$carpetaBackup = Join-Path -Path $carpetaPrincipal -ChildPath "Backup"

# Crear la carpeta "backup" si no existe
if (-not (Test-Path -Path $carpetaBackup)) {
    New-Item -Path $carpetaBackup -ItemType Directory
}

# Obtener la fecha límite (01/01/2023)
$fechaLimite = Get-Date -Year 2023 -Month 4 -Day 1

# Contador de archivos 7zip generados
$contadorArchivos7zip = 0

# Recorre todas las subcarpetas en la carpeta principal
Get-ChildItem -Path $carpetaPrincipal -Directory | ForEach-Object {
    $subcarpeta = $_.FullName
    
    if ($subcarpeta -ne $carpetaBackup) {

        $nombreArchivo7zip = Join-Path -Path $carpetaBackup -ChildPath ($_.Name + ".7z")  
        
        Write-Host "Comprimiendo archivos de la carpeta" $subcarpeta         
        # Crear un archivo 7zip de la subcarpeta
        & $7zipPath a -t7z "$nombreArchivo7zip" "$subcarpeta\*"

        $contadorArchivos7zip++

        Write-Host "Eliminando archivos anteriores al " $fechaLimite      
        # Eliminar archivos anteriores a 2023 en la subcarpeta
        Get-ChildItem -Path $subcarpeta -File | Where-Object { $_.LastWriteTime -lt $fechaLimite } | Remove-Item -Force
        }
        
    }
    Write-Host "El proceso creo $contadorArchivos7zip archivos 7zip" 
    
