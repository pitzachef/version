local user = "pitzachef"
local repo = "version"
local version = game:HttpGet(string.format("https://raw.githubusercontent.com/%s/%s/main/version.txt", user, repo))

if not isfolder("gunc") then makefolder("gunc") end

function download(version)
    writefile("gunc/src.lua", game:HttpGet(string.format("https://raw.githubusercontent.com/%s/%s/%s/main/src.luau", user, repo, version)))
    writefile("gunc/updater.lua", game:HttpGet(string.format("https://raw.githubusercontent.com/%s/%s/main/src.lua", user, repo)))
end

return {install=function() download(version) warn("gunc installed version:"..version) return loadstring(readfile("gunc/src.lua"))() end}
