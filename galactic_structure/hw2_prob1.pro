pro hw2_prob1

;Geneva-Copenhagen Survey data: RA(deg), DEC(deg), Radial Vel (km/s)

readcol,'/nfs/morgan/users/gagne/classes/gal-struc/pro/GCSdata.txt',ra,dec,vr,format='D,D,D',skipline=44

;converting from deg to radians:
ra=ra*!pi/180.
dec=dec*!pi/180.

;matrix A

AA=total((cos(dec)^2)*(cos(ra)^2))
AB=total((cos(dec)^2)*sin(ra)*cos(ra))
AC=total(sin(dec)*cos(dec)*cos(ra))

BA=total((cos(dec)^2)*sin(ra)*cos(ra))
BB=total((cos(dec)^2)*(sin(ra)^2))
BC=total(sin(dec)*cos(dec)*sin(ra))

CA=total(sin(dec)*cos(dec)*cos(ra))
CB=total(sin(dec)*cos(dec)*sin(ra))
CC=total(sin(dec)^2)

A = [[AA, AB, AC],$
     [BA, BB, BC],$
     [CA, CB, CC]]

a1=total(-vr*cos(dec)*cos(ra))
b1=total(-vr*cos(dec)*sin(ra))
c1=total(-vr*sin(dec))

b = [a1,b1,c1]

;x is the averaged solar motion vector, where x[0] is Xsol, x[1] is
;Ysol, and x[2] is Zsol
x = invert(A)#b 

print,'Solar Motion'
print,'Xsol =',x[0] 
print,'Ysol =',x[1]
print,'Zsol =',x[2]
print,''
print,'Solar speed:',(x[0]^2+x[1]^2+x[2]^2)^.5
;apex ra and dec components in radians
ap_ra=atan(x[1]/x[0])
ap_dec=atan(x[2]/((x[0]^2+x[1]^2)^.5))

;converting to deg
ap_ra=ap_ra*(180./!pi)
ap_dec=ap_dec*(180./!pi)

;print,ap_ra
;print,ap_dec

;Getting apex position in galactic cordinates
glactc,ap_ra,ap_dec,2000,l,b,1

print,''
print,'apex position in (l,b):'
print,'galactic l = ',l
print,'galactic b = ',b

return
end

