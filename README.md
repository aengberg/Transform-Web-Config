# Transform-Web-Config

## How to use
Github Action that uses same XML Transformation as msbuild but does'nt require a csproj-file.
The powershell script uses Microsoft.Web.XmlTransform 3.1.0 downloaded from https://www.nuget.org/packages/Microsoft.Web.Xdt/

In the current release the action needs full path to the web.config-files

```yaml
name: "Transform web.config"
on: [push]

jobs:
  deploy:
  runs-on: windows
  steps:
  - uses: aengberg/Transform-Web-Config@v1.0.3
  with:
        basefile: "${{ github.workspace }}/Web.config"
        transformfile: "${{ github.workspace }}/Web.Release.config"
```
