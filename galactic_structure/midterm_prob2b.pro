pro midterm_prob2b

d=findgen(60)*.5+1.5
r_0=8. ;kpc
l=40 ;deg
l=l*!pi/180 ;rad
omega=dblarr(60)
omega_0=220./r_0
v=dblarr(60)
r=dblarr(60)

for i=0,59 do begin
    r[i]=(r_0^2. +d[i]^2 - 2*r_0*d[i]*cos(l))^.5
    omega[i]=220/r[i]
    v[i]=(omega[i]-omega_0)*r_0*sin(l)
endfor

plot,d,v,psym=0,xtitle='Distance from the Sun (kpc)',ytitle='Observed Radial Velocity (km/s)'

d_t=where(v eq max(v))

v_t=[-200,200]
d_tan=[r_0*cos(l),r_0*cos(l)]

oplot,d_tan,v_t

print,d_t

return
end
