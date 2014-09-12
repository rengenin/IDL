pro hw2_prob2

;Hipparcos data: HIP: h_num, ra (deg), dec(deg), plax_mas (paralax in
;mas), mu_ra(RA proper motion in mas/yr), mu_dec(Dec proper motion in
;mas/yr), rv (radial velocity in km/s)

readcol,'/nfs/morgan/users/gagne/classes/gal-struc/pro/UVWdata.txt',h_num,ra,dec,plax_mas,mu_ra,mu_dec,rv,format='D,D,D,D,D,D,D',skipline=2

;plax is paralax in arcsec
plax=plax_mas/1000.

;calculating distance (in pc) with paralax distance formula:
d=1./plax

;calculating proper motion mu (in arcsec/yr)
mu=((mu_ra^2. + mu_dec^2.)^0.5)/1000

;Calculating transverse velocity vt in km/s
vt=mu*4.74*d

;using GAL_UVW to get u,v,w
gal_uvw,u,v,w,RA=ra,DEC=dec,PMRA=mu_ra,PMDEC=mu_dec,VRAD=rv,DISTANCE=d

u=-u

;space velocity km/2
vs=(u^2. + v^2. + w^2.)^0.5
vs_mean=mean(vs)

print,'mean space velocity:',vs_mean,'km/s'

;Part a) mean values and direction (l,b)

u_mean=mean(u)
v_mean=mean(v)
w_mean=mean(w)

b=asin(w_mean/vs_mean)
l=atan(v_mean/u_mean)

;convert galactic coordinates to degrees
b=b*180/!pi
l=l*180/!pi

print,''
print,'mean components'
print,'<u>=',u_mean,' km/s'
print,'<v>=',v_mean,' km/s'
print,'<w>=',w_mean,' km/s'
print,''
print,'direction of solar motion (l,b):'
print,'l:',l,' deg'
print,'b:',b,' deg'

;Part b) plotting historgams in 2 km/2 bins

uh=histogram(u,BINSIZE=2.)
vh=histogram(v,BINSIZE=2.)
wh=histogram(w,BINSIZE=2.)

ux=2.*findgen((max(u)-min(u))/2.)+min(u)
vx=2.*findgen((max(v)-min(v))/2.)+min(v)
wx=2.*findgen((max(w)-min(w))/2.)+min(w)

set_plot,'ps'
device,filename='hw2_prob2.ps',/landscape
!p.thick=5
!x.thick=5
!y.thick=5
!p.charsize=1
!p.charthick=3

;plotset
set_xy,-60,60,0,62
plot,ux,uh,xtitle='velocity in 2 km/s bins relative to the LSR',ytitle='number of stars per bin',color=0
oplot,vx,vh,linestyle=1,color=2
oplot,wx,wh,linestyle=2,color=3
legend,['u','v','w'],linestyle=[0,1,2],color=[0,2,3]

device,/close
set_plot,'x'
;Part c) sig_u, sig_v,sig_w are the rms values for u, v,w

sig_u=mean((u-u_mean)^2.)^.5
sig_v=mean((v-v_mean)^2.)^.5
sig_w=mean((w-w_mean)^2.)^.5

print,''
print,'RMS values'
print,'u RMS:',sig_u
print,'v RMS:',sig_v
print,'w RMS:',sig_w
print,''
print,'component RMS values relative to u RMS'
print,'sigma U/sigma U:',sig_u/sig_u
print,'sigma V/sigma U:',sig_v/sig_u
print,'sigma W/sigma U:',sig_w/sig_u

;Part d) angle of the vertex of deviation l_v
l_v=.5*atan(2*mean(u*(v-v_mean))/(sig_u^2. + sig_v^2.))
l_v=180./!pi

print,''
print,'angle of the vertex of deviation lv =',l_v,' deg'

return
end
