param(
  [switch] $clean,
  [switch] $run,
  [switch] $release
)

$endl = "`n"

if ($clean -eq $true) {
  $projects = @(
    "ConsoleDimensions",
    "Sandbox"
  )

  foreach ($project in $projects) {
    $buildPath = "./$project/build"
    if (Test-Path $buildPath) {
      Write-Output "Removing $project binaries at $buildPath..."
      Remove-Item -r $buildPath
    }
  }

  Write-Output $endl
}

Write-Output "Generating Make Files..."
.\vendor\bin\premake\premake5.exe gmake2
Write-Output $endl

Write-Output "Building Project..."
$makeConfig = if ($release -eq $true) { "release" } else { "debug" }
make config=$makeConfig
Write-Output $endl

if ($run -eq $true) {
  Write-Output "Running..."
  $config = if ($release -eq $true) { "Release" } else { "Debug" }
  $runCmd = ".\Sandbox\build\$config-windows-x86_64\bin\Sandbox.exe"
  Invoke-Expression $runCmd
}
