pro hw5_prob1

set_plot,'ps'
device,filename='hw5_prob1.ps',/landscape,/color
!p.thick=5
!x.thick=5
!y.thick=5
!p.charsize=1
!p.charthick=3

;plotset

i=60*!pi/180
phi=fltarr(10000)
v=dindgen(101)*4-200
r=dindgen(10000)+1


r_out=dblarr(100)+max(r)
phi_out=dindgen(100)*2.5d*!pi/100d
plot,r_out,phi_out,/polar,psym=0,xstyle=4,ystyle=4,title='Spidar Diagram of Disk inclined 60 degrees'

print,minmax(r_out)
print,minmax(phi_out)

phi=acos(v[0]/(sin(i)*sqrt(r)))

for n = 1, 49 do begin
  phi=acos(v[n]/(sin(i)*sqrt(r)))
  oplot,r,phi,/polar,psym=0,linestyle=2
  oplot,r,-phi,/polar,psym=0,linestyle=2
endfor

phi=acos(v[50]/(sin(i)*sqrt(r)))
oplot,r,phi,/polar,psym=0,color=2
oplot,r,-phi,/polar,psym=0,color=2

for n = 51, 100 do begin
  phi=acos(v[n]/(sin(i)*sqrt(r)))
  oplot,r,phi,/polar,psym=0,linestyle=4
  oplot,r,-phi,/polar,psym=0,linestyle=4
endfor

;legend,['Blue Shifted Velocities','Neutral Velocities','Blue Shifted Velocities'],linestyle=[2,0,4],/bottom,/left

xyouts,-1.05*max(r),0,'-200 km/s',orient=-90
xyouts,1.03*max(r),0,'200 km/s',orient=-90
xyouts,-.7*max(r),-.85*max(r),'-100 km/s',orient=-21
xyouts,.5*max(r),-.97*max(r),'100 km/s',orient=25
xyouts,-.06*max(r),-1.1*max(r),'0 km/s'
device,/close
set_plot,'x'

return
end
