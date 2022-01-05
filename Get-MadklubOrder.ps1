#Create array of the madklubs. That's good english!
$madklubber = "Maj & Thomas", "Anette & Emil", "Tine & Magnus", "Anto og Morten", "Jesper & Sidsel", "Emilie", "Casper & Elisabet", "Magga og David", "Matias og Marina"

#List them in the typed order
write-host "The Madklubs are in the typed order:"
$madklubber

$numberOfMadklubber = $madklubber.Count
$numberOfMadklubberZeroIndexed = $numberOfMadklubber - 1

Write-Host "That's a total of" $numberOfMadklubber "(zeroindexed:" $numberOfMadklubberZeroIndexed ")"
#General description of random method used by random.org
#https://www.random.org/randomness/


#Short description
#Quantum Events or Chaotic Systems?
#One characteristic that builders of TRNGs sometimes discuss is whether the physical phenomenon used is a quantum phenomenon or a phenomenon with chaotic behaviour. 
#There is some disagreement about whether quantum phenomena are better or not, and oddly enough it all comes down to our beliefs about how the universe works. 
#The key question is whether the universe is deterministic or not, i.e., whether everything that happens is essentially predetermined since the Big Bang. 
#Determinism is a difficult subject that has been the subject of quite a lot of philosophical inquiry, and the problem is far from as clear cut as you might think. 
#I will try and explain it here, but would also like to point out that Wikipedia has a concise account of the debate.

#Documentation from Random.org
#https://www.random.org/clients/http/
#Please note that the HTTP Interface was used, and not the experimental API Rest interface, because we can't let decisions like this 
#rely on experimental interface, also I was lazy
write-host "`nWe now call upon the randomness served by the universe!"

#Please note, like a real programming language, Powershell uses zero indexing
#https://softwareengineering.stackexchange.com/questions/110804/why-are-zero-based-arrays-the-norm
$randomDotOrgUrl = "https://www.random.org/sequences/?min=0&max=" + $numberOfMadklubberZeroIndexed + "&col=1&format=plain&rnd=new"
Write-Host "Url to call:" $randomDotOrgUrl
$webrequest = Invoke-WebRequest -URI  $randomDotOrgUrl

$order = $webrequest.Content -split "`n" | Where-Object {$_ -ne ""} 
write-host "`nWe have received the following order:"
$order


$i=1;
foreach ($number in $order)
{
    write-host "Madklub number #$i is:" $madklubber[$number]
    $i++
}




