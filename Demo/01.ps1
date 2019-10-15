<# Azure Functions Introduction
    Deploy function app Azure Resource using template
#>
$functionApp = 'bgdemojapan'
$currentContext = $psEditor.GetEditorContext()
$workingDir = Split-Path -Path $currentContext.CurrentFile.Path
$premiumJson = Join-Path -Path $workingDir -ChildPath 'premium.json'
$location = 'japanwest'

$rg = New-AzResourceGroup -Name $functionApp -Location $location

New-AzResourceGroupDeployment `
    -TemplateFile $premiumJson `
    -ResourceGroupName $rg.ResourceGroupName `
    -TemplateParameterObject @{functionAppName = $functionApp} `
    -AsJob

# show creation in portal, and how to create in portal