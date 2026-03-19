return {
	
	--cria e retorna um objeto platform
	init = function(self,x,y)
		
		self.width = display.width * 0.05
		self.height = display.height * 0.005
		
		--centraliza a posição
		self.x = x - (self.width / 2)
		self.y = y - (self.height / 2)
		
		
	end,

	--função de draw da platform
	draw = function(self)
		love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
	end
}