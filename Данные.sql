USE [CoffeeHouse_Baskakov]
GO
INSERT [dbo].[Employee] ([id], [FirstName], [LastName], [Number], [EMail]) VALUES (1, N'Daniil', N'Baskakov', N'+79108056022', N'dan.daniil22@yandex.ru')
INSERT [dbo].[Employee] ([id], [FirstName], [LastName], [Number], [EMail]) VALUES (2, N'Nikita', N'Shaposhnikov', N'+79208624567', N'nikita.shap01@yandex.ru')
INSERT [dbo].[EmployeePosition] ([id], [EmployeeID], [Position]) VALUES (N'1', 1, N'Повар')
INSERT [dbo].[EmployeePosition] ([id], [EmployeeID], [Position]) VALUES (N'2', 2, N'Администратор')
INSERT [dbo].[order] ([id], [clientID], [date]) VALUES (1, N'1', CAST(N'2023-12-12' AS Date))
INSERT [dbo].[order] ([id], [clientID], [date]) VALUES (2, N'2', CAST(N'2023-12-12' AS Date))
INSERT [dbo].[OrderStatus] ([id], [status], [OrderID]) VALUES (1, N'Ожидает оплату', 1)
INSERT [dbo].[OrderStatus] ([id], [status], [OrderID]) VALUES (2, N'Готово', 2)
INSERT [dbo].[Table] ([id], [usersID], [status]) VALUES (1, N'1', N'нормально')
INSERT [dbo].[users] ([id], [login], [password], [Email], [FirstName], [LastName], [TableID]) VALUES (1, N'admin', N'admin', N'admin@mail.com', N'Admin', N'Admin', 1)
INSERT [dbo].[Employee_Has_WorkingShift] ([EmployeeID], [WorkingShiftID]) VALUES (1, 1)
INSERT [dbo].[Employee_Has_WorkingShift] ([EmployeeID], [WorkingShiftID]) VALUES (2, 2)
INSERT [dbo].[workingShift] ([id], [Type], [date], [EmployeeID]) VALUES (1, N'Отдых', CAST(N'2023-12-20' AS Date), 1)
INSERT [dbo].[workingShift] ([id], [Type], [date], [EmployeeID]) VALUES (2, N'Работа', CAST(N'2023-12-21' AS Date), 2)
