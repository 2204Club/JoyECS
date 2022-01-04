project "nanamecs_core"
   kind "StaticLib"
   language "C++"
   targetdir "%{wks.location}/bin/%{cfg.buildcfg}"
   files { "**.h", "**.c" }
   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"
   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"