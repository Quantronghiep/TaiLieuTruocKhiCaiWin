Declare @t int, @x int
Set @t = 0 ; Set @x = 1
While (@x <= 100)
	begin
		if ((@x % 2) = 0)
			set @t = @t + @x
			set @x = @x + 1
	end
Print @t