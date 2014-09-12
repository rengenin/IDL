pro del_e,w

;determines engergy from given wavelength

h=4.136d-15 ;eV s
c=3d18 ;Ang s^-1
;w is wavelength in angstroms

e=(h*c)/w

print,e, 'eV'

return
end
