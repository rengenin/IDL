pro hw3_prob3

;;;;;;;;;;;;;;;;;;;;;;;;;;
;Justin Gagne 10/4/2012  ;
;ISM homework 3 problem 3;
;Special thanks to Sam   ;
;Quinn and his IDL skills;
;;;;;;;;;;;;;;;;;;;;;;;;;;


;colorset
set_plot,'ps'
device,filename='Stromgren-Sphere.eps'


;y is the ratio np/nh
;n is H density in cm^-3
;r is distance from star in pc
;ab is case b recombination (cm^(3)/sec) or in (pc^(3)/sec)
;wa is wavelength in parsec

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;constants
n=10d ;cm^(-3)
ab=2.59d-13 ;(cm^(3)/sec)
h=6.23d-27 ;(erg sec)
c=3d10 ;(cm/s)
t=5d4; star temp in K
k=1.38d-16 ;erg per K

;distance from star in pc
r=dindgen(5000)/100d
r=r+0.1d
r=r*3.08d18 ;converts r to cm
dr=r(1)-r(0)

y=r*0d
nh0=r*0d

;set of constants in front of integral
A1=(1d/(4d*!pi*r(0)*r(0)*ab*h))

;wavelength in Ang.
w=dindgen(9120)/10d 
w(0)=1d-9
wa=w*(1d-8) ;converts wavelength to cm
dw=wa(1)-wa(0)

;blackbody curve for T=5^4 K
b=((2d*h*c^(2))/(wa^(5)))/(exp(h*c/(wa*k*t))-1d) 
;luminosity (6.97d23 is the SA of the star)
l=4d*(!pi)^(2)*(6.97d23)*b
anu=0.008d*(wa^(3))

;s is the integral and constants
s=A1*total(l*(wa/c)*anu*dw)

y(0)=(-s+((s^(2)+4d*s*n)^(1d/2d)))/(20d)
nh0(0)=n*(1d -y(0))

for i=1,4999 do begin
subs=where(r lt r(i))

A1=(1d/(4d*!pi*r(i)*r(i)*ab*h))
tau=anu*total(nh0(subs)*dr)
s=A1*total(l*(wa/c)*anu*dw*exp(-tau))
y(i)=(-s+((s^(2)+4d*s*n)^(1d/2d)))/(20d)
nh0(i)=n*(1d -y(i))

endfor

r=r/(3.08d18)

set_xy,0,40,0,1.2

plot,r,y,xtitle='r in parsecs',ytitle='np/nh',title='Stromgren Sphere for O star' 

device,/close
set_plot,'x'

return
end

