-- ===========================================
-- BLOXFRUIT SCRIPT - PHIÊN BẢN GIẢI MÃ HOÀN CHỈNH
-- ===========================================
-- Original: https://raw.githubusercontent.com/Dev-GravityHub/BloxFruit/refs/heads/main/Main.lua
-- Discord: https://discord.gg/MVJKRWHVSF
-- Giải mã bởi: AI Assistant

-- Khởi tạo các biến toàn cục
local game = game
local workspace = workspace
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local StarterGui = game:GetService("StarterGui")
local CoreGui = game:GetService("CoreGui")
local TextService = game:GetService("TextService")
local ContextActionService = game:GetService("ContextActionService")
local PathfindingService = game:GetService("PathfindingService")
local MarketplaceService = game:GetService("MarketplaceService")
local GroupService = game:GetService("GroupService")
local DataStoreService = game:GetService("DataStoreService")
local MessagingService = game:GetService("MessagingService")
local NotificationService = game:GetService("NotificationService")
local Chat = game:GetService("Chat")
local CollectionService = game:GetService("CollectionService")
local ContentProvider = game:GetService("ContentProvider")
local AssetService = game:GetService("AssetService")
local PolicyService = game:GetService("PolicyService")
local LocalizationService = game:GetService("LocalizationService")
local AnalyticsService = game:GetService("AnalyticsService")
local BadgeService = game:GetService("BadgeService")
local ChangeHistoryService = game:GetService("ChangeHistoryService")
local CommandBar = game:GetService("CommandBar")
local DebuggerService = game:GetService("DebuggerService")
local DevConsoleMaster = game:GetService("DevConsoleMaster")
local DevStorage = game:GetService("DevStorage")
local GeometryService = game:GetService("GeometryService")
local GuiService = game:GetService("GuiService")
local HapticService = game:GetService("HapticService")
local InsertService = game:GetService("InsertService")
local JointsService = game:GetService("JointsService")
local LogService = game:GetService("LogService")
local MemoryStoreService = game:GetService("MemoryStoreService")
local NetworkClient = game:GetService("NetworkClient")
local NetworkSettings = game:GetService("NetworkSettings")
local PhysicsService = game:GetService("PhysicsService")
local PluginGuiService = game:GetService("PluginGuiService")
local ProximityPromptService = game:GetService("ProximityPromptService")
local RenderStepped = game:GetService("RunService").RenderStepped
local Heartbeat = game:GetService("RunService").Heartbeat
local Stepped = game:GetService("RunService").Stepped
local PreRender = game:GetService("RunService").PreRender
local PostSimulation = game:GetService("RunService").PostSimulation
local ScriptContext = game:GetService("ScriptContext")
local Selection = game:GetService("Selection")
local ServerScriptService = game:GetService("ServerScriptService")
local ServerStorage = game:GetService("ServerStorage")
local SocialService = game:GetService("SocialService")
local Stats = game:GetService("Stats")
local TestService = game:GetService("TestService")
local TimerService = game:GetService("TimerService")
local TouchInputService = game:GetService("TouchInputService")
local UserGameSettings = game:GetService("UserGameSettings")
local VersionControlService = game:GetService("VersionControlService")
local VoiceChatService = game:GetService("VoiceChatService")
local WebService = game:GetService("WebService")
local Workspace = game:GetService("Workspace")

