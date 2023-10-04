# ZIP every folder in the templates folder and copy it to the project templates folder

$projectTemplatesFolder = "./templates";
$templates = Get-ChildItem -Path $projectTemplatesFolder | Select-Object -ExpandProperty Name

foreach ($folder in $templates){
	echo "Compress Folder: $folder";
	
	if(Test-Path "./WinUI-UnitTest-Templates/ProjectTemplates/$folder.zip"){
		Remove-Item "./WinUI-UnitTest-Templates/ProjectTemplates/$folder.zip"
	}
	
	Compress-Archive -Path "$projectTemplatesFolder/$folder" -Destination "./WinUI-UnitTest-Templates/ProjectTemplates/$folder.zip"
}