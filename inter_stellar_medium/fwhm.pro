pro fwhm,wave,flux,width
;
; procedure to measure FWHM of emission line  DMC  5/10/11
;
w=wave
f=flux

plot,w,f,psym=0
;
print,'Click on left continuum, peak, and right continuum points'
;
cursor,x,y,/down,/data
;print,x,y
oplot,[x],[y],psym=1
xl=x
yl=y
;
cursor,x,y,/down,/data
;print,x,y
oplot,[x],[y],psym=1
xp=x
yp=y
;
cursor,x,y,/down,/data
;print,x,y
oplot,[x],[y],psym=1
xr=x
yr=y
;
;oplot,[xl,xr],[yl,yr],psym=0
;
m=(yr-yl)/(xr-xl)
b=yr-m*xr
y=m*w+b
oplot,w,y
;
;ym=m*xp+b
;oplot,[xm,xm],[ym,yp],psym=0,linestyle=2
;
;xa=xp
ym=m*xp+b
ya=(yp+ym)/2.
b=ya-m*xp
y=m*w+b
oplot,w,y,psym=0,linestyle=2
;
print,'Click on left and right HWHM points'
;
;
cursor,x,y,/down,/data
;print,x,y
oplot,[x],[y],psym=1
xl=x
yl=y
;
cursor,x,y,/down,/data
;print,x,y
oplot,[x],[y],psym=1
xr=x
yr=y
;
bx=xp-xl
rx=xr-xp
cent=(xl+xr)/2.0
bhm=bx/xp*2.997e5
rhm=rx/xp*2.997e5
width=bhm+rhm
;
print,' '
print,'Blue HWHM = ',bx,'Ang.',bhm,'km/s',format='(A14,F5.1,A5,F7.1,A5)'
print,'Red HWHM = ',rx,'Ang.',rhm,'km/s',format='(A14,F5.1,A5,F7.1,A5)'
print,'FWHM = ',bx+rx,'Ang.',width,'km/s',format='(A14,F5.1,A5,F7.1,A5)'
print,'Centroid = ',cent

print,' '

id=''
read,'enter position and row: ',id
;openu,1,'fwhm.txt'
;printf,1,id,bx+rx,cent
;close,1
;
spawn,'echo '+string(id)+' '+string(bx+rx)+' '+string(cent)+' >> fwhm.txt'
return
end
