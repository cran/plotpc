@rem test.plotpc.bat

@echo === test.plotpc ===============================================
@"\a\r\ra\bin\Rcmd.exe" BATCH --quiet --vanilla test.plotpc.R
@if %errorlevel% equ 0 goto good1:
@echo error: R returned errorlevel %errorlevel%, see test.plotpc.Rout
@exit /B %errorlevel%
:good1
diff test.plotpc.Rout test.plotpc.Rout.save
@if %errorlevel% equ 0 goto good2:
@echo === Files are different ===
@exit /B %errorlevel%
:good2
@rem test.plotpc.save.ps is too big to be included in the release
@rem so it is stored elsewhere
diff -w Rplots.ps ..\..\.#\test.plotpc.save.ps 
@if %errorlevel% equ 0 goto good3:
@echo === Files are different ===
@exit /B %errorlevel%
:good3
@rm -f test.plotpc.Rout
@rm -f Rplots.ps
@exit /B  0
