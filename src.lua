local user = "pitzachef"
local repo = "version"
local version = game:HttpGet(string.format("https://github.com/%s/%s/version.txt", user, repo))

if not isfolder("gunc") then makefolder("gunc") end

function download(version)
    local url = string.format("https://github.com/%s/%s/%s/src.luau", user, repo, version)
    local u_url = string.format("https://github.com/%s/%s/src.lua", user, repo)
    writefile("gunc/src.lua", game:HttpGet(url))
    writefile("gunc/updater.lua", game:HttpGet(u_url))
end

return download(version)
