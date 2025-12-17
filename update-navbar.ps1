# Script to update navbar across all HTML pages in Sunchi
$navbarFile = "navbar.html"
$navbarContent = Get-Content $navbarFile -Raw

$files = @("About.html", "Contact.html", "Products.html", "Page-2.html", "Page-3.html", "Page-4.html", "Page-5.html", "login.html")

foreach ($file in $files) {
    if (Test-Path $file) {
        $content = Get-Content $file -Raw
        
        # Check if navbar already exists
        if ($content -match '<header class=" u-border-no-bottom') {
            Write-Host "Navbar already exists in $file - skipping" -ForegroundColor Yellow
        } else {
            # Find the body tag and insert navbar after it
            $content = $content -replace '(<body[^>]*>)', "`$1$navbarContent"
            Set-Content $file -Value $content -NoNewline
            Write-Host "Added navbar to $file" -ForegroundColor Green
        }
    } else {
        Write-Host "File not found: $file" -ForegroundColor Red
    }
}

Write-Host "`nNavbar update complete!" -ForegroundColor Cyan
