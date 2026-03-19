local actorFactory = require("actorFactory")
local solidFactory = require("solidFactory")
local scenes = {
	game = require("scenes.game")
}


local activeScenes = {}


local sceneManager = {
	new = function(sceneName, ...)
		local scene = {
			base = scenes[sceneName],
			actors = {},
			solids = {},
			timeSeconds = 0,
			active = true
		}
		
		
		--atualiza a cena
		function scene:update(dt)
			self.timeSeconds = self.timeSeconds + dt
			
			if self.base.update then
				self.base.update(self, dt)
			end
			
			scene:updateActors(dt)
			scene:clearDestroyedActors()
			
			if self.base.lateUpdate then
				self.base.lateUpdate(self, dt)
			end
		end
		
		
		function scene:draw()
			
			if self.base.draw then
				self.base.draw(self)
			end
			
			self:drawActors()
			self:drawSolids()
			
			if self.base.lateDraw then
				self.base.lateDraw(self)
			end
		end
		
		
		--adiciona um ator a cena
		function scene:newActor(name, ...)
			actorFactory.new(self, name, ...)
		end
		
		
		--adiciona um ator a cena
		function scene:newSolid(name, ...)
			solidFactory.new(self, name, ...)
		end
		
		
		--atualiza todos os atores da cena
		function scene:updateActors(dt)
			for i, actor in ipairs(self.actors) do
				if not actor._destroyed then
					actor:update(dt)
				end
			end
		end
		
		
		--desenha todos os atores da cena
		function scene:drawActors()
			for i, actor in ipairs(self.actors) do
				if not actor._destroyed then
					actor:draw()
				end
			end
		end
		
		
		--desenha todos os solidos da cena
		function scene:drawSolids()
			for i, solid in ipairs(self.solids) do
				if not solid._destroyed then
					solid:draw()
				end
			end
		end
		
		
		--remove os atores destruidos de uma cena
		function scene:clearDestroyedActors()
			for i = #self.actors, 1, -1 do
				local actor = self.actors[i]
				
				if actor._destroyed then
					table.remove(self.actors, i)
				end
			end
		end
		
		
		--desabilita uma cena
		function scene:destroy()
			self._destroyed = true
			
			for i, another in ipairs(activeScenes) do
				if self == another then
					table.remove(activeScenes, i)
					break
				end
			end
		end
		
		scene.base.init(scene, ...)
		
		table.insert(activeScenes, scene)
		
		return scene
	end
}

function love.touchpressed(...)
	for i, scene in ipairs(activeScenes) do
		if scene.base.touchpressed and scene.active and (not scene._destroyed) then
			scene.base.touchpressed(...)
		end
	end
end

return sceneManager