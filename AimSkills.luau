loadstring([[
getgenv().AimPos = nil
getgenv().Aimbot = false
    mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)
    mt.__namecall = newcclosure(function(self, ...)
        method = getnamecallmethod()
        if method == "FireServer" and self.Name == "RemoteEvent" and getgenv().Aimbot then
            local args = {...}
            if typeof(args[1]) == "Vector3" then
                args[1] = getgenv().AimPos
                return old(self, unpack(args))
            end
        end
        return old(self,...)
    end)
]])()
