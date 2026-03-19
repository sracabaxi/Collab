local actorBases = {
	player = require('actors.player')
}

local actorFactory = {}

--cria um novo ator na cena
function actorFactory.new(scene, name, ...)
	local actor = {
		name = name,
		base = actorBases[name]
	}
	
	function actor:update(dt)
		self.base.update(self, dt)
	end
	
	function actor:draw(dt)
		self.base.draw(self)
	end
	
	function actor:destroy()
		if self._destroyed then
			return
		end
		
		self._destroyed = true
		
		if self.onDestroy then
			self:onDestroy()
		end
	end
	
	
	--move o ator no eixo x
	function actor:moveX(amount)
		self.x = self.x + amount
	end
	
	
	--move o ator no eixo y
	function actor:moveY(amount)
		self.y = self.y + amount
	end
	
	
	--move o ator nos dois eixos
	function actor:move(amountX, amountY)
		self:moveX(amountX)
		self:moveY(amountY)
	end
	
	
	actor.scene = scene
	table.insert(scene.actors, actor)
	
	actor.base.init(actor, ...)
	
	return actor
end

return actorFactory