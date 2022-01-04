workspace "Nanamecs"
   location "build"
   configurations { "Debug", "Release" }
   postbuildcommands {
        ("{COPY} %{cfg.buildtarget.relpath} \"../bin/\"")
   }

function IncludeRec(path)
    if string.sub(path, 1, 1) ~= "/" then path = "/"..path end
    if string.sub(path, -1) ~= "/" then path = path .. "/" end
    local allpaths = os.matchdirs(os.getcwd()..path.."**")
    for _,v in ipairs(allpaths) do
        if #os.matchfiles(v .. "/premake5.lua") ~= 0 then include(v) end
    end
end
IncludeRec("src")