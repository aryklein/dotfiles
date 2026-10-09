for _, profile in ipairs(require("conf/monitor-profiles")) do
    hl.monitor(profile)
end
