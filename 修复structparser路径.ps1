# 修复所有项目文件中的 structparser 路径

$repoRoot = "I:\wdym\GameServer-PVP"
$oldPath = "..\..\utilities\bin\structparser"
$newPath = "`$(SolutionDir)Utilities\bin\StructParser.exe"

Write-Host "正在修复 structparser 路径..." -ForegroundColor Cyan

# 查找所有 .vcxproj 文件
$projectFiles = Get-ChildItem -Path $repoRoot -Recurse -Filter "*.vcxproj" | Where-Object {
    $_.FullName -notmatch "\\obj\\" -and 
    $_.FullName -notmatch "\\bin\\" -and
    $_.FullName -notmatch "Utilities\\StructParser"
}

$fixedCount = 0

foreach ($file in $projectFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $originalContent = $content
    
    # 替换路径
    $content = $content -replace [regex]::Escape($oldPath), $newPath
    
    if ($content -ne $originalContent) {
        # 备份
        $backupFile = $file.FullName + ".backup"
        Copy-Item $file.FullName $backupFile -Force
        
        # 保存
        [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.Encoding]::UTF8)
        
        Write-Host "  已修复: $($file.Name)" -ForegroundColor Yellow
        $fixedCount++
    }
}

Write-Host ""
Write-Host "完成！修复了 $fixedCount 个项目文件" -ForegroundColor Green
