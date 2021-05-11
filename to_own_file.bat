@echo off
setlocal DisableDelayedExpansion
set /a count = 1
for /F "tokens=*" %%a in ('findstr /n $') do (
  set "line=%%a"
  setlocal EnableDelayedExpansion
  set "line=!line:*:=!"
  echo(!line! > !count!.svg
  endlocal
  set /a count += 1
)