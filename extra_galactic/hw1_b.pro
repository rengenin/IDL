pro hw1_b


zlen=dindgen(10001)+1
z=zlen*0.001
beta = (((1.+z)^2)-1.)/(((1.+z)^2)+1.)
err = ((abs(beta - z))/beta)*100.

;Looking for values of z which the difference between the
;approximation and relativistic value is equal to 1%

for i=0,n_elements(z)-1 do begin
if err[i] ge .99 and err[i] le 1.01 then begin
   print,'z with 1% error: z =',z[i]
endif
endfor

;Looking for values of z which the difference between the
;approximation and relativistic value is equal to 10%

for i=0,n_elements(z)-1 do begin
if err[i] ge 9.95 and err[i] le 10.01 then begin
   print,'z with 10% error: z =',z[i]
endif
endfor

return
end
