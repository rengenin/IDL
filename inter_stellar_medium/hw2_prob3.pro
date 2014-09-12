pro hw2_prob3

;;;;;;;;;;;;;;;;;;;;;;;;;;
;Justin Gagne 9/12/2012  ;
;ISM homework 2 problem 3;
;;;;;;;;;;;;;;;;;;;;;;;;;;

;colorset
;plotset
set_plot,'ps'
device,filename='Reddending-Curve.eps'

;w is the wavelength array for both stars
;f0 is intrinsic flux for the dereddend star at 10^(-14) (flux units)
;fw is the flux for the reddenend star at 10^(-14) (flux units)
;Aw is the extinction between the two stars (intrinsic flux)/(reddend flux)
;E(B-V) = 0.33
;Rw is the reddening curve

w=[1100,1650,2200,2750,3300,3850,4400,4950,5500,6050,6600]
f0=[3.779,2.443,1.788,1.361,1.049,0.831,0.689,0.590,0.524,0.486,0.463]
fw=[0.743,0.622,0.555,0.507,0.468,0.434,0.401,0.371,0.348,0.336,0.320]
Aw=(2.5*alog(f0/fw))
Rw=(Aw/0.33)

!psym=0
plot,w,Rw,title='Reddending Curve',xtitle='Wavelength (!3!S!A!9%!3!N!B!RA)',ytitle='Reddening'

device,/close
set_plot,'x'

return
end

