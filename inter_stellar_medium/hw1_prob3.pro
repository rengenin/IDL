pro hw1_prob3

;;;;;;;;;;;;;;;;;;;;;;;;;;
;Justin Gagne 9/11/2012  ;
;ISM homework 1 problem 3;
;;;;;;;;;;;;;;;;;;;;;;;;;;

;The value of b that fits the data best is b=10km/s +/- 2 km/s
;The best fitting column density is N=1e14 cm^{-2} +/- 5e13 cm^{-2}

colorset
;plotset
set_plot,'ps'
device,filename='Curve-of-growth.eps'

tau=[0.1d,0.2d,0.3d,0.4d,0.5d,0.6d,0.8d,1.0d,1.2d,1.4d,1.6d,2.0d,3.0d,4.0d,6.0d,10.0d,20.0d,30.0d,40.0d,60.0d,100.0d,1000.0d,10000.0d]

Ftau=[0.086d,0.165d,0.240d,0.309d,0.374d,0.435d,0.545d,0.643d,0.728d,0.804d,0.872d,0.986d,1.188d,1.32d,1.483d,1.66d,1.86d,1.97d,2.04d,2.14d,2.26d,2.73d,3.12d]

;b=5
y=alog10((2*5*Ftau)/(300000))
x=alog10((tau*5*1e5)/(1.497d-2))

;b=10
y1=alog10((2*10*Ftau)/(300000))
x1=alog10((tau*10*1e5)/(1.497d-2))

;b=20
y2=alog10((2*20*Ftau)/(300000))
x2=alog10((tau*20*1e5)/(1.497d-2))

;b=50
y3=alog10((2*50*Ftau)/(300000))
x3=alog10((tau*50*1e5)/(1.497d-2))

;b=100
y4=alog10((2*100*Ftau)/(300000))
x4=alog10((tau*100*1e5)/(1.497d-2))

;b=200
y5=alog10((2*200*Ftau)/(300000))
x5=alog10((tau*200*1e5)/(1.497d-2))

;b=500
y6=alog10((2*500*Ftau)/(300000))
x6=alog10((tau*500*1e5)/(1.497d-2))

set_xy,6,13,-5.5,-1.5

plot,x1,y1,xtitle='logNFLambda',ytitle='logEW/lambda',psym=0
xyouts,11.5,-4.1,'b=5'
oplot,x2,y2,psym=0
xyouts,11.7,-3.8,'b=10'
oplot,x3,y3,psym=0
xyouts,12.1,-3.5,'b=20'
oplot,x4,y4,psym=0
xyouts,12.2,-3.1,'b=50'
oplot,x5,y5,psym=0
xyouts,12.4,-2.8,'b=100'
oplot,x6,y6
xyouts,12.6,-2.5,'b=200'
oplot,x,y,psym=0
xyouts,12.7,-2.1,'b=500'
;given datapoints
;this set is with a column density of N=1e14 (points plotted in red)
;1193.3 Ang
oplot,[8.84,8.84],[-4.04,-4.04],psym=1,color=2
;error
oplot,[8.84,8.84],[-4.08,-4.00],color=2
;1260.4 Ang
oplot,[9.17,9.17],[-3.92,-3.92],psym=1,color=2
;error
oplot,[9.17,9.17],[-3.99,-3.87],color=2
;1304.4 Ang
oplot,[8.06,8.06],[-4.34,-4.34],psym=1,color=2
;error
oplot,[8.06,8.06],[-4.42,-4.27],color=2
;1526.7 Ang
oplot,[8.30,8.30],[-4.14,-4.14],psym=1,color=2
;error
oplot,[8.30,8.30],[-4.23,-4.07],color=2

device,/close
set_plot,'x'

return
end
