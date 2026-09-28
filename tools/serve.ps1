# Minimal statik dosya sunucusu (Windows PowerShell, harici bagimlilik yok)
# Kullanim:  .\tools\serve.ps1          -> http://127.0.0.1:8642/
#            .\tools\serve.ps1 -Port 9000
param(
  [int]$Port = 8642
)

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$prefix = "http://127.0.0.1:$Port/"

$mime = @{
  '.html' = 'text/html; charset=utf-8'
  '.css'  = 'text/css; charset=utf-8'
  '.js'   = 'application/javascript; charset=utf-8'
  '.json' = 'application/json'
  '.png'  = 'image/png'
  '.jpg'  = 'image/jpeg'
  '.svg'  = 'image/svg+xml'
  '.ico'  = 'image/x-icon'
  '.woff2'= 'font/woff2'
}

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($prefix)
$listener.Start()
Write-Host "Serving $root at $prefix"

while ($listener.IsListening) {
    $ctx = $listener.GetContext()
    try {
        $path = $ctx.Request.Url.AbsolutePath
        if ($path -eq '/') { $path = '/index.html' }
        $file = Join-Path $root ($path -replace '/', '\')
        if ((Test-Path $file -PathType Leaf) -and (-not ($file -match '\\tools\\'))) {
            $ext = [System.IO.Path]::GetExtension($file).ToLower()
            $ct = if ($mime.ContainsKey($ext)) { $mime[$ext] } else { 'application/octet-stream' }
            $bytes = [System.IO.File]::ReadAllBytes($file)
            $ctx.Response.ContentType = $ct
            $ctx.Response.ContentLength64 = $bytes.Length
            $ctx.Response.Headers['Cache-Control'] = 'no-store'
            $ctx.Response.OutputStream.Write($bytes, 0, $bytes.Length)
        } else {
            $ctx.Response.StatusCode = 404
            $msg = [System.Text.Encoding]::UTF8.GetBytes('404 not found')
            $ctx.Response.OutputStream.Write($msg, 0, $msg.Length)
        }
    } catch {
        Write-Host "ERR: $_"
    } finally {
        try { $ctx.Response.OutputStream.Close() } catch {}
    }
}
