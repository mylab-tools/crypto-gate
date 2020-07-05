local iresty_test = require "resty.iresty_test"
local tb = iresty_test.new({unit_name="crypto-gate-test"})

function tb:init(  )
   self:log("init complete")
end

function tb:test_should_not_authorize_wrong_token()

end

-- units test
tb:run()