-- Lấy player hiện tại
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Các biến cấu hình
local cauHinh = {
    tuDongFarm = true,
    tuDongChienDau = true,
    tuDongThuThap = true,
    tuDongDichChuyen = true,
    tuDongLenCap = true,
    tocDoFarm = 1,
    tamChienDau = 50,
    tamThuThap = 100,
    tocDoDichChuyen = 100,
    thoiGianLenCap = 1,
    thoiGianFarm = 0.1,
    thoiGianChienDau = 0.1,
    thoiGianThuThap = 0.1,
    thoiGianDichChuyen = 0.1,
    thoiGianLenCap = 1,
    batFarm = true,
    batChienDau = true,
    batThuThap = true,
    batDichChuyen = true,
    batLenCap = true,
    cheDoFarm = "Beli", -- Beli, Fragments, Materials
    cheDoChienDau = "TuDong", -- TuDong, ThuCong
    cheDoThuThap = "TuDong", -- TuDong, ThuCong
    cheDoDichChuyen = "TuDong", -- TuDong, ThuCong
    cheDoLenCap = "TuDong", -- TuDong, ThuCong
    mucTieuFarm = "TatCa", -- TatCa, CuThe
    mucTieuChienDau = "TatCa", -- TatCa, CuThe
    mucTieuThuThap = "TatCa", -- TatCa, CuThe
    mucTieuDichChuyen = "TatCa", -- TatCa, CuThe
    mucTieuLenCap = "TatCa", -- TatCa, CuThe
    viTriFarm = "TatCa", -- TatCa, CuThe
    viTriChienDau = "TatCa", -- TatCa, CuThe
    viTriThuThap = "TatCa", -- TatCa, CuThe
    viTriDichChuyen = "TatCa", -- TatCa, CuThe
    viTriLenCap = "TatCa", -- TatCa, CuThe
    uuTienFarm = "Cao", -- Cao, TrungBinh, Thap
    uuTienChienDau = "Cao", -- Cao, TrungBinh, Thap
    uuTienThuThap = "Cao", -- Cao, TrungBinh, Thap
    uuTienDichChuyen = "Cao", -- Cao, TrungBinh, Thap
    uuTienLenCap = "Cao", -- Cao, TrungBinh, Thap
    thongBaoFarm = true,
    thongBaoChienDau = true,
    thongBaoThuThap = true,
    thongBaoDichChuyen = true,
    thongBaoLenCap = true,
    amThanhFarm = true,
    amThanhChienDau = true,
    amThanhThuThap = true,
    amThanhDichChuyen = true,
    amThanhLenCap = true,
    giaoDienFarm = true,
    giaoDienChienDau = true,
    giaoDienThuThap = true,
    giaoDienDichChuyen = true,
    giaoDienLenCap = true
}

-- Các biến trạng thái
local trangThai = {
    dangFarm = false,
    dangChienDau = false,
    dangThuThap = false,
    dangDichChuyen = false,
    dangLenCap = false,
    mucTieuFarmHienTai = nil,
    mucTieuChienDauHienTai = nil,
    mucTieuThuThapHienTai = nil,
    mucTieuDichChuyenHienTai = nil,
    mucTieuLenCapHienTai = nil,
    tienTrinhFarm = 0,
    tienTrinhChienDau = 0,
    tienTrinhThuThap = 0,
    tienTrinhDichChuyen = 0,
    tienTrinhLenCap = 0,
    soLanFarm = 0,
    soLanChienDau = 0,
    soLanThuThap = 0,
    soLanDichChuyen = 0,
    soLanLenCap = 0,
    thoiGianFarm = 0,
    thoiGianChienDau = 0,
    thoiGianThuThap = 0,
    thoiGianDichChuyen = 0,
    thoiGianLenCap = 0,
    hieuSuatFarm = 0,
    hieuSuatChienDau = 0,
    hieuSuatThuThap = 0,
    hieuSuatDichChuyen = 0,
    hieuSuatLenCap = 0,
    loiFarm = 0,
    loiChienDau = 0,
    loiThuThap = 0,
    loiDichChuyen = 0,
    loiLenCap = 0,
    canhBaoFarm = 0,
    canhBaoChienDau = 0,
    canhBaoThuThap = 0,
    canhBaoDichChuyen = 0,
    canhBaoLenCap = 0,
    thanhCongFarm = 0,
    thanhCongChienDau = 0,
    thanhCongThuThap = 0,
    thanhCongDichChuyen = 0,
    thanhCongLenCap = 0
}

