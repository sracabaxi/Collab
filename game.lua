local playerBase = require("player")
local platformBase = require("platform")

return {
	new = function()
		
		local game = {
			actors = {},
			solids = {},
			timeSeconds = 0
		}
		
		--cria um player
		playerBase.new(game, display.width / 2, 0)
		
		--cria uma plataforma
		platformBase.new(game, (display.width / 2), display.height * 0.80)
		
		
		--roda a logica dos atores
		function game:update(dt)
			
			self.timeSeconds = self.timeSeconds + dt
			
			for i, actor in ipairs(self.actors) do
				actor:update(dt)
			end
			
		end
		
		
		function game:draw()
			
			--desenha os atores
			for i, actor in ipairs(self.actors) do
				actor:draw()
			end
			
			--desenha os solidos (plataformas)
			for i, solid in ipairs(self.solids) do
				solid:draw()
			end
			
		end
		
		
		return game
	end
}