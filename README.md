# Transform-Web-Config

## How to use
Github Action that uses same XML Transformation as msbuild but does'nt require a csproj-file.
The powershell script uses Microsoft.Web.XmlTransform 3.1.0 downloaded from https://www.nuget.org/packages/Microsoft.Web.Xdt/

```yaml
name: "Transform web.config"
on: [push]

jobs:
  deploy:
  runs-on: windows
  steps:
  - uses: aengberg/Transform-Web-Config@v1.0.3
  with:
        basefile: "Web.config"
        transformfile: "Web.Release.config"
```
