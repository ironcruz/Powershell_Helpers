$url= "https://dev.azure.com/""/""/_apis/build/builds?statusFilter=notStarted&api-version=5.1"

$pat=""

$base64AuthInfo= [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(":$($pat)"))

$pendingJobs=Invoke-RestMethod -Uri $url -Headers @{Authorization = ("Basic {0}" -f $base64AuthInfo)} -Method get -ContentType "application/json" 

$jobsToCancel = $pendingJobs.value

#Pending jobs donot consume the job agents in the agent pool. To filter the definition name to cancel pending jobs for a particular pipeline, you can use below filter criteria. 
#$jobsToCancel = $pendingJobs.value | where {$_.definition.Name -eq "{Name of your pipeline }"}

#call update api to cancel each job.
ForEach($build in $jobsToCancel)
{
    if ($build.definition.name -eq "APPS-LayerStatusCheck"){
        Write-Host $build.definition.name
        Write-Host $build.url
        $build.status = "Cancelling"
        $body = $build | ConvertTo-Json -Depth 10
        $urlToCancel = "https://dev.azure.com/""/""/_apis/build/builds/$($build.id)?api-version=5.1"
        Invoke-RestMethod -Uri $urlToCancel -Method Patch -ContentType application/json -Body $body -Header @{Authorization = ("Basic {0}" -f $base64AuthInfo)}
   }
}