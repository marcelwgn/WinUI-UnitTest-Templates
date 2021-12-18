# ZIP every folder in the templates folder and copy it to the project templates folder

$projectTemplatesFolder = "./templates";
$templates = Get-ChildItem -Path $projectTemplatesFolder -Directory -Force -ErrorAction SilentlyContinue

foreach ($folder in $templates){
	$folderName = $folder.NameString
	if(Test-Path "./WinUI_UnitTestTemplates/ProjectTemplates/$folderName.zip"){
		Remove-Item "./WinUI_UnitTestTemplates/ProjectTemplates/$folderName.zip"
	}
	Compress-Archive -Path "$projectTemplatesFolder/$folderName" -Destination "./WinUI_UnitTestTemplates/ProjectTemplates/$folderName.zip"
}