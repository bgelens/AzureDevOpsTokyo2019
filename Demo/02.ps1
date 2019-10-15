<# Azure Functions Introduction
    Create your first PowerShell function in Azure (preview)
    https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-first-function-powershell
#>

$currentContext = $psEditor.GetEditorContext()
$workingDir = Split-Path -Path $currentContext.CurrentFile.Path
Set-Location -Path $workingDir

# prereqs, Azure Function Core Tools https://github.com/Azure/azure-functions-core-tools and dotnet core 2.2
Get-Command -Name func
func --version

Get-Command -Name dotnet
dotnet --version

# start developing
New-Item -ItemType Directory -Path ./DemoApp -Force | Set-Location

# help?
func

# create project
func init
#func init --worker-runtime powershell

# look at files, disable managedDependency, UseDevelopmentStorage=true, loglevel trace
# start azurite and open storage explorer

# create http function
func new
#func new --template httptrigger --name demo
#func new --template 'AzureQueueStoragetrigger' --name demo2

# look at files, make anonymous, add wait-debugger to http, configure queue connection AzureWebJobsStorage
# talk about modules

# run function app locally
func start

# in another windows run:
Invoke-RestMethod http://localhost:7071/api/demo
Invoke-RestMethod http://localhost:7071/api/demo?name=Japan
Invoke-RestMethod http://localhost:7071/api/demo -Method Post -ContentType 'application/json' -Body (
    @{
        Name = 'Japan'
    } | ConvertTo-Json
)

# add queue item

# stop function app

# publish to pre-created azure function app, remove wait-debugger first!
Get-AzWebApp -ResourceGroupName bgdemojapan
func azure functionapp publish bgdemojapan

# interact with published function app
Invoke-RestMethod -Uri https://bgdemojapan.azurewebsites.net/api/demo?name=Japan!

# connect with storage explorer
#$st = Get-AzStorageAccount -ResourceGroupName bgdemojapan
#$st | New-AzStorageQueue -Name ps-queue-items
#$st.Context.ConnectionString | clip

# attach logsteam and send queue message, note that it might take some time to show up!
#func azure functionapp logstream bgdemojapan
