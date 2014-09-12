pro hw3_prob1

;;;;;;;;;;;;;;;;;;;;;;;;;;
;Justin Gagne 9/25/2012  ;
;ISM homework 3 problem 1;
;;;;;;;;;;;;;;;;;;;;;;;;;;

colorset
plotset
;set_plot,'ps'
;device,filename='Blackbody-Curve.eps'

;b is the planck function
;hnu is the frequency
;k is boltzmann's constant
;t is the temp


nu=fltarry(10000)

for i=0,9999 do begin
nu(i)=i+3.28d15
endfor


h=4.136d-15 ;ev*s
c=3d10 ;cm^(-2)
t=50000d ;K
k=8.62d-5 ;eV K^(-1)
hnu=h*nu

f=(2*h*(nu)^(3))
g=(1d)/(exp((hnu)/(k*t))-1d)

b=f*g

;b=((2*h*(nu)^(3))/((c^(2))))*(1d/(exp((h*nu)/(k*t))-1d))

print,minmax(f)
print,minmax(g)
print,minmax(nu)
print,minmax(b)

plot,b,hnu



;device,/close
;set_plot,'x'

return
end
