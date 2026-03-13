--[[
    profile_switcher.lua — compact profile switcher for mpv
    Place in ~/.config/mpv/scripts/
    
    Usage in input.conf:
      F1 script-message profile-cycle   gpu-hq  upscale-anime  sharpen
      F2 script-message profile-toggle  gpu-hq
    
    Profiles must have  profile-restore=copy-equal  for restore to work.
    Cycle includes an "OFF" step at the end (all listed profiles restored).
    MIT License Copyright (c) 2026 We0M
]]
local on, ci = {}, {}

mp.register_script_message("profile-cycle", function(...)
    local p, k = {...}, table.concat({...}, "\0")
    ci[k] = (ci[k] or 0) % (#p + 1) + 1
    for i, n in ipairs(p) do
        local want = (i == ci[k])
        if want and not on[n] then
            mp.commandv("apply-profile", n); on[n] = true
        elseif not want and on[n] then
            mp.commandv("apply-profile", n, "restore"); on[n] = nil
        end
    end
    mp.osd_message("Profile: " .. (p[ci[k]] or "returned default"))
end)

mp.register_script_message("profile-toggle", function(n)
    if on[n] then
        mp.commandv("apply-profile", n, "restore"); on[n] = nil
    else
        mp.commandv("apply-profile", n); on[n] = true
    end
    mp.osd_message("Profile " .. (on[n] and "ON: " or "OFF: ") .. n)
end)