@rem test.plotpc.bat

@echo === test.plotpc ===============================================
@"C:\PROGRA~1\R\R-3.2.2\bin\x64\Rcmd.exe" BATCH --quiet --vanilla test.plotpc.R
@if %errorlevel% equ 0 goto good1:
@echo error: R returned errorlevel %errorlevel%, see test.plotpc.Rout
@exit /B %errorlevel%
:good1
diff -w test.plotpc.Rout test.plotpc.Rout.save
@if %errorlevel% equ 0 goto good2:
@echo === Files are different ===
@exit /B %errorlevel%
:good2
@rem test.plotpc.save.ps is too big to be included in the release
@rem so it is stored elsewhere
diff Rplots.ps ..\..\.#\test.plotpc.save.ps 
@if %errorlevel% equ 0 goto good3:
@echo === Files are different ===
@exit /B %errorlevel%
:good3
@rm -f test.plotpc.Rout
@rm -f Rplots.ps
@exit /B  0
