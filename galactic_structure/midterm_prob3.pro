pro midterm_prob3

z=findgen(99)*.0002+4d-4
p=0.009
p2=.0200024685
m=exp(-z/p)/p

m2=.001/(p2-z)

set_xy,-10,200,0,0.03
plot,m2,z

return
end
