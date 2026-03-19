local sceneManager = require("sceneManager")

--variaveis locais
local gameScene
local timeSeconds


function love.load()
	
	display = {}
	display.width = love.graphics.getWidth()
	display.height = love.graphics.getHeight()
	
	--cria uma nova cena
	gameScene = sceneManager.new("game")
	
	timeSeconds = 0
	
end


function love.update(dt)
	
	timeSeconds = timeSeconds + dt
	
	gameScene:update(dt)
	
end

function love.draw()
	
	gameScene:draw()
	
	love.graphics.print(timeSeconds, 0, 0)
	
end
