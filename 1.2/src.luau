--[[Create main frame
    if status == "pass" then
        icon.Image = "rbxassetid://4914902889"
    elseif status == "fail" then
        icon.Image = "rbxassetid://18281471142"
    elseif status == "warning" then
        icon.Image = "rbxassetid://85147473315465"
    else -- no test
        icon.Image = 0 -- Fallback if NoTest not defined
    end
]]
local passes, fails, undefined = 0, 0, 0
local running = 0

-- Create main frame with splash screen animation
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UNCEnvironmentCheck"
ScreenGui.Parent = game:GetService("CoreGui")


-- Splash Screen Animation
local SplashFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = SplashFrame
SplashFrame.Name = "SplashFrame"
SplashFrame.Size = UDim2.new(0, 255, 0, 255)
SplashFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
SplashFrame.AnchorPoint = Vector2.new(0.5, 0.5)
SplashFrame.BackgroundColor3 = Color3.fromRGB(13, 17, 23)
SplashFrame.BorderSizePixel = 0
SplashFrame.ZIndex = 10
SplashFrame.Parent = ScreenGui

-- Create splash text label
local SplashText = Instance.new("TextLabel")
SplashText.Name = "SplashText"
SplashText.Size = UDim2.new(1, 0, 0, 30)
SplashText.Position = UDim2.new(0, 0, 0.5, 80) -- Positioned below logo
SplashText.BackgroundTransparency = 1
SplashText.Text = "Checking for updates.."
local cv = "1.2"
local wlv = game:HttpGet("https://raw.githubusercontent.com/pitzachef/version/refs/heads/main/version.txt")
local wlurl = string.format("https://raw.githubusercontent.com/pitzachef/version/refs/heads/main/%d/src.luau", wlv)
if string.find(wlv,cv) then
	SplashText.Text = "Latest version: ".. wlv
else SplashText.Text = "Found update: ".. wlv
   loadstring(game:HttpGet(wlurl))()
   task.wait(1)
   ScreenGui:Destroy()
end


SplashText.TextColor3 = Color3.fromRGB(200, 200, 200)
SplashText.TextSize = 14
SplashText.Font = Enum.Font.Roboto
SplashText.TextTransparency = 1 -- Start invisible
SplashText.Parent = SplashFrame
SplashText.ZIndex = 511
local SplashLogo = Instance.new("ImageLabel")
SplashLogo.Name = "SplashLogo"
SplashLogo.Size = UDim2.new(0, 200, 0, 200)
SplashLogo.Position = UDim2.new(0.5, -100, 0.5, -100)
SplashLogo.BackgroundTransparency = 1
SplashLogo.Image = "rbxassetid://125610815999055" -- GitHub logo or your custom logo
SplashLogo.BackgroundTransparency = 1
SplashLogo.ZIndex = 11
SplashLogo.Parent = SplashFrame

-- Animate splash screen
task.spawn(function()
    -- Fade in animation (logo + text)
    for i = 1, 0, -0.05 do
        SplashFrame.BackgroundTransparency = i
        SplashLogo.ImageTransparency = i
        SplashText.TextTransparency = i
        task.wait(0.02)
    end
    
    -- Brief display
    task.wait(1.5) -- Display time
    
    -- Fade out animation (logo + text)
    for i = 0, 1, 0.05 do
        SplashFrame.BackgroundTransparency = i
        SplashLogo.ImageTransparency = i
        SplashText.TextTransparency = i
        task.wait(0.02)
    end
    
    SplashFrame:Destroy()
end)

task.wait(1.56)
local function getGlobal(path)
	local value = getfenv(0)

	while value ~= nil and path ~= "" do
		local name, nextValue = string.match(path, "^([^.]+)%.?(.*)$")
		value = value[name]
		path = nextValue
	end

	return value
end

-- Main UI
local MainFrame = Instance.new("ImageLabel")
MainFrame.Image = "rbxassetid://17493618226"
MainFrame.ImageTransparency = 0.8
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 650, 0, 550)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(13, 17, 23) -- GitHub dark background
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local DropShadow = Instance.new("ImageLabel")
DropShadow.Name = "DropShadow"
DropShadow.Image = "rbxassetid://18783399135"
DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow.ImageTransparency = 0.8
DropShadow.ScaleType = Enum.ScaleType.Slice
DropShadow.SliceCenter = Rect.new(10, 10, 118, 118)
DropShadow.Size = UDim2.new(1, 20, 1, 20)
DropShadow.Position = UDim2.new(0, -10, 0, -10)
DropShadow.BackgroundTransparency = 1
DropShadow.ZIndex = -1
DropShadow.Parent = MainFrame

