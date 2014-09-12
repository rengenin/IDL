pro hw3_prob1

set_plot,'ps'
device,filename='hw3_prob1_OB.ps',/landscape
!p.thick=5
!x.thick=5
!y.thick=5
!p.charsize=1
!p.charthick=3


readcol,'/nfs/morgan/users/gagne/classes/gal-struc/pro/reed.dat',r,l,b,format='D,X,D,D',skipline=1

;convert l and b from deg. to rad:

l=l*!pi/180.
b=b*!pi/180.

;scaling r from pc to kpc
r=r/1000.

x=r*cos(b)*cos(l)
y=r*cos(b)*sin(l)+8

set_xy,-1.5,1.5,6.5,9.5

;plotarms
;oplot,x,y,psym=3
plot,x,y,symsize=.1,psym=2,title='Local OB Star Distribution',xtitle='(kpc)',ytitle='(kpc)'
device,/close
set_plot,'x'

return
end

