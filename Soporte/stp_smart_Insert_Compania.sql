USE SMART
GO
IF EXISTS (	SELECT							1
			FROM							SYSOBJECTS
			WHERE							NAME = 'stp_smart_Insert_Compania'
			AND								TYPE = 'P' )
	DROP PROCEDURE		stp_smart_Insert_Compania
GO

CREATE PROCEDURE stp_smart_Insert_Compania(
	@intResultado	INT OUTPUT,
	@RazonSocial	VARCHAR(100),
	@Descripcion	VARCHAR(150),
	@RFC			VARCHAR(15),
	@NombreBD		VARCHAR(15),
	@CorreoContacto	VARCHAR(30),
	@NombreContacto VARCHAR(50)
)
AS 

BEGIN
BEGIN TRANSACTION					ingresar_Compania
	BEGIN TRY			
		INSERT INTO smart_Companias
		(
			RazonSocial,	Descripcion,	RFC,	NombreBD,	CorreoContacto,		NombreContacto,		FechaSis
		)
		VALUES
		(
			@RazonSocial,	@Descripcion,	@RFC,	@NombreBD,	@CorreoContacto,	@NombreContacto,	getdate()
		)				  
		SET			@intResultado = IDENT_CURRENT('smart_Companias')
		COMMIT TRANSACTION				ingresar_Compania				
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION			ingresar_Compania
		SET			@intResultado = -1			
	END CATCH		
END
SELECT @intResultado
RETURN @intResultado
-- exec stp_ListarTest