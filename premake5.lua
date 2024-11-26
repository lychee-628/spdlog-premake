project "spdlog"
  kind "StaticLib"
  language "C++"
  staticruntime "on"

  systemversion "latest"
  cppdialect "C++20"

  targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
  
  includedirs "include/"
  files
  {
    "include/**.h",
    "src/**.cpp"
  }
  
  defines "SPDLOG_COMPILED_LIB"

  filter { "system:windows" } -- Probably a windows only thing, although I'm not sure
    buildoptions { "/utf-8" }


  --Adapt these configuration to fit yours
  filter "configurations:debug"
		symbols "on"

	filter "configurations:release"
		optimize "on"

  filter "configurations:dist"
		optimize "speed"
    symbols "off"