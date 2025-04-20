local user = "pitzachef"
local repo = "version"
local version = game:HttpGet(string.format("https://github.com/%s/%s/version.txt", user, repo))

if not isfolder("gunc") then makefolder("gunc") end

function download(version)
    writefile("gunc/src.lua", game:HttpGet(string.format("https://github.com/%s/%s/%s/src.luau", user, repo, version)))
    writefile("gunc/updater.lua", game:HttpGet(string.format("https://github.com/%s/%s/src.lua", user, repo)))
end

return {install=function() download(version) return loadfile("gunc/src.lua")() end}