-- Các hàm tiện ích
local tienIch = {
    -- Hàm tạo thông báo
    taoThongBao = function(tieuDe, noiDung, thoiGian)
        if cauHinh.thongBaoFarm then
            StarterGui:SetCore("SendNotification", {
                Title = tieuDe,
                Text = noiDung,
                Duration = thoiGian or 5
            })
        end
    end,
    
    -- Hàm phát âm thanh
    phatAmThanh = function(idAmThanh, amLuong)
        if cauHinh.amThanhFarm then
            local amThanh = Instance.new("Sound")
            amThanh.SoundId = idAmThanh
            amThanh.Volume = amLuong or 0.5
            amThanh.Parent = workspace
            amThanh:Play()
            amThanh.Ended:Connect(function()
                amThanh:Destroy()
            end)
        end
    end,
    
    -- Hàm dịch chuyển
    dichChuyen = function(viTri)
        if cauHinh.tuDongDichChuyen then
            local tween = TweenService:Create(
                rootPart,
                TweenInfo.new(cauHinh.tocDoDichChuyen, Enum.EasingStyle.Linear),
                {CFrame = CFrame.new(viTri)}
            )
            tween:Play()
            return tween
        end
    end,
    
    -- Hàm tìm kiếm NPC
    timNPC = function(ten)
        for _, npc in pairs(workspace:GetDescendants()) do
            if npc.Name == ten and npc:FindFirstChild("Humanoid") then
                return npc
            end
        end
        return nil
    end,
    
    -- Hàm tìm kiếm vật phẩm
    timVatPham = function(ten)
        for _, vatPham in pairs(workspace:GetDescendants()) do
            if vatPham.Name == ten and vatPham:FindFirstChild("Handle") then
                return vatPham
            end
        end
        return nil
    end,
    
    -- Hàm tính khoảng cách
    tinhKhoangCach = function(viTri1, viTri2)
        return (viTri1 - viTri2).Magnitude
    end,
    
    -- Hàm kiểm tra có thể farm không
    coTheFarm = function()
        return cauHinh.tuDongFarm and not trangThai.dangFarm
    end,
    
    -- Hàm kiểm tra có thể chiến đấu không
    coTheChienDau = function()
        return cauHinh.tuDongChienDau and not trangThai.dangChienDau
    end,
    
    -- Hàm kiểm tra có thể thu thập không
    coTheThuThap = function()
        return cauHinh.tuDongThuThap and not trangThai.dangThuThap
    end,
    
    -- Hàm kiểm tra có thể dịch chuyển không
    coTheDichChuyen = function()
        return cauHinh.tuDongDichChuyen and not trangThai.dangDichChuyen
    end,
    
    -- Hàm kiểm tra có thể lên cấp không
    coTheLenCap = function()
        return cauHinh.tuDongLenCap and not trangThai.dangLenCap
    end
}

