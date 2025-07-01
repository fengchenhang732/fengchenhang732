%计算GF域内两个码字的码距子程序：
function ret = gf_dis(a, b)
ret = 0;
a_temp = de2bi(double(a.x), 3, 'left-msb'); 
b_temp = de2bi(double(b.x), 3, 'left-msb');
temp = xor(a_temp, b_temp);
ret = sum(temp);
end