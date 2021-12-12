
cd .\
if ( -not ( Test-Path .\PDFy -PathType Container ) ) {
    New-Item -Name PDFy -ItemType Directory
}
foreach ($plik in Get-ChildItem -Path .\* -Include *.pdf) {
    if ( -not ( Test-Path .\PDFy\$plik.Name -PathType Leaf ) ) {
        Move-Item $plik.Name -Destination .\PDFy\
    }
}
cd .\PDFy
foreach ($plik in Get-ChildItem -Path .\*) {
    $utworzono = $plik.CreationTime.toString("dd.MM.yyyy")
    if ( -not (  Test-Path .\$utworzono -PathType Container ) ) {
        New-Item -Name $utworzono -ItemType Directory
    }
    Move-Item -Path $plik -Destination .\$utworzono\
}