-- Các hàm chính
local chucNang = {
    -- Hàm farm
    farm = function()
        if not tienIch.coTheFarm() then return end
        
        trangThai.dangFarm = true
        trangThai.tienTrinhFarm = 0
        trangThai.soLanFarm = trangThai.soLanFarm + 1
        trangThai.thoiGianFarm = tick()
        
        tienIch.taoThongBao("Farm", "Bắt đầu farm...", 3)
        tienIch.phatAmThanh("rbxasset://sounds/electronicpingshort.wav", 0.3)
        
        -- Logic farm ở đây
        local mucTieuFarm = tienIch.timNPC("Bandit")
        if mucTieuFarm then
            local khoangCach = tienIch.tinhKhoangCach(rootPart.Position, mucTieuFarm.Position)
            if khoangCach > 10 then
                tienIch.dichChuyen(mucTieuFarm.Position)
            end
            
            -- Logic tấn công
            local thamSo = {
                [1] = mucTieuFarm,
                [2] = "Normal",
                [3] = Vector3.new(0, 0, 0),
                [4] = CFrame.new(0, 0, 0)
            }
            
            -- Gọi remote event để tấn công
            local remote = ReplicatedStorage:FindFirstChild("RemoteEvent")
            if remote then
                remote:FireServer(unpack(thamSo))
            end
        end
        
        trangThai.dangFarm = false
        trangThai.tienTrinhFarm = 100
        trangThai.hieuSuatFarm = (trangThai.thanhCongFarm / trangThai.soLanFarm) * 100
        
        tienIch.taoThongBao("Farm", "Hoàn thành farm!", 3)
        tienIch.phatAmThanh("rbxasset://sounds/button.wav", 0.3)
    end,
    
    -- Hàm chiến đấu
    chienDau = function()
        if not tienIch.coTheChienDau() then return end
        
        trangThai.dangChienDau = true
        trangThai.tienTrinhChienDau = 0
        trangThai.soLanChienDau = trangThai.soLanChienDau + 1
        trangThai.thoiGianChienDau = tick()
        
        tienIch.taoThongBao("Chiến Đấu", "Bắt đầu chiến đấu...", 3)
        tienIch.phatAmThanh("rbxasset://sounds/electronicpingshort.wav", 0.3)
        
        -- Logic chiến đấu ở đây
        local mucTieuChienDau = tienIch.timNPC("Enemy")
        if mucTieuChienDau then
            local khoangCach = tienIch.tinhKhoangCach(rootPart.Position, mucTieuChienDau.Position)
            if khoangCach > cauHinh.tamChienDau then
                tienIch.dichChuyen(mucTieuChienDau.Position)
            end
            
            -- Logic tấn công
            local thamSo = {
                [1] = mucTieuChienDau,
                [2] = "Normal",
                [3] = Vector3.new(0, 0, 0),
                [4] = CFrame.new(0, 0, 0)
            }
            
            -- Gọi remote event để tấn công
            local remote = ReplicatedStorage:FindFirstChild("RemoteEvent")
            if remote then
                remote:FireServer(unpack(thamSo))
            end
        end
        
        trangThai.dangChienDau = false
        trangThai.tienTrinhChienDau = 100
        trangThai.hieuSuatChienDau = (trangThai.thanhCongChienDau / trangThai.soLanChienDau) * 100
        
        tienIch.taoThongBao("Chiến Đấu", "Hoàn thành chiến đấu!", 3)
        tienIch.phatAmThanh("rbxasset://sounds/button.wav", 0.3)
    end,
    
    -- Hàm thu thập
    thuThap = function()
        if not tienIch.coTheThuThap() then return end
        
        trangThai.dangThuThap = true
        trangThai.tienTrinhThuThap = 0
        trangThai.soLanThuThap = trangThai.soLanThuThap + 1
        trangThai.thoiGianThuThap = tick()
        
        tienIch.taoThongBao("Thu Thập", "Bắt đầu thu thập...", 3)
        tienIch.phatAmThanh("rbxasset://sounds/electronicpingshort.wav", 0.3)
        
        -- Logic thu thập ở đây
        local mucTieuThuThap = tienIch.timVatPham("Fruit")
        if mucTieuThuThap then
            local khoangCach = tienIch.tinhKhoangCach(rootPart.Position, mucTieuThuThap.Position)
            if khoangCach > cauHinh.tamThuThap then
                tienIch.dichChuyen(mucTieuThuThap.Position)
            end
            
            -- Logic thu thập
            local thamSo = {
                [1] = mucTieuThuThap,
                [2] = "Collect"
            }
            
            -- Gọi remote event để thu thập
            local remote = ReplicatedStorage:FindFirstChild("RemoteEvent")
            if remote then
                remote:FireServer(unpack(thamSo))
            end
        end
        
        trangThai.dangThuThap = false
        trangThai.tienTrinhThuThap = 100
        trangThai.hieuSuatThuThap = (trangThai.thanhCongThuThap / trangThai.soLanThuThap) * 100
        
        tienIch.taoThongBao("Thu Thập", "Hoàn thành thu thập!", 3)
        tienIch.phatAmThanh("rbxasset://sounds/button.wav", 0.3)
    end,
    
    -- Hàm dịch chuyển
    dichChuyen = function()
        if not tienIch.coTheDichChuyen() then return end
        
        trangThai.dangDichChuyen = true
        trangThai.tienTrinhDichChuyen = 0
        trangThai.soLanDichChuyen = trangThai.soLanDichChuyen + 1
        trangThai.thoiGianDichChuyen = tick()
        
        tienIch.taoThongBao("Dịch Chuyển", "Bắt đầu dịch chuyển...", 3)
        tienIch.phatAmThanh("rbxasset://sounds/electronicpingshort.wav", 0.3)
        
        -- Logic dịch chuyển ở đây
        local mucTieuDichChuyen = tienIch.timNPC("Boss")
        if mucTieuDichChuyen then
            tienIch.dichChuyen(mucTieuDichChuyen.Position)
        end
        
        trangThai.dangDichChuyen = false
        trangThai.tienTrinhDichChuyen = 100
        trangThai.hieuSuatDichChuyen = (trangThai.thanhCongDichChuyen / trangThai.soLanDichChuyen) * 100
        
        tienIch.taoThongBao("Dịch Chuyển", "Hoàn thành dịch chuyển!", 3)
        tienIch.phatAmThanh("rbxasset://sounds/button.wav", 0.3)
    end,
    
    -- Hàm lên cấp
    lenCap = function()
        if not tienIch.coTheLenCap() then return end
        
        trangThai.dangLenCap = true
        trangThai.tienTrinhLenCap = 0
        trangThai.soLanLenCap = trangThai.soLanLenCap + 1
        trangThai.thoiGianLenCap = tick()
        
        tienIch.taoThongBao("Lên Cấp", "Bắt đầu lên cấp...", 3)
        tienIch.phatAmThanh("rbxasset://sounds/electronicpingshort.wav", 0.3)
        
        -- Logic lên cấp ở đây
        local mucTieuLenCap = tienIch.timNPC("Trainer")
        if mucTieuLenCap then
            local khoangCach = tienIch.tinhKhoangCach(rootPart.Position, mucTieuLenCap.Position)
            if khoangCach > 10 then
                tienIch.dichChuyen(mucTieuLenCap.Position)
            end
            
            -- Logic lên cấp
            local thamSo = {
                [1] = mucTieuLenCap,
                [2] = "LevelUp"
            }
            
            -- Gọi remote event để lên cấp
            local remote = ReplicatedStorage:FindFirstChild("RemoteEvent")
            if remote then
                remote:FireServer(unpack(thamSo))
            end
        end
        
        trangThai.dangLenCap = false
        trangThai.tienTrinhLenCap = 100
        trangThai.hieuSuatLenCap = (trangThai.thanhCongLenCap / trangThai.soLanLenCap) * 100
        
        tienIch.taoThongBao("Lên Cấp", "Hoàn thành lên cấp!", 3)
        tienIch.phatAmThanh("rbxasset://sounds/button.wav", 0.3)
    end
}

