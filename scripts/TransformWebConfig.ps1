function TransformWebConfig([string]$baseFile, [string]$transformFile)
{
  $scriptpath = $PSScriptRoot + "\"
  $baseFilePath = $scriptpath + $baseFile
  $transformFilePath = $scriptpath + $transformFile
  
  Add-Type -LiteralPath "$PSScriptRoot\microsoft.web.xdt.3.1.0\lib\net40\Microsoft.Web.XmlTransform.dll"

  if(([string]::IsNullOrEmpty($baseFilePath)) -Or (-Not (Test-Path $baseFilePath)))
  {
	  throw "Base file not found";
  }
  
  if(([string]::IsNullOrEmpty($transformFilePath)) -Or (-Not (Test-Path $transformFilePath)))
  {
	  throw "Transform file not found";
  }
  
  $xmlTransformableDoc = New-Object   Microsoft.Web.XmlTransform.XmlTransformableDocument;
  $xmlTransformableDoc.PreserveWhitespace = $true
  $xmlTransformableDoc.Load($baseFilePath);

  $xmlTransformation = New-Object Microsoft.Web.XmlTransform.XmlTransformation($transformFilePath);
  if ($xmlTransformation.Apply($xmlTransformableDoc) -eq $false)
  {
	  throw "Transformation failed."
  }
  $xmlTransformableDoc.Save($baseFilePath);

  Write-Host "Transformation succeeded"
}