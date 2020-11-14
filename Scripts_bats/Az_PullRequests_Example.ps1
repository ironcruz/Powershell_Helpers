$token = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(":$($args[0])"))

$header = @{authorization = "Basic $token"}

 

#region Functions

Function getRepos($sourceRef, $targetRef)

{

    $reposUrl = "your azure url here"

    $getRepos = Invoke-RestMethod -Uri $reposUrl -Method 'Get' -ContentType "application/json" -Headers $header

    $getRepos.value | ForEach-Object{

        If ($_.name -Match $repo){

        

        return $_.id, $_.name

        }

    }

}

 

Function createPullRequest($sourceRef, $targetRef, $title)

{

    $repoInfo = getRepos $sourceRef $targetRef

    $repoID = $repoInfo[0]

    $repoName = $repoInfo[1]

    $PR_Body= @"

        {

          "sourceRefName": "$sourceRef",

          "targetRefName": "$targetRef",

          "title": "$title",

          "description": "Automated pull request, $repoName, $sourceRef to $targetRef",

        }

"@


    ""

 

    $PRUri = "your azure url here" + $repoID+"/pullrequests?api-version=5.1"

 

    $Response = Invoke-RestMethod -Uri $PRUri `

                                  -Method Post `

                                  -ContentType "application/json" `

                                  -Headers $header `

                                  -Body $PR_Body

 

 

    return $Response.url

}

 

Function getCreatedByID($sourceRef, $targetRef, $title)

{

    #Write-Host "creating pull request"

    $PR = createPullRequest $sourceRef $targetRef $title

    $getCreatedByID = Invoke-RestMethod -Uri "$PR" -Method 'Get' -ContentType "application/json" -Headers $header

 

    $createdByID = $getCreatedByID.createdBy.url.split("/")[6]

    return $PR , $createdByID

 

}

 

Function completePullRequest($sourceRef, $targetRef, $title)

{

    $PR = getCreatedByID $sourceRef $targetRef $title

    $PRUrl = $PR[0] + "?api-version=5.1"

    $CreatedByID = $PR[1]

 

    $PR_Update_JSONBody= @"

              {

                "autoCompleteSetBy": {

                    "id": "$createdByID"

               },

              "completionOptions": {

                "deleteSourceBranch": "false",

                "MergeStrategy" : "rebase",

                "mergeCommitMessage": "Added known issues document",

                "squashMerge": "false"

              }

            }

"@

    $UpdateResponse = Invoke-RestMethod -Uri "$PRUrl" `

                               -Method PATCH `

                               -ContentType "application/json" `

                               -Headers $header `

                               -Body $PR_Update_JSONBody

 

    #"Completed pull request for $PRUrl"

}

#endregion

 

#region vars

$repo = $args[1]

$title = $args[3..$args.Length]

#endregion

 

 

#region call pull requests

if($args[2] -eq "test"){

        $sourceRef = "refs/heads/DEV"

        $targetRef = "refs/heads/TEST"

        "creating DEV to TEST Pull Request for"+ "  $repo"

        completePullRequest $sourceRef $targetRef $title

        "Pull Request completed"

}

 

elseif($args[2] -eq "master"){

    $sourceRef = "refs/heads/TEST"

    $targetRef = "refs/heads/master"

    "creating TEST to master Pull Request for" + " $repo"

    completePullRequest $sourceRef $targetRef $title

    "Pull Request completed"

    }

 

elseif($args[2] -eq "all"){

    $sourceRef = "refs/heads/DEV"

    $targetRef = "refs/heads/TEST"

    "creating DEV to TEST Pull Request for"+ "  $repo"

    completePullRequest $sourceRef $targetRef $title

    "Pull Request completed"

   

    Start-Sleep -Seconds 5

 

    "creating TEST to master Pull Request" + " $repo"

    Set-Variable -Name "sourceRef" -Value "refs/heads/TEST"

    Set-Variable -Name "targetRef" -Value "refs/heads/master"

    completePullRequest $sourceRef $targetRef $title

    "Pull Request completed"

}
#endregion