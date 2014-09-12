pro hw1_prob1

;;;;;;;;;;;;;;;;;;;;;;;;
;Justin Gagne 8/31/2012;
;ISM homework problem 1;
;;;;;;;;;;;;;;;;;;;;;;;;

;s stands for sigma (velocity dispersion)
;v stands for radial velocity
;p is the gaussian profile

s=100

v=fltarr(20000)
for i=0,19999 do begin
v(i)=i-10000
endfor

p=((1)/(((2*!pi)^(.5))*s))*exp(-.5*(v/s)^(2))

colorset
set_xy,-600,600,0,0


plot,v,p

fwhm,v,p



return
end
@fwhm.pro
