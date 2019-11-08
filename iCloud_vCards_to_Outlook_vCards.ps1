clear-host
$ifile = $args[0]

if($ifile -eq $NULL)
    {
        Write-Host How to use: .\iCloud_vCards_to_Outlook_vCards.ps1 filenameofvcard.vcf
        Exit
    }

    Write-Host Output: $ifile
    $i = 1
    switch -regex -file $ifile
    {

        "^BEGIN:VCARD" {
            if($FString){
                $FString | out-file -Encoding "ASCII" "$ifile.$i.vcf"};
                $FString = $_;$i++
            }
        "^(?!BEGIN:VCARD)" {$FString += "`r`n$_"}
    }

Write-Host Fin.
Write-Host $i VCards