-- Header
local Header = Instance.new("ImageLabel")
Header.Image = "rbxassetid://17493618226"
Header.ImageTransparency = 0.8
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 50)
Header.BackgroundColor3 = Color3.fromRGB(22, 27, 34) -- GitHub header dark
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local HeaderUICorner = Instance.new("UICorner")
HeaderUICorner.CornerRadius = UDim.new(0, 8)
HeaderUICorner.Parent = Header

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(0.7, -10, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "GUNC"
Title.TextColor3 = Color3.fromRGB(240, 246, 252) -- GitHub text white
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.Roboto
Title.TextSize = 16
Title.TextTruncate = Enum.TextTruncate.AtEnd
Title.Parent = Header

local Subtitle = Instance.new("TextLabel")
Subtitle.Name = "Subtitle"
Subtitle.Size = UDim2.new(0.7, -10, 0, 20)
Subtitle.Position = UDim2.new(0, 15, 0, 30)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "by cr1tcal3"
Subtitle.TextColor3 = Color3.fromRGB(139, 148, 158) -- GitHub text gray
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Font = Enum.Font.Roboto
Subtitle.TextSize = 7
Subtitle.TextTruncate = Enum.TextTruncate.AtEnd
Subtitle.Parent = Header

-- Close button
local CloseButton = Instance.new("ImageButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 12, 0, 12)
CloseButton.Position = UDim2.new(1, -25, 0, 18)
--UDim2.new(xS, xO, yS, yO)
CloseButton.BackgroundColor3 = Color3.fromRGB(33, 38, 45)
CloseButton.BorderSizePixel = 0
CloseButton.Image = "rbxassetid://5702663813" -- Close icon
CloseButton.Parent = Header
CloseButton.BackgroundTransparency = 1

CloseButton.MouseEnter:Connect(function()
    game:GetService("TweenService"):Create(CloseButton, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(48, 54, 61)
    }):Play()
end)

local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, -10, 1, -80)
ContentFrame.Position = UDim2.new(0, 5, 0, 50)
ContentFrame.BackgroundColor3 = Color3.fromRGB(13, 17, 23)
ContentFrame.BorderSizePixel = 0
ContentFrame.ClipsDescendants = true
ContentFrame.Parent = MainFrame
ContentFrame.ZIndex = 1

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Name = "ScrollFrame"
ScrollFrame.Size = UDim2.new(1, 0, 1, 0)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.BorderSizePixel = 0
ScrollFrame.ScrollBarThickness = 6
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(48, 54, 61)
ScrollFrame.ScrollBarImageTransparency = 0.5
ScrollFrame.Parent = ContentFrame
ScrollFrame.ZIndex = 1
CloseButton.MouseLeave:Connect(function()
    game:GetService("TweenService"):Create(CloseButton, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(33, 38, 45)
    }):Play()
end)

CloseButton.MouseButton1Click:Connect(function()
    -- Disable interaction immediately
    CloseButton.Active = false
    
    -- 1. Fade out all visible elements
    local elementsToFade = {}
    
    -- Collect all GUI objects
    local function collectElements(parent)
        for _, child in ipairs(parent:GetDescendants()) do
            if child:IsA("GuiObject") and child.Visible then
                table.insert(elementsToFade, child)
            end
        end
    end
    
    collectElements(MainFrame)
    if DropShadow then table.insert(elementsToFade, DropShadow) end
    
    -- Create fade tweens for each element
    local tweens = {}
    for _, element in ipairs(elementsToFade) do
        local props = {}
        if element:IsA("TextLabel") or element:IsA("TextButton") or element:IsA("TextBox") then
            props.TextTransparency = 1
        end
        if element:IsA("ImageLabel") or element:IsA("ImageButton") then
            props.ImageTransparency = 1
        end
        if element.BackgroundTransparency < 1 then
            props.BackgroundTransparency = 1
        end
        
        table.insert(tweens, game:GetService("TweenService"):Create(
            element,
            TweenInfo.new(1.5, Enum.EasingStyle.Quint),
            props
        ))

    end
    
    -- Play all tweens simultaneously
    for _, tween in ipairs(tweens) do
        tween:Play()
    end
		game:GetService("TweenService"):Create(
        MainFrame,
        TweenInfo.new(1.5, Enum.EasingStyle.Quint),
        { BackgroundTransparency = 1 }
    )
	MainFrame.BackgroundTransparency = 1
	MainFrame.ImageTransparency = 1
		game:GetService("TweenService"):Create(
        ScrollFrame,
        TweenInfo.new(1.5, Enum.EasingStyle.Quint),
        { ScrollBarImageTransparency = 1 }
    )
    ScrollFrame.ScrollBarImageTransparency = 1
		game:GetService("TweenService"):Create(
        ContentFrame,
        TweenInfo.new(1.5, Enum.EasingStyle.Quint),
        { BackgroundTransparency = 1 }
    )

    -- 2. After fadeout, recreate splash
    task.wait(0.5)
    
    local newScreenGui = Instance.new("ScreenGui")
    newScreenGui.Name = "UNCEnvironmentCheck_Splash"
    newScreenGui.Parent = game:GetService("CoreGui")
    
    -- Splash Frame

    local newSplashFrame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = newSplashFrame
    newSplashFrame.Size = UDim2.new(0, 255, 0, 255)
	newSplashFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	newSplashFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    newSplashFrame.BackgroundColor3 = Color3.fromRGB(13, 17, 23)
    newSplashFrame.BorderSizePixel = 0
    newSplashFrame.ZIndex = 10
    newSplashFrame.Parent = newScreenGui
    
    -- Splash Logo (starts invisible)
    local newSplashLogo = Instance.new("ImageLabel")
    newSplashLogo.Size = UDim2.new(0, 200, 0, 200)
    newSplashLogo.Position = UDim2.new(0.5, -100, 0.5, -100)
    newSplashLogo.BackgroundTransparency = 1
    newSplashLogo.Image = "rbxassetid://125610815999055" -- Your logo asset
    newSplashLogo.ImageColor3 = Color3.fromRGB(201, 209, 217)
    newSplashLogo.ZIndex = 11
    newSplashLogo.ImageTransparency = 1 -- Start invisible
    newSplashLogo.Parent = newSplashFrame
    
    -- Splash Text (starts invisible)
    local newSplashText = Instance.new("TextLabel")
    newSplashText.Size = UDim2.new(1, 0, 0, 30)
    newSplashText.Position = UDim2.new(0, 0, 0.5, 120)
    newSplashText.BackgroundTransparency = 1
    newSplashText.Text = "Shutting Down"
	newSplashText.ZIndex = 511
    newSplashText.TextColor3 = Color3.fromRGB(200, 200, 200)
    newSplashText.TextSize = 14
    newSplashText.Font = Enum.Font.Roboto
    newSplashText.TextTransparency = 1
    newSplashText.Parent = newSplashFrame
    newSplashText.Position = UDim2.new(0, 0, 0.5, 80)
    -- 3. Animate splash in and out
    -- Fade in
    for i = 1, 0, -0.05 do
        newSplashFrame.BackgroundTransparency = i
        newSplashLogo.ImageTransparency = i
        newSplashText.TextTransparency = i
        task.wait(0.03)
    end
    
    -- Display for 2 seconds
    task.wait(1.5)
    
    -- Fade out
    for i = 0, 1, 0.05 do
        newSplashFrame.BackgroundTransparency = i
        newSplashLogo.ImageTransparency = i
        newSplashText.TextTransparency = i
        task.wait(0.03)
    end
    
    -- Final cleanup
	    ScreenGui:Destroy()
    newScreenGui:Destroy()
end)

