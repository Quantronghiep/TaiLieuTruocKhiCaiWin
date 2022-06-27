Declare @s int, @x int
Set @s = 1 ; Set @x = 1
while(@x<6)
	begin
		set @s *=@x
		set @x = @x + 1
	end
Print @s