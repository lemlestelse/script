-- ts file was generated at discord.gg/25ms


if getgenv().GUI_Loaded then
    return
else
    getgenv().GUI_Loaded = true
    local v1 = "4.4.0"
    local vu2 = 7225069918
    local vu3 = {
        RunService = game:GetService("RunService"),
        HttpService = game:GetService("HttpService"),
        MarketplaceService = game:GetService("MarketplaceService"),
        TextChatService = game:GetService("TextChatService"),
        UIS = game:GetService("UserInputService"),
        Light = game:GetService("Lighting"),
        Teleport = game:GetService("TeleportService"),
        TweenService = game:GetService("TweenService"),
        StarterPlayer = game:GetService("StarterPlayer"),
        Players = game:GetService("Players")
    }
    local vu4 = vu3.Players.LocalPlayer
    local vu5 = game.PlaceId
    local vu6 = vu4.UserId
    local vu7 = vu3.MarketplaceService:GetProductInfo(vu5).Name
    local vu8 = game.JobId
    local vu9 = game.Workspace.CurrentCamera
    local vu10 = vu4:GetMouse()
    local vu11 = vu3.UIS.TouchEnabled
    if vu11 then
        vu11 = not vu3.UIS.KeyboardEnabled
    end
    local function vu15(p12, p13, p14)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = p12,
            Text = p13,
            Duration = p14
        })
    end
    local function vu17(p16)
        return vu3.HttpService:JSONDecode(game:HttpGet(p16))
    end
    local function vu19(p18)
        return vu17("https://api-production-4040.up.railway.app/" .. p18)
    end
    local function vu22()
        local v20 = vu19("is-banned/" .. vu6 .. "?place_name=" .. vu7 .. "&place_id=" .. vu5 .. "&job_id=" .. vu8)
        if v20 then
            local v21 = v20.is_vip or false
            is_staff = v20.is_staff or false
            is_vip = v21
            return v20.is_banned
        end
    end
    if vu22() then
        for _ = 1, 3 do
            vu15("vk\'z Panel", "Voc\195\170 est\195\161 banido do vk\'z Panel\nContate o suporte: https://dsc.gg/ksxspanel", 5)
            task.wait(10)
        end
        getgenv().GUI_Loaded = false
    else
        local function vu23()
            return math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
        end
        local function vu25()
            local v24 = vu19("get-stats")
            return not v24 and {} or "\n\nOnline: <font color=\'rgb(200,200,200)\'>" .. v24.online_count .. "</font>" .. "\nUsers: <font color=\'rgb(200,200,200)\'>" .. v24.total_count .. "</font>" .. "\n\nDate: <font color=\'rgb(200,200,200)\'>" .. v24.current_date .. "</font>"
        end
        task.spawn(function()
            while true do
                _stats = vu25()
                task.wait(10)
            end
        end)
        local function vu27()
            local v26 = vu19("get-data/" .. vu8)
            if v26 then
                return v26.tags or {}, v26.users or {}
            else
                return {}, {}
            end
        end
        task.spawn(function()
            while true do
                local v28, v29 = vu27()
                _users = v29
                _tags = v28
                task.wait(10)
            end
        end)
        local function vu31()
            local v30 = vu19("is-vip/" .. vu6 .. "?permission=7dbb2294de587ca6c42ec03eb9c7e2f20294ad92b33098b9f2acaf1878dc880e")
            if v30 then
                return v30.Fling or "", v30.AntiFling or "", v30.AntiForce or "", v30.AntiChatSpy or "", v30.CollectOrbs or ""
            end
        end
        if is_vip then
            local v32, v33, v34, v35, v36 = vu31()
            vip_collectorbs = v36
            vip_antichatspy = v35
            vip_antiforce = v34
            vip_antifling = v33
            vip_fling = v32
            if vip_fling == "" then
                is_vip = false
            end
        end
        last_vip_state = is_vip
        local v37 = game.ReplicatedStorage:FindFirstChild("AntiCheat")
        local v38 = v37 and v37:FindFirstChild("GuiThreatDetected")
        if v38 then
            v38:Destroy()
        end
        local v39, v40, v41 = ipairs(getconnections(vu4:WaitForChild("PlayerGui").ChildAdded))
        local vu42 = vu19
        local vu43 = vu17
        while true do
            local v44
            v41, v44 = v39(v40, v41)
            if v41 == nil then
                break
            end
            v44:Disconnect()
        end
        local v45, v46, v47 = ipairs(getconnections(vu4:WaitForChild("PlayerGui").DescendantAdded))
        while true do
            local v48
            v47, v48 = v45(v46, v47)
            if v47 == nil then
                break
            end
            v48:Disconnect()
        end
        local v49 = vu4:WaitForChild("PlayerScripts"):FindFirstChild("AntiCheat")
        if v49 then
            v49:Destroy()
        end
        if not isfolder("ksx") then
            makefolder("ksx")
        end
        local vu50 = "ksx/settings.json"
        function WriteFile(p51, p52, p53)
            local v54 = isfile(vu50) and (vu3.HttpService:JSONDecode(readfile(vu50)) or {}) or {}
            if p52 then
                v54[p51] = v54[p51] or {}
                v54[p51][p52] = p53
            else
                v54[p51] = p53
            end
            writefile(vu50, vu3.HttpService:JSONEncode(v54))
        end
        function LoadFile(p55, p56, p57)
            if isfile(vu50) then
                local v58 = vu3.HttpService:JSONDecode(readfile(vu50))
                if p56 and v58[p55] then
                    return v58[p55][p56] or p57
                else
                    return v58[p55] or p57
                end
            else
                return p57
            end
        end
        Themes = {
            Dark = {
                BackgroundColor3_title = Color3.fromRGB(0, 0, 0),
                BackgroundColor3_button = Color3.fromRGB(100, 100, 100),
                BackgroundColor3 = Color3.fromRGB(35, 35, 35),
                TextColor3_credits = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(45, 45, 45),
                ImageColor3 = Color3.fromRGB(25, 25, 25),
                TextColor3 = Color3.fromRGB(150, 150, 150),
                PlaceholderTextColor3 = Color3.fromRGB(140, 140, 140)
            },
            Light = {
                BackgroundColor3_title = Color3.fromRGB(255, 255, 255),
                BackgroundColor3_button = Color3.fromRGB(225, 225, 225),
                BackgroundColor3 = Color3.fromRGB(150, 150, 150),
                TextColor3_credits = Color3.fromRGB(0, 0, 0),
                BorderColor3 = Color3.fromRGB(255, 255, 255),
                ImageColor3 = Color3.fromRGB(150, 150, 150),
                TextColor3 = Color3.fromRGB(0, 0, 0),
                PlaceholderTextColor3 = Color3.fromRGB(35, 35, 35)
            },
            Blue = {
                BackgroundColor3_title = Color3.fromRGB(20, 20, 80),
                BackgroundColor3_button = Color3.fromRGB(80, 80, 200),
                BackgroundColor3 = Color3.fromRGB(60, 60, 170),
                TextColor3_credits = Color3.fromRGB(230, 230, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 130),
                ImageColor3 = Color3.fromRGB(0, 0, 60),
                TextColor3 = Color3.fromRGB(210, 210, 255),
                PlaceholderTextColor3 = Color3.fromRGB(180, 180, 255)
            },
            Pink = {
                BackgroundColor3_title = Color3.fromRGB(80, 20, 80),
                BackgroundColor3_button = Color3.fromRGB(200, 80, 200),
                BackgroundColor3 = Color3.fromRGB(170, 60, 170),
                TextColor3_credits = Color3.fromRGB(255, 230, 255),
                BorderColor3 = Color3.fromRGB(130, 0, 130),
                ImageColor3 = Color3.fromRGB(60, 0, 60),
                TextColor3 = Color3.fromRGB(255, 210, 255),
                PlaceholderTextColor3 = Color3.fromRGB(255, 180, 255)
            }
        }
        savedTheme = LoadFile("Theme", "value", "Dark")
        Theme = Themes[savedTheme] or Themes.Dark
        if not is_vip and (savedTheme ~= "Dark" and savedTheme ~= "Light") then
            Theme = Themes.Dark
            WriteFile("Theme", "value", "Dark")
        end
        local vu59 = {}
        local function vu66(p60, p61)
            vu59[p60] = p61
            local v62, v63, v64 = pairs(p61)
            while true do
                local v65
                v64, v65 = v62(v63, v64)
                if v64 == nil then
                    break
                end
                if Theme[v65] then
                    p60[v64] = Theme[v65]
                end
            end
        end
        local function vu77(p67)
            local v68, v69, v70 = pairs(vu59)
            while true do
                local v71
                v70, v71 = v68(v69, v70)
                if v70 == nil then
                    break
                end
                local v72, v73, v74 = pairs(v71)
                local v75 = v70
                while true do
                    local v76
                    v74, v76 = v72(v73, v74)
                    if v74 == nil then
                        break
                    end
                    if p67[v76] then
                        v75[v74] = p67[v76]
                    end
                end
            end
        end
        local function vu80(p78)
            local v79 = p78.Ticket_Asset
            if v79.ImageColor3 ~= Color3.fromRGB(255, 0, 0) then
                v79.ImageColor3 = Color3.fromRGB(255, 0, 0)
            else
                v79.ImageColor3 = Color3.fromRGB(0, 255, 0)
            end
        end
        local function vu86(p81)
            if p81 == "" then
                return nil
            end
            local v82, v83, v84 = pairs(vu3.Players:GetPlayers())
            while true do
                local v85
                v84, v85 = v82(v83, v84)
                if v84 == nil then
                    break
                end
                if v85.Name:lower():match(p81) or v85.DisplayName:lower():match(p81) then
                    return v85
                end
            end
            return nil
        end
        local function vu88(p87)
            if p87.Character then
                return p87.Character
            end
        end
        local function vu90(p89)
            if vu88(p89):FindFirstChild("HumanoidRootPart") then
                return vu88(p89).HumanoidRootPart
            end
        end
        local function vu97(pu91, pu92, pu93, pu94, pu95)
            pcall(function()
                local vu96 = vu90(vu4)
                if vu96 then
                    if pu95 ~= "safe" then
                        vu96.Velocity = Vector3.new(0, 0, 0)
                        if pu94 ~= "pos" then
                            vu96.CFrame = CFrame.new(vu90(pu94).Position) + Vector3.new(0, 2, 0)
                        else
                            vu96.CFrame = CFrame.new(pu91, pu92, pu93)
                        end
                    else
                        task.spawn(function()
                            for _ = 1, 30 do
                                task.wait()
                                vu96.Velocity = Vector3.new(0, 0, 0)
                                if pu94 ~= "pos" then
                                    vu96.CFrame = CFrame.new(vu90(pu94).Position) + Vector3.new(0, 2, 0)
                                else
                                    vu96.CFrame = CFrame.new(pu91, pu92, pu93)
                                end
                            end
                        end)
                    end
                end
            end)
        end
        local function vu102()
            vu4.Character.Animate.Disabled = false
            local v98, v99, v100 = pairs(vu4.Character.Humanoid:GetPlayingAnimationTracks())
            while true do
                local v101
                v100, v101 = v98(v99, v100)
                if v100 == nil then
                    break
                end
                v101:Stop()
            end
        end
        local function vu108(pu103, pu104, pu105)
            pcall(function()
                vu102()
                vu4.Character.Animate.Disabled = true
                local v106 = Instance.new("Animation")
                v106.AnimationId = "rbxassetid://" .. pu103
                local v107 = vu4.Character.Humanoid:LoadAnimation(v106)
                v107:Play()
                v107.TimePosition = pu104
                v107:AdjustSpeed(pu105)
                v107.Stopped:Connect(function()
                    vu102()
                end)
            end)
        end
        local function vu117(p109, p110)
            local vu111 = Instance.new(p109)
            local v112, v113, v114 = pairs(p110)
            while true do
                local vu115, vu116 = v112(v113, v114)
                if vu115 == nil then
                    break
                end
                v114 = vu115
                if vu116 ~= nil then
                    pcall(function()
                        vu111[vu115] = vu116
                    end)
                end
            end
            return vu111
        end
        local vu120 = vu117("ScreenGui", {
            Name = tostring((function()
                local v118 = {}
                for v119 = 1, math.random(10, 20) do
                    v118[v119] = string.char(math.random(32, 126))
                end
                return table.concat(v118)
            end)()),
            Parent = vu4:WaitForChild("PlayerGui"),
            ResetOnSpawn = false,
            IgnoreGuiInset = true,
            DisplayOrder = 1,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        })
        local vu121 = vu117("ImageLabel", {
            Name = "Background",
            Parent = vu120,
            Active = true,
            Position = UDim2.new(0.5, 0, 0.5, 0),
            Size = UDim2.new(0, 500, 0, 350),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = "rbxassetid://89548031362604",
            ImageTransparency = 0.5,
            ScaleType = Enum.ScaleType.Crop,
            TileSize = UDim2.new(0, 30, 0, 30),
            SliceCenter = Rect.new(0, 256, 0, 256),
            ZIndex = 9
        })
        vu66(vu121, {
            BackgroundColor3 = "BackgroundColor3",
            BorderColor3 = "BorderColor3",
            ImageColor3 = "ImageColor3"
        })
        if vu121.Draggable then
            vu121.Draggable = false
        end
        local vu122 = vu121
        local vu123 = false
        local vu124 = nil
        local vu125 = nil
        local vu126 = 0.1
        local vu127 = nil
        local function vu130()
            if vu123 and vu127 then
                local v128 = vu127.Position - vu124
                local v129 = UDim2.new(vu125.X.Scale, vu125.X.Offset + v128.X, vu125.Y.Scale, vu125.Y.Offset + v128.Y)
                vu122.Position = vu122.Position:Lerp(v129, vu126)
            end
        end
        vu122.InputBegan:Connect(function(p131)
            if p131.UserInputType == Enum.UserInputType.MouseButton1 or p131.UserInputType == Enum.UserInputType.Touch then
                local v132 = p131.Position
                local v133 = vu122.Position
                vu127 = p131
                vu125 = v133
                vu124 = v132
                vu123 = true
            end
        end)
        vu122.InputChanged:Connect(function(p134)
            if p134.UserInputType == Enum.UserInputType.MouseMovement or p134.UserInputType == Enum.UserInputType.Touch then
                vu127 = p134
            end
        end)
        vu3.UIS.InputChanged:Connect(function(p135)
            if vu123 and p135 == vu127 then
                vu130()
            end
        end)
        vu3.UIS.InputEnded:Connect(function(p136)
            if p136.UserInputType == Enum.UserInputType.MouseButton1 or p136.UserInputType == Enum.UserInputType.Touch then
                vu123 = false
            end
        end)
        local vTitleBar = vu117("TextLabel", {
            Name = "TitleBarLabel",
            Parent = vu121,
            BackgroundTransparency = 0.25,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 30),
            Text = "vkz Panel",
            Font = Enum.Font.Unknown,
            TextSize = 14,
            TextScaled = true,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Center
        })
        vu66(vTitleBar, {
            BackgroundColor3 = "BackgroundColor3_title",
            BorderColor3 = "BorderColor3",
            TextColor3 = "TextColor3"
        })
        vu121.Active = false
        vTitleBar.Active = true
        vu122 = vTitleBar
        vu66(vu117("TextLabel", {
            Name = "VersionLabel",
            Parent = vu121,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.new(0, 4, 0, 2),
            Size = UDim2.new(0.1, 0, 0, 20),
            Text = "v" .. v1,
            Font = Enum.Font.Unknown,
            TextSize = 14,
            TextScaled = true,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Left
        }), {
            BorderColor3 = "BorderColor3",
            TextColor3 = "TextColor3"
        })
        local vu137 = vu117("ScrollingFrame", {
            Name = "SectionList",
            Parent = vu121,
            BackgroundTransparency = 0.5,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.new(0, 0, 0, 30),
            Size = UDim2.new(0, 105, 0, 320),
            ScrollBarThickness = 2.5,
            CanvasSize = UDim2.new(0, 0, is_staff and 1.144 or 1.028, 0)
        })
        local function v142(p138, p139)
            local v140 = 5 + (p139 - 1) * 40
            local v141 = vu117("TextButton", {
                Name = p138,
                Parent = vu137,
                BackgroundTransparency = 0.5,
                BorderSizePixel = 0,
                Position = UDim2.new(0, 0, 0, v140),
                Size = UDim2.new(0, 105, 0, 30),
                Text = p138,
                Font = Enum.Font.Oswald,
                TextSize = 14,
                TextScaled = true,
                TextWrapped = true,
                AutoLocalize = false
            })
            vu66(v141, {
                BackgroundColor3 = "BackgroundColor3_button",
                BorderColor3 = "BorderColor3",
                TextColor3 = "TextColor3"
            })
            return v141
        end
        local v143 = {
            "Home",
            "VIP",
            "Emphasis",
            "Character",
            "Target",
            "Animations",
            "More",
            "Misc",
            "About"
        }
        if is_staff then
            table.insert(v143, 2, "STAFF")
        end
        local v144, v145, v146 = ipairs(v143)
        local vu147 = vu90
        local vu148 = vu102
        local vu149 = vu137
        local vu150 = vu117
        local v151 = {}
        local vu152 = nil
        while true do
            local v153
            v146, v153 = v144(v145, v146)
            if v146 == nil then
                break
            end
            v151[v153 .. "_Section_Button"] = v142(v153, v146)
        end
        local function v158(p154, p155, p156)
            local v157 = vu150("ScrollingFrame", {
                Name = p154,
                Parent = vu121,
                Active = true,
                Visible = p155,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Position = UDim2.new(0, 105, 0, 30),
                Size = UDim2.new(0, 395, 0, 320),
                ScrollBarThickness = 5,
                CanvasSize = UDim2.new(0, 0, p156 or 0, 0)
            })
            vu66(v157, {
                BackgroundColor3 = "BackgroundColor3",
                BorderColor3 = "BorderColor3"
            })
            return v157
        end
        local vu159 = {
            Home_Section = v158("Home_Section", true),
            Staff_Section = v158("Staff_Section", false),
            Vip_Section = v158("Vip_Section", false),
            Emphasis_Section = v158("Emphasis_Section", false),
            Character_Section = v158("Character_Section", false),
            Target_Section = v158("Target_Section", false, 1.602),
            Animations_Section = v158("Animations_Section", false, 2.675),
            More_Section = v158("More_Section", false),
            Misc_Section = v158("Misc_Section", false),
            About_Section = v158("About_Section", false)
        }
        local v160 = {
            Name = "Profile_Image",
            Parent = vu159.Home_Section,
            BorderSizePixel = 1,
            Position = UDim2.new(0, 25, 0, 25),
            Size = UDim2.new(0, 100, 0, 100),
            Image = vu3.Players:GetUserThumbnailAsync(vu6, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
        }
        vu66(vu150("ImageLabel", v160), {
            BackgroundColor3 = "BackgroundColor3",
            BorderColor3 = "BorderColor3"
        })
        local function vu169(p161, p162, p163, p164, p165, p166, p167)
            local v168 = vu150("TextLabel", {
                Name = p161,
                Parent = p162,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Position = p164,
                Size = p165,
                Text = p163,
                Font = p166 or Enum.Font.SourceSans,
                TextSize = p167 or 24,
                TextWrapped = true,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
                RichText = true,
                AutoLocalize = false
            })
            vu66(v168, {
                BackgroundColor3 = "BackgroundColor3",
                BorderColor3 = "BorderColor3",
                TextColor3 = "TextColor3"
            })
            return v168
        end
        vu169("Welcome_Label", vu159.Home_Section, "Ol\195\161! @" .. vu4.Name .. "!\nPressione [B] para abrir/fechar o painel", UDim2.new(0, 172.5, 0, 36), UDim2.new(0, 200, 0, 100))
        local function v177(p170, p171, p172, p173, p174, p175)
            local v176 = vu169(p170, p171, p172, p173, p174, nil, p175)
            v176.Active = true
            v176.TextColor3 = Color3.fromRGB(0, 100, 255)
            vu66(v176, {
                TextColor3 = v176.TextColor3
            })
            return v176
        end
        vu169("Partnership_Label", vu159.Home_Section, "<font color=\'rgb(255,0,0)\'>P</font><font color=\'rgb(255,165,0)\'>a</font><font color=\'rgb(255,255,0)\'>r</font><font color=\'rgb(0,255,0)\'>t</font><font color=\'rgb(0,255,255)\'>n</font><font color=\'rgb(0,0,255)\'>e</font><font color=\'rgb(128,0,128)\'>r</font><font color=\'rgb(255,0,255)\'>s</font><font color=\'rgb(255,105,180)\'>h</font><font color=\'rgb(75,0,130)\'>i</font><font color=\'rgb(148,0,211)\'>p</font><font color=\'rgb(255,255,255)\'>:</font>", UDim2.new(0, 261, 0, 149.5), UDim2.new(0, 200, 0, 100))
        Partnership_Link = v177("Partnership_Link", vu159.Home_Section, "robux barato", UDim2.new(0, 262.9, 0, 172.5), UDim2.new(0, 98, 0, 20), 22)
        local function vu179()
            local v178 = vu23()
            return "Ping: <font color=\'" .. (v178 <= 79 and "rgb(80,255,80)" or (v178 <= 149 and "rgb(255,200,50)" or "rgb(255,80,80)")) .. "\'>" .. v178 .. "ms</font>"
        end
        local vu180 = nil
        local vu181 = 0
        vu3.RunService.Heartbeat:Connect(function(p182)
            if _stats then
                vu180 = vu180 or vu169("Stats_Label", vu159.Home_Section, vu179() .. _stats, UDim2.new(0, 25, 0, 150), UDim2.new(0, 200, 0, 200))
                vu181 = vu181 + p182
                if vu181 >= 1 then
                    vu180.Text = vu179() .. _stats
                    vu181 = 0
                end
            end
        end)
        local vu183 = vu150("ImageButton", {
            Name = "ViewTag_Button",
            Parent = vu159.Home_Section,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.new(0, 322, 0, 250),
            Size = UDim2.new(0, 40, 0, 40),
            Image = "rbxassetid://119030989234087"
        })
        vu66(vu183, {
            BackgroundColor3 = "BackgroundColor3_button",
            BorderColor3 = "BorderColor3"
        })
        local function vu193(p184, p185, p186, p187, p188, p189)
            local v190 = p186 % 2 == 1 and 25 or 210
            local v191 = 25 + math.floor((p186 - 1) / 2) * 50 + (p187 or 0)
            local v192
            if p188 then
                v192 = Instance.new("TextBox")
                v192.Text = ""
                v192.PlaceholderText = p189 or ""
                v192.Font = Enum.Font.Gotham
                v192.TextSize = 18
                v192.ClearTextOnFocus = true
                vu66(v192, {
                    BackgroundColor3 = "BackgroundColor3_button",
                    BorderColor3 = "BorderColor3",
                    TextColor3 = "TextColor3",
                    PlaceholderColor3 = "PlaceholderTextColor3"
                })
            else
                v192 = Instance.new("TextButton")
                v192.Text = p184
                v192.Font = Enum.Font.Oswald
                v192.TextSize = 14
                v192.TextScaled = true
                vu66(v192, {
                    BackgroundColor3 = "BackgroundColor3_button",
                    BorderColor3 = "BorderColor3",
                    TextColor3 = "TextColor3"
                })
            end
            v192.Name = p184
            v192.Parent = p185
            v192.BackgroundTransparency = 0.5
            v192.BorderSizePixel = 0
            v192.Position = UDim2.new(0, v190, 0, v191)
            v192.Size = UDim2.new(0, 150, 0, 30)
            v192.TextWrapped = true
            v192.AutoLocalize = false
            return v192
        end
        vu169("TpUsers_Label", vu159.Staff_Section, "Teleport User:", UDim2.new(0, 140, 0, 25), UDim2.new(0, 300, 0, 75), Enum.Font.Oswald, 28)
        local function vu203()
            if # _users >= 1 then
                local v194, v195, v196 = ipairs(vu159.Staff_Section:GetChildren())
                while true do
                    local v197
                    v196, v197 = v194(v195, v196)
                    if v196 == nil then
                        break
                    end
                    if v197:IsA("TextButton") and v197.Name:find("Users_") then
                        v197:Destroy()
                    end
                end
                local v198 = 0
                for v199 = 1, # _users do
                    local v200 = _users[v199]
                    if v200.user_id ~= vu6 then
                        local vu201 = vu3.Players:GetPlayerByUserId(v200.user_id)
                        if vu201 then
                            v198 = v198 + 1
                            local v202 = vu193("<font color=\"rgb(80,255,80)\">" .. vu201.DisplayName .. "</font>", vu159.Staff_Section, v198 + 2)
                            v202.Name = "Users_" .. v200.user_id
                            v202.RichText = true
                            v202.MouseButton1Click:Connect(function()
                                if vu201 and vu201.Character and vu201.Character:FindFirstChild("HumanoidRootPart") then
                                    vu4.Character:SetPrimaryPartCFrame(vu201.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, - 3) * CFrame.Angles(0, math.rad(180), 0))
                                end
                            end)
                        end
                    end
                end
                vu159.Staff_Section.CanvasSize = UDim2.new(0, 0, 0, math.ceil(v198 / 2) * 50 + 75)
            end
        end
        local vu204 = 0
        vu3.RunService.Heartbeat:Connect(function(p205)
            if vu152 ~= "STAFF" then
                vu204 = 0
            else
                vu204 = vu204 + p205
                if vu204 >= 5 then
                    vu204 = 0
                    vu203()
                end
            end
        end)
        local vu206 = {
            Fling = vu193("Fling", vu159.Vip_Section, 1),
            AntiFling = vu193("AntiFling", vu159.Vip_Section, 2),
            AntiForce = vu193("AntiForce", vu159.Vip_Section, 3),
            AntiChatSpy = vu193("AntiChatSpy", vu159.Vip_Section, 4),
            CollectOrbs = vu193("CollectOrbs", vu159.Vip_Section, 5)
        }
        local v207 = vu150("ImageButton", {
            Name = "ChangeVipTheme_Button",
            Parent = vu159.Vip_Section,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.new(0, 322, 0, 247.2),
            Size = UDim2.new(0, 40, 0, 40),
            Image = "rbxassetid://79530953686405"
        })
        vu66(v207, {
            BackgroundColor3 = "BackgroundColor3_button",
            BorderColor3 = "BorderColor3"
        })
        isVipThemeActive = false
        v207.MouseButton1Click:Connect(function()
            isVipThemeActive = not isVipThemeActive
            if isVipThemeActive then
                Theme = Themes.Blue
                WriteFile("Theme", "value", "Blue")
            else
                Theme = Themes.Pink
                WriteFile("Theme", "value", "Pink")
            end
            vu77(Theme)
        end)
        local vu208 = vu150("ImageButton", {
            Name = "VIPOverlay",
            Parent = vu159.Vip_Section,
            BackgroundTransparency = 0.2,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 1, 0),
            AutoButtonColor = false,
            ZIndex = 50,
            Visible = not is_vip
        })
        vu150("ImageLabel", {
            Name = "BlurEffect",
            Parent = vu208,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 1, 0),
            Image = "rbxassetid://8992231225",
            ImageTransparency = 0.6,
            ImageColor3 = Color3.fromRGB(100, 100, 255),
            ScaleType = Enum.ScaleType.Tile,
            TileSize = UDim2.new(0, 150, 0, 150),
            ZIndex = 51
        })
        local vu209 = vu150("Frame", {
            Name = "Message_Container",
            Parent = vu208,
            BackgroundTransparency = 1,
            Position = UDim2.new(0.5, 0, 0.5, 0),
            Size = UDim2.new(0, 300, 0, 100),
            AnchorPoint = Vector2.new(0.5, 0.5),
            ZIndex = 52
        })
        local function v216(p210, p211, p212, p213, p214, p215)
            return vu150("TextLabel", {
                Name = p210,
                Parent = vu209,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 0, 0, p212),
                Size = UDim2.new(1, 0, 0, p214),
                Text = p211,
                TextColor3 = p213,
                Font = p215,
                TextScaled = true,
                TextWrapped = true,
                ZIndex = 53
            })
        end
        local vu217 = v216("VIP_Message", "ADQUIRIR VIP", - 10, Color3.fromRGB(255, 255, 0), 50, Enum.Font.Oswald)
        v216("VIP_SubMessage", "ACESSE: https://dsc.gg/ksxspanel", 40, Color3.fromRGB(255, 255, 255), 30, Enum.Font.SourceSans)
        vu3.RunService.Heartbeat:Connect(function()
            vu217.TextColor3 = Color3.fromRGB(255, 255, 0):Lerp(Color3.fromRGB(255, 200, 0), (math.sin(tick() * 3) + 1) / 2)
        end)
        vu208.InputBegan:Connect(function(p218)
            if p218.UserInputType == Enum.UserInputType.MouseButton1 or p218.UserInputType == Enum.UserInputType.Touch then
                setclipboard("https://discord.gg/gg6RkUKDEZ")
                vu15("VIP", "Link copiado!\nAcesse para adquirir seu VIP.", 10)
            end
        end)
        local v219 = {
            Invisible = vu193("Invisible", vu159.Emphasis_Section, 1),
            ClickTP = vu193("ClickTP", vu159.Emphasis_Section, 2),
            NoClip = vu193("NoClip", vu159.Emphasis_Section, 3),
            JerkOff = vu193("JerkOff", vu159.Emphasis_Section, 4),
            Spin = vu193("Spin", vu159.Emphasis_Section, 5),
            FaceBang = vu193("FaceBang", vu159.Emphasis_Section, 6),
            feFlip = vu193("feFlip", vu159.Emphasis_Section, 7),
            AnimSpeed = vu193("AnimSpeed", vu159.Emphasis_Section, 8),
            AntiVoid = vu193("AntiVoid", vu159.Emphasis_Section, 9),
            Flashback = vu193("Flashback", vu159.Emphasis_Section, 10)
        }
        local vu220 = {
            WalkSpeed = vu193("Walk Speed", vu159.Character_Section, 1),
            WalkSpeed_Input = vu193("WalkSpeed_Input", vu159.Character_Section, 2, nil, true, "[0 - n]"),
            JumpPower = vu193("Jump Power", vu159.Character_Section, 3),
            JumpPower_Input = vu193("JumpPower_Input", vu159.Character_Section, 4, nil, true, "[0 - n]"),
            Fly = vu193("Fly", vu159.Character_Section, 5),
            FlySpeed_Input = vu193("FlySpeed_Input", vu159.Character_Section, 6, nil, true, "[0 - n]"),
            Respawn = vu193("Respawn", vu159.Character_Section, 9),
            Checkpoint = vu193("Checkpoint", vu159.Character_Section, 10)
        }
        local vu221 = vu150("ImageLabel", {
            Name = "TargetImage",
            Parent = vu159.Target_Section,
            Position = UDim2.new(0, 25, 0, 25),
            Size = UDim2.new(0, 100, 0, 100),
            Image = "rbxassetid://10818605405"
        })
        vu66(vu221, {
            BackgroundColor3 = "BackgroundColor3_button",
            BorderColor3 = "BorderColor3"
        })
        local vu222 = vu150("TextBox", {
            Name = "TargetName_Input",
            Parent = vu159.Target_Section,
            BackgroundTransparency = 0.3,
            Position = UDim2.new(0, 150, 0, 25.5),
            Size = UDim2.new(0, 207.5, 0, 30),
            Text = "",
            PlaceholderText = "@username...",
            Font = Enum.Font.Gotham,
            TextSize = 16,
            TextWrapped = true
        })
        vu66(vu222, {
            BackgroundColor3 = "BackgroundColor3_button",
            BorderColor3 = "BorderColor3",
            TextColor3 = "TextColor3",
            PlaceholderColor3 = "PlaceholderTextColor3"
        })
        local v223 = vu150("ImageButton", {
            Name = "ClickTargetTool_Button",
            Parent = vu222,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.new(0, 172, 0, 44),
            Size = UDim2.new(0, 35, 0, 35),
            Image = "rbxassetid://80854448131955"
        })
        vu66(v223, {
            BackgroundColor3 = "BackgroundColor3_button",
            BorderColor3 = "BorderColor3"
        })
        local vu224 = vu169("UserIDTargetLabel", vu159.Target_Section, "UserID: \nDisplay: \nCreated: ", UDim2.new(0, 150, 0, 64.98), UDim2.new(0, 300, 0, 75), Enum.Font.Oswald, 21)
        local vu225 = {
            View = vu193("View", vu159.Target_Section, 5, 25),
            Focus = vu193("Focus", vu159.Target_Section, 7, 25),
            Follow = vu193("Follow", vu159.Target_Section, 8, 25),
            Stand = vu193("Stand", vu159.Target_Section, 9, 25),
            Bang = vu193("Bang", vu159.Target_Section, 10, 25),
            Drag = vu193("Drag", vu159.Target_Section, 11, 25),
            Headsit = vu193("Headsit", vu159.Target_Section, 12, 25),
            Doggy = vu193("Doggy", vu159.Target_Section, 13, 25),
            Backpack = vu193("Backpack", vu159.Target_Section, 14, 25),
            Teleport = vu193("Teleport", vu159.Target_Section, 15, 25)
        }
        local v226 = vu169("CopyTargetLabel", vu159.Target_Section, "Copy Target", UDim2.new(0, 150, 0, 450), UDim2.new(0, 300, 0, 75), Enum.Font.Oswald, 28)
        vu225.Animation = vu193("Animation", vu159.Target_Section, 19, 25)
        __set_list(vu225, 1, {
            v226
        })
        local v227 = {
            Vampire = vu193("Vampire", vu159.Animations_Section, 1),
            Hero = vu193("Hero", vu159.Animations_Section, 2),
            Ghost = vu193("Ghost", vu159.Animations_Section, 3),
            Elder = vu193("Elder", vu159.Animations_Section, 4),
            Mage = vu193("Mage", vu159.Animations_Section, 5),
            Catwalk = vu193("Catwalk", vu159.Animations_Section, 6),
            Levitation = vu193("Levitation", vu159.Animations_Section, 7),
            Astronaut = vu193("Astronaut", vu159.Animations_Section, 8),
            Ninja = vu193("Ninja", vu159.Animations_Section, 9),
            Adidas = vu193("Adidas", vu159.Animations_Section, 10),
            AdidasClassic = vu193("Adidas Classic", vu159.Animations_Section, 11),
            Cartoon = vu193("Cartoon", vu159.Animations_Section, 12),
            Pirate = vu193("Pirate", vu159.Animations_Section, 13),
            Sneaky = vu193("Sneaky", vu159.Animations_Section, 14),
            Toy = vu193("Toy", vu159.Animations_Section, 15),
            Knight = vu193("Knight", vu159.Animations_Section, 16),
            Confident = vu193("Confident", vu159.Animations_Section, 17),
            Popstar = vu193("Popstar", vu159.Animations_Section, 18),
            Princess = vu193("Princess", vu159.Animations_Section, 19),
            Cowboy = vu193("Cowboy", vu159.Animations_Section, 20),
            Patrol = vu193("Patrol", vu159.Animations_Section, 21),
            Werewolf = vu193("Werewolf", vu159.Animations_Section, 22),
            Robot = vu193("Robot", vu159.Animations_Section, 23),
            Zombie = vu193("Zombie", vu159.Animations_Section, 24),
            ZombieClassic = vu193("Zombie Classic", vu159.Animations_Section, 25)
        }
        local vu228 = {}
        local v229 = vu169("CustomAnim_Label", vu159.Animations_Section, "Custom Animation", UDim2.new(0, 125, 0, 675), UDim2.new(0, 300, 0, 75), Enum.Font.Oswald, 28)
        vu228.Idle = vu193("Idle", vu159.Animations_Section, 29)
        vu228.Idle_Input = vu193("Idle_Input", vu159.Animations_Section, 30, nil, true, "Animation ID")
        vu228.Walk = vu193("Walk", vu159.Animations_Section, 31)
        vu228.Walk_Input = vu193("Walk_Input", vu159.Animations_Section, 32, nil, true, "Animation ID")
        vu228.Jump = vu193("Jump", vu159.Animations_Section, 33)
        vu228.Jump_Input = vu193("Jump_Input", vu159.Animations_Section, 34, nil, true, "Animation ID")
        vu228.Fall = vu193("Fall", vu159.Animations_Section, 35)
        vu228.Fall_Input = vu193("Fall_Input", vu159.Animations_Section, 36, nil, true, "Animation ID")
        __set_list(vu228, 1, {
            v229
        })
        local v230 = {}
        local v231 = vu169("Casual_Label", vu159.More_Section, "Casual", UDim2.new(0, 25, 0, 25), UDim2.new(0, 300, 0, 75), Enum.Font.Oswald, 28)
        v230.PianoAuto = vu193("PianoAuto", vu159.More_Section, 3)
        local v232 = vu169("FPS_Label", vu159.More_Section, "FPS", UDim2.new(0, 25, 0, 125), UDim2.new(0, 300, 0, 75), Enum.Font.Oswald, 28)
        v230.ESP = vu193("ESP", vu159.More_Section, 7)
        v230.Aimbot = vu193("Aimbot", vu159.More_Section, 8)
        __set_list(v230, 1, {
            v231,
            v232
        })
        local vu233 = {
            AntiAFK = vu193("Anti AFK", vu159.Misc_Section, 1),
            TpToOwner = vu193("TpToOwner", vu159.Misc_Section, 2),
            Shaders = vu193("Shaders", vu159.Misc_Section, 3),
            ChangeTime = vu193("Day/Night", vu159.Misc_Section, 4),
            ResetLighting = vu193("Reset Lighting", vu159.Misc_Section, 5),
            DestroyUI = vu193("Destroy GUI", vu159.Misc_Section, 6),
            FreeEmotes = vu193("Free Emotes", vu159.Misc_Section, 7),
            ClearChat = vu193("Clear Chat", vu159.Misc_Section, 8),
            Rejoin = vu193("Rejoin", vu159.Misc_Section, 9),
            InfYieldPremium = vu193("Infinite Premium", vu159.Misc_Section, 10)
        }
        vu169("Credits_Label", vu159.About_Section, "Developed by <font color=\'rgb(255,255,255)\'>vkz</font>\n\nVersion: " .. v1, UDim2.new(0, 25, 0, 25), UDim2.new(0, 200, 0, 100))
        vu169("Donate_Label", vu159.About_Section, "Donate:", UDim2.new(0, 107.5, 0, 245), UDim2.new(0, 200, 0, 100), nil, 20)
        Donate_Link = v177("Donate_Link", vu159.About_Section, "ajudar projeto", UDim2.new(0, 182.5, 0, 245), UDim2.new(0, 90, 0, 18), 18)
        vu169("Support_Label", vu159.About_Section, "Support:", UDim2.new(0, 107.5, 0, 270), UDim2.new(0, 200, 0, 100), nil, 20)
        Support_Link = v177("Support_Link", vu159.About_Section, "acessar suporte", UDim2.new(0, 182.5, 0, 270), UDim2.new(0, 98, 0, 18), 18)
        local vu234 = vu150("ImageButton", {
            Name = "ChangeTheme_Button",
            Parent = vu159.About_Section,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.new(0, 322, 0, 247.2),
            Size = UDim2.new(0, 40, 0, 40),
            Image = savedTheme == "Dark" and "rbxassetid://111141131115404" or "rbxassetid://99955958887420"
        })
        vu66(vu234, {
            BackgroundColor3 = "BackgroundColor3_button",
            BorderColor3 = "BorderColor3"
        })
        local v235 = vu150("Folder", {
            Name = "Assets",
            Parent = vu120
        })
        local vu236 = vu150("ImageButton", {
            Name = "Ticket_Asset",
            Parent = v235,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.new(1, 5, 0.5, 0),
            Size = UDim2.new(0, 25, 0, 25),
            AnchorPoint = Vector2.new(0, 0.5),
            Image = "rbxassetid://3926305904",
            ImageColor3 = Color3.fromRGB(255, 0, 0),
            ImageRectSize = Vector2.new(36, 36),
            ImageRectOffset = Vector2.new(424, 4),
            LayoutOrder = 5,
            ZIndex = 2
        })
        local function v238(p237)
            vu236:Clone().Parent = p237
        end
        local vu239 = vu150("ImageButton", {
            Name = "Click_Asset",
            Parent = v235,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.new(1, 5, 0.5, 0),
            Size = UDim2.new(0, 25, 0, 25),
            AnchorPoint = Vector2.new(0, 0.5),
            Image = "rbxassetid://3926305904",
            ImageColor3 = Color3.fromRGB(100, 100, 100),
            ImageRectSize = Vector2.new(36, 36),
            ImageRectOffset = Vector2.new(204, 964),
            ZIndex = 2
        })
        local function v241(p240)
            vu239:Clone().Parent = p240
        end
        local vu242 = vu150("BodyAngularVelocity", {
            Name = "BreakVelocity",
            Parent = v235,
            P = 1250,
            AngularVelocity = Vector3.new(0, 0, 0),
            MaxTorque = Vector3.new(50000, 50000, 50000)
        })
        local v243 = vu150("ImageButton", {
            Name = "OpenClose",
            Parent = vu120,
            BorderSizePixel = 0,
            Position = UDim2.new(0, 0, 0.5, 0),
            Size = UDim2.new(0, 30, 0, 30),
            Image = "rbxassetid://79695215836488"
        })
        vu66(v243, {
            BackgroundColor3 = "BackgroundColor3",
            BorderColor3 = "BorderColor3",
            ImageColor3 = "ImageColor3"
        })
        vu150("UICorner", {
            Parent = v243,
            CornerRadius = UDim.new(1, 0)
        })
        v241(vu206.Fling)
        v238(vu206.AntiFling)
        v241(vu206.AntiForce)
        v238(vu206.AntiChatSpy)
        v241(vu206.CollectOrbs)
        v241(v219.Invisible)
        v241(v219.ClickTP)
        v241(v219.NoClip)
        v241(v219.JerkOff)
        v241(v219.Spin)
        v241(v219.FaceBang)
        v241(v219.feFlip)
        v241(v219.AnimSpeed)
        v241(v219.AntiVoid)
        v241(v219.Flashback)
        v238(vu220.WalkSpeed)
        v238(vu220.JumpPower)
        v238(vu220.Fly)
        v241(vu220.Respawn)
        v238(vu220.Checkpoint)
        v238(vu225.View)
        v238(vu225.Focus)
        v238(vu225.Follow)
        v238(vu225.Stand)
        v238(vu225.Bang)
        v238(vu225.Drag)
        v238(vu225.Headsit)
        v238(vu225.Doggy)
        v238(vu225.Backpack)
        v241(vu225.Teleport)
        v238(vu225.Animation)
        v241(v227.Vampire)
        v241(v227.Hero)
        v241(v227.Ghost)
        v241(v227.Elder)
        v241(v227.Mage)
        v241(v227.Catwalk)
        v241(v227.Levitation)
        v241(v227.Astronaut)
        v241(v227.Ninja)
        v241(v227.Adidas)
        v241(v227.AdidasClassic)
        v241(v227.Cartoon)
        v241(v227.Pirate)
        v241(v227.Sneaky)
        v241(v227.Toy)
        v241(v227.Knight)
        v241(v227.Confident)
        v241(v227.Popstar)
        v241(v227.Princess)
        v241(v227.Cowboy)
        v241(v227.Patrol)
        v241(v227.Werewolf)
        v241(v227.Robot)
        v241(v227.Zombie)
        v241(v227.ZombieClassic)
        v241(vu228.Idle)
        v241(vu228.Walk)
        v241(vu228.Jump)
        v241(vu228.Fall)
        v241(v230.PianoAuto)
        v241(v230.ESP)
        v241(v230.Aimbot)
        v238(vu233.AntiAFK)
        v241(vu233.TpToOwner)
        v238(vu233.Shaders)
        v238(vu233.ChangeTime)
        v241(vu233.ResetLighting)
        v241(vu233.DestroyUI)
        v241(vu233.FreeEmotes)
        v241(vu233.ClearChat)
        v241(vu233.Rejoin)
        v241(vu233.InfYieldPremium)
        local v244, v245, v246 = ipairs(v143)
        local function vu260(p247)
            local v248 = p247.Name:gsub("_Section_Button", ""):upper()
            vu152 = v248
            local v249 = vu149
            local v250, v251, v252 = ipairs(v249:GetChildren())
            while true do
                local v253
                v252, v253 = v250(v251, v252)
                if v252 == nil then
                    break
                end
                if v253:IsA("TextButton") then
                    local v254 = v253 == p247
                    vu3.TweenService:Create(v253, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        BackgroundTransparency = v254 and 0.3 or 0.5,
                        TextTransparency = v254 and 0 or 0.2
                    }):Play()
                end
            end
            local v255 = vu121
            local v256, v257, v258 = ipairs(v255:GetChildren())
            while true do
                local v259
                v258, v259 = v256(v257, v258)
                if v258 == nil then
                    break
                end
                if v259:IsA("ScrollingFrame") and v259.Name ~= "SectionList" then
                    v259.Visible = v259.Name:gsub("_Section", ""):upper() == v248
                end
            end
        end
        while true do
            local v261, v262 = v244(v245, v246)
            if v261 == nil then
                break
            end
            v246 = v261
            local vu263 = v151[v262 .. "_Section_Button"]
            vu263.MouseButton1Click:Connect(function()
                vu260(vu263)
            end)
        end
        Partnership_Link.InputBegan:Connect(function(p264)
            if p264.UserInputType == Enum.UserInputType.MouseButton1 or p264.UserInputType == Enum.UserInputType.Touch then
                setclipboard("https://discord.gg/UTDNQWABx5")
                vu15("Link Copiado!", "Cole no navegador para acessar a loja.", 10)
            end
        end)
        Partnership_Link.MouseEnter:Connect(function()
            Partnership_Link.TextColor3 = Color3.fromRGB(255, 100, 100)
        end)
        Partnership_Link.MouseLeave:Connect(function()
            Partnership_Link.TextColor3 = Color3.fromRGB(0, 100, 255)
        end)
        local vu265 = true
        local vu266 = {
            mobile = "106664533595965",
            tablet = "72895940611699",
            desktop = "71666975026687"
        }
        local vu267 = {}
        local vu268 = {}
        local vu269 = {}
        local vu270 = {}
        local vu271 = {}
        local vu272 = {}
        local vu273 = {}
        local function vu277(p274)
            if p274 and p274.Character then
                local v275 = p274.Character:FindFirstChild("Head")
                local v276 = v275 and v275:FindFirstChild("NameTagGui")
                if v276 then
                    v276:Destroy()
                end
                if not vu268[p274.UserId] and vu273[p274.UserId] then
                    vu273[p274.UserId]:Disconnect()
                    vu273[p274.UserId] = nil
                end
            end
        end
        local function vu289(p278, p279)
            if vu265 and (p278.Character and (not vu272[p278.UserId] and vu268[p278.UserId])) then
                vu272[p278.UserId] = true
                local v280 = p278.Character:FindFirstChild("Head")
                if v280 then
                    if p279 then
                        p279 = p279[p278.UserId]
                    end
                    local v281 = vu269[p278.UserId] or {
                        name = "User",
                        color = Color3.fromRGB(255, 255, 255),
                        rainbow = false
                    }
                    local _ = v281.name
                    local v282 = v281.color
                    local _ = v281.rainbow
                    local v283 = nil
                    local v284, v285
                    if p279 then
                        v284 = p279.name
                        if p279.color == "Rainbow" or p279.color == "Rainbow2" then
                            v283 = p279.rainbowType or p279.color
                            v285 = true
                        else
                            v282 = Color3.fromRGB(p279.color[1], p279.color[2], p279.color[3])
                            v285 = false
                        end
                    else
                        v282 = Color3.fromRGB(255, 255, 255)
                        v284 = "User"
                        v285 = false
                        v283 = nil
                    end
                    if v281.name ~= v284 or (v281.rainbow ~= v285 or (v281.rainbowType ~= v283 or not v285 and v281.color ~= v282)) or not v280:FindFirstChild("NameTagGui") then
                        vu277(p278)
                        local v286 = vu150("BillboardGui", {
                            Name = "NameTagGui",
                            Parent = v280,
                            Adornee = v280,
                            Size = UDim2.new(0, 200, 0, 50),
                            StudsOffset = Vector3.new(0, 2, 0),
                            MaxDistance = 50
                        })
                        local v287 = vu150("TextLabel", {
                            Parent = v286,
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 50, 0, 0),
                            Size = UDim2.new(0.5, 0, 0.5, 0),
                            Text = v284,
                            Font = Enum.Font.FredokaOne,
                            TextStrokeTransparency = 0,
                            TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
                            TextScaled = true,
                            AutoLocalize = false
                        })
                        local v288 = (v284 == "User" or v284 == "VIP") and vu266[vu267[p278.UserId] ]
                        if v288 then
                            vu150("ImageLabel", {
                                Name = "DeviceIcon",
                                Parent = v286,
                                BackgroundTransparency = 1,
                                Position = UDim2.new(0, 130, 0, 2.9),
                                Size = UDim2.new(0, 20, 0, 20),
                                Image = "rbxassetid://" .. v288
                            })
                        end
                        if v285 then
                            vu270[v287] = true
                            if v283 == "Rainbow2" then
                                vu271[v287] = vu150("UIGradient", {
                                    Name = "Gradient",
                                    Parent = v287,
                                    Color = ColorSequence.new({
                                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 100)),
                                        ColorSequenceKeypoint.new(0.25, Color3.fromRGB(255, 128, 0)),
                                        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 150)),
                                        ColorSequenceKeypoint.new(0.75, Color3.fromRGB(0, 128, 255)),
                                        ColorSequenceKeypoint.new(1, Color3.fromRGB(128, 0, 255))
                                    }),
                                    Rotation = 0
                                })
                            else
                                v287.TextColor3 = Color3.fromHSV(hue, 1, 1)
                                vu271[v287] = nil
                            end
                        else
                            v287.TextColor3 = v282
                            vu270[v287] = nil
                            vu271[v287] = nil
                        end
                        vu269[p278.UserId] = {
                            name = v284,
                            color = v282,
                            rainbow = v285,
                            rainbowType = v283
                        }
                    end
                    vu272[p278.UserId] = nil
                else
                    vu272[p278.UserId] = nil
                end
            else
                return
            end
        end
        local function vu310()
            if _users then
                local vu290 = {}
                if _tags then
                    local v291, v292, v293 = pairs(_tags)
                    while true do
                        local v294
                        v293, v294 = v291(v292, v293)
                        if v293 == nil then
                            break
                        end
                        if v294.ids then
                            local v295, v296, v297 = ipairs(v294.ids)
                            while true do
                                local v298
                                v297, v298 = v295(v296, v297)
                                if v297 == nil then
                                    break
                                end
                                vu290[v298] = {
                                    name = v294.name,
                                    color = v294.color,
                                    rainbowType = v294.rainbowType
                                }
                            end
                        end
                    end
                end
                local v299 = {}
                vu267 = {}
                local v300, v301, v302 = ipairs(_users)
                while true do
                    local v303
                    v302, v303 = v300(v301, v302)
                    if v302 == nil then
                        break
                    end
                    if v303.is_vip and not vu290[v303.user_id] then
                        vu290[v303.user_id] = {
                            name = "VIP",
                            color = {
                                255,
                                215,
                                0
                            },
                            rainbow = false
                        }
                    end
                    v299[v303.user_id] = true
                    vu267[v303.user_id] = v303.device
                    local vu304 = vu3.Players:GetPlayerByUserId(v303.user_id)
                    if vu304 then
                        task.spawn(function()
                            vu289(vu304, vu290)
                        end)
                        if not vu273[vu304.UserId] then
                            vu273[vu304.UserId] = vu304.CharacterAdded:Connect(function()
                                vu289(vu304, vu290)
                            end)
                        end
                    end
                end
                vu268 = v299
                local v305, v306, v307 = pairs(vu269)
                while true do
                    local v308
                    v307, v308 = v305(v306, v307)
                    if v307 == nil then
                        break
                    end
                    if not vu268[v307] then
                        local v309 = vu3.Players:GetPlayerByUserId(v307)
                        if v309 then
                            vu277(v309)
                        end
                        vu269[v307] = nil
                    end
                end
            end
        end
        local vu311 = 0
        vu3.RunService.Heartbeat:Connect(function(p312)
            vu310()
            vu311 = (vu311 + p312 * 0.25) % 1
            local v313, v314, v315 = pairs(vu270)
            while true do
                v315 = v313(v314, v315)
                if v315 == nil then
                    break
                end
                if v315 and v315.Parent then
                    v315.TextColor3 = Color3.fromHSV(vu311, 1, 1)
                    local v316 = vu271[v315]
                    if v316 then
                        v316.Rotation = (v316.Rotation + 1) % 360
                    end
                else
                    vu270[v315] = nil
                    vu271[v315] = nil
                end
            end
        end)
        vu183.MouseButton1Click:Connect(function()
            vu265 = not vu265
            if vu265 then
                vu183.Image = "rbxassetid://119030989234087"
            else
                vu183.Image = "rbxassetid://113916582668001"
                local v317, v318, v319 = ipairs(_users)
                while true do
                    local v320
                    v319, v320 = v317(v318, v319)
                    if v319 == nil then
                        break
                    end
                    local v321 = vu3.Players:GetPlayerByUserId(v320.user_id)
                    if v321 then
                        vu277(v321)
                        vu269[v321.UserId] = nil
                    end
                end
            end
            vu310()
        end)
        local vu322 = vu150("ScreenGui", {
            Name = "Touch_Button",
            Parent = vu4:WaitForChild("PlayerGui"),
            ResetOnSpawn = false,
            DisplayOrder = 0
        })
        local function vu329(p323, p324, p325, p326)
            if not vu11 then
                return nil
            end
            local v327 = UDim2.new(0, 40, 0, 40)
            local v328 = vu150("TextButton", {
                Parent = vu322,
                BackgroundTransparency = 0.125,
                BorderSizePixel = 0,
                Position = UDim2.new(0, 50 + (p326 - 1) * (v327.X.Offset + 35), 0, 40 + (p325 - 1) * (v327.Y.Offset + 30)),
                Size = v327,
                Text = p324,
                Font = Enum.Font.Oswald,
                TextSize = 14,
                TextScaled = true,
                TextWrapped = true
            })
            vu66(v328, {
                BackgroundColor3 = "BackgroundColor3_button",
                BorderColor3 = "BorderColor3",
                TextColor3 = "TextColor3"
            })
            if p323 then
                v328.MouseButton1Click:Connect(p323)
            end
            return v328
        end
        _FlingLoaded = false
        vu206.Fling.MouseButton1Click:Connect(function()
            pcall(function()
                if not _FlingLoaded then
                    _FlingLoaded = true
                    loadstring(vip_fling)()(vu4, vu3.RunService, vu3.UIS, vu15, vu329, "H", 2, 14)
                end
            end)
        end)
        _G.AntiFlingToggled = false
        vu206.AntiFling.MouseButton1Click:Connect(function()
            vu80(vu206.AntiFling)
            if vu206.AntiFling.Ticket_Asset.ImageColor3 ~= Color3.fromRGB(0, 255, 0) then
                _G.AntiFlingToggled = false
            else
                _G.AntiFlingToggled = true
                loadstring(vip_antifling)()
            end
        end)
        _AntiForceLoaded = false
        vu206.AntiForce.MouseButton1Click:Connect(function()
            pcall(function()
                if not _AntiForceLoaded then
                    _AntiForceLoaded = true
                    loadstring(vip_antiforce)()(vu4, vu3.UIS, vu15, vu329, "M", 3, 14)
                end
            end)
        end)
        _G.AntiChatSpyToggled = false
        vu206.AntiChatSpy.MouseButton1Click:Connect(function()
            vu80(vu206.AntiChatSpy)
            if vu206.AntiChatSpy.Ticket_Asset.ImageColor3 ~= Color3.fromRGB(0, 255, 0) then
                _G.AntiChatSpyToggled = false
            else
                _G.AntiChatSpyToggled = true
                loadstring(vip_antichatspy)()
            end
        end)
        _CollectOrbsLoaded = false
        vu206.CollectOrbs.MouseButton1Click:Connect(function()
            pcall(function()
                if not _CollectOrbsLoaded then
                    _CollectOrbsLoaded = true
                    loadstring(vip_collectorbs)()(vu4, vu3.UIS, vu15, vu329, "J", 4, 14)
                end
            end)
        end)
        _InvisibleLoaded = false
        v219.Invisible.MouseButton1Click:Connect(function()
            pcall(function()
                if not _InvisibleLoaded then
                    _InvisibleLoaded = true
                    loadstring(game:HttpGet("https://github.com/lemlestelse/script/blob/main/Emphasis/Invisible.lua"))()(vu4, vu3.RunService, vu3.UIS, vu15, vu329, "Y", 2, 1)
                end
            end)
        end)
        _ClickTPLoaded = false
        v219.ClickTP.MouseButton1Click:Connect(function()
            pcall(function()
                if (vu11 or not _ClickTPLoaded) and not (vu11 and (vu4.Backpack:FindFirstChild("TPTool") or vu4.Character and vu4.Character:FindFirstChild("TPTool"))) then
                    _ClickTPLoaded = true
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/lemlestelse/script/refs/heads/main/Emphasis/ClickTP.lua"))()(vu4, vu3.UIS, vu15)
                end
            end)
        end)
        _NoClipLoaded = false
        v219.NoClip.MouseButton1Click:Connect(function()
            pcall(function()
                if not _NoClipLoaded then
                    _NoClipLoaded = true
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/lemlestelse/script/refs/heads/main/Emphasis/NoClip.lua"))()(vu4, vu3.RunService, vu3.UIS, vu15, vu329, "N", 3, 1)
                end
            end)
        end)
        _JerkOffLoaded = false
        v219.JerkOff.MouseButton1Click:Connect(function()
            pcall(function()
                if not _JerkOffLoaded then
                    _JerkOffLoaded = true
                    loadstring(game:HttpGet("https://github.com/lemlestelse/script/blob/main/Emphasis/JerkOff.lua"))()(vu4, vu3.UIS, vu15, vu329, "R", 4, 1)
                end
            end)
        end)
        _SpinLoaded = false
        v219.Spin.MouseButton1Click:Connect(function()
            pcall(function()
                if not _SpinLoaded then
                    _SpinLoaded = true
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/lemlestelse/script/refs/heads/main/Emphasis/Spin.lua"))()(vu4, vu3.UIS, vu15, vu329, "T", 5, 1)
                end
            end)
        end)
        _FaceBangLoaded = false
        v219.FaceBang.MouseButton1Click:Connect(function()
            pcall(function()
                if not _FaceBangLoaded then
                    _FaceBangLoaded = true
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/lemlestelse/script/refs/heads/main/Emphasis/FaceBang.lua"))()
                    vu15("FaceBang", "Z.FaceBang", 5)
                end
            end)
        end)
        _feFlipLoaded = false
        v219.feFlip.MouseButton1Click:Connect(function()
            pcall(function()
                if not _feFlipLoaded then
                    _feFlipLoaded = true
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/lemlestelse/script/refs/heads/main/Emphasis/feFlip.lua"))()(vu4, vu15, vu329, "X", "C", 1, 12)
                end
            end)
        end)
        _AnimSpeedLoaded = false
        v219.AnimSpeed.MouseButton1Click:Connect(function()
            pcall(function()
                if not _AnimSpeedLoaded then
                    _AnimSpeedLoaded = true
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/lemlestelse/script/refs/heads/main/Emphasis/AnimSpeed.lua"))()(vu4, vu3.RunService, vu3.UIS, vu15, vu329, "E", "Q", 1, 2)
                end
            end)
        end)
        _AntiVoidLoaded = false
        v219.AntiVoid.MouseButton1Click:Connect(function()
            pcall(function()
                if not _AntiVoidLoaded then
                    _AntiVoidLoaded = true
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/lemlestelse/script/refs/heads/main/Emphasis/AntiVoid.lua"))()(vu4, vu3.RunService, vu3.UIS, vu15, vu329, "G", 1, 15)
                end
            end)
        end)
        _FlashbackLoaded = false
        v219.Flashback.MouseButton1Click:Connect(function()
            pcall(function()
                if not _FlashbackLoaded then
                    _FlashbackLoaded = true
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/lemlestelse/script/refs/heads/main/Emphasis/Flashback.lua"))()(vu4, vu3.RunService, vu3.UIS, vu15, vu329, "V", 1, 14)
                end
            end)
        end)
        recentSpeed = nil
        WalkSpeed = nil
        vu220.WalkSpeed_Input.FocusLost:Connect(function()
            local v330 = vu220.WalkSpeed_Input.Text:match("%d+")
            if v330 then
                WalkSpeed = tonumber(v330)
                if vu220.WalkSpeed.Ticket_Asset.ImageColor3 == Color3.fromRGB(0, 255, 0) then
                    vu4.Character.Humanoid.WalkSpeed = WalkSpeed
                end
                vu15("vk\'z Panel", "Velocidade atualizada para " .. WalkSpeed .. ".", 5)
                recentSpeed = WalkSpeed
            end
        end)
        vu220.WalkSpeed.MouseButton1Click:Connect(function()
            vu80(vu220.WalkSpeed)
            if vu220.WalkSpeed.Ticket_Asset.ImageColor3 ~= Color3.fromRGB(0, 255, 0) then
                WalkSpeed = 16
            else
                WalkSpeed = 50
                if recentSpeed then
                    WalkSpeed = recentSpeed
                end
            end
            vu4.Character.Humanoid.WalkSpeed = WalkSpeed
        end)
        recentPower = nil
        JumpPower = nil
        vu220.JumpPower_Input.FocusLost:Connect(function()
            local v331 = vu220.JumpPower_Input.Text:match("%d+")
            if v331 then
                JumpPower = tonumber(v331)
                if vu220.JumpPower.Ticket_Asset.ImageColor3 == Color3.fromRGB(0, 255, 0) then
                    vu4.Character.Humanoid.JumpHeight = JumpPower
                end
                vu15("vk\'z Panel", "Altura do pulo atualizada para " .. JumpPower .. ".", 5)
                recentPower = JumpPower
            end
        end)
        vu220.JumpPower.MouseButton1Click:Connect(function()
            vu80(vu220.JumpPower)
            if vu220.JumpPower.Ticket_Asset.ImageColor3 ~= Color3.fromRGB(0, 255, 0) then
                JumpPower = 7.199999809265137
            else
                JumpPower = 50
                if recentPower then
                    JumpPower = recentPower
                end
            end
            vu4.Character.Humanoid.JumpHeight = JumpPower
        end)
        recentFlySpeed = 75
        FlySpeed = 75
        vu220.FlySpeed_Input.FocusLost:Connect(function()
            local v332 = vu220.FlySpeed_Input.Text:match("%d+")
            if v332 then
                FlySpeed = tonumber(v332)
                recentFlySpeed = FlySpeed
                vu15("vk\'z Panel", "Velocidade de voo atualizada para " .. FlySpeed .. ".", 5)
            end
        end)
        local vu333 = {}
        local vu334 = nil
        local vu335 = nil
        local vu336 = nil
        local vu337 = false
        local vu338 = false
        local vu339 = false
        local vu340 = false
        local function vu377()
            local v341 = vu4.Character or vu4.CharacterAdded:Wait()
            local vu342 = v341:WaitForChild("Humanoid")
            local vu343 = v341:WaitForChild("HumanoidRootPart")
            local function v346(p344)
                local v345 = Instance.new("Animation")
                v345.AnimationId = p344
                return vu342:LoadAnimation(v345)
            end
            local v347, v348, v349 = pairs({
                forward = "rbxassetid://10714177846",
                left = "rbxassetid://10147823318",
                backward = "rbxassetid://10147823318",
                right = "rbxassetid://10147823318",
                idleFly = "rbxassetid://10714347256"
            })
            local vu350 = vu342
            while true do
                local v351
                v349, v351 = v347(v348, v349)
                if v349 == nil then
                    break
                end
                vu333[v349] = v346(v351)
            end
            local function vu357()
                local v352 = vu350
                local v353, v354, v355 = pairs(v352:GetPlayingAnimationTracks())
                while true do
                    local v356
                    v355, v356 = v353(v354, v355)
                    if v355 == nil then
                        break
                    end
                    v356:Stop()
                end
            end
            local function vu362(p358, p359, p360)
                local v361 = vu333[p358]
                if v361 then
                    vu357()
                    v361:Play()
                    v361.TimePosition = p359
                    v361:AdjustSpeed(p360)
                end
            end
            local function vu364(p363)
                if p363 then
                    vu4.DevEnableMouseLock = vu336
                else
                    vu336 = vu4.DevEnableMouseLock
                    vu4.DevEnableMouseLock = false
                end
            end
            local function vu365()
                if not vu338 then
                    vu338 = true
                    vu364(false)
                    vu350:ChangeState(Enum.HumanoidStateType.Physics)
                    vu343.Velocity = Vector3.new(0, 50, 0)
                    vu334 = Instance.new("BodyVelocity", vu343)
                    vu334.MaxForce = Vector3.new(1000000, 1000000, 1000000)
                    vu334.Velocity = Vector3.zero
                    vu335 = Instance.new("BodyGyro", vu343)
                    vu335.MaxTorque = Vector3.new(400000, 400000, 400000)
                    vu335.CFrame = vu343.CFrame
                end
            end
            local function vu366()
                if vu338 then
                    vu338 = false
                    vu357()
                    if vu334 then
                        vu334:Destroy()
                        vu334 = nil
                    end
                    if vu335 then
                        vu335:Destroy()
                        vu335 = nil
                    end
                    vu350:ChangeState(Enum.HumanoidStateType.GettingUp)
                    vu364(true)
                end
            end
            local function vu368(p367)
                if vu338 then
                    if vu3.UIS:IsKeyDown(Enum.KeyCode.LeftControl) and p367 then
                        if not vu337 then
                            FlySpeed = recentFlySpeed * 1.3333333333333333
                            vu337 = true
                            vu3.TweenService:Create(vu9, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                                FieldOfView = 90
                            }):Play()
                        end
                    elseif vu337 then
                        FlySpeed = recentFlySpeed
                        vu337 = false
                        vu3.TweenService:Create(vu9, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            FieldOfView = 70
                        }):Play()
                    end
                end
            end
            local function vu376()
                if vu338 then
                    local v369 = Vector3.zero
                    local v370 = 0
                    local v371 = 0
                    local v372 = vu9.CFrame.LookVector
                    local v373 = vu9.CFrame.RightVector
                    local v374 = (vu4.Character or vu4.CharacterAdded:Wait()):WaitForChild("Humanoid").MoveDirection
                    local v375
                    if v374.Magnitude <= 0 then
                        v375 = false
                    else
                        v375 = true
                        v369 = Vector3.new(v374.X, math.abs(Vector3.new(v374.X, 0, v374.Z):Dot(Vector3.new(v372.X, 0, v372.Z))) < math.abs(Vector3.new(v374.X, 0, v374.Z):Dot(Vector3.new(v373.X, 0, v373.Z))) and 0 or (v372.Y * (Vector3.new(v374.X, 0, v374.Z):Dot(Vector3.new(v372.X, 0, v372.Z)) >= 0 and 1 or - 1) or 0), v374.Z) * FlySpeed
                        if math.abs(Vector3.new(v374.X, 0, v374.Z):Dot(Vector3.new(v373.X, 0, v373.Z))) <= math.abs(Vector3.new(v374.X, 0, v374.Z):Dot(Vector3.new(v372.X, 0, v372.Z))) then
                            if Vector3.new(v374.X, 0, v374.Z):Dot(Vector3.new(v372.X, 0, v372.Z)) <= 0 then
                                vu362("backward", 4.11, 0)
                            else
                                vu362("forward", 4.65, 0)
                                v370 = - 85
                                v371 = - 0.3
                            end
                        elseif Vector3.new(v374.X, 0, v374.Z):Dot(Vector3.new(v373.X, 0, v373.Z)) <= 0 then
                            vu362("left", 3.55, 0)
                        else
                            vu362("right", 4.81, 0)
                        end
                    end
                    if not vu11 then
                        if vu3.UIS:IsKeyDown(Enum.KeyCode.Space) then
                            v369 = v369 + Vector3.new(0, 0.25, 0) * FlySpeed
                            v375 = true
                        end
                        if vu3.UIS:IsKeyDown(Enum.KeyCode.LeftShift) then
                            v369 = v369 - Vector3.new(0, 0.25, 0) * FlySpeed
                            v375 = true
                        end
                    end
                    if v375 then
                        if vu334 then
                            vu334.Velocity = v369
                        end
                        if vu335 then
                            vu335.CFrame = CFrame.new(vu343.Position, vu343.Position + v372) * CFrame.Angles(math.rad(v370), v371, 0)
                        end
                    else
                        vu362("idleFly", 4, 0)
                        if vu334 then
                            vu334.Velocity = Vector3.zero
                        end
                        if vu335 then
                            vu335.CFrame = CFrame.new(vu343.Position, vu343.Position + v372)
                        end
                    end
                    return v375
                end
            end
            vu3.RunService.RenderStepped:Connect(function()
                vu368((vu376()))
            end);
            (function()
                vu80(vu220.Fly)
                vu339 = true
                if not vu340 then
                    vu15("Fly", "F.Fly", 5)
                    vu340 = true
                end
                if vu220.Fly.Ticket_Asset.ImageColor3 ~= Color3.fromRGB(0, 255, 0) then
                    vu366()
                else
                    vu365()
                end
            end)()
        end
        vu3.UIS.InputBegan:Connect(function(p378, p379)
            if vu339 and (not p379 and p378.KeyCode == Enum.KeyCode.F) then
                vu377()
            end
        end)
        vu220.Fly.MouseButton1Click:Connect(vu377)
        vu220.Respawn.MouseButton1Click:Connect(function()
            local v380 = vu147(vu4).Position
            vu4.Character.Humanoid.Health = 0
            vu4.CharacterAdded:wait()
            vu97(v380.X, v380.Y, v380.Z, "pos", "safe")
        end)
        SavedCheckpoint = nil
        vu220.Checkpoint.MouseButton1Click:Connect(function()
            vu80(vu220.Checkpoint)
            if vu220.Checkpoint.Ticket_Asset.ImageColor3 ~= Color3.fromRGB(0, 255, 0) then
                SavedCheckpoint = nil
                vu15("vk\'z Panel", "Checkpoint limpo.", 5)
            else
                SavedCheckpoint = vu147(vu4).Position
                vu15("vk\'z Panel", "Checkpoint salvo.", 5)
            end
        end)
        TargetedPlayer = nil
        local function vu382(p381)
            if p381 == nil then
                vu222.Text = "@username..."
                vu224.Text = "UserID: \nDisplay: \nCreated: "
                vu221.Image = "rbxassetid://10818605405"
                TargetedPlayer = nil
                vu225.View.Ticket_Asset.ImageColor3 = Color3.fromRGB(255, 0, 0)
                vu225.Focus.Ticket_Asset.ImageColor3 = Color3.fromRGB(255, 0, 0)
                vu225.Follow.Ticket_Asset.ImageColor3 = Color3.fromRGB(255, 0, 0)
                vu225.Stand.Ticket_Asset.ImageColor3 = Color3.fromRGB(255, 0, 0)
                vu225.Bang.Ticket_Asset.ImageColor3 = Color3.fromRGB(255, 0, 0)
                vu225.Drag.Ticket_Asset.ImageColor3 = Color3.fromRGB(255, 0, 0)
                vu225.Headsit.Ticket_Asset.ImageColor3 = Color3.fromRGB(255, 0, 0)
                vu225.Doggy.Ticket_Asset.ImageColor3 = Color3.fromRGB(255, 0, 0)
                vu225.Backpack.Ticket_Asset.ImageColor3 = Color3.fromRGB(255, 0, 0)
                vu225.Animation.Ticket_Asset.ImageColor3 = Color3.fromRGB(255, 0, 0)
            else
                TargetedPlayer = p381.Name
                vu222.Text = p381.Name
                vu224.Text = "UserID: " .. p381.UserId .. "\nDisplay: " .. p381.DisplayName .. "\nCreated: " .. os.date("%d-%m-%Y", os.time() - p381.AccountAge * 24 * 3600)
                vu221.Image = vu3.Players:GetUserThumbnailAsync(p381.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
            end
        end
        local vu383 = nil
        v223.MouseButton1Click:Connect(function()
            if not (vu4.Backpack:FindFirstChild("ClickTarget") or vu4.Character and vu4.Character:FindFirstChild("ClickTarget")) then
                vu383 = Instance.new("Tool")
                vu383.Name = "ClickTarget"
                vu383.RequiresHandle = false
                vu383.TextureId = "rbxassetid://80854448131955"
                vu383.ToolTip = "Select Target"
            end
            local function vu386()
                local v384 = vu10.Target
                local v385 = nil
                if v384 and v384.Parent then
                    if v384.Parent:IsA("Model") then
                        v385 = vu3.Players:GetPlayerFromCharacter(v384.Parent)
                    elseif v384.Parent:IsA("Accessory") then
                        v385 = vu3.Players:GetPlayerFromCharacter(v384.Parent.Parent)
                    end
                    if v385 then
                        vu382(v385)
                    end
                end
            end
            vu383.Activated:Connect(function()
                vu386()
            end)
            vu383.Parent = vu4.Backpack
        end)
        vu222.FocusLost:Connect(function()
            vu382((vu86(vu222.Text)))
        end)
        vu225.View.MouseButton1Click:Connect(function()
            if TargetedPlayer == nil then
                vu382((vu86(vu222.Text)))
            end
            if TargetedPlayer ~= nil then
                vu80(vu225.View)
                if vu225.View.Ticket_Asset.ImageColor3 == Color3.fromRGB(0, 255, 0) then
                    repeat
                        pcall(function()
                            game.Workspace.CurrentCamera.CameraSubject = vu3.Players[TargetedPlayer].Character.Humanoid
                        end)
                        task.wait(0.1)
                    until vu225.View.Ticket_Asset.ImageColor3 == Color3.fromRGB(255, 0, 0)
                    game.Workspace.CurrentCamera.CameraSubject = vu4.Character.Humanoid
                end
            end
        end)
        vu225.Focus.MouseButton1Click:Connect(function()
            if TargetedPlayer == nil then
                vu382((vu86(vu222.Text)))
            end
            if TargetedPlayer ~= nil then
                vu80(vu225.Focus)
                if vu225.Focus.Ticket_Asset.ImageColor3 == Color3.fromRGB(0, 255, 0) then
                    repeat
                        pcall(function()
                            vu97(0, 0, 0, vu3.Players[TargetedPlayer])
                        end)
                        task.wait(0.2)
                    until vu225.Focus.Ticket_Asset.ImageColor3 == Color3.fromRGB(255, 0, 0)
                end
            end
        end)
        vu225.Follow.MouseButton1Click:Connect(function()
            if TargetedPlayer == nil then
                vu382((vu86(vu222.Text)))
            end
            if TargetedPlayer ~= nil then
                vu80(vu225.Follow)
                if vu225.Follow.Ticket_Asset.ImageColor3 == Color3.fromRGB(0, 255, 0) then
                    local vu387 = Vector3.new()
                    local vu388 = false
                    repeat
                        pcall(function()
                            local vu389 = vu147(vu4)
                            if vu389 and not vu389:FindFirstChild("BreakVelocity") then
                                pcall(function()
                                    vu242:Clone().Parent = vu389
                                end)
                            end
                            local v390 = vu147(vu3.Players[TargetedPlayer])
                            if vu389 and v390 then
                                local v391 = v390.Position - v390.CFrame.LookVector * 2
                                local v392 = CFrame.new(v391, v390.Position)
                                vu389.CFrame = vu389.CFrame:Lerp(v392, 0.25)
                                vu389.Velocity = Vector3.new(0, 0, 0)
                                if (v390.Position - vu387).Magnitude <= 0.05 then
                                    if vu388 then
                                        vu388 = false
                                        vu148()
                                    end
                                elseif not vu388 then
                                    vu388 = true
                                    vu108(10921269718, 4, 1)
                                end
                                vu387 = v390.Position
                            end
                        end)
                        task.wait()
                    until vu225.Follow.Ticket_Asset.ImageColor3 == Color3.fromRGB(255, 0, 0)
                    vu148()
                    if vu147(vu4):FindFirstChild("BreakVelocity") then
                        vu147(vu4).BreakVelocity:Destroy()
                    end
                end
            end
        end)
        vu225.Stand.MouseButton1Click:Connect(function()
            if TargetedPlayer == nil then
                vu382((vu86(vu222.Text)))
            end
            if TargetedPlayer ~= nil then
                vu80(vu225.Stand)
                if vu225.Stand.Ticket_Asset.ImageColor3 == Color3.fromRGB(0, 255, 0) then
                    vu108(13823324057, 4, 0)
                    repeat
                        pcall(function()
                            if not vu147(vu4):FindFirstChild("BreakVelocity") then
                                pcall(function()
                                    vu242:Clone().Parent = vu147(vu4)
                                end)
                            end
                            local v393 = vu147(vu3.Players[TargetedPlayer])
                            vu147(vu4).CFrame = v393.CFrame * CFrame.new(- 3, 1, 0)
                            vu147(vu4).Velocity = Vector3.new(0, 0, 0)
                        end)
                        task.wait()
                    until vu225.Stand.Ticket_Asset.ImageColor3 == Color3.fromRGB(255, 0, 0)
                    vu148()
                    if vu147(vu4):FindFirstChild("BreakVelocity") then
                        vu147(vu4).BreakVelocity:Destroy()
                    end
                end
            end
        end)
        vu225.Bang.MouseButton1Click:Connect(function()
            if TargetedPlayer == nil then
                vu382((vu86(vu222.Text)))
            end
            if TargetedPlayer ~= nil then
                vu80(vu225.Bang)
                if vu225.Bang.Ticket_Asset.ImageColor3 == Color3.fromRGB(0, 255, 0) then
                    vu108(5918726674, 0, 1)
                    repeat
                        pcall(function()
                            if not vu147(vu4):FindFirstChild("BreakVelocity") then
                                pcall(function()
                                    vu242:Clone().Parent = vu147(vu4)
                                end)
                            end
                            local v394 = vu147(vu3.Players[TargetedPlayer])
                            vu147(vu4).CFrame = v394.CFrame * CFrame.new(0, 0, 1.1)
                            vu147(vu4).Velocity = Vector3.new(0, 0, 0)
                        end)
                        task.wait()
                    until vu225.Bang.Ticket_Asset.ImageColor3 == Color3.fromRGB(255, 0, 0)
                    vu148()
                    if vu147(vu4):FindFirstChild("BreakVelocity") then
                        vu147(vu4).BreakVelocity:Destroy()
                    end
                end
            end
        end)
        vu225.Drag.MouseButton1Click:Connect(function()
            if TargetedPlayer == nil then
                vu382((vu86(vu222.Text)))
            end
            if TargetedPlayer ~= nil then
                vu80(vu225.Drag)
                if vu225.Drag.Ticket_Asset.ImageColor3 == Color3.fromRGB(0, 255, 0) then
                    vu108(10714360343, 0.5, 0)
                    repeat
                        pcall(function()
                            if not vu147(vu4):FindFirstChild("BreakVelocity") then
                                pcall(function()
                                    vu242:Clone().Parent = vu147(vu4)
                                end)
                            end
                            local v395 = vu3.Players[TargetedPlayer].Character.RightHand
                            vu147(vu4).CFrame = v395.CFrame * CFrame.new(0, - 2.5, 1) * CFrame.Angles(- 2, - 3, 0)
                            vu147(vu4).Velocity = Vector3.new(0, 0, 0)
                        end)
                        task.wait()
                    until vu225.Drag.Ticket_Asset.ImageColor3 == Color3.fromRGB(255, 0, 0)
                    vu148()
                    if vu147(vu4):FindFirstChild("BreakVelocity") then
                        vu147(vu4).BreakVelocity:Destroy()
                    end
                end
            end
        end)
        vu225.Headsit.MouseButton1Click:Connect(function()
            if TargetedPlayer == nil then
                vu382((vu86(vu222.Text)))
            end
            if TargetedPlayer ~= nil then
                vu80(vu225.Headsit)
                if vu225.Headsit.Ticket_Asset.ImageColor3 == Color3.fromRGB(0, 255, 0) then
                    repeat
                        pcall(function()
                            if not vu147(vu4):FindFirstChild("BreakVelocity") then
                                pcall(function()
                                    vu242:Clone().Parent = vu147(vu4)
                                end)
                            end
                            local v396 = vu3.Players[TargetedPlayer].Character.Head
                            vu4.Character.Humanoid.Sit = true
                            vu147(vu4).CFrame = v396.CFrame * CFrame.new(0, 2, 0)
                            vu147(vu4).Velocity = Vector3.new(0, 0, 0)
                        end)
                        task.wait()
                    until vu225.Headsit.Ticket_Asset.ImageColor3 == Color3.fromRGB(255, 0, 0)
                    if vu147(vu4):FindFirstChild("BreakVelocity") then
                        vu147(vu4).BreakVelocity:Destroy()
                    end
                end
            end
        end)
        vu225.Doggy.MouseButton1Click:Connect(function()
            if TargetedPlayer == nil then
                vu382((vu86(vu222.Text)))
            end
            if TargetedPlayer ~= nil then
                vu80(vu225.Doggy)
                if vu225.Doggy.Ticket_Asset.ImageColor3 == Color3.fromRGB(0, 255, 0) then
                    vu108(13694096724, 3.4, 0)
                    repeat
                        pcall(function()
                            if not vu147(vu4):FindFirstChild("BreakVelocity") then
                                pcall(function()
                                    vu242:Clone().Parent = vu147(vu4)
                                end)
                            end
                            local v397 = vu3.Players[TargetedPlayer].Character.LowerTorso
                            vu147(vu4).CFrame = v397.CFrame * CFrame.new(0, 0.23, 0)
                            vu147(vu4).Velocity = Vector3.new(0, 0, 0)
                        end)
                        task.wait()
                    until vu225.Doggy.Ticket_Asset.ImageColor3 == Color3.fromRGB(255, 0, 0)
                    vu148()
                    if vu147(vu4):FindFirstChild("BreakVelocity") then
                        vu147(vu4).BreakVelocity:Destroy()
                    end
                end
            end
        end)
        vu225.Backpack.MouseButton1Click:Connect(function()
            if TargetedPlayer == nil then
                vu382((vu86(vu222.Text)))
            end
            if TargetedPlayer ~= nil then
                vu80(vu225.Backpack)
                if vu225.Backpack.Ticket_Asset.ImageColor3 == Color3.fromRGB(0, 255, 0) then
                    repeat
                        pcall(function()
                            if not vu147(vu4):FindFirstChild("BreakVelocity") then
                                pcall(function()
                                    vu242:Clone().Parent = vu147(vu4)
                                end)
                            end
                            local v398 = vu147(vu3.Players[TargetedPlayer])
                            vu4.Character.Humanoid.Sit = true
                            vu147(vu4).CFrame = v398.CFrame * CFrame.new(0, 0, 1.2) * CFrame.Angles(0, - 3, 0)
                            vu147(vu4).Velocity = Vector3.new(0, 0, 0)
                        end)
                        task.wait()
                    until vu225.Backpack.Ticket_Asset.ImageColor3 == Color3.fromRGB(255, 0, 0)
                    if vu147(vu4):FindFirstChild("BreakVelocity") then
                        vu147(vu4).BreakVelocity:Destroy()
                    end
                end
            end
        end)
        vu225.Teleport.MouseButton1Click:Connect(function()
            if TargetedPlayer == nil then
                vu382((vu86(vu222.Text)))
            end
            if TargetedPlayer ~= nil then
                vu97(0, 0, 0, vu3.Players[TargetedPlayer], "safe")
            end
        end)
        isCopyingAnimations = false
        vu225.Animation.MouseButton1Click:Connect(function()
            if TargetedPlayer == nil then
                vu382((vu86(vu222.Text)))
            end
            if TargetedPlayer ~= nil then
                vu80(vu225.Animation)
                if vu225.Animation.Ticket_Asset.ImageColor3 ~= Color3.fromRGB(0, 255, 0) then
                    if (vu4.Character or vu4.CharacterAdded:Wait()):FindFirstChildWhichIsA("Humanoid") then
                        vu148()
                    end
                    isCopyingAnimations = false
                else
                    local v399 = vu3.Players[TargetedPlayer]
                    if not v399 then
                        return
                    end
                    local v400 = v399.Character or v399.CharacterAdded:Wait()
                    if not v400 then
                        return
                    end
                    local v401 = vu4.Character or vu4.CharacterAdded:Wait()
                    local vu402 = v401:FindFirstChildWhichIsA("Humanoid") or v401:WaitForChild("Humanoid", 0.5)
                    local vu403 = v400:FindFirstChildWhichIsA("Humanoid") or v400:WaitForChild("Humanoid", 0.5)
                    if not (vu402 and vu403) then
                        return
                    end
                    if not isCopyingAnimations then
                        isCopyingAnimations = true
                        task.spawn(function()
                            while isCopyingAnimations do
                                local v404 = vu403
                                local v405, v406, v407 = pairs(v404:GetPlayingAnimationTracks())
                                while true do
                                    local vu408
                                    v407, vu408 = v405(v406, v407)
                                    if v407 == nil then
                                        break
                                    end
                                    if not string.find(vu408.Animation.AnimationId, "507768375") then
                                        local v409 = Instance.new("Animation")
                                        v409.AnimationId = vu408.Animation.AnimationId
                                        local vu410 = vu402:LoadAnimation(v409)
                                        vu410.Priority = vu408.Priority
                                        vu410.Looped = vu408.Looped
                                        local v411 = vu410
                                        vu410.Play(v411, 0.1, 1, vu408.Speed)
                                        vu410.TimePosition = vu408.TimePosition
                                        task.spawn(function()
                                            vu408.Stopped:Wait()
                                            vu410:Stop()
                                            vu410:Destroy()
                                        end)
                                    end
                                end
                                task.wait(0.1)
                            end
                        end)
                    end
                end
            end
        end)
        local function vu420(p412, p413, p414, p415, p416, p417, p418)
            local v419 = vu4.Character.Animate
            v419.Disabled = true
            vu148()
            v419.idle.Animation1.AnimationId = "rbxassetid://" .. p412
            v419.idle.Animation2.AnimationId = "rbxassetid://" .. p413
            v419.walk.WalkAnim.AnimationId = "rbxassetid://" .. p414
            v419.run.RunAnim.AnimationId = "rbxassetid://" .. p415
            v419.jump.JumpAnim.AnimationId = "rbxassetid://" .. p416
            v419.climb.ClimbAnim.AnimationId = "rbxassetid://" .. p417
            v419.fall.FallAnim.AnimationId = "rbxassetid://" .. p418
            vu4.Character.Humanoid:ChangeState(3)
            v419.Disabled = false
        end
        v227.Vampire.MouseButton1Click:Connect(function()
            vu420(1083445855, 1083450166, 1083473930, 1083462077, 1083455352, 1083439238, 1083443587)
        end)
        v227.Hero.MouseButton1Click:Connect(function()
            vu420(616111295, 616113536, 616122287, 616117076, 616115533, 616104706, 616108001)
        end)
        v227.Ghost.MouseButton1Click:Connect(function()
            vu420(616006778, 616008087, 616010382, 616013216, 616008936, 616003713, 616005863)
        end)
        v227.Elder.MouseButton1Click:Connect(function()
            vu420(845397899, 845400520, 845403856, 845386501, 845398858, 845392038, 845396048)
        end)
        v227.Mage.MouseButton1Click:Connect(function()
            vu420(707742142, 707855907, 707897309, 707861613, 707853694, 707826056, 707829716)
        end)
        v227.Catwalk.MouseButton1Click:Connect(function()
            vu420(133806214992291, 94970088341563, 109168724482748, 81024476153754, 116936326516985, 119377220967554, 92294537340807)
        end)
        v227.Levitation.MouseButton1Click:Connect(function()
            vu420(616006778, 616008087, 616010382, 616013216, 616008936, 616003713, 616005863)
        end)
        v227.Astronaut.MouseButton1Click:Connect(function()
            vu420(891621366, 891633237, 891667138, 891636393, 891627522, 891609353, 891617961)
        end)
        v227.Ninja.MouseButton1Click:Connect(function()
            vu420(656117400, 656118341, 656121766, 656118852, 656117878, 656114359, 656115606)
        end)
        v227.Adidas.MouseButton1Click:Connect(function()
            vu420(122257458498464, 102357151005774, 122150855457006, 82598234841035, 75290611992385, 88763136693023, 98600215928904)
        end)
        v227.AdidasClassic.MouseButton1Click:Connect(function()
            vu420(18537376492, 18537371272, 18537392113, 18537384940, 18537380791, 18537363391, 18537367238)
        end)
        v227.Cartoon.MouseButton1Click:Connect(function()
            vu420(742637544, 742638445, 742640026, 742638842, 742637942, 742636889, 742637151)
        end)
        v227.Pirate.MouseButton1Click:Connect(function()
            vu420(750781874, 750782770, 750785693, 750783738, 750782230, 750779899, 750780242)
        end)
        v227.Sneaky.MouseButton1Click:Connect(function()
            vu420(1132473842, 1132477671, 1132510133, 1132494274, 1132489853, 1132461372, 1132469004)
        end)
        v227.Toy.MouseButton1Click:Connect(function()
            vu420(782841498, 782845736, 782843345, 782842708, 782847020, 782843869, 782846423)
        end)
        v227.Knight.MouseButton1Click:Connect(function()
            vu420(657595757, 657568135, 657552124, 657564596, 658409194, 658360781, 657600338)
        end)
        v227.Confident.MouseButton1Click:Connect(function()
            vu420(1069977950, 1069987858, 1070017263, 1070001516, 1069984524, 1069946257, 1069973677)
        end)
        v227.Popstar.MouseButton1Click:Connect(function()
            vu420(1212900985, 1212900985, 1212980338, 1212980348, 1212954642, 1213044953, 1212900995)
        end)
        v227.Princess.MouseButton1Click:Connect(function()
            vu420(941003647, 941013098, 941028902, 941015281, 941008832, 940996062, 941000007)
        end)
        v227.Cowboy.MouseButton1Click:Connect(function()
            vu420(1014390418, 1014398616, 1014421541, 1014401683, 1014394726, 1014380606, 1014384571)
        end)
        v227.Patrol.MouseButton1Click:Connect(function()
            vu420(1149612882, 1150842221, 1151231493, 1150967949, 1150944216, 1148811837, 1148863382)
        end)
        v227.Werewolf.MouseButton1Click:Connect(function()
            vu420(1083195517, 1083214717, 1083178339, 1083216690, 1083218792, 1083182000, 1083189019)
        end)
        v227.Robot.MouseButton1Click:Connect(function()
            vu420(10921248039, 10921248831, 10921255446, 10921250460, 10921252123, 10921247141, 10921251156)
        end)
        v227.Zombie.MouseButton1Click:Connect(function()
            vu420(3489171152, 3489171152, 3489174223, 3489173414, 616161997, 616156119, 616157476)
        end)
        v227.ZombieClassic.MouseButton1Click:Connect(function()
            vu420(616158929, 616160636, 616168032, 616163682, 616161997, 616156119, 616157476)
        end)
        local function vu425(p421, p422, p423)
            local v424 = vu4.Character:WaitForChild("Animate")
            v424.Disabled = true
            vu148()
            p422.AnimationId = "rbxassetid://" .. (tonumber(p421.Text:match("%d+")) or p423)
            vu4.Character.Humanoid:ChangeState(3)
            v424.Disabled = false
        end
        vu228.Idle.MouseButton1Click:Connect(function()
            vu425(vu228.Idle_Input, vu4.Character.Animate.idle.Animation1, 122257458498464)
            vu425(vu228.Idle_Input, vu4.Character.Animate.idle.Animation2, 102357151005774)
        end)
        vu228.Walk.MouseButton1Click:Connect(function()
            vu425(vu228.Walk_Input, vu4.Character.Animate.walk.WalkAnim, 18537392113)
            vu425(vu228.Walk_Input, vu4.Character.Animate.run.RunAnim, 18537384940)
        end)
        vu228.Jump.MouseButton1Click:Connect(function()
            vu425(vu228.Jump_Input, vu4.Character.Animate.jump.JumpAnim, 18537380791)
        end)
        vu228.Fall.MouseButton1Click:Connect(function()
            vu425(vu228.Fall_Input, vu4.Character.Animate.fall.FallAnim, 18537367238)
        end)
        v230.PianoAuto.MouseButton1Click:Connect(function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/lemlestelse/script/refs/heads/main/More/PianoAuto.lua"))()
            end)
        end)
        _ESPLoaded = false
        v230.ESP.MouseButton1Click:Connect(function()
            pcall(function()
                if not _ESPLoaded then
                    _ESPLoaded = true
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/lemlestelse/script/refs/heads/main/More/ESP.lua"))()(vu4, vu3.RunService, vu3.UIS, vu15, vu329, "E", 1, 4)
                end
            end)
        end)
        _AimbotLoaded = false
        v230.Aimbot.MouseButton1Click:Connect(function()
            pcall(function()
                if not _AimbotLoaded then
                    _AimbotLoaded = true
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/lemlestelse/script/refs/heads/main/More/Aimbot.lua"))()(vu4, vu3.RunService, vu3.UIS, vu15, vu329, "F", 1, 3)
                end
            end)
        end)
        AntiAFKFunction = nil
        vu233.AntiAFK.MouseButton1Click:Connect(function()
            vu80(vu233.AntiAFK)
            if vu233.AntiAFK.Ticket_Asset.ImageColor3 ~= Color3.fromRGB(0, 255, 0) then
                AntiAFKFunction:Disconnect()
            else
                AntiAFKFunction = vu4.Idled:Connect(function()
                    local v426 = game:GetService("VirtualUser")
                    v426:CaptureController()
                    v426:ClickButton2(Vector2.new())
                end)
            end
        end)
        vu233.TpToOwner.MouseButton1Click:Connect(function()
            if vu6 ~= vu2 then
                local v427 = vu3.Players:GetPlayerByUserId(vu2)
                if v427 and v427.Character and v427.Character:FindFirstChild("HumanoidRootPart") then
                    vu4.Character:SetPrimaryPartCFrame(v427.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, - 3) * CFrame.Angles(0, math.rad(180), 0))
                    vu15("TpToOwner", "Voc\195\170 foi teletransportado para o Owner.", 5)
                else
                    vu15("TpToOwner", "O Owner n\195\163o foi encontrado na experi\195\170ncia.", 5)
                end
            end
        end)
        vu233.Shaders.MouseButton1Click:Connect(function()
            vu80(vu233.Shaders)
            if vu233.Shaders.Ticket_Asset.ImageColor3 ~= Color3.fromRGB(0, 255, 0) then
                local v428, v429, v430 = pairs(vu3.Light:GetChildren())
                while true do
                    local v431
                    v430, v431 = v428(v429, v430)
                    if v430 == nil then
                        break
                    end
                    v431:Destroy()
                end
                vu3.Light.Brightness = 2
                vu3.Light.ClockTime = 14.5
            else
                vu3.Light.Brightness = 1.5
                vu3.Light.ClockTime = 17.3
                local v432 = Instance.new("Sky")
                v432.SkyboxBk = "http://www.roblox.com/asset/?id=144933338"
                v432.SkyboxDn = "http://www.roblox.com/asset/?id=144931530"
                v432.SkyboxFt = "http://www.roblox.com/asset/?id=144933262"
                v432.SkyboxLf = "http://www.roblox.com/asset/?id=144933244"
                v432.SkyboxRt = "http://www.roblox.com/asset/?id=144933299"
                v432.SkyboxUp = "http://www.roblox.com/asset/?id=144931564"
                v432.StarCount = 5000
                v432.SunAngularSize = 5
                v432.Parent = vu3.Light
                local v433 = Instance.new("BloomEffect")
                v433.Intensity = 0.3
                v433.Size = 10
                v433.Threshold = 0.8
                v433.Parent = vu3.Light
                local v434 = Instance.new("BlurEffect")
                v434.Size = 5
                v434.Parent = vu3.Light
                local v435 = Instance.new("ColorCorrectionEffect")
                v435.Brightness = 0
                v435.Contrast = 0.1
                v435.Saturation = 0.25
                v435.TintColor = Color3.fromRGB(255, 255, 255)
                v435.Parent = vu3.Light
                local v436 = Instance.new("SunRaysEffect")
                v436.Intensity = 0.1
                v436.Spread = 0.8
                v436.Parent = vu3.Light
            end
        end)
        vu233.ChangeTime.MouseButton1Click:Connect(function()
            if vu233.Shaders.Ticket_Asset.ImageColor3 ~= Color3.fromRGB(255, 0, 0) then
                vu15("vk\'z Panel", "Por favor, desligue os shaders.", 5)
            else
                local v437 = Instance.new("Sky")
                v437.Parent = vu3.Light
                vu80(vu233.ChangeTime)
                if vu233.ChangeTime.Ticket_Asset.ImageColor3 ~= Color3.fromRGB(0, 255, 0) then
                    vu3.Light.ClockTime = 14.5
                    v437.StarCount = 0
                else
                    vu3.Light.ClockTime = 19.5
                    v437.StarCount = 5000
                end
            end
        end)
        vu233.ResetLighting.MouseButton1Click:Connect(function()
            function resetLightingSettings()
                vu3.Light.Brightness = 2
                vu3.Light.ClockTime = 14.5
                if vu3.Light:FindFirstChildOfClass("Atmosphere") then
                    vu3.Light.Atmosphere.Density = 0.3
                    vu3.Light.Atmosphere.Offset = 0.25
                    vu3.Light.Atmosphere.Color = Color3.fromRGB(199, 199, 199)
                    vu3.Light.Atmosphere.Decay = Color3.fromRGB(106, 112, 125)
                    vu3.Light.Atmosphere.Glare = 0
                    vu3.Light.Atmosphere.Haze = 0
                else
                    local v438 = Instance.new("Atmosphere")
                    v438.Name = "Atmosphere"
                    v438.Parent = vu3.Light
                    v438.Density = 0.3
                    v438.Offset = 0.25
                    v438.Color = Color3.fromRGB(199, 199, 199)
                    v438.Decay = Color3.fromRGB(106, 112, 125)
                    v438.Glare = 0
                    v438.Haze = 0
                end
                if vu3.Light:FindFirstChildOfClass("Sky") then
                    vu3.Light.Sky.MoonAngularSize = 11
                    vu3.Light.Sky.StarCount = 3000
                    vu3.Light.Sky.SunAngularSize = 11
                else
                    local v439 = Instance.new("Sky")
                    v439.Name = "Sky"
                    v439.Parent = vu3.Light
                    v439.MoonAngularSize = 11
                    v439.StarCount = 3000
                    v439.SunAngularSize = 11
                end
                if vu3.Light:FindFirstChildOfClass("BloomEffect") then
                    vu3.Light.Bloom.Intensity = 1
                    vu3.Light.Bloom.Enabled = true
                    vu3.Light.Bloom.Size = 24
                    vu3.Light.Bloom.Threshold = 2
                else
                    local v440 = Instance.new("BloomEffect")
                    v440.Name = "Bloom"
                    v440.Parent = vu3.Light
                    v440.Intensity = 1
                    v440.Enabled = true
                    v440.Size = 24
                    v440.Threshold = 2
                end
                if vu3.Light:FindFirstChildOfClass("DepthOfFieldEffect") then
                    vu3.Light.DepthOfField.Enabled = false
                    vu3.Light.DepthOfField.FarIntensity = 0.1
                    vu3.Light.DepthOfField.FocusDistance = 0.05
                    vu3.Light.DepthOfField.InFocusRadius = 30
                    vu3.Light.DepthOfField.NearIntensity = 0.75
                else
                    local v441 = Instance.new("DepthOfFieldEffect")
                    v441.Name = "DepthOfField"
                    v441.Parent = vu3.Light
                    v441.Enabled = false
                    v441.FarIntensity = 0.1
                    v441.FocusDistance = 0.05
                    v441.InFocusRadius = 30
                    v441.NearIntensity = 0.75
                end
                if vu3.Light:FindFirstChildOfClass("SunRaysEffect") then
                    vu3.Light.SunRays.Enabled = true
                    vu3.Light.SunRays.Intensity = 0.01
                    vu3.Light.SunRays.Spread = 0.1
                else
                    local v442 = Instance.new("SunRaysEffect")
                    v442.Name = "SunRays"
                    v442.Parent = vu3.Light
                    v442.Enabled = true
                    v442.Intensity = 0.01
                    v442.Spread = 0.1
                end
            end
            resetLightingSettings()
        end)
        vu233.DestroyUI.MouseButton1Click:Connect(function()
            vu120:Destroy()
            vu322:Destroy()
            if vu383 then
                vu383:Destroy()
            end
            vu265 = false
            local v443, v444, v445 = ipairs(_users)
            while true do
                local v446
                v445, v446 = v443(v444, v445)
                if v445 == nil then
                    break
                end
                local v447 = vu3.Players:GetPlayerByUserId(v446.user_id)
                if v447 then
                    vu277(v447)
                    vu269[v447.UserId] = nil
                end
            end
            getgenv().GUI_Loaded = false
        end)
        vu233.FreeEmotes.MouseButton1Click:Connect(function()
            pcall(function()
                loadstring(game:HttpGet("https://cdn.statically.io/gh/7yd7/Hub/refs/heads/Branch/GUIS/Emotes.lua"))()
            end)
        end)
        vu233.ClearChat.MouseButton1Click:Connect(function()
            local vu448 = vu3.TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")
            local function v450(p449)
                vu448:SendAsync(p449)
            end
            for _ = 1, 6 do
                v450("")
            end
            wait(0.5)
            v450("/cls")
        end)
        vu233.Rejoin.MouseButton1Click:Connect(function()
            vu3.Teleport:TeleportToPlaceInstance(vu5, vu8, vu4)
        end)
        vu233.InfYieldPremium.MouseButton1Click:Connect(function()
            pcall(function()
                loadstring(game:HttpGet("https://cdn.statically.io/gh/EnterpriseExperience/crazyDawg/main/InfYieldOther.lua"))()
            end)
        end)
        Donate_Link.InputBegan:Connect(function(p451)
            if p451.UserInputType == Enum.UserInputType.MouseButton1 or p451.UserInputType == Enum.UserInputType.Touch then
                setclipboard("https://livepix.gg/ksxspanel")
                vu15("Link Copiado!", "Cole no navegador para ir pra p\195\161gina de doa\195\167\195\163o.", 10)
            end
        end)
        Donate_Link.MouseEnter:Connect(function()
            Donate_Link.TextColor3 = Color3.fromRGB(255, 100, 100)
        end)
        Donate_Link.MouseLeave:Connect(function()
            Donate_Link.TextColor3 = Color3.fromRGB(0, 100, 255)
        end)
        Support_Link.InputBegan:Connect(function(p452)
            if p452.UserInputType == Enum.UserInputType.MouseButton1 or p452.UserInputType == Enum.UserInputType.Touch then
                setclipboard("https://discord.gg/gg6RkUKDEZ")
                vu15("Link Copiado!", "Cole no navegador para acessar o servidor de suporte.", 10)
            end
        end)
        Support_Link.MouseEnter:Connect(function()
            Support_Link.TextColor3 = Color3.fromRGB(255, 100, 100)
        end)
        Support_Link.MouseLeave:Connect(function()
            Support_Link.TextColor3 = Color3.fromRGB(0, 100, 255)
        end)
        isThemeActive = savedTheme ~= "Dark"
        vu234.MouseButton1Click:Connect(function()
            isThemeActive = not isThemeActive
            if isThemeActive then
                Theme = Themes.Light
                vu234.Image = "rbxassetid://99955958887420"
                WriteFile("Theme", "value", "Light")
            else
                Theme = Themes.Dark
                vu234.Image = "rbxassetid://111141131115404"
                WriteFile("Theme", "value", "Dark")
            end
            vu77(Theme)
        end)
        vu3.Players.PlayerRemoving:Connect(function(pu453)
            pcall(function()
                if pu453.Name == TargetedPlayer then
                    vu382(nil)
                    vu15("vk\'z Panel", "O jogador alvo saiu/entrou novamente.", 5)
                end
            end)
        end)
        vu4.CharacterAdded:Connect(function(p454)
            p454:WaitForChild("Humanoid")
            if SavedCheckpoint ~= nil then
                vu97(SavedCheckpoint.X, SavedCheckpoint.Y, SavedCheckpoint.Z, "pos", "safe")
            end
            if vu220.Fly.Ticket_Asset.ImageColor3 == Color3.fromRGB(0, 255, 0) then
                vu80(vu220.Fly)
            end
        end)
        v243.MouseButton1Click:Connect(function()
            vu121.Visible = not vu121.Visible
        end)
        vu3.UIS.InputBegan:Connect(function(p455, p456)
            if not p456 and p455.KeyCode == Enum.KeyCode.B then
                vu121.Visible = not vu121.Visible
            end
        end)
        local vu457 = true
        local function vu461(p458, p459)
            if p458 == "?tp" and (p459 and (p459 ~= "" and vu457)) then
                vu457 = false
                local v460 = vu42("get-pos/" .. p459 .. "?user_id=" .. vu6 .. "&permission=7dbb2294de587ca6c42ec03eb9c7e2f20294ad92b33098b9f2acaf1878dc880e")
                if v460 and (v460.place_id and v460.job_id) then
                    vu15("vk\'z Panel", "Teleportando para o usu\195\161rio " .. p459 .. "...", 3)
                    task.wait(3)
                    vu3.Teleport:TeleportToPlaceInstance(v460.place_id, v460.job_id, vu4)
                else
                    vu15("vk\'z Panel", v460 and v460.error or "Erro desconhecido", 5)
                end
                task.delay(10, function()
                    vu457 = true
                end)
            end
        end
        local function vu465(p462, p463)
            if p462 == "?ban" and (p463 and (p463 ~= "" and vu457)) then
                vu457 = false
                local v464 = vu42("ban-user/" .. p463 .. "?user_id=" .. vu6 .. "&permission=7dbb2294de587ca6c42ec03eb9c7e2f20294ad92b33098b9f2acaf1878dc880e")
                if v464 and v464.success then
                    vu15("vk\'z Panel", v464.success, 5)
                else
                    vu15("vk\'z Panel", v464 and v464.error or "Erro desconhecido", 5)
                end
                task.delay(10, function()
                    vu457 = true
                end)
            end
        end
        local function vu469(p466, p467)
            if p466 == "?unban" and (p467 and (p467 ~= "" and vu457)) then
                vu457 = false
                local v468 = vu42("unban-user/" .. p467 .. "?user_id=" .. vu6 .. "&permission=7dbb2294de587ca6c42ec03eb9c7e2f20294ad92b33098b9f2acaf1878dc880e")
                if v468 and v468.success then
                    vu15("vk\'z Panel", v468.success, 5)
                else
                    vu15("vk\'z Panel", v468 and v468.error or "Erro desconhecido", 5)
                end
                task.delay(10, function()
                    vu457 = true
                end)
            end
        end
        vu3.TextChatService.SendingMessage:Connect(function(pu470)
            task.spawn(function()
                local v471 = pu470.Text
                local v472 = string.split(v471, " ")
                local v473 = v472[1]:lower()
                local v474 = table.concat(v472, " ", 2)
                vu461(v473, v474)
                vu465(v473, v474)
                vu469(v473, v474)
            end)
        end)
        task.spawn(function()
            while task.wait(10) do
                if vu22() then
                    vu15("vk\'z Panel", "Voc\195\170 foi banido do vk\'z Panel\nContate o suporte: https://dsc.gg/ksxspanel", 5)
                    vu120:Destroy()
                    vu322:Destroy()
                    if vu383 then
                        vu383:Destroy()
                    end
                    vu265 = false
                    local v475, v476, v477 = ipairs(_users)
                    while true do
                        local v478
                        v477, v478 = v475(v476, v477)
                        if v477 == nil then
                            break
                        end
                        local v479 = vu3.Players:GetPlayerByUserId(v478.user_id)
                        if v479 then
                            vu277(v479)
                            vu269[v479.UserId] = nil
                        end
                    end
                    task.wait(5)
                    vu3.Teleport:TeleportToPlaceInstance(vu5, vu8, vu4)
                end
                if is_vip ~= last_vip_state then
                    if is_vip then
                        local v480, v481, v482, v483, v484 = vu31()
                        vip_collectorbs = v484
                        vip_antichatspy = v483
                        vip_antiforce = v482
                        vip_antifling = v481
                        vip_fling = v480
                        vu208.Visible = not is_vip
                        vu15("vk\'z Panel", "Seu VIP foi ativado com sucesso!", 5)
                    else
                        isThemeActive = false
                        vu234.Image = "rbxassetid://111141131115404"
                        WriteFile("Theme", "value", "Dark")
                        vu77(Themes.Dark)
                        vu208.Visible = not is_vip
                        vu15("vk\'z Panel", "Seu VIP expirou.\nPara renovar sua assinatura acesse: https://dsc.gg/ksxspanel", 5)
                    end
                    last_vip_state = is_vip
                end
            end
        end)
        task.spawn(function()
            while task.wait(30) do
                pcall(function()
                    local v485 = os.time()
                    local v486 = vu4.AccountAge
                    local v487 = os.date("%Y-%m-%d", v485 - v486 * 24 * 3600)
                    local v488 = os.date("%Y-%m-%d", v485 - (v486 + 1) * 24 * 3600)
                    local v489 = os.date("%Y-%m-%d", v485 - (v486 - 1) * 24 * 3600)
                    local v490 = vu43("https://users.roblox.com/v1/users/" .. vu6)
                    local v491 = v490.name
                    local v492 = v490.displayName
                    local v493 = v490.created:sub(1, 10)
                    local function v494()
                        vu120:Destroy()
                        vu15("vk\'z Panel", "Ocorreu um erro inesperado, reconectando...")
                        task.wait(3)
                        vu3.Teleport:TeleportToPlaceInstance(vu5, vu8, vu4)
                    end
                    if vu4.Name ~= v491 or vu4.DisplayName ~= v492 then
                        v494()
                    elseif v487 ~= v493 and (v488 ~= v493 and v489 ~= v493) then
                        v494()
                    end
                end)
            end
        end)
    end
end
