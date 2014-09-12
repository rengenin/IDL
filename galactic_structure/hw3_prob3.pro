pro hw3_prob3
common potpar, z, dpdr, dpdz, lz
;part B): determine vc_lsr (circular velocity) of the LSR at R = 8.0 kpc
getpot,r,z,pot,dpdr,dpdz
vc_lsr = sqrt(r[79]*dpdr[79,30])
print,vc_lsr,' kpc/Myr'
vc_lsr = vc_lsr*977.77553
print,vc_lsr,' km/s'

; Now for the pain...

set_plot,'ps'
device,filename='hw3_prob3D.ps',/landscape
!p.thick=5
!x.thick=5
!y.thick=5
!p.charsize=1
!p.charthick=3

;initial conditions:
y1 = 8.5 ;kpc (y1 = R) 
y2 = 10/977.7753 ;kpc/Myr (y2 = dR/dt = Vr = -Usol)
y3 = 0 ; deg (y3 = Phi, assumed as initial degree position)
y4 = (vc_lsr + 5.25)/977.7753/8.5 ;rad/Myr (y4 = dPhi/dt = Vc + Vsol)
y5 = .2 ; kpc (y5 = z, assume starting z in the plane)
y6 = 7.17/977.7753 ;kpc/Myr (y6 = dz/dt = Wsol) 
y = [y1,y2,y3,y4,y5,y6]
lz = (y1^2.)*y4 ;angular momentum is constant
h = 0.5 ;Myr (step size)
;time = dindgen(1001)*h ;Total time: 500 Myr in h increments 
;t= 500 ;Myr

;Arrays to build up
t=0 ;Time per step
time=fltarr(4601)
rr=fltarr(4601) ; R(time)
pp=fltarr(4601) ;phi(time
zz=fltarr(4601) ;Z(time)
fy=fltarr(6) ;y array with time
fy=y   ;1st element in fy
;dfy=fltarr(1001,6) ;dfy/dt 
dfy=dyidt(0,fy) ;first element in dfy

;To step through time
for i = 0, 4600 do begin
t = t+h
time(i)=t
newfy=rk4(fy,dfy,t,h,'dyidt')
fy=newfy
rr(i)=fy(0)
pp(i)=fy(2)
zz(i)=fy(4)
dfy=dyidt(t,fy)
endfor

xx=rr*sin(pp);rad
yy=rr*cos(pp)

;plotset

plot_3DBOX,xx,yy,zz,ax=20,az=30,zaxis=-1,xystyle=5,yzstyle=2,xzstyle=5;,/xy_plane,/yz_plane,/xz_plane,xtitle='X (kpc)',ytitle='Y (kpc)',ztitle='Z (kpc)',title='Solar Orbit X,Y,Z over 500 Myr' 

;plot,xx,yy,title='Solar Orbits in the Galactic plane over 500 Gyr,',xtitle='R(kpc)',ytitle='Z(kpc)'

device,/close
set_plot,'x'

return
end

function dyidt,t,y
common potpar, z, dpdr, dpdz, lz

ix = (y[0]-0.1)/0.1
iy = (y[4]+3.)/0.1

dpdrt = bilinear(dpdr,[ix],[iy])
dpdzt = bilinear(dpdz,[ix],[iy])

dlzdr = -lz^2/y(0)^3
dydt=fltarr(6)      
dydt[0] = y[1]
dydt[1] = -dpdrt - dlzdr
dydt[2] = lz/y[0]^2
dydt[3] = -2*lz*(y[1]/(y[0]^3.))
dydt[4] = y[5]
dydt[5] = -dpdzt

return,dydt 
end

