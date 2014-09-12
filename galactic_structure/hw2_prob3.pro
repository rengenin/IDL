pro hw2_prob3

!except=2
;set_plot,'ps'
;device,filename='hw2_prob3.ps',/landscape
;!p.thick=5
;!x.thick=5
;!y.thick=5
;!p.charsize=1
;!p.charthick=3

r=findgen(30)*.5+1.5
r_0=8. ;kpc
alpha=findgen(37)*10
h=dblarr(37)
l=dblarr(37)
omega=dblarr(37)
v=dblarr(37)
alpha=alpha*!pi/180
omega_0=220/r_0

;print,alpha

for i = 0, 36 do begin
    l[i]=atan(r[0]*sin(alpha[i])/(r_0-r[0]*cos(alpha[i])))
    omega[i]=220/r[0]
    v[i]=(omega[i]-omega_0)*r_0*sin(l[i])
 endfor

set_xy,200,-200,-200,200
l=l*180/!pi
plot,l,v,psym=0,xtitle='Galactic Longitude l',ytitle='Radial Velocity v (km/2)'
l=l*!pi/180

;looping through entire r
for i = 1, 29 do begin
    for k = 0, 36 do begin
        l[k]=atan(r[i]*sin(alpha[k])/(r_0-r[i]*cos(alpha[k])))
           ;if alpha[k] eq !pi then begin
           ;   l[k] = !pi
           ;endif
        omega[k]=220/r[i] 
        v[k]=(omega[k]-omega_0)*r_0*sin(l[k]) 
     endfor
l=l*180/!pi
oplot,l,v,psym=0
endfor        

;device,/close
;set_plot,'x'

return
end
