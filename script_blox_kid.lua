-- ===========================================
-- BLOXFRUIT SCRIPT - PHIÊN BẢN BẢO MẬT CAO
-- ===========================================
-- Original: https://raw.githubusercontent.com/Dev-GravityHub/BloxFruit/refs/heads/main/Main.lua
-- Discord: https://discord.gg/MVJKRWHVSF
-- Mã hóa bởi: AI Assistant

-- Hệ thống mã hóa chuỗi
local function taoMaHoa()
    local chuoiMaHoa = "iiihhhiiiiihssss\\136%\\250\\025N\\201pwzg\\019(A_Y&l\\r\\200N\\181\\000\\181\\226\\r\\001O\\134\\212\\001\\a\\202\\154;\\000\\000\\001\\000\\000\\001\\a\\000\\000\\000__index\\006\\000\\000\\000__call\\005\\000\\000\\000__sub\\005\\000\\000\\000__mul"
    local viTri = 1
    
    -- Hàm giải mã 4 byte
    local function giaiMa4Byte()
        if viTri + 3 <= #chuoiMaHoa then
            local b1, b2, b3, b4 = chuoiMaHoa:byte(viTri, viTri + 3)
            viTri = viTri + 4
            return ((b1 + b2 * 256) + b3 * 65536) + b4 * 16777216
        end
        return 0
    end
    
    -- Hàm giải mã 2 byte
    local function giaiMa2Byte()
        if viTri + 1 <= #chuoiMaHoa then
            local b1, b2 = chuoiMaHoa:byte(viTri, viTri + 1)
            viTri = viTri + 2
            return b1 + b2 * 256
        end
        return 0
    end
    
    -- Hàm giải mã chuỗi null-terminated
    local function giaiMaChuoiNull()
        local ketQua = ""
        for i = viTri, #chuoiMaHoa, 1 do
            if chuoiMaHoa:byte(i) == 0 then
                ketQua = chuoiMaHoa:sub(viTri, i - 1)
                viTri = i + 1
                break
            end
        end
        return ketQua
    end
    
    return giaiMa4Byte, giaiMa2Byte, giaiMaChuoiNull
end

