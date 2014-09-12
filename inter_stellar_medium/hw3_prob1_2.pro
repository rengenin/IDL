pro hw3_prob1_2

h=6.23d-27 ;(erg sec)
c=3d10 ;(cm/s)
k=1.38d-16 ;erg per K
t=3d4; star temp in K

w=dindgen(9121)/10d
w(0)=1d-9
wa=w*(1d-8)

b=((2d*h*c*c)/(wa*wa*wa*wa*wa))/(exp(h*c/(wa*k*t))-1d)

wa=wa/(1d-8)

set_xy,0,0,0,0

plot,wa,b

restore=tsum(wa,b,0,912)
print,restore

return
end
