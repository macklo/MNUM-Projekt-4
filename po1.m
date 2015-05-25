function [ wrt ] = po1(x1,x2)
wrt=x2+x1*(0.9-x1*x1-x2*x2);
end

