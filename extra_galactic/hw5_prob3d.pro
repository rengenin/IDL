pro hw5_prob3d
;wavelength array
w=[8540,8541,8542,8543,8544,8545,8546,8547,8548,8549,8550]
;star flux padded with 4 1.'s on each side
s=[1.,.7,.4,.7,1.,1.,1.,1.,1.,1.,1.]
;galaxy flux padded with 4 1.'s on each side
g=[1.,1.,1.,1.,.8,.6,.4,.6,.8,1.,1.]

;half max of star and galaxy
s_hm=min(s)/2
g_hm=min(g)/2

;interpolation for absorptions
plot,w,g,psym=0
u_g=findgen(400)*.025+8543
u_s=findgen(400)*.025+8540
g_int=interpol(g,w,u_g)
s_int=interpol(s,w,u_s)

;find half max values
s_hm=max(s_int)-(max(s_int)-min(s_int))/2
g_hm=max(g_int)-(max(g_int)-min(g_int))/2
;get coresponding index values
dex_s=where(s_int eq s_hm)
dex_g=where(g_int gt .699 and g_int lt .701)
;print,dex_g;index values
;print,g_int[60]
;print,g_int[180]
;print,s_int[dex_s[0]],s_int[dex_s[1]];checking half max
;print,u_s[dex_s[0]],u_s[dex_s[1]];wavelength span

;calculate FWHM
fwhm_s=u_s[dex_s[1]]-u_s[dex_s[0]]
fwhm_g=u_g[dex_g[1]]-u_g[dex_g[0]]

print,'fwhm of star :',fwhm_s
print,'fwhm of galaxy :',fwhm_g

fwhm_true=sqrt((fwhm_g)^2. - (fwhm_s)^2.)

print,'intrinsic galaxy fwhm :',fwhm_true

return
end
