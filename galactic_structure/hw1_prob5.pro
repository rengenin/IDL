  pro hw1_prob5

;plotset
;colorset

set_plot,'ps'
device,filename='hw1_prob5.ps',/landscape
!p.thick=5
!x.thick=5
!y.thick=5
!p.charsize=1
!p.charthick=3

;info for PDMF from Miller & Scalo
;log_m = log m/m_sun
;phi_ms = luminosity mass function PDMF
log_m=[1.79,1.55,1.33,1.11,.91,.72,.54,.4,.27,.16,.07,-.01,-.08,-.14,-.21,-.27,-.35,-.44,-.54,-.65,-.75,-.85,-.96]
phi_ms=[5.85d-6,2.91d-5,1.39d-4,6.99d-4,3.46d-3,1.75d-2,7.77d-2,2.71d-1,8.62d-1,3.34d0,1.08d1,2.24d1,3.89d1,5.33d1,6.44d1,7.14d1,7.22d1,7.6d1,8.18d1,9.19d1,9.19d1,8.97d1,8.18d1]

;to linearize the PDMF and mass arrays
m1=10^(log_m)
mspdmf=alog10(exp(1.))*(phi_ms/m1)

;to interpolate the PDMF and Mass array to range of 1-60 solar masses
dm=0.1
mass=(findgen(601)+1.)*dm
pdmf=interpol(alog10(mspdmf),alog10(m1),alog10(mass))
pdmf=10^(pdmf)
;initial mass function scaled to the pdmf
imf=(12.9622)*mass^(-2.35)

;Log - Log plot
;set_xy,0,10,0,100
;plot,mass,pdmf,psym=0
;oplot,mass,imf,linestyle=2,psym=0
;set_xy,0,0,0,0
plot,alog10(mass),alog10(pdmf),psym=0,xtitle='Log Solar Mass',ytitle='Log of Number of Stars per Mass Bin',title='Log - Log plot of Initial Mass Function versus Present Day Mass Function'
oplot,alog10(mass),alog10(imf),psym=0,linestyle=2
legend,['Log(PDMF)','Log(IMF)'],linestyle=[0,2],/right

xyouts,-0.9,-7.0,'Ratio of White Dwarf Mass to Main Sequence Star Mass: 0.299'

;Too find element range = 1-10 solar masses
;for i=0,n_elements(mass)-1 do begin
;if mass[i] ge 1. and mass[i] le 1. then begin
;   print,i
;endif
;endfor

;create and populate mass function arrays to find difference over correct
;mass range:
;pdmf2 is pdmf over 1-10 mass sol
;imf2 is imf over 1-10 mass sol
;m2 is mass over 1-10 mass sol
pdmf2=fltarr(91)
imf2=fltarr(91)
m2=fltarr(91)
pdmf2[0]=pdmf[9]
imf2[0]=imf[9]
m2[0]=mass[9]
for i=1, 90 do begin
   pdmf2[i]=pdmf[i+9]
   imf2[i]=imf[i+9]
   m2[i]=mass[i+9]
endfor

;plot,m2,pdmf2
;oplot,m2,imf2,color=2

;mass = 1 at element i=9, mass = 10 at element i = 99
;mass = 0.5 at element i=4
 
;difference between imf and pdmf from 1 to 10 solar masses:
dif=imf2-pdmf2
;oplot,m2,dif,color=3

;sum is the sum of stars in difference from 1-10 mass sol
sum=total(dif)
;print,sum
;wdmass white dwarf mass, for each star in sum turning into a
;whitedwarf of 0.5 solar masses
wdmass = .5*sum

;create and populate mass function arrays to get difference between
;0.5 and 1 sol mass, to find the number of main sequence stars in this
;mass range:
;pdmf3 is pdmf over 0.5-1 mass sol
;imf3 is imf over 0.5-1 mass sol
;m3 is mass range from 0.5-1 mass sol

pdmf3=fltarr(6)
imf3=fltarr(6)
m3=fltarr(6)
pdmf3[0]=pdmf[4]
imf3[0]=imf[4]
m3[0]=mass[4]
for i=1, 5 do begin
   pdmf3[i]=pdmf[i+4]
   imf3[i]=imf[i+4]
   m3[i]=mass[i+4]
endfor

;plot,m3,pdmf3
;oplot,m3,imf3

;to get scaling factor for imf
sumpdmf3=total(pdmf3)
sumimf3=total(imf3)
;print,'<pdmf[0.5-1 mass sol]>,',sumpdmf3/6
;print,'<imf[0.5-1 mass sol]>,',sumimf3/6

;msmass is the mass of main sequence stars from PDMF from 0.5-1 mass sol
msmass=total(pdmf3*m3)

;ratio of white dwarf mass to main sequence star mass
ratio=wdmass/msmass

print,'ratio of white dwarf mass to main sequence mass:',ratio
print,'white dwarf mass:',wdmass,' solar masses'
print,'total mass from 0.5-1 solar masses from PDMF:',msmass,' solar masses'


device,/close
set_plot,'x'

return
end
