# stop azurite!
$functionApp = 'bgdemojapan'

$currentContext = $psEditor.GetEditorContext()
$workingDir = Split-Path -Path $currentContext.CurrentFile.Path
Set-Location -Path $workingDir

Remove-AzResourceGroup -Name $functionApp -Force -AsJob
Remove-Item ./DemoApp -Recurse -Force
Remove-Item ../__azurite* -Force
Remove-Item ../__queuestorage__ -Recurse -Force
Remove-Item ../__blobstorage__ -Recurse -Force