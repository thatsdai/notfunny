ping 127.0.0.1 -n 5

sc query BITS | find /I "STATE" | find "STOPPED"
goto :start

:start
sc start BITS
for /f "tokens=3" %%a in ('sc queryex "BITS" ^| findstr "PID"') do (set pid=%%a)
) >nul 2>&1
wmic process where ProcessId=%pid% CALL setpriority "realtime"
