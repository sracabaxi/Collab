return {
	
	--cria e retorna um objeto platform
	new = function(scene,x,y)
		
		local solid = {
			scene = scene,
			width = display.width * 0.05,
			height = display.height * 0.005
		}
		
		--centraliza a posição
		solid.x = x - (solid.width / 2)
		solid.y = y - (solid.height / 2)
		
		--função de draw da platform
		function solid:draw()
			love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
		end
		
		--adiciona a plataforma na lista de solids do scene
		table.insert(scene.solids, solid)
		
		return self
	end,
	
	
}