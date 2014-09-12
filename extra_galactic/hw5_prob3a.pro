pro hw5_prob3a

set_plot,'ps'
device,filename='hw5_prob3a.ps',/landscape
!p.thick=5
!x.thick=5
!y.thick=5

;wavelength array
w=[8540,8541,8542,8543,8544,8545,8546,8547,8548,8549,8550]
;star flux padded with 4 1.'s on each side
s=[1.,1.,1.,1.,1.,.7,.4,.7,1.,1.,1.,1.,1.,1.,1.,1.,1.,1.,1.]
;galaxy flux padded with 4 1.'s on each side
g=[1.,1.,1.,1.,1.,1.,1.,1.,.8,.6,.4,.6,.8,1.,1.,1.,1.,1.,1.]
;s=[1.,1.,1.,1.,.7,.4,.7,1.,1.,1.,1.,1.,1.,1.,1.,1.,1.]
;g=[1.,1.,1.,1.,1.,1.,1.,.8,.6,.4,.6,.8,1.,1.,1.,1.,1.]
;Calculating R by hand

a=fltarr(n_elements(s))
b=fltarr(n_elements(s))
c=fltarr(n_elements(s))

s_bar = mean(s)
g_bar = mean(g)

;shift array
r_top = fltarr(10)
r_bottom = fltarr(10)
rj = fltarr(10)
sh=dindgen(10)

for i = 0, 9 do begin     
      for j = 0, n_elements(s)-1 do begin
         a[j] = (s[j]-s_bar)*(g[j]-g_bar)
         b[j] = (s[j]-s_bar)^2.
         c[j] = (g[j]-g_bar)^2.
        endfor
r_top[i] = total(a)
r_bottom[i] = sqrt(total(b))*sqrt(total(c))
rj[i] = r_top[i]/r_bottom[i] 
s=shift(s,1)
endfor

print,max(rj)
set_xy,0,8,0,0
plot,sh,rj,psym=0,title='Cross Corelation between Star and Galaxy',xtitle='Shift Steps',ytitle='R value'

device,/close
set_plot,'x'

return
end

