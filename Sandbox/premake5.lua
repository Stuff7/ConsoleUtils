project "Sandbox"
  kind "ConsoleApp"
  language "C++"
  cppdialect "c++2a"
  staticruntime "on"
  warnings "Extra"

  targetdir (bindir)
  objdir (binintdir)

  files {
    "src/**.h",
    "src/**.cpp"
  }

  includedirs {
    "%{includeDir.ConsoleDimensions}",
  }

  links {
    "ConsoleDimensions",
  }

  filter "system:windows"
    systemversion "latest"

  filter "configurations:Debug"
    defines "CUTILS_DEBUG"
    runtime "Debug"
    symbols "on"

  filter "configurations:Release"
    defines "CUTILS_RELEASE"
    runtime "Release"
    optimize "on"
