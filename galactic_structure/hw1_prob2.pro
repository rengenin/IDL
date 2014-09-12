pro hw1_prob2

;colorset
set_plot,'ps'
device,filename='hw1_prob2.ps',/landscape
!p.thick=5
!x.thick=5
!y.thick=5
!p.charsize=1
!p.charthick=3

;aparent magnitude groups
m1=15.5
m2=16.5
m3=17.5

m=[15.5,16.5,17.5]

;Distance Calculations for NGP and SGP, for distance modulus all stars
;absolute mag. M = 10.7
;dn is the distance for the north groups, ds is for south groups and
;all given negative values

dn=dblarr(3)
ds=dblarr(3)

for i = 0, n_elements(m)-1 do begin
dn[i]=10^(((m[i]-10.7)+5.)/5.)
ds[i]=-dn[i]
endfor

;Calculating Stellar densities from three different groups in NGP

N_num1=(86+90+95+109+93+107)/6.
N_num2=(220+208+223+240+231+260)/6.
N_num3=(487+435+535+440+488+502)/6.
N_num=[N_num1,N_num2,N_num3]
N_den=(3*N_num)/(2*!pi*(dn^(3)))

;Calculating Stellar densities from three different groups in NGP

S_num1=(77+134+127+91+100+130)/6.
S_num2=(253+284+257+261+206+289)/6.
S_num3=(487+435+535+440+488+502)/6.
S_num=[S_num1,S_num2,S_num3]
S_den=(3*S_num)/(2*!pi*(dn^(3)))
S_den=reverse(S_den)

;Combining North and South Densities
den=[S_den,N_den]

;Combining distances
ds=reverse(ds)
r=[ds,dn]

set_xy,0,0,0,1.1d-4
plot,r,den,psym=2,xtitle='Radial Distance Relative to the Galactic Plane in Parsecs',ytitle='Average Stellar Density per Parsec',title='Plot of Average Stellar Densities Relative to the Galactic Plane'

xyouts,-285,1.12d-4,'Z!DSun!N = 9 pc';,charsize=2,charthick=3
xyouts,-285,1.08d-4,'Z!D0!N = 160 pc';,charsize=2,charthick=3
xyouts,-285,1.04d-4,'C = 0.0055';,charsize=2,charthick=3
xyouts,-270,5d-6,'South Galactic Plane'
xyouts,160,5d-6,'North Galactic Plane'
xyouts,-3,3.5d-5,'Galactic Plane',orient=90
;create r range for sech function called r2:
r2=dindgen(10000)*0.0458-229

;scale constants
z_sol=8 ;pc
z_0=160;pc
c=.0055

;z_sol=7.3 ;pc
;z_0=165.5;pc
;c=8.3d-5
y=(r2+z_sol)/z_0

;d_r new density function
d_r=c*(4*(exp(y)+exp(-y)))^(-2)

oplot,r2,d_r

gp=[0,1d-3]
r_cen=[0,0]
oplot,r_cen,gp

device,/close
set_plot,'x'

return
end
