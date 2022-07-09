clear
echo "Adding .json suffix..."
get-childitem ./ -recurse -include *.json | 
  select -expand fullname |
    foreach {
            (Get-Content $_) -replace '(")(http://fhir.org/guides/nachc/hiv-cds/ValueSet/nachc-[^"]*)(\")', ('"' + '$2' + '.json"') |
             Set-Content $_
    }

echo "Cleaning up .json suffixes..."
get-childitem ./ -recurse -include *.json | 
  select -expand fullname |
    foreach {
            (Get-Content $_) -replace '\.json\.json', ('.json') |
             Set-Content $_
    }

echo "Updating urls..."
get-childitem ./ -recurse -include *.json | 
  select -expand fullname |
    foreach {
            (Get-Content $_) -replace '\.json\.json', ('.json') |
             Set-Content $_
    }

echo "Done."


