IncludeDir = {}
IncludeDir["stb_image"] = "extlibs/headers/stb_image"
IncludeDir["glad"] = "extlibs/headers/glad/include"
IncludeDir["freetype2"] = "extlibs/headers/freetype2"
IncludeDir["vulkan"] = "extlibs/headers/vulkan"

project "tmxlite"
    kind "StaticLib"
    architecture "x64"
    language "C++"
    staticruntime "on"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "tmxlite/src/**.h",
        "tmxlite/src/**.hpp",
        "tmxlite/src/**.cpp",
        "tmxlite/src/**.c",
        "tmxlite/src/**.inl",
    }
    
    includedirs 
    {
        "tmxlite/include",
    }

    defines { "TMXLITE_STATIC" }

    characterset "MBCS"

    filter "configurations:Debug"
        targetsuffix "-s-d"
        defines {
            "_CRT_SECURE_NO_WARNINGS",
            "_MBCS",
        }
        symbols "On"

    filter "configurations:Release"
        targetsuffix "-s"
        defines { 
            "_CRT_SECURE_NO_WARNINGS",
            "_MBCS",
        }
        optimize "On"

