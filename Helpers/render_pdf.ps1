# This may be expanded
$paths = @(
    "..\FIE";
    "..\Relics"
)

# Use Word to render these files
$word_app = New-Object -ComObject Word.Application

foreach ($path in $paths) {
    # Create PDF folders
    if (-not (Test-Path -Path "${path}\PDF")) {
        New-Item -Path $path -Name "PDF" -ItemType "directory"
    }
    
    # This basically as if you were actually in Word
    Get-ChildItem -Path $path -Filter *.doc? | ForEach-Object {
        $document = $word_app.Documents.Open($_.FullName)
        $pdf_filename = "$($_.DirectoryName)\PDF\$($_.BaseName).pdf"
        $document.SaveAs([ref] $pdf_filename, [ref] 17)
        $document.Close()
    }
}

# Dispose of com object
$word_app.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($word_app)