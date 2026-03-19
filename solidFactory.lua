local solidBases = {
	platform = require('solids.platform')
}

local solidFactory = {}

--cria um novo solido na cena
function solidFactory.new(scene, name, ...)
	local solid = {
		name = name,
		base = solidBases[name]
	}
	
	function solid:draw(dt)
		self.base.draw(self)
	end
	
	function solid:destroy()
		if self._destroyed then
			return
		end
		
		self._destroyed = true
		
		if self.onDestroy then
			self:onDestroy()
		end
	end
	
	solid.scene = scene
	table.insert(scene.solids, solid)
	
	solid.base.init(solid, ...)
	
	return actor
end

return solidFactory