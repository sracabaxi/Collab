local playerBase = require("player")
local platformBase = require("platform")


function love.load()

	display = {}
	display.width = love.graphics.getWidth()
	display.height = love.graphics.getHeight()
	
	--cria um player
    player = playerBase.new(display.width / 2, 0)

    --cria uma plataforma
	platform = platformBase.new((display.width / 2), display.height * 0.80)
    
    gravity = 500
	
	timeSeconds = 0
	
end


function love.update(dt)
	
	timeSeconds = timeSeconds + dt
	
	playerBase.update(player, dt)
	
end

function love.draw()
    
    playerBase.draw(player)
    
    platformBase.draw(platform)
    
	love.graphics.print(timeSeconds, 0, 0)

end