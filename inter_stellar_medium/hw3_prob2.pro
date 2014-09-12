pro hw3_prob2

;;;;;;;;;;;;;;;;;;;;;;;;;;
;Justin Gagne 10/5/2012  ;
;ISM homework 3 problem 2;
;;;;;;;;;;;;;;;;;;;;;;;;;;


;constants
n=10d ;cm^(-3)
h=6.23d-27 ;(erg sec)
c=3d10 ;(cm/s)
t=5d4; star temp in K
k=1.38d-16 ;erg per K
;r=5 ;distance from star in pc
r=1.54d19 ;distance from star in cm

;wavelength in Ang.
w=dindgen(9121)/10d 
w(0)=1d-9
wa=w*(1d-8) ;converts wavelength to cm
dw=wa(1)-wa(0)

;blackbody curve for T=5^4 K
b=((2d*h*c^(2))/(wa^(5)))/(exp(h*c/(wa*k*t))-1d) 

;luminosity (6.97d23 is the SA of the star)
l=4d*(!pi)^(2)*(6.97d23)*b
anu=0.008d*(wa^(3))

i=(1/(r^(2)*h*c))*total(l*wa*anu*dw)
print,i

return
end