-- Content frame

-- Scroll frame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Name = "UIListLayout"
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.Parent = ScrollFrame

-- Status bar
local StatusBar = Instance.new("ImageLabel")
StatusBar.Image = "rbxassetid://17493618226"
StatusBar.ImageTransparency = 0.4
StatusBar.Name = "StatusBar"
StatusBar.Size = UDim2.new(1, -10, 0, 30)
StatusBar.Position = UDim2.new(0, 5, 1, -35)
StatusBar.BackgroundColor3 = Color3.fromRGB(22, 27, 34)
StatusBar.BorderSizePixel = 0
StatusBar.Parent = MainFrame
StatusBar.BackgroundTransparency = 0.5

local StatusUICorner = Instance.new("UICorner")
StatusUICorner.CornerRadius = UDim.new(0, 6)
StatusUICorner.Parent = StatusBar

local ProgressText = Instance.new("TextLabel")
ProgressText.Name = "ProgressText"
ProgressText.Size = UDim2.new(1, -20, 1, 0)
ProgressText.Position = UDim2.new(0, 10, 0, 0)
ProgressText.BackgroundTransparency = 1
ProgressText.Text = "Running tests..."
ProgressText.TextColor3 = Color3.fromRGB(139, 148, 158)
ProgressText.TextXAlignment = Enum.TextXAlignment.Left
ProgressText.Font = Enum.Font.Roboto
ProgressText.TextSize = 13
ProgressText.TextTruncate = Enum.TextTruncate.AtEnd
ProgressText.Parent = StatusBar

-- Image setup
local imageAssets = {
    Pass = "rbxassetid://82668563249216",       -- Green check
    Fail = "rbxassetid://18281471142",      -- Red X
    Warning = "rbxassetid://85147473315465", -- Yellow warning
    NoTest = "rbxassetid://7137686232"      -- Gray dot
}

-- Preload images
for _, id in pairs(imageAssets) do
    game:GetService("ContentProvider"):PreloadAsync({id})
end

-- Test entry function
local function createTestEntry(name, status, message)
    local entry = Instance.new("ImageLabel")
    entry.Name = name
	entry.Image = "rbxassetid://17493618226"
	entry.ImageTransparency = 0.8
    entry.Size = UDim2.new(1, -10, 0, 36)
    entry.BackgroundColor3 = Color3.fromRGB(22, 27, 34)
    entry.BorderSizePixel = 0
    entry.BackgroundTransparency = 1
    local entryCorner = Instance.new("UICorner")
    entryCorner.CornerRadius = UDim.new(0, 6)
    entryCorner.Parent = entry
    
    local icon = Instance.new("ImageLabel")
    icon.Name = "StatusIcon"
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    
    if status == "pass" then
        icon.Image = imageAssets.Pass
 -- GitHub green
    elseif status == "fail" then
        icon.Image = imageAssets.Fail -- GitHub red
    elseif status == "warning" then
        icon.Image = imageAssets.Warning -- GitHub yellow
    else -- no test
        icon.Image = imageAssets.NoTest
        icon.ImageColor3 = Color3.fromRGB(139, 148, 158) -- GitHub gray
    end
    icon.Parent = entry
            local messageLabel = Instance.new("TextLabel")
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "TestName"
    nameLabel.Size = UDim2.new(0.5, -40, 1, 0)
    nameLabel.Position = UDim2.new(0, 40, 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = name
    nameLabel.TextColor3 = Color3.fromRGB(240, 246, 252) -- GitHub text white
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.Font = Enum.Font.Roboto
    nameLabel.TextSize = 14
    nameLabel.TextTruncate = Enum.TextTruncate.AtEnd
    nameLabel.Parent = entry
    
    if message then
        messageLabel.Name = "TestMessage"
        messageLabel.Size = UDim2.new(0.5, -10, 1, 0)
        messageLabel.Position = UDim2.new(0.5, 0, 0, 0)
        messageLabel.BackgroundTransparency = 1
        messageLabel.Text = message
        messageLabel.TextColor3 = Color3.fromRGB(139, 148, 158) -- GitHub text gray
        messageLabel.TextXAlignment = Enum.TextXAlignment.Left
        messageLabel.Font = Enum.Font.Roboto
        messageLabel.TextSize = 12
        messageLabel.TextTruncate = Enum.TextTruncate.AtEnd
        messageLabel.TextWrapped = true
        messageLabel.Parent = entry
    end
    
    entry.Parent = ScrollFrame
    
    -- Auto-update scroll frame size
    local function updateSize()
        ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
    end
    
    UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateSize)
    task.defer(updateSize)
    
    -- Entry animation
    entry.BackgroundTransparency = 1
    if message then
        messageLabel.TextTransparency = 1
    end
    nameLabel.TextTransparency = 1
    icon.ImageTransparency = 1
    
    game:GetService("TweenService"):Create(entry, TweenInfo.new(0.3), {
        BackgroundTransparency = 0.6
    }):Play()
    
    game:GetService("TweenService"):Create(nameLabel, TweenInfo.new(0.3), {
        TextTransparency = 0
    }):Play()
    
    game:GetService("TweenService"):Create(icon, TweenInfo.new(0.3), {
        ImageTransparency = 0
    }):Play()
    
    if message then
        game:GetService("TweenService"):Create(messageLabel, TweenInfo.new(0.3), {
            TextTransparency = 0
        }):Play()
    end
    
    return entry