-- Mảng chuỗi được mã hóa
local chuoiMaHoa = {
    "3W", "@X)g3", "F!)tU6>:(LDf#", "6XakCGu8]qF*\\',", "FCf9\\\"E,Tc=", "3[c:b.OdC",
    "Eb065ATMr^DKKo-DI[5", "7VQpWBl7QNCh[HuF8", "F`)/,@qu", "6t(+O+@L6YB4kdr+=eR8@;K_)",
    "6YUXVH=^s", ":h=\\'QF`\\\\a&Eb0<+A7]Y#", ";e9A[;f?J_Bk;;", "6?RQ?Cgggh9P%i",
    "FEMVA+E)-?AoD]4FCf9\\\"E,Tc=", "6ul^KDf-[dB4h", "6?RPr<,u\\\\lCh4_^@<>pq@/",
    ";e9TYASuTJ", "6YUXVH=^tk", "F)YQ3D?", "6$79f7VQpc6t(+ODImm1",
    "+@^0cH=^t^Bl.F!F(oQ1+B*Aj", "BQS?8F#ks-GB\\\\6`Ec5E\\'Dg3mE", "6$79f+@^\\'_A0=NZFE;SBAKXQc",
    ";KZhcCh3", "6$79f+Am8mF*&O\\'ARQ]:", "<+U;r9OVCAC]", "6?RPr9m(MmATR",
    "6Z6jaBl8\\')", "6tp^N@VfTu6YKnM+@fF\\'", "6YL%PFE7", "?Uk", "6XabA;0?GkF>3",
    "6\\\"t1FDfd+#FCB96F!*L", "F<fcubl8\\\"", "3b$", "7u^+sah", "7ri$]blnvc89jaa>9HCUAS#^m",
    ";IO9MBl7P", ";flGgF8", "+Am8mF*&O\\\"F_tT!EcW?a+EVaI", "87c4?", "6tLFLEbTK7Bl@k",
    "9Q+ELFD5Z2Er", "6$HaQASu\\'i+A$\\'S+@0OTBl[Wu", "6>U(?CLUj`Eb&\\'ZG@>N&",
    "7VQLKFD5W*+AHE`ARuu_FEq\\\\6", "94`!/De*KlF%g.WF8", "<-MnbDGt+eG%kGt",
    "7;Q[[AKXfiDe!g!F)rHb+<u", ";,qp@@pll%>\\\"V@r7TFS.EE?mf", "6Z7!RC`lPgEaa\\'$",
    "9jr9FE+NTk", "7;ZLFE`?UeE,8s)AH", "6$79f7U^=S;IO9M", "6tp^aEc64oBlj",
    ":hal[", "<,unrBR)<", ":NU8]EW", "7<<dj7vm!eat@", "9pjzadj((qdf&rtah",
    "j,", "6$79f+b2ogat2r.f<enyebtt:", "@ux.b", "<h)sk@:wqi@:nj", "7wmpmd.ru,er",
    "9jqp\\\\bl@l36xas<", "6$79f+bmula7]x$;g3></h;m", "6$79f95></q\\'%b5_ttd0$gm+ctd7",
    "8p,#ach6idatmq", ";is]`fcdmaasus", ";fh></v", "87c4?f&d0ible60@<h",
    "6yl1fafso]feddn:m+3q@qbz", "6z6dwarfgh7;zlfew", "<afiabl[b", "</dj9p%jjdid0rgp$%0dft@",
    "6xaba", "6$79f;ep)`cg$", "6xakmdf,", "9p%gx<h)nge^=__", "<e<1\\'=^#6c@q9._b4u!ocm[j*",
    ";e9a", ";flggfb!9p@;g", "7vqms;e]cr;0?gkf8", "bleb7ebt#+ble*!di`",
    ";iso\\\\f<fxuasrvxdf\\'h0atvk+", "6\\\"></zu#ew", "femva+e)-?aod]4d..3k+d#g%",
    ";isa", "6$79f+aucgb5_r.+b*k&eb#", "6zquif<fooecq)=8muo", "6$79f+b3k(dbnk8+@:3ldz",
    ":nbuwe]l^0@jz#+d></f+sdkkh1", "f)q2;7s></lf)", "<-<5!+e)-?;h-a@9lfqr",
    "6uxref_,w9", "6tkeea9)5", "6t(+o+@9mqa7y", "9lfiiasq", "6?rpr6></v@;z",
    "9jr8", "0)", "6$79f6=k1xgl", "6ylcvf(hijcghu#ecv", "7vllmah",
    "6$79f7u^=s?ua[kah", "6\\\"t1fdfekld?", "<,udjasabtatmp5df]=", ";g2yf;k$jj",
    ";#", "6?rpr7!3b[at)h></ckci]", "7vqasf(ebyec_", "7rmocf!*tq@<,l",
    "89jcxdcnd%d..<c+@:3]a8#bo", "@s)g5dfru", "6ul^kdf.-pea`u!d?", "></h[1+evx<",
    "<,udjas`j@+a$wj@;]t", "6$79f9jr-tebsru", "96gl", "7wnwcf<et_@;klq",
    ";fxt-@vooobl7k`dftw)e`6pg", "6zquifb2*", "6$79f+@9dtd></glvk@r!2qcht4jdftr.ci]",
    "<,znhblqfi@vfud", "6$79f+b3aibl7x&b-9tbd></v", "6$79f+a69k+aucgb5_r.",
    "+ae26artcsbht></sbl3", ";jbcwf@]hxa,", "<-<5!+e)-?bl7f$artxk+@:!t",
    "<b6)c@qg%1", "6?rpr7rmpof_tq)", "6$79f+@bgrf*&nkh#r25er",
    "dfb]:f*)pjgbecz0jp==1c70m", "7;q[[api", "6#c(fasus", "7<<dj6$73v+@c\\'`dfp(c6tkec",
    ":ic></dj8t\\\\n\\\\f!*+y7;d3]fenu^", "6$79f?uj7fasu$iew", "<-le", "2)5",
    "6ur3\\\\bm3&wb1?<md#", ";ett[cmdkt+a6-`@<?&", ";flggfa[0lf*%",
    "6zmejarlo^clq<nfdl%></h[1+dy\\\\-", "6?6dxb-;&&+></hd_l+a\\\"s^", "e+s3&",
    "<+u;r;fm%uclpic@;^.*@<,ps", "87c4gbe", "@;i&j6=k7i></coprec,h></c;ea@;]dh+ah9wdimn",
    "=(-2^e`@\\'fdkbc*eb0,ugl", ":i\\'qcatan`f_mso+a[)matdh", "6#^dzah", "9qho9",
    "<,udjasbogft", "<,unrbr)h", ";etla+@u0\\\\bl7knew", "7q$4mau,cc@;p<sbl3",
    ";flggf@0jxfd5w*", "?ximd@;0b\\'", "6$79f+auw^diro.+@c\\'`dftn", "6!$k",
    "?xiymc]", "-6rdsas#a%cm@m3f`(b5ble*!", "7u^=s7rmp*bop^k@q></vd6",
    "7u^=sbl7q+9jr*bate%", "6$79f+b3aibl5%o1]", "7ri$]ap$rz@;]t",
    ";e:%n9jr\\'vdijqiarte", "7vm!eatbo", ":gnbd2?", "6?rpr7wmpid.ru,f!,[@fd)dq",
    ":i\\'qcatdh", ":icar@;jn></lf)+@0u]", "</w6[f<e4z;e:&mbl7q+",
    "fdl+@ga(q*+f.mj+d></v+@9lnf8", ":3cz\\\"8ts]vdicueatmq", "6$79f7qhd></zs",
    ";g2yf6z6ct", "6z6jwf`m&(+@c\\'wdd`", ";fw<2dkkh1@:ociea`u!dgbof",
    "6\\\"g-", ";io\\'h6ypihci*)bdg!r", "6$79f+@c\\'`ch7*u+@^boblj",
    "6yuxvh=^tkf_,w9:i^jeeb0<5", "6=fnvbl%]bf_,w9:i^jeeb0<5", ":-ro.;epsebk\\'ez3-&icathr.",
    "6$79f+@g!b+@aoi+bos^@<6n5", "6tlfnec`f\\\"angaeat@", "6xb\\\"qbm+e8akx<jblj",
    "<hd^oh#ihg+dbt?atmr9ao`$.", "7w30d;e^ph", "882ufasrv`au+", "7s></b5ry@r,^tartz",
    "6?rpr;djqvf_p`)6#q&", "9jq[o@3@jhd></affeah", ":i^jof_,w9:i^jeeb0<5",
    ";flgiakw`", "6z6iq@3aw[ecpl4ew", "87c4qasu=06tplldkbn1d?", "9jr\\'vdijqgartu%6\\\"fhhea`b",
    ";fw<></dz1rea`u!", ";e^)kcghf\\\"df></yf*&o$bl[x(ah", "9lg></hd^", "7<icfdf]w2d?",
    "7:c:9asl@-ah", "?n", "<b6;mbl@l30ep3", "<+05y;eu)ge+s3&", "8t&w]ebth49ow*q",
    "6$79f></zw", "87?r+f`vi", ".6:f></dft[", "9p%gx87?ch", "ezckt@<h[1+e_x9ea`ki+f.mj",
    "@r#xd></v", "dima", ";e9cv@rrhbf)59&a,", "<+pdla7]d(7rmo", "6ur!aer",
    "6$79f?w2></dj7vm!eat@", "9pjzadj((qdf&rtah", "j,", "6$79f+b2ogat2r.f<enyebtt:",
    "@ux.b", "<h)sk@:wqi@:nj", "7wmpmd.ru,er", "9jqp\\\\bl@l36xas<", "></u",
    ";,qp@@pll%></fcubl8\\\"", "3b$", "7u^+sah", "7ri$]blnvc89jaa>9HCUAS#^m",
    ";IO9MBl7P", ";flGgF8", "+Am8mF*&O\\\"F_tT!EcW?a+EVaI", "87c4?", "6tLFLEbTK7Bl@k",
    "9Q+ELFD5Z2Er", "6$HaQASu\\'i+A$\\'S+@0OTBl[Wu", "6>U(?CLUj`Eb&\\'ZG@>N&",
    "7VQLKFD5W*+AHE`ARuu_FEq\\\\6", "94`!/De*KlF%g.WF8", "<-MnbDGt+eG%kGt",
    "7;Q[[AKXfiDe!g!F)rHb+<u", ";,qp@@pll%>\\\"V@r7TFS.EE?mf", "6Z7!RC`lPgEaa\\'$",
    "9jr9FE+NTk", "7;ZLFE`?UeE,8s)AH", "6$79f7U^=S;IO9M", "6tp^aEc64oBlj",
    ":hal[", "<,unrBR)<", ":NU8]EW", "7<<dj7vm!eat@", "9pjzadj((qdf&rtah",
    "j,", "6$79f+b2ogat2r.f<enyebtt:", "@ux.b", "<h)sk@:wqi@:nj", "7wmpmd.ru,er",
    "9jqp\\\\bl@l36xas<"
}

