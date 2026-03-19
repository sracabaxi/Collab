return {
	
	--roda uma vez quando o player é criado
	init = function(self, x, y)
		
		self.width = 50
		self.height = 50
		self.radius = 25
		self.velocityX = 0
		self.velocityY = 0
		self.gravity = 100
		
		--definir a posição
		self.x = x - (self.width / 2)
		self.y = y - (self.height / 2)
		
	end,
	
	
	--função de update do player
	update = function(self, dt)
		--adiciona gravidade
		self.velocityY = self.velocityY + self.gravity * dt
		
		--move o player de acordo com a velocidade do mesmo
		self.x = self.x + self.velocityX * dt
		self.y = self.y + self.velocityY * dt
		
		--colisão com plataformas
		local bottomSide = self.y + self.height
		for i, solid in ipairs(self.scene.solids) do
			
			if self.x <= solid.x + solid.width and self.x + self.width >= solid.x and bottomSide >= solid.y and bottomSide <= solid.y + solid.height then
				self.y = solid.y - self.height
				self.velocityY = self.velocityY * -0.1
				break
			end
			
		end
	end,
	
	
	--função de draw do player
	draw = function(self)
		love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, self.radius)
	end
}