end

-- Rest of your code (test function, test cases, etc.) remains the same

local function test(name, aliases, callback)
    running = running + 1
    
    task.spawn(function()
        local entry
        local status = "notext"
        local message
        
        if not callback then
            -- No test case provided
            status = "fail"
            entry = createTestEntry(name, status)
        elseif not getGlobal(name) then
            -- Global doesn't exist
            fails = fails + 1
            status = "fail"
            entry = createTestEntry(name, status, "Global not found")
        else
            -- Run the test
            local success, result = pcall(callback)
            
            if success then
                -- Test passed
                passes = passes + 1
                status = "pass"
                message = result and tostring(result) or nil
                createTestEntry(name, "pass", message)
            else
                -- Test failed
                fails = fails + 1
                status = "fail"
                createTestEntry(name, "fail", "Failed: "..tostring(result))
            end
        end
        
        -- Check for undefined aliases
        local undefinedAliases = {}
        for _, alias in ipairs(aliases) do
            if getGlobal(alias) == nil then
                table.insert(undefinedAliases, alias)
            end
        end
        
        if #undefinedAliases > 0 then
            undefined = undefined + 1
            createTestEntry("⚠️ Aliases for "..name, "warning", table.concat(undefinedAliases, ", "))
        end
        
        running = running - 1
        ProgressText.Text = string.format("Running tests... (%d/%d)", passes + fails, passes + fails + running)
        
        if running == 0 then
            local rate = math.round(passes / (passes + fails) * 100)
            local outOf = passes.." out of "..(passes + fails)
            ProgressText.Text = string.format("%d%% success (%s) %d failed %d missing aliases", 
                rate, outOf, fails, undefined)
        end
    end)
end

-- Make window draggable
local UserInputService = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Header.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- =====================
-- TEST CASES START HERE
-- =====================

-- Cache tests
test("cache.invalidate", {}, function()
    local container = Instance.new("Folder")
    local part = Instance.new("Part", container)
    cache.invalidate(container:FindFirstChild("Part"))
    assert(part ~= container:FindFirstChild("Part"), "Reference `part` could not be invalidated")
end)

test("cache.iscached", {}, function()
    local part = Instance.new("Part")
    assert(cache.iscached(part), "Part should be cached")
    cache.invalidate(part)
    assert(not cache.iscached(part), "Part should not be cached")
end)

test("cache.replace", {}, function()
    local part = Instance.new("Part")
    local fire = Instance.new("Fire")
    cache.replace(part, fire)
    assert(part ~= fire, "Part was not replaced with Fire")
end)

test("cloneref", {}, function()
    local part = Instance.new("Part")
    local clone = cloneref(part)
    assert(part ~= clone, "Clone should not be equal to original")
    clone.Name = "Test"
    assert(part.Name == "Test", "Clone should have updated the original")
end)

test("compareinstances", {}, function()
    local part = Instance.new("Part")
    local clone = cloneref(part)
    assert(part ~= clone, "Clone should not be equal to original")
    assert(compareinstances(part, clone), "Clone should be equal to original when using compareinstances()")
end)

-- Closures tests
local function shallowEqual(t1, t2)
    if t1 == t2 then return true end
    local UNIQUE_TYPES = {["function"]=true,["table"]=true,["userdata"]=true,["thread"]=true}
    for k, v in pairs(t1) do
        if UNIQUE_TYPES[type(v)] then
            if type(t2[k]) ~= type(v) then return false end
        elseif t2[k] ~= v then return false end
    end
    for k, v in pairs(t2) do
        if UNIQUE_TYPES[type(v)] then
            if type(t2[k]) ~= type(v) then return false end
        elseif t1[k] ~= v then return false end
    end
    return true
end

test("checkcaller", {}, function()
    assert(checkcaller(), "Main scope should return true")
end)

test("clonefunction", {}, function()
    local function test() return "success" end
    local copy = clonefunction(test)
    assert(test() == copy(), "The clone should return the same value as the original")
    assert(test ~= copy, "The clone should not be equal to the original")
end)

test("getcallingscript", {})

test("getscriptclosure", {"getscriptfunction"}, function()
    local module = game:GetService("CoreGui").RobloxGui.Modules.Common.Constants
    local constants = getrenv().require(module)
    local generated = getscriptclosure(module)()
    assert(constants ~= generated, "Generated module should not match the original")
    assert(shallowEqual(constants, generated), "Generated constant table should be shallow equal to the original")
end)

test("hookfunction", {"replaceclosure"}, function()
    local function test() return true end
    local ref = hookfunction(test, function() return false end)
    assert(test() == false, "Function should return false")
    assert(ref() == true, "Original function should return true")
    assert(test ~= ref, "Original function should not be same as the reference")
end)

test("iscclosure", {}, function()
    assert(iscclosure(print) == true, "Function 'print' should be a C closure")
    assert(iscclosure(function() end) == false, "Executor function should not be a C closure")
end)

test("islclosure", {}, function()
    assert(islclosure(print) == false, "Function 'print' should not be a Lua closure")
    assert(islclosure(function() end) == true, "Executor function should be a Lua closure")
end)

test("isexecutorclosure", {"checkclosure", "isourclosure"}, function()
    assert(isexecutorclosure(isexecutorclosure) == true, "Did not return true for an executor global")
    assert(isexecutorclosure(newcclosure(function() end)) == true, "Did not return true for an executor C closure")
    assert(isexecutorclosure(function() end) == true, "Did not return true for an executor Luau closure")
    assert(isexecutorclosure(print) == false, "Did not return false for a Roblox global")
end)

