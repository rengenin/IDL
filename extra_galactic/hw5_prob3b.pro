pro hw5_prob3b

set_plot,'ps'
device,filename='hw5_prob3b.ps',/landscape
!p.thick=5
!x.thick=5
!y.thick=5

;wavelength array
w=[8540,8541,8542,8543,8544,8545,8546,8547,8548,8549,8550]
;star flux padded with 4 1.'s on each side
s=[1.,1.,1.,1.,1.,.7,.4,.7,1.,1.,1.,1.,1.,1.,1.,1.,1.,1.,1.]
;galaxy flux padded with 4 1.'s on each side
g=[1.,1.,1.,1.,1.,1.,1.,1.,.8,.6,.4,.6,.8,1.,1.,1.,1.,1.,1.]

;Calculating R by hand

a=fltarr(n_elements(s))
b=fltarr(n_elements(s))
c=fltarr(n_elements(s))

s_bar = mean(s)
g_bar = mean(g)

;shift array
sh=[-5,-4,-3,-2,-1,0,1,2,3,4,5]
;ACC for Galaxy
rg_top = fltarr(11)
rg_bottom = fltarr(11)
rg = fltarr(11)
g_sh=g

for i = 0, 10 do begin 
g_sh=shift(g,sh[i])    
      for j = 0, n_elements(s)-1 do begin
         a[j] = (g_sh[j]-g_bar)*(g[j]-g_bar)
         b[j] = (g_sh[j]-g_bar)^2.
         c[j] = (g[j]-g_bar)^2.
        endfor
rg_top[i] = total(a)
rg_bottom[i] = sqrt(total(b))*sqrt(total(c))
rg[i] = rg_top[i]/rg_bottom[i] 
g_sh=g
endfor

;ACC for Star
rs_top = fltarr(11)
rs_bottom = fltarr(11)
rs = fltarr(11)
d=fltarr(n_elements(s))
e=fltarr(n_elements(s))
f=fltarr(n_elements(s))
s_sh=s

for i = 0, 10 do begin
s_sh=shift(s,sh[i])     
      for j = 0, n_elements(s)-1 do begin
         d[j] = (s_sh[j]-s_bar)*(s[j]-s_bar)
         e[j] = (s_sh[j]-s_bar)^2.
         f[j] = (s[j]-s_bar)^2.
        endfor
rs_top[i] = total(d)
rs_bottom[i] = sqrt(total(e))*sqrt(total(f))
rs[i] = rs_top[i]/rs_bottom[i] 
s_sh=s
endfor

;ACC for Galaxy and for Star
plot,sh,rg,psym=0,title='Auto Corelation for Star and Galaxy',ytitle='R Value',xtitle='Shift Step'
oplot,sh,rs,psym=0,linestyle=1

legend,['ACF Galaxy','ACF Star'],linestyle=[0,1]

device,/close
set_plot,'x'

return
end
