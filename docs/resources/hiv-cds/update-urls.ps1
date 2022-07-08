clear
echo "Adding .json suffix"
get-childitem ./ -recurse -include *.json | 
  select -expand fullname |
    foreach {
            (Get-Content $_) -replace '(")(http://fhir.org/guides/nachc/hiv-cds/ValueSet/nachc-[^"]*)(\")', ('"' + '$2' + '.json"') |
             Set-Content $_
    }

get-childitem ./ -recurse -include *.json | 
  select -expand fullname |
    foreach {
            (Get-Content $_) -replace '\.json\.json', ('.json') |
             Set-Content $_
    }