test("loadstring", {}, function()
    local animate = game:GetService("Players").LocalPlayer.Character.Animate
    local bytecode = getscriptbytecode(animate)
    local func = loadstring(bytecode)
    assert(type(func) ~= "function", "Luau bytecode should not be loadable!")
    assert(assert(loadstring("return ... + 1"))(1) == 2, "Failed to do simple math")
    assert(type(select(2, loadstring("f"))) == "string", "Loadstring did not return anything for a compiler error")
end)

test("newcclosure", {}, function()
    local function test() return true end
    local testC = newcclosure(test)
    assert(test() == testC(), "New C closure should return the same value as the original")
    assert(test ~= testC, "New C closure should not be same as the original")
    assert(iscclosure(testC), "New C closure should be a C closure")
end)

-- Console tests
test("rconsoleclear", {"consoleclear"})
test("rconsolecreate", {"consolecreate"})
test("rconsoledestroy", {"consoledestroy"})
test("rconsoleinput", {"consoleinput"})
test("rconsoleprint", {"consoleprint"})
test("rconsolesettitle", {"rconsolename", "consolesettitle"})

-- Crypt tests
test("crypt.base64encode", {"crypt.base64.encode", "crypt.base64_encode", "base64.encode", "base64_encode"}, function()
    assert(crypt.base64encode("test") == "dGVzdA==", "Base64 encoding failed")
end)

test("crypt.base64decode", {"crypt.base64.decode", "crypt.base64_decode", "base64.decode", "base64_decode"}, function()
    assert(crypt.base64decode("dGVzdA==") == "test", "Base64 decoding failed")
end)

test("crypt.encrypt", {}, function()
    local key = crypt.generatekey()
    local encrypted, iv = crypt.encrypt("test", key, nil, "CBC")
    assert(iv, "crypt.encrypt should return an IV")
    local decrypted = crypt.decrypt(encrypted, key, iv, "CBC")
    assert(decrypted == "test", "Failed to decrypt raw string from encrypted data")
end)

test("crypt.decrypt", {}, function()
    local key, iv = crypt.generatekey(), crypt.generatekey()
    local encrypted = crypt.encrypt("test", key, iv, "CBC")
    local decrypted = crypt.decrypt(encrypted, key, iv, "CBC")
    assert(decrypted == "test", "Failed to decrypt raw string from encrypted data")
end)

