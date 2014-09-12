pro hw3_prob2

set_plot,'ps'
device,filename='hw3_prob2.ps',/landscape
!p.thick=5
!x.thick=5
!y.thick=5
!p.charsize=1
!p.charthick=3

r0 = 8000. ;pc
rc = 2150. ;pc
v0 = 220. ;km/s
rho = 0.15 ;Msol/pc^3
G = 4.302d-3 ;pc km^2/Msol s^2

;part (B)
;to simplify for value of q

A = rho*4*!pi*G*((rc^2)+(r0^2))
B = (2*(v0^2)*(rc^2))/((rc^2)+(r0^2))
q = ((v0^2)/(A-B))^.5

;part (C)
r=dindgen(1001)/40*1000.
C = (v0^2)/(4*!pi*G*(q^2))
D = ((2*(q^2)+1)*(rc^2)+(r^2))/(((rc^2)+(r^2))^2)

rho_new=C*D

print,minmax(r)

set_xy,0,0,0,0
plot,r,alog10(rho_new),title='Mass Distribution',ytitle='Density (Solar Masses / Cubic Parsecs)',xtitle='Radius (Parsecs)'

device,/close
set_plot,'x'

return
end
