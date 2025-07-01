%计算GF域内每个码元与“0”码字的码距，并映射在成实数子程序：
function distance = gf2num(gf_a)

if ~isa(gf_a, 'gf') || gf_a.m ~= 3
    error('输入必须是GF(8)域元素');
end

val = gf_a.x;  
distance = double(val); 

distance(val >= 8) = -1; 
end