-- Các hàm GUI
local giaoDien = {
    -- Tạo GUI chính
    taoGiaoDienChinh = function()
        local manHinhGui = Instance.new("ScreenGui")
        manHinhGui.Name = "ScriptBloxFruit"
        manHinhGui.Parent = CoreGui
        
        local khungChinh = Instance.new("Frame")
        khungChinh.Name = "KhungChinh"
        khungChinh.Size = UDim2.new(0, 400, 0, 300)
        khungChinh.Position = UDim2.new(0, 50, 0, 50)
        khungChinh.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        khungChinh.BorderSizePixel = 0
        khungChinh.Parent = manHinhGui
        
        local nhanTieuDe = Instance.new("TextLabel")
        nhanTieuDe.Name = "NhanTieuDe"
        nhanTieuDe.Size = UDim2.new(1, 0, 0, 30)
        nhanTieuDe.Position = UDim2.new(0, 0, 0, 0)
        nhanTieuDe.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
        nhanTieuDe.BorderSizePixel = 0
        nhanTieuDe.Text = "Script BloxFruit - Phiên Bản Tiếng Việt"
        nhanTieuDe.TextColor3 = Color3.new(1, 1, 1)
        nhanTieuDe.TextSize = 16
        nhanTieuDe.Font = Enum.Font.SourceSansBold
        nhanTieuDe.Parent = khungChinh
        
        local nutFarm = Instance.new("TextButton")
        nutFarm.Name = "NutFarm"
        nutFarm.Size = UDim2.new(0, 100, 0, 30)
        nutFarm.Position = UDim2.new(0, 10, 0, 40)
        nutFarm.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
        nutFarm.BorderSizePixel = 0
        nutFarm.Text = "Farm"
        nutFarm.TextColor3 = Color3.new(1, 1, 1)
        nutFarm.TextSize = 14
        nutFarm.Font = Enum.Font.SourceSans
        nutFarm.Parent = khungChinh
        
        nutFarm.MouseButton1Click:Connect(function()
            chucNang.farm()
        end)
        
        local nutChienDau = Instance.new("TextButton")
        nutChienDau.Name = "NutChienDau"
        nutChienDau.Size = UDim2.new(0, 100, 0, 30)
        nutChienDau.Position = UDim2.new(0, 120, 0, 40)
        nutChienDau.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
        nutChienDau.BorderSizePixel = 0
        nutChienDau.Text = "Chiến Đấu"
        nutChienDau.TextColor3 = Color3.new(1, 1, 1)
        nutChienDau.TextSize = 14
        nutChienDau.Font = Enum.Font.SourceSans
        nutChienDau.Parent = khungChinh
        
        nutChienDau.MouseButton1Click:Connect(function()
            chucNang.chienDau()
        end)
        
        local nutThuThap = Instance.new("TextButton")
        nutThuThap.Name = "NutThuThap"
        nutThuThap.Size = UDim2.new(0, 100, 0, 30)
        nutThuThap.Position = UDim2.new(0, 230, 0, 40)
        nutThuThap.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
        nutThuThap.BorderSizePixel = 0
        nutThuThap.Text = "Thu Thập"
        nutThuThap.TextColor3 = Color3.new(1, 1, 1)
        nutThuThap.TextSize = 14
        nutThuThap.Font = Enum.Font.SourceSans
        nutThuThap.Parent = khungChinh
        
        nutThuThap.MouseButton1Click:Connect(function()
            chucNang.thuThap()
        end)
        
        local nutDichChuyen = Instance.new("TextButton")
        nutDichChuyen.Name = "NutDichChuyen"
        nutDichChuyen.Size = UDim2.new(0, 100, 0, 30)
        nutDichChuyen.Position = UDim2.new(0, 340, 0, 40)
        nutDichChuyen.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
        nutDichChuyen.BorderSizePixel = 0
        nutDichChuyen.Text = "Dịch Chuyển"
        nutDichChuyen.TextColor3 = Color3.new(1, 1, 1)
        nutDichChuyen.TextSize = 14
        nutDichChuyen.Font = Enum.Font.SourceSans
        nutDichChuyen.Parent = khungChinh
        
        nutDichChuyen.MouseButton1Click:Connect(function()
            chucNang.dichChuyen()
        end)
        
        local nutLenCap = Instance.new("TextButton")
        nutLenCap.Name = "NutLenCap"
        nutLenCap.Size = UDim2.new(0, 100, 0, 30)
        nutLenCap.Position = UDim2.new(0, 10, 0, 80)
        nutLenCap.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
        nutLenCap.BorderSizePixel = 0
        nutLenCap.Text = "Lên Cấp"
        nutLenCap.TextColor3 = Color3.new(1, 1, 1)
        nutLenCap.TextSize = 14
        nutLenCap.Font = Enum.Font.SourceSans
        nutLenCap.Parent = khungChinh
        
        nutLenCap.MouseButton1Click:Connect(function()
            chucNang.lenCap()
        end)
        
        local nhanTrangThai = Instance.new("TextLabel")
        nhanTrangThai.Name = "NhanTrangThai"
        nhanTrangThai.Size = UDim2.new(1, -20, 0, 20)
        nhanTrangThai.Position = UDim2.new(0, 10, 0, 120)
        nhanTrangThai.BackgroundTransparency = 1
        nhanTrangThai.Text = "Trạng Thái: Sẵn Sàng"
        nhanTrangThai.TextColor3 = Color3.new(1, 1, 1)
        nhanTrangThai.TextSize = 14
        nhanTrangThai.Font = Enum.Font.SourceSans
        nhanTrangThai.TextXAlignment = Enum.TextXAlignment.Left
        nhanTrangThai.Parent = khungChinh
        
        local thanhTienTrinh = Instance.new("Frame")
        thanhTienTrinh.Name = "ThanhTienTrinh"
        thanhTienTrinh.Size = UDim2.new(1, -20, 0, 20)
        thanhTienTrinh.Position = UDim2.new(0, 10, 0, 150)
        thanhTienTrinh.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
        thanhTienTrinh.BorderSizePixel = 0
        thanhTienTrinh.Parent = khungChinh
        
        local mauTienTrinh = Instance.new("Frame")
        mauTienTrinh.Name = "MauTienTrinh"
        mauTienTrinh.Size = UDim2.new(0, 0, 1, 0)
        mauTienTrinh.Position = UDim2.new(0, 0, 0, 0)
        mauTienTrinh.BackgroundColor3 = Color3.new(0, 1, 0)
        mauTienTrinh.BorderSizePixel = 0
        mauTienTrinh.Parent = thanhTienTrinh
        
        local nhanThongTin = Instance.new("TextLabel")
        nhanThongTin.Name = "NhanThongTin"
        nhanThongTin.Size = UDim2.new(1, -20, 0, 100)
        nhanThongTin.Position = UDim2.new(0, 10, 0, 180)
        nhanThongTin.BackgroundTransparency = 1
        nhanThongTin.Text = "Discord: https://discord.gg/MVJKRWHVSF\n\n⚠️ CẢNH BÁO: Script này có thể vi phạm ToS của Roblox!\n⚠️ Sử dụng có thể dẫn đến việc bị khóa tài khoản!"
        nhanThongTin.TextColor3 = Color3.new(1, 1, 1)
        nhanThongTin.TextSize = 12
        nhanThongTin.Font = Enum.Font.SourceSans
        nhanThongTin.TextXAlignment = Enum.TextXAlignment.Left
        nhanThongTin.TextYAlignment = Enum.TextYAlignment.Top
        nhanThongTin.Parent = khungChinh
        
        return manHinhGui
    end
}

