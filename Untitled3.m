%计算GF域内两个码字的码距子程序：
function distance = gf_hamming_distance(A, B, m, prim_poly)
    % 计算 GF(2^m) 内两个码字的汉明距离
    % 输入:
    %   A, B: 待比较的码字（向量）
    %   m: GF(2^m) 的 m 值（默认 8）
    %   prim_poly: 本原多项式（默认 391, 即 x^8 + x^7 + x^2 + x + 1）
    %
    % 输出:
    %   distance: A 和 B 不同的符号数
    % 参数检查
    if nargin < 3
        m = 8;                  % 默认 GF(2^8)
    end
    if nargin < 4
        prim_poly = 391;        % 默认本原多项式
    end
    if length(A) ~= length(B)
        error('码字长度必须相同！');
    end

    % 转换为 GF 类型（若 MWorks 支持 gf 运算）
    A_gf = gf(A, m, prim_poly);
    B_gf = gf(B, m, prim_poly);

    % 计算不相等的符号数
    distance = sum(A_gf ~= B_gf);
end