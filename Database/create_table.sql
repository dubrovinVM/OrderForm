use lykos
CREATE TABLE [dbo].[forms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[operator_id]  [int] foreign key references [dbo].[users] (id),
	[name] [varchar](500) NOT NULL,
	saved_date datetime NOT NULL,
	send_date datetime NOT NULL,
	signed_date datetime NOT NULL,
	
	)
