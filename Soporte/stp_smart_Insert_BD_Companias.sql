USE SMART
GO
IF EXISTS (	SELECT							1
			FROM							SYSOBJECTS
			WHERE							NAME = 'stp_smart_Insert_BD_Companias'
			AND								TYPE = 'P' )
	DROP PROCEDURE		stp_smart_Insert_BD_Companias
GO

CREATE PROCEDURE stp_smart_Insert_BD_Companias(
	@intResultado		INT OUTPUT,
	@CompaniaId			INT,
	@BDProviderCompania	VARCHAR(150)
)
AS 

BEGIN
BEGIN TRANSACTION					ingresar_BD_Compania
	BEGIN TRY			
		INSERT INTO smart_BD_Companias
		(
			CompaniaId,				BDProviderCompania
		)
		VALUES
		(
			@CompaniaId,			@BDProviderCompania
		)				  
		SET			@intResultado = IDENT_CURRENT('smart_BD_Companias')
		COMMIT TRANSACTION			ingresar_BD_Compania				
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION		ingresar_BD_Compania
		SET			@intResultado = -1			
	END CATCH		
END
SELECT @intResultado
RETURN @intResultado
-- exec stp_ListarTest