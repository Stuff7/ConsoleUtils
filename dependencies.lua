outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
bindir = "./build/%{outputdir}/bin/"
binintdir = "./build/%{outputdir}/"

includeDir = {}
includeDir["ConsoleDimensions"] = "%{wks.location}/ConsoleDimensions/src"
