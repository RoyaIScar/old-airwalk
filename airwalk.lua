-- old changestate airwalk by Scar ye#0009


setfflag("HumanoidParallelRemoveNoPhysics","False")
setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2","False")



local bbv = game:GetService("RunService").RenderStepped
local jumping = false
local airwalk = false
local inpoot = game:GetService("UserInputService")
local activated = true

inpoot.InputBegan:connect(function(spacebar,chat)
    if chat then
        return
    end

    if spacebar.KeyCode == Enum.KeyCode.Space then
        jumping = true
        airwalk = false
    end
end)

inpoot.InputEnded:connect(function(spacebar,chat)
    if chat then
        return
    end
    if spacebar.KeyCode == Enum.KeyCode.Space then
        jumping = false
        airwalk = true
    end
end)

inpoot.InputBegan:connect(function(ctrl,chat)
    if chat then
        return
    end
    if ctrl.KeyCode == Enum.KeyCode.LeftControl then
        jumping = false
        airwalk = false
    end
end)

inpoot.InputEnded:connect(function(ctrl,chat)
    if chat then
        return
    end
    if ctrl.KeyCode == Enum.KeyCode.LeftControl then
        jumping = false
        airwalk = true
    end
end)
bbv:connect(function()
    pcall(function()
        if activated == true then

            if jumping == true then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)
            elseif jumping == false and airwalk == true then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
            end
        else
            jumping = false
            airwalk = false
        end
    end)
end)
