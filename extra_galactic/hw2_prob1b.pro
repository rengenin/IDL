pro hw2_prob1b

M0=1d6 ;solar masses

;eddington accretion rate
M_dot=2.2*(M0/1d8) ;solar masses / year
;T=M0/M_dot ;years

while M_dot le 0.03 do begin
M_dot= 2.2*(M0/1d8)
M0 = M0 + M_dot
M_dot=2.2*(M0/1d8)
T = M0/M_dot
print,M_dot
print,T
endwhile

;print,T

return
end
