@ECHO OFF
SET args=%*
IF NOT DEFINED args (
	GOTO END
) ELSE (
	FOR %%i IN (%args%) DO (
		SET wd=%%~dpi
	)
)
SET /P folder="Insert new folder's name: "
IF "%folder%" == "" (
	SET folder=New folder
)
ECHO Working dir: %wd%
ECHO Folder: %folder%
IF NOT EXIST "%wd%\%folder%" (
	mkdir "%wd%\%folder%"
	FOR %%a IN (%args%) DO (
		MOVE %%a "%wd%\%folder%"
	)	
) ELSE (
	SET /p test="Directory already existing. Continue? [y/n] "
	IF "%test%" == "y" DO (
		FOR %%a IN (%args%) DO (
			MOVE %%a "%wd%\%folder%"
		)
	)
)
PAUSE
EXIT /B %ERRORLEVEL%

:END
PAUSE
EXIT /B %ERRORLEVEL%