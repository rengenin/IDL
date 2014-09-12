pro hw4_prob2

alpha=-0.4
h=0.73
n_star=0.02*h^(3.) ;per Mpc^2
L_star=9d9/h^(2.);L_sol

L=dindgen(1000)*0.1+.1

phi=(n_star/L_star)*((L/L_star)^(alpha))*exp(-L/L_star)

plot,alog10(L),phi

return
end