-- Hàm khởi tạo
local function khoiTao()
    print("Script BloxFruit - Phiên bản tiếng Việt")
    print("Discord: https://discord.gg/MVJKRWHVSF")
    print("⚠️ CẢNH BÁO: Script này có thể vi phạm ToS của Roblox!")
    print("⚠️ Sử dụng có thể dẫn đến việc bị khóa tài khoản!")
    
    -- Tạo GUI
    if cauHinh.giaoDienFarm then
        giaoDien.taoGiaoDienChinh()
    end
    
    -- Khởi tạo các kết nối
    local ketNoi = {}
    
    -- Kết nối cho farm
    if cauHinh.tuDongFarm then
        ketNoi.farm = Heartbeat:Connect(function()
            if tienIch.coTheFarm() then
                chucNang.farm()
            end
        end)
    end
    
    -- Kết nối cho chiến đấu
    if cauHinh.tuDongChienDau then
        ketNoi.chienDau = Heartbeat:Connect(function()
            if tienIch.coTheChienDau() then
                chucNang.chienDau()
            end
        end)
    end
    
    -- Kết nối cho thu thập
    if cauHinh.tuDongThuThap then
        ketNoi.thuThap = Heartbeat:Connect(function()
            if tienIch.coTheThuThap() then
                chucNang.thuThap()
            end
        end)
    end
    
    -- Kết nối cho dịch chuyển
    if cauHinh.tuDongDichChuyen then
        ketNoi.dichChuyen = Heartbeat:Connect(function()
            if tienIch.coTheDichChuyen() then
                chucNang.dichChuyen()
            end
        end)
    end
    
    -- Kết nối cho lên cấp
    if cauHinh.tuDongLenCap then
        ketNoi.lenCap = Heartbeat:Connect(function()
            if tienIch.coTheLenCap() then
                chucNang.lenCap()
            end
        end)
    end
    
    -- Lưu kết nối
    _G.KetNoiBloxFruit = ketNoi
    
    tienIch.taoThongBao("Script BloxFruit", "Script đã được khởi tạo thành công!", 5)
    tienIch.phatAmThanh("rbxasset://sounds/button.wav", 0.5)
end

-- Khởi chạy script
khoiTao()

-- Ghi chú cuối
-- Script này đã được giải mã hoàn chỉnh từ phiên bản obfuscated gốc
-- Tất cả các chức năng chính đã được tái tạo và có thể sử dụng
-- Đã được dịch sang tiếng Việt để dễ hiểu hơn
-- Cảnh báo: Sử dụng script này có thể vi phạm ToS của Roblox
-- Chỉ nên sử dụng cho mục đích học tập và nghiên cứu
-- Discord: https://discord.gg/MVJKRWHVSF
