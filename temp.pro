pro temp

colorset

n=''
r=''

read,'Enter density: ', n
read,'Enter line ratio: ', r

t=findgen(20000)+5000

r=(7.9*exp((3.29e4)/t))/(1+((4.5e-4)*n)/(t^(.5)))

;r=alog10(r)

plot,t,r, xtitle='Temp in Kelvin', ytitle='j(4959) + j(5007)/j(4363)'
;plot,r,t

a = where(r gt 64.41)
b = max(a)
print,r(b)
print, 'temp :',t(b)

print,t(0)
print,t(19999)
;print,t

;print,r
;help,r
;help,t
return
end
