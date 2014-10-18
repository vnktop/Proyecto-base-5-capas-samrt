USE SMART
GO
IF EXISTS (	SELECT							1
			FROM							SYSOBJECTS
			WHERE							NAME = 'stp_smart_Insert_Perfil'
			AND								TYPE = 'P' )
	DROP PROCEDURE		stp_smart_Insert_Perfil
GO

CREATE PROCEDURE stp_smart_Insert_Perfil(
	@intResultado	INT OUTPUT,
	@Funcion		VARCHAR(100),
	@Descripcion	VARCHAR(150)	
)
AS 

BEGIN
BEGIN TRANSACTION					ingresar_Perfil
	BEGIN TRY			
		INSERT INTO smart_Perfiles
		(
			Funcion,	Descripcion,	FechaSis
		)
		VALUES
		(
			@Funcion,	@Descripcion,	getdate()
		)				  
		SET			@intResultado = IDENT_CURRENT('smart_Perfiles')
		COMMIT TRANSACTION				ingresar_Perfil				
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION			ingresar_Perfil
		SET			@intResultado = -1			
	END CATCH		
END
SELECT @intResultado
RETURN @intResultado
-- exec stp_ListarTest