test("crypt.generatebytes", {}, function()
    local size = math.random(10, 100)
    local bytes = crypt.generatebytes(size)
    assert(#crypt.base64decode(bytes) == size, "The decoded result should be "..size.." bytes long")
end)

test("crypt.generatekey", {}, function()
    local key = crypt.generatekey()
    assert(#crypt.base64decode(key) == 32, "Generated key should be 32 bytes long when decoded")
end)

test("crypt.hash", {}, function()
    local algorithms = {'sha1','sha384','sha512','md5','sha256','sha3-224','sha3-256','sha3-512'}
    for _, algorithm in ipairs(algorithms) do
        local hash = crypt.hash("test", algorithm)
        assert(hash, "crypt.hash on algorithm '"..algorithm.."' should return a hash")
    end
end)

-- Debug tests
test("debug.getconstant", {}, function()
    local function test() print("Hello, world! test") end
    assert(debug.getconstant(test, 1) == "print", "First constant must be print")
    assert(debug.getconstant(test, 2) == nil, "Second constant must be nil")
    assert(debug.getconstant(test, 3) == "Hello, world! test", "Third constant must be 'Hello, world!'")
end)

test("debug.getconstants", {}, function()
    local function test()
        local num = 5000 .. 500001
        print("Hello, world!", num, warn)
    end
    local constants = debug.getconstants(test)
    assert(constants[1] == 50000, "First constant must be 50000")
    assert(constants[2] == "print", "Second constant must be print")
    assert(constants[3] == nil, "Third constant must be nil")
    assert(constants[4] == "Hello, world!", "Fourth constant must be 'Hello, world!'")
    assert(constants[5] == "warn", "Fifth constant must be warn")
end)

test("debug.getinfo", {}, function()
    local types = {
        source = "string",
        short_src = "string",
        func = "function",
        what = "string",
        currentline = "number",
        name = "string",
        nups = "number",
        numparams = "number",
        is_vararg = "number",
    }
    local function test(...) print(...) end
    local info = debug.getinfo(test)
    for k, v in pairs(types) do
        assert(info[k] ~= nil, "Did not return a table with a '"..k.."' field")
        assert(type(info[k]) == v, "Did not return a table with "..k.." as a "..v.." (got "..type(info[k])..")")
    end
end)

test("debug.getproto", {}, function()
    local function test()
        local function proto() return true end
    end
    local proto = debug.getproto(test, 1, true)[1]
    local realproto = debug.getproto(test, 1)
    assert(proto, "Failed to get the inner function")
    assert(proto() == true, "The inner function did not return anything")
    if not realproto() then
        return "Proto return values are disabled on this executor"
    end
end)

test("debug.getprotos", {}, function()
    local function test()
        local function _1() return true end
        local function _2() return true end
        local function _3() return true end
    end
    for i in ipairs(debug.getprotos(test)) do
        local proto = debug.getproto(test, i, true)[1]
        local realproto = debug.getproto(test, i)
        assert(proto(), "Failed to get inner function "..i)
        if not realproto() then
            return "Proto return values are disabled on this executor"
        end
    end
end)

test("debug.getstack", {}, function()
    local _ = "a" .. "b"
    assert(debug.getstack(1, 1) == "ab", "The first item in the stack should be 'ab'")
    assert(debug.getstack(1)[1] == "ab", "The first item in the stack table should be 'ab'")
end)

test("debug.getupvalue", {}, function()
    local upvalue = function() end
    local function test() print(upvalue) end
    assert(debug.getupvalue(test, 1) == upvalue, "Unexpected value returned from debug.getupvalue")
end)

test("debug.getupvalues", {}, function()
    local upvalue = function() end
    local function test() print(upvalue) end
    local upvalues = debug.getupvalues(test)
    assert(upvalues[1] == upvalue, "Unexpected value returned from debug.getupvalues")
end)

test("debug.setconstant", {}, function()
    local function test() return "fail" end
    debug.setconstant(test, 1, "success")
    assert(test() == "success", "debug.setconstant did not set the first constant")
end)

test("debug.setstack", {}, function()
    local function test()
        return "fail", debug.setstack(1, 1, "success")
    end
    assert(test() == "success", "debug.setstack did not set the first stack item")
end)

test("debug.setupvalue", {}, function()
    local function upvalue() return "fail" end
    local function test() return upvalue() end
    debug.setupvalue(test, 1, function() return "success" end)
    assert(test() == "success", "debug.setupvalue did not set the first upvalue")
end)

-- Filesystem tests
if isfolder and makefolder and delfolder then
    if isfolder(".tests") then delfolder(".tests") end
    makefolder(".tests")
end

test("readfile", {}, function()
    writefile(".tests/readfile.txt", "success")
    assert(readfile(".tests/readfile.txt") == "success", "Did not return the contents of the file")
end)

test("listfiles", {}, function()
    makefolder(".tests/listfiles")
    writefile(".tests/listfiles/test_1.txt", "success")
    writefile(".tests/listfiles/test_2.txt", "success")
    local files = listfiles(".tests/listfiles")
    assert(#files == 2, "Did not return the correct number of files")
    assert(isfile(files[1]), "Did not return a file path")
    assert(readfile(files[1]) == "success", "Did not return the correct files")
    makefolder(".tests/listfiles_2")
    makefolder(".tests/listfiles_2/test_1")
    makefolder(".tests/listfiles_2/test_2")
    local folders = listfiles(".tests/listfiles_2")
    assert(#folders == 2, "Did not return the correct number of folders")
    assert(isfolder(folders[1]), "Did not return a folder path")
end)

test("writefile", {}, function()
    writefile(".tests/writefile.txt", "success")
    assert(readfile(".tests/writefile.txt") == "success", "Did not write the file")
    local requiresFileExt = pcall(function()
        writefile(".tests/writefile", "success")
        assert(isfile(".tests/writefile.txt"))
    end)
    if not requiresFileExt then
        return "This executor requires a file extension in writefile"
    end
end)

test("makefolder", {}, function()
    makefolder(".tests/makefolder")
    assert(isfolder(".tests/makefolder"), "Did not create the folder")
end)

test("appendfile", {}, function()
    writefile(".tests/appendfile.txt", "su")
    appendfile(".tests/appendfile.txt", "cce")
    appendfile(".tests/appendfile.txt", "ss")
    assert(readfile(".tests/appendfile.txt") == "success", "Did not append the file")
end)

test("isfile", {}, function()
    writefile(".tests/isfile.txt", "success")
    assert(isfile(".tests/isfile.txt") == true, "Did not return true for a file")
    assert(isfile(".tests") == false, "Did not return false for a folder")
    assert(isfile(".tests/doesnotexist.exe") == false, "Did not return false for a nonexistent path")
end)

test("isfolder", {}, function()
    assert(isfolder(".tests") == true, "Did not return false for a folder")
    assert(isfolder(".tests/doesnotexist.exe") == false, "Did not return false for a nonexistent path")
end)

test("delfolder", {}, function()
    makefolder(".tests/delfolder")
    delfolder(".tests/delfolder")
    assert(isfolder(".tests/delfolder") == false, "Failed to delete folder")
end)

test("delfile", {}, function()
    writefile(".tests/delfile.txt", "Hello, world!")
    delfile(".tests/delfile.txt")
    assert(isfile(".tests/delfile.txt") == false, "Failed to delete file")
end)

test("loadfile", {}, function()
    writefile(".tests/loadfile.txt", "return ... + 1")
    assert(assert(loadfile(".tests/loadfile.txt"))(1) == 2, "Failed to load a file with arguments")
    writefile(".tests/loadfile.txt", "f")
    local callback, err = loadfile(".tests/loadfile.txt")
    assert(err and not callback, "Did not return an error message for a compiler error")
end)

test("dofile", {})

-- Input tests
test("isrbxactive", {"isgameactive"}, function()
    assert(type(isrbxactive()) == "boolean", "Did not return a boolean value")
end)

test("mouse1click", {})
test("mouse1press", {})
test("mouse1release", {})
test("mouse2click", {})
test("mouse2press", {})
test("mouse2release", {})
test("mousemoveabs", {})
test("mousemoverel", {})
test("mousescroll", {})

-- Instances tests
test("fireclickdetector", {}, function()
    local detector = Instance.new("ClickDetector")
    fireclickdetector(detector, 50, "MouseHoverEnter")
end)

test("getcallbackvalue", {}, function()
    local bindable = Instance.new("BindableFunction")
    local function test() end
    bindable.OnInvoke = test
    assert(getcallbackvalue(bindable, "OnInvoke") == test, "Did not return the correct value")
end)

test("getconnections", {}, function()
    local types = {
        Enabled = "boolean",
        ForeignState = "boolean",
        LuaConnection = "boolean",
        Function = "function",
        Thread = "thread",
        Fire = "function",
        Defer = "function",
        Disconnect = "function",
        Disable = "function",
        Enable = "function",
    }
    local bindable = Instance.new("BindableEvent")
    bindable.Event:Connect(function() end)
    local connection = getconnections(bindable.Event)[1]
    for k, v in pairs(types) do
        assert(connection[k] ~= nil, "Did not return a table with a '"..k.."' field")
        assert(type(connection[k]) == v, "Did not return a table with "..k.." as a "..v.." (got "..type(connection[k])..")")
    end
end)

test("getcustomasset", {}, function()
    writefile(".tests/getcustomasset.txt", "success")
    local contentId = getcustomasset(".tests/getcustomasset.txt")
    assert(type(contentId) == "string", "Did not return a string")
    assert(#contentId > 0, "Returned an empty string")
    assert(string.match(contentId, "rbxasset://") == "rbxasset://", "Did not return an rbxasset url")
end)

test("gethiddenproperty", {}, function()
    local fire = Instance.new("Fire")
    local property, isHidden = gethiddenproperty(fire, "size_xml")
    assert(property == 5, "Did not return the correct value")
    assert(isHidden == true, "Did not return whether the property was hidden")
end)

test("sethiddenproperty", {}, function()
    local fire = Instance.new("Fire")
    local hidden = sethiddenproperty(fire, "size_xml", 10)
    assert(hidden, "Did not return true for the hidden property")
    assert(gethiddenproperty(fire, "size_xml") == 10, "Did not set the hidden property")
end)

test("gethui", {}, function()
    assert(typeof(gethui()) == "Instance", "Did not return an Instance")
end)

test("getinstances", {}, function()
    assert(getinstances()[1]:IsA("Instance"), "The first value is not an Instance")
end)

test("getnilinstances", {}, function()
    assert(getnilinstances()[1]:IsA("Instance"), "The first value is not an Instance")
    assert(getnilinstances()[1].Parent == nil, "The first value is not parented to nil")
end)

test("isscriptable", {}, function()
    local fire = Instance.new("Fire")
    assert(isscriptable(fire, "size_xml") == false, "Did not return false for a non-scriptable property (size_xml)")
    assert(isscriptable(fire, "Size") == true, "Did not return true for a scriptable property (Size)")
end)

test("setscriptable", {}, function()
    local fire = Instance.new("Fire")
    local wasScriptable = setscriptable(fire, "size_xml", true)
    assert(wasScriptable == false, "Did not return false for a non-scriptable property (size_xml)")
    assert(isscriptable(fire, "size_xml") == true, "Did not set the scriptable property")
    fire = Instance.new("Fire")
    assert(isscriptable(fire, "size_xml") == false, "⚠️⚠️ setscriptable persists between unique instances ⚠️⚠️")
end)

test("setrbxclipboard", {})

-- Metatable tests
test("getrawmetatable", {}, function()
    local metatable = { __metatable = "Locked!" }
    local object = setmetatable({}, metatable)
    assert(getrawmetatable(object) == metatable, "Did not return the metatable")
end)

test("hookmetamethod", {}, function()
    local object = setmetatable({}, { __index = newcclosure(function() return false end), __metatable = "Locked!" })
    local ref = hookmetamethod(object, "__index", function() return true end)
    assert(object.test == true, "Failed to hook a metamethod and change the return value")
    assert(ref() == false, "Did not return the original function")
end)

test("getnamecallmethod", {}, function()
    local method
    local ref
    ref = hookmetamethod(game, "__namecall", function(...)
        if not method then
            method = getnamecallmethod()
        end
        return ref(...)
    end)
    game:GetService("Lighting")
    assert(method == "GetService", "Did not get the correct method (GetService)")
end)

test("isreadonly", {}, function()
    local object = {}
    table.freeze(object)
    assert(isreadonly(object), "Did not return true for a read-only table")
end)

test("setrawmetatable", {}, function()
    local object = setmetatable({}, { __index = function() return false end, __metatable = "Locked!" })
    local objectReturned = setrawmetatable(object, { __index = function() return true end })
    assert(object, "Did not return the original object")
    assert(object.test == true, "Failed to change the metatable")
    if objectReturned then
        return objectReturned == object and "Returned the original object" or "Did not return the original object"
    end
end)

test("setreadonly", {}, function()
    local object = { success = false }
    table.freeze(object)
    setreadonly(object, false)
    object.success = true
    assert(object.success, "Did not allow the table to be modified")
end)

-- Miscellaneous tests
test("identifyexecutor", {"getexecutorname"}, function()
    local name, version = identifyexecutor()
    assert(type(name) == "string", "Did not return a string for the name")
    return type(version) == "string" and "Returns version and executor name as a string: ".. identifyexecutor() or "Does not return version"
end)

test("lz4compress", {}, function()
    local raw = "Hello, world!"
    local compressed = lz4compress(raw)
    assert(type(compressed) == "string", "Compression did not return a string")
    assert(lz4decompress(compressed, #raw) == raw, "Decompression did not return the original string")
end)

test("lz4decompress", {}, function()
    local raw = "Hello, world!"
    local compressed = lz4compress(raw)
    assert(type(compressed) == "string", "Compression did not return a string")
    assert(lz4decompress(compressed, #raw) == raw, "Decompression did not return the original string")
end)

test("messagebox", {})

test("queue_on_teleport", {"queueonteleport"})

test("request", {"http.request", "http_request"}, function()
    local response = request({
        Url = "https://httpbin.org/user-agent",
        Method = "GET",
    })
    assert(type(response) == "table", "Response must be a table")
    assert(response.StatusCode == 200, "Did not return a 200 status code")
    local data = game:GetService("HttpService"):JSONDecode(response.Body)
    assert(type(data) == "table" and type(data["user-agent"]) == "string", "Did not return a table with a user-agent key")
    return "User-Agent: "..data["user-agent"]
end)

test("setclipboard", {"toclipboard"})

test("setfpscap", {}, function()
    local renderStepped = game:GetService("RunService").RenderStepped
    local function step()
        renderStepped:Wait()
        local sum = 0
        for _ = 1, 5 do
            sum += 1 / renderStepped:Wait()
        end
        return math.round(sum / 5)
    end
    setfpscap(60)
    local step60 = step()
    setfpscap(0)
    local step0 = step()
    return step60.."fps @60 • "..step0.."fps @0"
end)

-- Scripts tests
test("getgc", {}, function()
    local gc = getgc()
    assert(type(gc) == "table", "Did not return a table")
    assert(#gc > 0, "Did not return a table with any values")
end)

test("getgenv", {}, function()
    getgenv().__TEST_GLOBAL = true
    assert(__TEST_GLOBAL, "Failed to set a global variable")
    getgenv().__TEST_GLOBAL = nil
end)

--[[test("getprenv", {}, function()
    getprenv().__TEST_PRIMARY = 5
	assert(__TEST_PRIMARY, "Failed to set a primary variable")
	getprenv().__TEST_PRIMARY = nil
end)]]

test("getloadedmodules", {}, function()
    local modules = getloadedmodules()
    assert(type(modules) == "table", "Did not return a table")
    assert(#modules > 0, "Did not return a table with any values")
    assert(typeof(modules[1]) == "Instance", "First value is not an Instance")
    assert(modules[1]:IsA("ModuleScript"), "First value is not a ModuleScript")
end)

test("getrenv", {}, function()
    assert(_G ~= getrenv()._G, "The variable _G in the executor is identical to _G in the game")
end)

test("getrunningscripts", {}, function()
    local scripts = getrunningscripts()
    assert(type(scripts) == "table", "Did not return a table")
    assert(#scripts > 0, "Did not return a table with any values")
    assert(typeof(scripts[1]) == "Instance", "First value is not an Instance")
    assert(scripts[1]:IsA("ModuleScript") or scripts[1]:IsA("LocalScript"), "First value is not a ModuleScript or LocalScript")
end)

test("getscriptbytecode", {"dumpstring"}, function()
    local animate = game:GetService("Players").LocalPlayer.Character.Animate
    local bytecode = getscriptbytecode(animate)
    assert(type(bytecode) == "string", "Did not return a string for Character.Animate")
end)

test("getscripthash", {}, function()
    local animate = game:GetService("Players").LocalPlayer.Character.Animate:Clone()
    local hash = getscripthash(animate)
    local source = animate.Source
    animate.Source = "print('Hello, world!')"
    task.defer(function()
        animate.Source = source
    end)
    local newHash = getscripthash(animate)
    assert(hash ~= newHash, "Did not return a different hash for a modified script")
    assert(newHash == getscripthash(animate), "Did not return the same hash for a script with the same source")
end)

test("getscripts", {}, function()
    local scripts = getscripts()
    assert(type(scripts) == "table", "Did not return a table")
    assert(#scripts > 0, "Did not return a table with any values")
    assert(typeof(scripts[1]) == "Instance", "First value is not an Instance")
    assert(scripts[1]:IsA("ModuleScript") or scripts[1]:IsA("LocalScript"), "First value is not a ModuleScript or LocalScript")
end)

test("getsenv", {}, function()
    local animate = game:GetService("Players").LocalPlayer.Character.Animate
    local env = getsenv(animate)
    assert(type(env) == "table", "Did not return a table for Character.Animate")
    assert(env.script == animate, "The script global is not identical to Character.Animate")
end)

test("getthreadidentity", {"getidentity", "getthreadcontext"}, function()
    assert(type(getthreadidentity()) == "number", "Did not return a number")
end)

test("setthreadidentity", {"setidentity", "setthreadcontext"}, function()
    setthreadidentity(3)
    assert(getthreadidentity() == 3, "Did not set the thread identity")
end)

-- Drawing tests
test("Drawing", {})

test("Drawing.new", {}, function()
    local drawing = Drawing.new("Square")
    drawing.Visible = false
    local canDestroy = pcall(function()
        drawing:Destroy()
    end)
    assert(canDestroy, "Drawing:Destroy() should not throw an error")
end)

test("Drawing.Fonts", {}, function()
    assert(Drawing.Fonts.UI == 0, "Did not return the correct id for UI")
    assert(Drawing.Fonts.System == 1, "Did not return the correct id for System")
    assert(Drawing.Fonts.Plex == 2, "Did not return the correct id for Plex")
    assert(Drawing.Fonts.Monospace == 3, "Did not return the correct id for Monospace")
end)

test("isrenderobj", {}, function()
    local drawing = Drawing.new("Image")
    drawing.Visible = true
    assert(isrenderobj(drawing) == true, "Did not return true for an Image")
    assert(isrenderobj(newproxy()) == false, "Did not return false for a blank table")
end)

test("getrenderproperty", {}, function()
    local drawing = Drawing.new("Image")
    drawing.Visible = true
    assert(type(getrenderproperty(drawing, "Visible")) == "boolean", "Did not return a boolean value for Image.Visible")
    local success, result = pcall(function()
        return getrenderproperty(drawing, "Color")
    end)
    if not success or not result then
        return "Image.Color is not supported"
    end
end)

test("setrenderproperty", {}, function()
    local drawing = Drawing.new("Square")
    drawing.Visible = true
    setrenderproperty(drawing, "Visible", false)
    assert(drawing.Visible == false, "Did not set the value for Square.Visible")
end)

test("cleardrawcache", {})

-- WebSocket tests
test("WebSocket", {})

test("WebSocket.connect", {}, function()
    local types = {
        Send = "function",
        Close = "function",
        OnMessage = {"table", "userdata"},
        OnClose = {"table", "userdata"},
    }
    local ws = WebSocket.connect("ws://echo.websocket.events")
    assert(type(ws) == "table" or type(ws) == "userdata", "Did not return a table or userdata")
    for k, v in pairs(types) do
        if type(v) == "table" then
            assert(table.find(v, type(ws[k])), "Did not return a "..table.concat(v, ", ").." for "..k.." (a "..type(ws[k])..")")
        else
            assert(type(ws[k]) == v, "Did not return a "..v.." for "..k.." (a "..type(ws[k])..")")
        end
    end
    ws:Close()
end)
