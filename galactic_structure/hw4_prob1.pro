pro hw4_prob1
set_plot,'ps'
device,filename='hw4_prob1.ps',/landscape
!p.thick=5
!x.thick=5
!y.thick=5
t=dindgen(1000)*.001

x=0.29*cos(38.75*t+1.23)
y=-.43*sin(38.75*t+1.23)

x_sol=0.29*cos(1.23)
y_sol=-0.43*sin(1.23)

x_2=0.29*cos(4.37)
y_2=-0.43*sin(4.37)

set_xy,0,0,0,0
plot,y,-x,psym=0,position=aspect(1.0),xtitle="Y (kpc)",ytitle="X (kpc)",title="Sun's Epicycle"
xyouts,y_sol-0.03,-(x_sol),charsize=2,charthick=30,"+"
xyouts,y_sol-0.15,-(x_sol+.05),charsize=2,"Sun"
xyouts,0,0,charsize=2,"LSR"
xyouts,0,.28,charsize=2,charthick=4,"----->",orient=0
xyouts,0,-.28,charsize=2,charthick=4,"----->",orient=180
xyouts,0.15,0,charsize=2,charthick=3,orient=-90,"----->"
xyouts,.2,.05,orient=-90,"To Galactic Center"

device,/close
set_plot,'x'
return
end
