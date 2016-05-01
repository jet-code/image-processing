function y = psi(t)

y = (t>0).*(t<0.5) + -1*(t>0.5).*(t<1);