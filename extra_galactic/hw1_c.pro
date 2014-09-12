pro hw1_c

H0=73 ;km/s/mpc
v=(dindgen(100)+1)*600. ;in km/s
d=v/H0 ;in mpc
err=dblarr(100)

for i=1, n_elements(d)-1 do begin
   err[i]=(d[i]-d[i-1])/d[i]*100.
if err[i] ge 9.9 and err[i] le 10.5 then begin 
   print,err[i]
   print,'distance where perculiar velocity of 600 km/s:'
   print,'d =',d[i],' Mpc'
endif
endfor

return
end
