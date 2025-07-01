%RS码编码
function encoded_msg = rs_encode_mworks(msg, n, k)
    % 参数设置
    m = 8;                  % GF(2^8), 常用字节级RS码
    t = (n - k) / 2;        % 纠错能力
    prim_poly = 391;        % GF(2^8) 本原多项式 (如 x^8 + x^7 + x^2 + x + 1)
    
    % 1. 创建伽罗华域
    gf_data = gf(msg, m, prim_poly);
    
    % 2. 生成RS生成多项式
    rs_gen_poly = rsgenpoly(n, k, prim_poly, m);
    
    % 3. 编码
    encoded_msg = rsenc(gf_data, n, k, rs_gen_poly);
end