# Build script: injects Three.js into the game HTML with proper UTF-8 (no BOM)
$threejs = [System.IO.File]::ReadAllText("C:\Users\Administrador\threejs_r128.min.js", [System.Text.Encoding]::UTF8)
$gameHtml = [System.IO.File]::ReadAllText("e:\Antigravity\Esculibiertu-3D\game_template.html", [System.Text.Encoding]::UTF8)
$output = $gameHtml.Replace("__THREEJS_PLACEHOLDER__", $threejs)
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText("e:\Antigravity\Esculibiertu-3D\EsculibiertU-3D.html", $output, $utf8NoBom)
Write-Host "Game built! File size: $([math]::Round((Get-Item 'e:\Antigravity\Esculibiertu-3D\EsculibiertU-3D.html').Length / 1KB, 1)) KB"
