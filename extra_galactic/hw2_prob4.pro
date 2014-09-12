pro hw2_prob4

;This program has been shamelessly modified from the original version
;sed.pro by Dr. D. M. Crenshaw 
;
!p.thick=2
!x.thick=2
!y.thick=2
!p.charthick=2
!psym=0
!fancy=3
!xtitle='log E (eV)'
!ytitle='log nFn (arbitrary units)'
set_xy,0,0,0,0
set_viewport,0.15,0.95,0.1,0.9
;
nlaw=3
maxi=700
;
loge=findgen(701)*0.01-2.0
lognf=fltarr(701)
mine=[.1,13.6,1000]
maxe=[13.6,1000,10000]
alpha=[-.75,-2,-0.7]
;
;creates each power law for steps from 0.1-13.6eV, 13.6-1000eV, 1000-10000eV
for i=1,nlaw do begin
  mine[i-1]=alog10(mine[i-1])
  maxe[i-1]=alog10(maxe[i-1])
;
  b=lognf(maxi)-(alpha[i-1]+1.0)*loge(maxi)
  if (i eq 1) then b=10.0
  mini=fix(mine[i-1]*100)+200
  maxi=fix(maxe[i-1]*100)+200
  lognf(mini:maxi)=(alpha[i-1]+1.0)*loge(mini:maxi)+b
endfor
;
plot,loge,lognf,xstyle=2,ystyle=2
;
;e is linear energy in eV, h is plancks constant, nu is frequency in
;Hz, nf is linear nuFnu (monchromatic flux in frequency units
;(arbitrary)), fnu is flux in frequency (eV/s/cm^2)
h=4.1357d-15 ;eV s
e=10^loge
nu=e/h
nf=10^lognf
fnu=nf/nu
;
;5100 Ang. = 0.39 log(E(eV)), so to find element where loge=0.39
;loge[239]=0.39
;for i = 0, n_elements(loge)-1 do begin
;   if loge[i] le 0.4 and loge[i] ge 0.38 then print,i
;endfor
;print,loge[239]
;print,nf[239]

;fti is the integration of nuFnu from i=313-700 13.6-10000eV (ionizing
;monochromatic flux), pht is ionizing frequencies 
fti=total(nf(313:700))
pht=total(fnu(313:700))

;calculating nuFnu observed from Flambda(5100Ang.), loge_obs is the
;log of energy at wavelength 5100 Ang., nf_obs is the monochromatic
;flux in frequency units for the observed flux at 5100 Ang.
loge_obs=alog10(h*(2.99d18)/5100)
nf_obs=(5100^2.)*(5d-15)*(6.242d11)*(5.86d14)/(2.99d18)
f_obs=nf_obs/(5.86d14);5.86d14 Hz (frequency for 5100 Ang.)
;
flux_factor=f_obs/fnu[239]
print,''
print,'Flux Obs/Flux Arb =',flux_factor
print,''
;ft is the total of nuFnu for entire frequency range, 6.626e-27 is
;planck's constant in erg s
ft=total(nf)
ft_obs=(ft*flux_factor)/6.2415d11 ;wavelength units
print,'Total Observed Flux in Wavelength units',ft_obs,' erg/s cm^2'
print,' '
;to calculate bolometric luminosity from z=0.03, H0=73 km/s/Mpc
d=(0.03)*(3d5)/73 ;in Mpc
d=d*3.0822d24 ;d in cm
L_tot_obs=4*!pi*ft_obs*d^2
print,'Observed Bolometric Luminosity',L_tot_obs,' erg/s'
print,''
;
factor=fti/ft
print,'L(ion)/L(tot) =',factor
print,' '
L_ion=L_tot_obs*factor
print,'Ionizing Luminosity',L_ion,' erg/s'
;

return
end
