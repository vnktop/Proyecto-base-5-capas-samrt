USE SMART
GO
IF EXISTS (	SELECT							1
			FROM							SYSOBJECTS
			WHERE							NAME = 'stp_smart_Insert_CompaniasBitacoraAcciones'
			AND								TYPE = 'P' )
	DROP PROCEDURE		stp_smart_Insert_CompaniasBitacoraAcciones
GO

CREATE PROCEDURE stp_smart_Insert_CompaniasBitacoraAcciones(
	@intResultado		INT OUTPUT,
	@AgregarCompania	BIT,
	@AgregarMembership	BIT,
	@AgregarPerfil		BIT,
	@EnvioCorreo		BIT
)
AS 

BEGIN
BEGIN TRANSACTION					ingresar_CompaniasBitAcc
	BEGIN TRY			
		INSERT INTO Smart_CompaniasBitacoraAcciones
		(
			AgregarCompania,	AgregarMembership,	AgregarPerfil,	EnvioCorreo
		)
		VALUES
		(
			@AgregarCompania,	@AgregarMembership,	@AgregarPerfil,	@EnvioCorreo
		)				  
		SET			@intResultado = IDENT_CURRENT('Smart_CompaniasBitacoraAcciones')
		COMMIT TRANSACTION				ingresar_CompaniasBitAcc				
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION			ingresar_CompaniasBitAcc
		SET			@intResultado = -1			
	END CATCH		
END
SELECT @intResultado
RETURN @intResultado
-- exec stp_ListarTest