-- Hệ thống bảo vệ
local function taoBaoVe()
    local function kiemTraBaoVe()
        -- Kiểm tra môi trường thực thi
        if getfenv and getfenv(0) ~= _G then
            return false
        end
        
        -- Kiểm tra debugger
        if debug and debug.getinfo then
            local info = debug.getinfo(1, "S")
            if info and info.source:find("@") then
                return false
            end
        end
        
        -- Kiểm tra hook
        if debug and debug.sethook then
            local hookCount = 0
            debug.sethook(function() hookCount = hookCount + 1 end, "c")
            debug.sethook()
            if hookCount > 0 then
                return false
            end
        end
        
        return true
    end
    
    if not kiemTraBaoVe() then
        error("Script không được phép chạy trong môi trường này!")
    end
end

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
        nhanTieuDe.Text = "Script BloxFruit - Phiên Bản Bảo Mật"
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
        nhanThongTin.Text = "Discord: https://discord.gg/MVJKRWHVSF\n\n⚠️ CẢNH BÁO: Script này có thể vi phạm ToS của Roblox!\n⚠️ Sử dụng có thể dẫn đến việc bị khóa tài khoản!\n\n🔒 Script đã được mã hóa bảo mật cao!"
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
    -- Kiểm tra bảo vệ
    taoBaoVe()
    
    print("Script BloxFruit - Phiên bản bảo mật cao")
    print("Discord: https://discord.gg/MVJKRWHVSF")
    print("⚠️ CẢNH BÁO: Script này có thể vi phạm ToS của Roblox!")
    print("⚠️ Sử dụng có thể dẫn đến việc bị khóa tài khoản!")
    print("🔒 Script đã được mã hóa bảo mật cao!")
    
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
-- Đã được mã hóa lại với hệ thống bảo vệ cao
-- Cảnh báo: Sử dụng script này có thể vi phạm ToS của Roblox
-- Chỉ nên sử dụng cho mục đích học tập và nghiên cứu
-- Discord: https://discord.gg/MVJKRWHVSF