                local hook = game:GetService("Players").LocalPlayer.Kick;
                local mt = getrawmetatable(game:GetService("Players").LocalPlayer)
                local psuedoEnv = {
                    ["__index"] = mt.__index,
                    ["__namecall"] = mt.__namecall
                }
                local ReturnFunc = function()end
                        
                print("Credits to whoever discovered that -  AntiKick") -- remove this if you want, just dont claim it as yours ty
                setreadonly(mt, false)
                mt.__namecall = newcclosure(function(self, Index, ...)
                    local NameCallMethod = getnamecallmethod()
                    if type(NameCallMethod) == "string" then
                        if NameCallMethod == "Kick" or NameCallMethod == "kick" then
                            print("Prevented Kick At " .. tostring(os.time()))
                            return ReturnFunc
                        end
                    end
                    return psuedoEnv.__namecall(self, Index, ...)
                end)
                        
                mt.__index = newcclosure(function(self, Index, ...)
                    if type(Index) == "string" then
                        if Index == "Kick" or Index == "kick" then
                            print("Prevented Kick At " .. tostring(os.time()))
                            return ReturnFunc
                        end
                    end
                    return psuedoEnv.__index(self, Index, ...)
                end)
                setreadonly(mt, true)
